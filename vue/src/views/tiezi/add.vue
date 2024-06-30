<template>
    <div class="views-tiezi-add">
        <div>
            <el-card class="box-card">
                <template #header>
                    <div class="clearfix">
                        <span class="title"> 添加帖子 </span>
                    </div>
                </template>

                <el-form :model="form" ref="formModel" label-width="140px" status-icon validate-on-rule-change>
                    <el-form-item label="标题" prop="biaoti" required :rules="[{required:true, message:'请填写标题'}]">
                        <el-input type="text" placeholder="输入标题" style="width: 450px" v-model="form.biaoti" />
                    </el-form-item>

                    <el-form-item label="图片" prop="tupian"> <e-upload-images v-model="form.tupian" is-paste></e-upload-images> </el-form-item>

                    <el-form-item label="视频" prop="shipin"> <e-upload-file v-model="form.shipin"></e-upload-file> </el-form-item>

                    <el-form-item label="内容" prop="neirong"> <e-editor v-model="form.neirong" @getContent="getneirongContent"></e-editor> </el-form-item>

                    <el-form-item label="发布人" prop="faburen"> <el-input v-model="form.faburen" readonly style="width: 250px"></el-input> </el-form-item>

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
    import EEditor from "@/components/EEditor.vue";

    import { ref, reactive, computed } from "vue";
    import { useRoute } from "vue-router";
    import { session } from "@/utils/utils";
    import { ElMessage, ElMessageBox } from "element-plus";
    import { useTieziCreateForm, canTieziInsert } from "@/module";
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
    const { form } = useTieziCreateForm();
    const emit = defineEmits(["success"]);
    const formModel = ref();
    const loading = ref(false);
    var submit = () => {
        formModel.value.validate().then((res) => {
            if (loading.value) return;
            loading.value = true;
            canTieziInsert(form).then(
                (res) => {
                    loading.value = false;
                    if (res.code == 0) {
                        emit("success", res.data);
                        if (props.isHouxu) {
                            ElMessage.success("添加成功");
                            const f = useTieziCreateForm();
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

    const getneirongContent = (v) => {
        form.neirong = v;
    };
</script>

<style scoped lang="scss">
    .views-tiezi-add {
    }
</style>
