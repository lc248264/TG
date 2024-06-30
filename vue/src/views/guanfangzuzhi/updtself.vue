<template>
    <div class="views-guanfangzuzhi-updtself">
        <div>
            <el-card class="box-card">
                <template #header>
                    <div class="clearfix">
                        <span class="title"> 添加 </span>
                    </div>
                </template>

                <el-form :model="form" ref="formModel" label-width="140px" status-icon validate-on-rule-change>
                    <el-form-item
                        label="账号"
                        prop="zhanghao"
                        required
                        :rules="[{required:true, message:'请填写账号'}, {validator:rule.checkRemote, message:'内容重复了', checktype:'update', module:'guanfangzuzhi', col:'zhanghao', id:form.id, trigger:'blur'}]"
                    >
                        <el-input type="text" placeholder="输入账号" style="width: 450px" v-model="form.zhanghao" />
                    </el-form-item>

                    <el-form-item label="姓名" prop="xingming" required :rules="[{required:true, message:'请填写姓名'}]">
                        <el-input type="text" placeholder="输入姓名" style="width: 450px" v-model="form.xingming" />
                    </el-form-item>

                    <el-form-item label="性别" prop="xingbie">
                        <el-select v-model="form.xingbie"
                            ><el-option label="男" value="男"></el-option>
                            <el-option label="女" value="女"></el-option>
                        </el-select>
                    </el-form-item>

                    <el-form-item label="电话" prop="dianhua" :rules="[{validator:rule.checkPhone, message:'请输入正确手机号码'}]">
                        <el-input type="text" placeholder="输入电话" style="width: 450px" v-model="form.dianhua" />
                    </el-form-item>

                    <el-form-item label="头像" prop="touxiang"> <e-upload-image v-model="form.touxiang" is-paste></e-upload-image> </el-form-item>

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

    import { ref, reactive, computed } from "vue";
    import { useRoute } from "vue-router";
    import { session } from "@/utils/utils";
    import { ElMessage, ElMessageBox } from "element-plus";
    import { useGuanfangzuzhiFindById, canGuanfangzuzhiFindById, canGuanfangzuzhiUpdate } from "@/module";

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
    const form = useGuanfangzuzhiFindById(props.id);
    const emit = defineEmits(["success"]);
    const formModel = ref();
    const loading = ref(false);

    const submit = () => {
        formModel.value.validate().then((res) => {
            if (loading.value) return;
            loading.value = true;
            canGuanfangzuzhiUpdate(form).then(
                (res) => {
                    loading.value = false;
                    if (res.code == 0) {
                        emit("success", res.data);
                        if (props.isHouxu) {
                            ElMessage.success("更新成功");
                            router.go(-1);
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
</script>

<style scoped lang="scss">
    .views-guanfangzuzhi-updtself {
    }
</style>
