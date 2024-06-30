<template>
    <div class="views-wxuser-add">
        <div>
            <el-card class="box-card">
                <template #header>
                    <div class="clearfix">
                        <span class="title"> 添加微信用户 </span>
                    </div>
                </template>

                <el-form :model="form" ref="formModel" label-width="140px" status-icon validate-on-rule-change>
                    <el-form-item label="昵称" prop="nickName"> <el-input type="text" placeholder="输入昵称" style="width: 450px" v-model="form.nickName" /> </el-form-item>

                    <el-form-item label="头像" prop="avatarUrl"> <e-upload-image v-model="form.avatarUrl" is-paste></e-upload-image> </el-form-item>

                    <el-form-item label="性别" prop="gender" :rules="[{validator:rule.checkNumber, message:'输入一个有效数字'}]">
                        <el-input type="number" placeholder="输入性别" style="width: 450px" v-model.number="form.gender" />
                    </el-form-item>

                    <el-form-item label="国家" prop="country"> <el-input type="text" placeholder="输入国家" style="width: 450px" v-model="form.country" /> </el-form-item>

                    <el-form-item label="省份" prop="province"> <el-input type="text" placeholder="输入省份" style="width: 450px" v-model="form.province" /> </el-form-item>

                    <el-form-item label="城市" prop="city"> <el-input type="text" placeholder="输入城市" style="width: 450px" v-model="form.city" /> </el-form-item>

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
    import { useWxuserCreateForm, canWxuserInsert } from "@/module";
    import { extend } from "vue-design-plugin";

    const route = useRoute();
    const props = defineProps({
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
    const { form } = useWxuserCreateForm();
    const emit = defineEmits(["success"]);
    const formModel = ref();
    const loading = ref(false);
    var submit = () => {
        formModel.value.validate().then((res) => {
            if (loading.value) return;
            loading.value = true;
            canWxuserInsert(form).then(
                (res) => {
                    loading.value = false;
                    if (res.code == 0) {
                        emit("success", res.data);
                        if (props.isHouxu) {
                            ElMessage.success("添加成功");
                            const f = useWxuserCreateForm();
                            extend(form, f.form);
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
    .views-wxuser-add {
    }
</style>
