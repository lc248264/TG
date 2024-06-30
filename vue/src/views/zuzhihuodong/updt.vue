<template>
    <div class="views-zuzhihuodong-updt">
        <div>
            <el-card class="box-card">
                <template #header>
                    <div class="clearfix">
                        <span class="title"> 添加组织活动 </span>
                    </div>
                </template>

                <el-form :model="form" ref="formModel" label-width="140px" status-icon validate-on-rule-change>
                    <el-form-item v-if="isRead" label="编号" prop="bianhao"> {{ form.bianhao }} </el-form-item>

                    <el-form-item v-if="isRead" label="名称" prop="mingcheng"> {{ form.mingcheng }} </el-form-item>

                    <el-form-item v-if="isRead" label="地区" prop="diqu">
                        <e-select-view module="diqu" :value="form.diqu" select="id" show="diquming"></e-select-view>
                    </el-form-item>

                    <el-form-item v-if="isRead" label="创建人" prop="chuangjianren"> {{ form.chuangjianren }} </el-form-item>

                    <el-form-item label="活动主题" prop="huodongzhuti" required :rules="[{required:true, message:'请填写活动主题'}]">
                        <el-input type="text" placeholder="输入活动主题" style="width: 450px" v-model="form.huodongzhuti" />
                    </el-form-item>

                    <el-form-item label="图片" prop="tupian" required :rules="[{required:true, message:'请填写图片'}]">
                        <e-upload-image v-model="form.tupian" is-paste></e-upload-image>
                    </el-form-item>

                    <el-form-item label="开始时间" prop="kaishishijian" :rules="[{required:true, message:'请填写开始时间'}]">
                        <el-date-picker v-model="form.kaishishijian" type="datetime" :editable="false" value-format="YYYY-MM-DD HH:mm:ss" placeholder="选择日期"> </el-date-picker>
                    </el-form-item>

                    <el-form-item label="结束时间" prop="jieshushijian" :rules="[{required:true, message:'请填写结束时间'}]">
                        <el-date-picker v-model="form.jieshushijian" type="datetime" :editable="false" value-format="YYYY-MM-DD HH:mm:ss" placeholder="选择日期"> </el-date-picker>
                    </el-form-item>

                    <el-form-item label="活动人数" prop="huodongrenshu" :rules="[{validator:rule.checkNumber, message:'输入一个有效数字'}]">
                        <el-input type="number" placeholder="输入活动人数" style="width: 450px" v-model.number="form.huodongrenshu" />
                    </el-form-item>

                    <el-form-item label="活动地址" prop="huodongdizhi">
                        <el-input type="text" placeholder="输入活动地址" style="width: 450px" v-model="form.huodongdizhi" />
                    </el-form-item>

                    <el-form-item label="活动介绍" prop="huodongjieshao"> <el-input type="textarea" v-model="form.huodongjieshao"></el-input> </el-form-item>

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
    import { useZuzhihuodongFindById, canZuzhihuodongFindById, canZuzhihuodongUpdate, canZuzhixinxiFindById } from "@/module";
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
    const form = useZuzhihuodongFindById(props.id);
    const emit = defineEmits(["success"]);
    const formModel = ref();
    const loading = ref(false);

    const submit = () => {
        formModel.value.validate().then((res) => {
            if (loading.value) return;
            loading.value = true;
            canZuzhihuodongUpdate(form).then(
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
        () => form.zuzhixinxiid,
        (id) => {
            canZuzhixinxiFindById(id).then((res) => {
                extend(readMap, res);
            });
        }
    );
</script>

<style scoped lang="scss">
    .views-zuzhihuodong-updt {
    }
</style>
