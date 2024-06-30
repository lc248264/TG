<template>
    <div class="views-tiezi-detail">
        <div>
            <el-card class="box-card">
                <template #header>
                    <div class="clearfix">
                        <span class="title"> 帖子详情 </span>
                    </div>
                </template>

                <div id="printdetail">
                    <el-descriptions class="margin-top" :column="3" border>
                        <el-descriptions-item label="标题"> {{ map.biaoti }} </el-descriptions-item>
                        <el-descriptions-item label="发布人"> {{ map.faburen }} </el-descriptions-item>
                        <el-descriptions-item label="发布时间"> {{ map.addtime }} </el-descriptions-item>
                    </el-descriptions>

                    <el-descriptions direction="vertical" class="margin-top" :column="1" border>
                        <el-descriptions-item label="图片"> <e-images :src="map.tupian" type="detail"></e-images> </el-descriptions-item>
                        <el-descriptions-item label="视频"> <vue3VideoPlay width="100%" :src="$formatImageSrc(map.shipin)" poster="" /> </el-descriptions-item>
                        <el-descriptions-item label="内容"> <div v-html="map.neirong"></div> </el-descriptions-item>
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
    import "vue3-video-play/dist/style.css";
    import vue3VideoPlay from "vue3-video-play";

    import { ref, reactive, watch, computed } from "vue";
    import { useRoute } from "vue-router";
    import { session } from "@/utils/utils";
    import { extend } from "@/utils/extend";
    import { useTieziFindById, canTieziFindById } from "@/module";

    const route = useRoute();

    // 获取详情页面的一行数据,当url参数id变更时，自动
    const map = useTieziFindById(route.query.id);
    // 当url参数id变更时，自动更新map中的数据
    watch(
        () => route.query.id,
        (id) => {
            canTieziFindById(id).then((res) => {
                extend(map, res);
            });
        }
    );
    // end 获取详情页面的一行数据
</script>

<style scoped lang="scss">
    .views-tiezi-detail {
    }
</style>
