<template>
    <div class="views-ruzushenhe-detail">
        <div>
            <el-card class="box-card">
                <template #header>
                    <div class="clearfix">
                        <span class="title"> 入组审核详情 </span>
                    </div>
                </template>

                <div id="printdetail">
                    <el-descriptions class="margin-top" :column="3" border>
                        <el-descriptions-item label="编号"> {{ map.bianhao }} </el-descriptions-item>
                        <el-descriptions-item label="名称"> {{ map.mingcheng }} </el-descriptions-item>
                        <el-descriptions-item label="地区"> <e-select-view module="diqu" :value="map.diqu" select="id" show="diquming"></e-select-view> </el-descriptions-item>
                        <el-descriptions-item label="地址"> {{ map.dizhi }} </el-descriptions-item>
                        <el-descriptions-item label="创建人"> {{ map.chuangjianren }} </el-descriptions-item>
                        <el-descriptions-item label="姓名"> {{ map.xingming }} </el-descriptions-item>
                        <el-descriptions-item label="电话"> {{ map.dianhua }} </el-descriptions-item>
                        <el-descriptions-item label="申请人"> {{ map.shenqingren }} </el-descriptions-item>
                        <el-descriptions-item label="审核"> {{ map.shenhe }} </el-descriptions-item>
                    </el-descriptions>

                    <el-descriptions direction="vertical" class="margin-top" :column="1" border>
                        <el-descriptions-item label="意见"> {{ map.yijian }} </el-descriptions-item>
                    </el-descriptions>
                </div>
                <div class="no-print">
                    <el-button @click="$router.go(-1)">返回</el-button>
                    <el-button @click="$print('#printdetail')">打印</el-button>
                </div>
            </el-card>
        </div>
    </div>
</template>

<script setup>
    import http from "@/utils/ajax/http";
    import DB from "@/utils/db";

    import { ref, reactive, watch, computed } from "vue";
    import { useRoute } from "vue-router";
    import { session } from "@/utils/utils";
    import { extend } from "@/utils/extend";
    import { useRuzushenheFindById, canRuzushenheFindById } from "@/module";

    const route = useRoute();

    // 获取详情页面的一行数据,当url参数id变更时，自动
    const map = useRuzushenheFindById(route.query.id);
    // 当url参数id变更时，自动更新map中的数据
    watch(
        () => route.query.id,
        (id) => {
            canRuzushenheFindById(id).then((res) => {
                extend(map, res);
            });
        }
    );
    // end 获取详情页面的一行数据
</script>

<style scoped lang="scss">
    .views-ruzushenhe-detail {
    }
</style>
