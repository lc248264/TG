<template>
    <div class="views-wxuser-list">
        <div>
            <el-card class="box-card">
                <template #header>
                    <div class="clearfix">
                        <span class="title"> 微信用户查询 </span>
                    </div>
                </template>

                <div class="form-search">
                    <el-form @submit.prevent.stop :inline="true" size="small">
                        <el-form-item label="昵称">
                            <el-input v-model="search.nickName"></el-input>
                        </el-form-item>
                        <el-form-item>
                            <el-button type="primary" @click="searchSubmit" icon="el-icon-search">查询</el-button>
                        </el-form-item>
                    </el-form>
                </div>

                <el-table border :data="lists" style="width: 100%" @sort-change="sortChange" highlight-current-row @selection-change="handleSelectionChange">
                    <el-table-column type="selection" width="55"> </el-table-column
                    ><!-- 批量选择 -->

                    <el-table-column prop="nickName" label="昵称" width="130">
                        <template #default="{row}"> {{ row.nickName }} </template>
                    </el-table-column>
                    <el-table-column prop="avatarUrl" label="头像" width="100">
                        <template #default="{row}"> <e-img :src="row.avatarUrl" style="max-width: 120px" /> </template>
                    </el-table-column>
                    <el-table-column prop="gender" label="性别" width="80">
                        <template #default="{row}"> {{ row.gender }} </template>
                    </el-table-column>
                    <el-table-column prop="country" label="国家" width="130">
                        <template #default="{row}"> {{ row.country }} </template>
                    </el-table-column>
                    <el-table-column prop="province" label="省份" width="130">
                        <template #default="{row}"> {{ row.province }} </template>
                    </el-table-column>
                    <el-table-column prop="city" label="城市" width="130">
                        <template #default="{row}"> {{ row.city }} </template>
                    </el-table-column>

                    <el-table-column label="操作" fixed="right" width="180">
                        <template #default="{row}">
                            <el-button-group>
                                <el-tooltip effect="dark" content="编辑" placement="top-start"
                                    ><el-button type="success" :icon="Edit" size="small" @click="$router.push('/admin/wxuser/updt?id='+row.id)"></el-button>
                                </el-tooltip>
                                <el-tooltip effect="dark" content="删除" placement="top-start"
                                    ><el-button type="danger" :icon="Delete" size="small" @click="deleteItems(row.id)"></el-button>
                                </el-tooltip>
                            </el-button-group>
                        </template>
                    </el-table-column>
                </el-table>
                <div style="margin-top: 10px">
                    <el-button type="default" @click="batchDelete" :disabled="multipleSelection.length==0">批量删除</el-button>
                </div>
                <div class="e-pages" style="margin-top: 10px; text-align: center">
                    <el-pagination
                        @current-change="loadList"
                        :page-sizes="[12, 24, 36, 48,60]"
                        v-model:current-page="search.page"
                        v-model:page-size="search.pagesize"
                        @size-change="sizeChange"
                        layout="total, sizes, prev, pager, next"
                        :total="totalCount"
                    >
                    </el-pagination>
                </div>
            </el-card>
        </div>
    </div>
</template>

<script setup>
    import http from "@/utils/ajax/http";
    import DB from "@/utils/db";
    import router from "@/router";

    import { ref, reactive, watch, unref, onBeforeMount } from "vue";
    import { useRoute } from "vue-router";
    import { session } from "@/utils/utils";
    import { canWxuserSelect, useWxuserSelect, canWxuserDelete } from "@/module";
    import { extend } from "@/utils/extend";
    import { ElMessageBox, ElMessage } from "element-plus";
    import { Edit, Delete } from "@element-plus/icons-vue";

    const route = useRoute();
    const search = reactive({
        nickName: "",
        page: 1, // 当前页
        pagesize: 12, // 每页行数
        orderby: "id", // 排序字段
        sort: "desc", // 排序类型
    });
    extend(search, route.query);
    // 链接参数变化时更新这些内容
    watch(
        () => route.query,
        () => {
            extend(search, route.query);
            loadList(1);
        },
        { deep: true }
    );

    // 总行数
    const totalCount = ref(0);
    // 列表数据
    const lists = ref([]);
    // 加载状态
    const loading = ref(false);

    // 批量选择数据
    const multipleSelection = ref([]);
    const handleSelectionChange = (val) => {
        multipleSelection.value = val;
    };

    // 批量删除数据
    const batchDelete = () => {
        var ids = unref(multipleSelection).map((o) => o.id);
        deleteItems(ids).then((r) => {
            multipleSelection.value = [];
        });
    };
    // 排序操作
    const sortChange = (e) => {
        console.log(e);
        if (e.order == null) {
            search.orderby = "id";
            search.sort = "desc";
        } else {
            search.orderby = e.prop;
            search.sort = e.order == "ascending" ? "asc" : "desc";
        }
        loadList(1);
    };
    // 设置页数多少
    const sizeChange = (e) => {
        search.pagesize = e;
        loadList(1);
    };

    const deleteItems = (ids) => {
        return new Promise((resolve, reject) => {
            ElMessageBox.confirm("确定删除？")
                .then((res) => {
                    canWxuserDelete(ids).then((res) => {
                        loadList(search.page);
                        resolve(res.data);
                    });
                })
                .catch((err) => {
                    reject(err);
                });
        });
    };

    // 加载微信用户列表方法
    const loadList = (page) => {
        // 加载
        if (unref(loading)) return;
        loading.value = true;
        search.page = page;

        http.post("/api/wxuser/selectPages", search).then(
            (res) => {
                loading.value = false;
                if (res.code == 0) {
                    var data = res.data;
                    lists.value = data.lists.records;
                    totalCount.value = data.lists.total;
                }
            },
            (err) => {
                ElMessage.error(err.message);
            }
        );
    };

    onBeforeMount(() => {
        loadList(1);
    });
    const searchSubmit = () => {
        loadList(1);
    };
</script>

<style scoped lang="scss">
    .views-wxuser-list {
    }
</style>
