<template>
    <div class="views-huodongshenqing-list">
        <div>
            <el-card class="box-card">
                <template #header>
                    <div class="clearfix">
                        <span class="title"> 活动申请查询 </span>
                    </div>
                </template>

                <div class="form-search">
                    <el-form @submit.prevent.stop :inline="true" size="small">
                        <el-form-item label="名称">
                            <el-input v-model="search.mingcheng"></el-input>
                        </el-form-item>
                        <el-form-item label="地区">
                            <el-select v-model="search.diqu"
                                ><el-option label="请选择" value=""></el-option><e-select-option type="option" module="diqu" value="id" label="diquming"></e-select-option
                            ></el-select>
                        </el-form-item>
                        <el-form-item label="活动主题">
                            <el-input v-model="search.huodongzhuti"></el-input>
                        </el-form-item>
                        <el-form-item label="姓名">
                            <el-input v-model="search.xingming"></el-input>
                        </el-form-item>
                        <el-form-item label="电话">
                            <el-input v-model="search.dianhua"></el-input>
                        </el-form-item>
                        <el-form-item label="申请状态">
                            <el-select v-model="search.shenqingzhuangtai"
                                ><el-option label="请选择" value=""></el-option><el-option label="待审核" value="待审核"></el-option>
                                <el-option label="同意" value="同意"></el-option>
                                <el-option label="不同意" value="不同意"></el-option>
                                <el-option label="已结算" value="已结算"></el-option>
                            </el-select>
                        </el-form-item>
                        <el-form-item>
                            <el-button type="primary" @click="searchSubmit" icon="el-icon-search">查询</el-button>
                        </el-form-item>
                    </el-form>
                </div>

                <el-table border :data="lists" style="width: 100%" @sort-change="sortChange" highlight-current-row>
                    <el-table-column type="index" label="#"></el-table-column>
                    <!-- 序号 -->

                    <el-table-column prop="mingcheng" label="名称">
                        <template #default="{row}"> {{ row.mingcheng }} </template>
                    </el-table-column>
                    <el-table-column prop="diqu" label="地区" width="80">
                        <template #default="{row}"> <e-select-view module="diqu" :value="row.diqu" select="id" show="diquming"></e-select-view> </template>
                    </el-table-column>
                    <el-table-column prop="chuangjianren" label="创建人" width="80">
                        <template #default="{row}"> {{ row.chuangjianren }} </template>
                    </el-table-column>
                    <el-table-column prop="huodongzhuti" label="活动主题">
                        <template #default="{row}"> {{ row.huodongzhuti }} </template>
                    </el-table-column>
                    <el-table-column prop="kaishishijian" label="开始时间" width="120">
                        <template #default="{row}"> {{ row.kaishishijian }} </template>
                    </el-table-column>
                    <el-table-column prop="jieshushijian" label="结束时间" width="120">
                        <template #default="{row}"> {{ row.jieshushijian }} </template>
                    </el-table-column>
                    <el-table-column prop="huodongshizhang" label="活动时长" width="80">
                        <template #default="{row}"> {{ row.huodongshizhang }} </template>
                    </el-table-column>
                    <el-table-column prop="huodongdizhi" label="活动地址" width="130">
                        <template #default="{row}"> {{ row.huodongdizhi }} </template>
                    </el-table-column>
                    <el-table-column prop="xingming" label="姓名" width="130">
                        <template #default="{row}"> {{ row.xingming }} </template>
                    </el-table-column>
                    <el-table-column prop="dianhua" label="电话" width="130">
                        <template #default="{row}"> {{ row.dianhua }} </template>
                    </el-table-column>
                    <el-table-column prop="shenqingyuanyin" label="申请原因">
                        <template #default="{row}"> {{ row.shenqingyuanyin }} </template>
                    </el-table-column>
                    <el-table-column prop="shenqingzhuangtai" label="申请状态" width="80">
                        <template #default="{row}"> {{ row.shenqingzhuangtai }} </template>
                    </el-table-column>
                    <el-table-column prop="shenqingren" label="申请人" width="80">
                        <template #default="{row}"> {{ row.shenqingren }} </template>
                    </el-table-column>

                    <el-table-column label="操作" fixed="right" width="180">
                        <template #default="{row}">
                            <el-button-group>
                                <el-tooltip effect="dark" content="详情" placement="top-start"
                                    ><el-button type="info" :icon="InfoFilled" size="small" @click="$router.push('/admin/huodongshenqing/detail?id='+row.id)"></el-button>
                                </el-tooltip>
                                <el-tooltip effect="dark" content="编辑" placement="top-start"
                                    ><el-button type="success" :icon="Edit" size="small" @click="$router.push('/admin/huodongshenqing/updt?id='+row.id)"></el-button>
                                </el-tooltip>
                                <el-tooltip effect="dark" content="删除" placement="top-start"
                                    ><el-button type="danger" :icon="Delete" size="small" @click="deleteItems(row.id)"></el-button>
                                </el-tooltip>
                            </el-button-group>
                        </template>
                    </el-table-column>
                </el-table>
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
    import { canHuodongshenqingSelect, useHuodongshenqingSelect, canHuodongshenqingDelete } from "@/module";
    import { extend } from "@/utils/extend";
    import { ElMessageBox, ElMessage } from "element-plus";
    import { InfoFilled, Edit, Delete } from "@element-plus/icons-vue";

    const route = useRoute();
    const search = reactive({
        zuzhihuodongid: "",
        mingcheng: "",
        diqu: "",
        huodongzhuti: "",
        xingming: "",
        dianhua: "",
        shenqingzhuangtai: "",
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
                    canHuodongshenqingDelete(ids).then((res) => {
                        loadList(search.page);
                        resolve(res.data);
                    });
                })
                .catch((err) => {
                    reject(err);
                });
        });
    };

    // 加载活动申请列表方法
    const loadList = (page) => {
        // 加载
        if (unref(loading)) return;
        loading.value = true;
        search.page = page;

        http.post("/api/huodongshenqing/selectPages", search).then(
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
    .views-huodongshenqing-list {
    }
</style>
