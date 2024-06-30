<template>
    <div class="views-jiesuanzhiyuan-updt">
        <div>
            <el-card class="box-card">
                <template #header>
                    <div class="clearfix">
                        <span class="title"> 添加结算志愿 </span>
                    </div>
                </template>

                <el-form :model="form" ref="formModel" label-width="140px" status-icon validate-on-rule-change>
                    <el-form-item v-if="isRead" label="名称" prop="mingcheng"> {{ form.mingcheng }} </el-form-item>

                    <el-form-item v-if="isRead" label="地区" prop="diqu">
                        <e-select-view module="diqu" :value="form.diqu" select="id" show="diquming"></e-select-view>
                    </el-form-item>

                    <el-form-item v-if="isRead" label="创建人" prop="chuangjianren"> {{ form.chuangjianren }} </el-form-item>

                    <el-form-item v-if="isRead" label="活动主题" prop="huodongzhuti"> {{ form.huodongzhuti }} </el-form-item>

                    <el-form-item v-if="isRead" label="开始时间" prop="kaishishijian"> {{ form.kaishishijian }} </el-form-item>

                    <el-form-item v-if="isRead" label="结束时间" prop="jieshushijian"> {{ form.jieshushijian }} </el-form-item>

                    <el-form-item v-if="isRead" label="活动时长" prop="huodongshizhang" :rules="[{validator:rule.checkNumber, message:'输入一个有效数字'}]">
                        {{ form.huodongshizhang }}
                    </el-form-item>

                    <el-form-item v-if="isRead" label="申请人" prop="shenqingren"> {{ form.shenqingren }} </el-form-item>

                    <el-form-item label="完成情况" prop="wanchengqingkuang">
                        <el-select v-model="form.wanchengqingkuang"
                            ><el-option label="优秀" value="优秀"></el-option>
                            <el-option label="良好" value="良好"></el-option>
                            <el-option label="一般" value="一般"></el-option>
                            <el-option label="差" value="差"></el-option>
                        </el-select>
                    </el-form-item>

                    <el-form-item label="意见" prop="yijian"> <el-input type="textarea" v-model="form.yijian"></el-input> </el-form-item>

                    <el-form-item v-if="btnText">
                        <el-button type="primary" @click="submit">{{ btnText }}</el-button>
                    </el-form-item>
                </el-form></el-card
            >
        </div>
    </div>
</template>

<script setup>
    import http from "@/utils/ajax/http";
    import DB from "@/utils/db";
    import rule from "@/utils/rule";
    import router from "@/router";

    import { ref, reactive, computed, watch } from "vue";
    import { useRoute } from "vue-router";
    import { session } from "@/utils/utils";
    import { ElMessage, ElMessageBox } from "element-plus";
    import { useJiesuanzhiyuanFindById, canJiesuanzhiyuanFindById, canJiesuanzhiyuanUpdate, canHuodongshenqingFindById } from "@/module";
    import { extend } from "@/utils/extend";

    const route = useRoute();
    const props = defineProps({
        id: [String, Number],
        btnText: {
            type: String,
            default: "保存",
        },
        isRead: {
            type: Boolean,
            default: true,
        },
        isHouxu: {
            type: Boolean,
            default: true,
        },
    });
    const form = useJiesuanzhiyuanFindById(props.id);
    const emit = defineEmits(["success"]);
    const formModel = ref();
    const loading = ref(false);

    const submit = () => {
        formModel.value.validate().then((res) => {
            if (loading.value) return;
            loading.value = true;
            canJiesuanzhiyuanUpdate(form).then(
                (res) => {
                    loading.value = false;
                    if (res.code == 0) {
                        emit("success", res.data);
                        if (props.isHouxu) {
                            ElMessage.success("更新成功");
                        }
                    } else {
                        ElMessageBox.alert(res.msg);
                    }
                },
                (err) => {
                    loading.value = false;
                    ElMessageBox.alert(err.message);
                }
            );
        });
    };

    const readMap = reactive({});
    watch(
        () => form.huodongshenqingid,
        (id) => {
            canHuodongshenqingFindById(id).then((res) => {
                extend(readMap, res);
            });
        }
    );
</script>

<style scoped lang="scss">
    .views-jiesuanzhiyuan-updt {
    }
</style>
