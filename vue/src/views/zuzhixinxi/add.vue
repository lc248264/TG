<template>
    <div class="views-zuzhixinxi-add">
        <div>
            <el-card class="box-card">
                <template #header>
                    <div class="clearfix">
                        <span class="title"> 添加组织信息 </span>
                    </div>
                </template>

                <el-form :model="form" ref="formModel" label-width="140px" status-icon validate-on-rule-change>
                    <el-form-item label="编号" prop="bianhao" :rules="[{required:true, message:'请填写编号'}]">
                        <el-input type="text" placeholder="输入编号" style="width: 450px" v-model="form.bianhao" />
                    </el-form-item>

                    <el-form-item
                        label="名称"
                        prop="mingcheng"
                        required
                        :rules="[{required:true, message:'请填写名称'}, {validator:rule.checkRemote, message:'内容重复了', checktype:'insert', module:'zuzhixinxi', col:'mingcheng', trigger:'blur'}]"
                    >
                        <el-input type="text" placeholder="输入名称" style="width: 450px" v-model="form.mingcheng" />
                    </el-form-item>

                    <el-form-item label="地区" prop="diqu">
                        <el-select v-model="form.diqu"><e-select-option type="option" module="diqu" value="id" label="diquming"></e-select-option></el-select>
                    </el-form-item>

                    <el-form-item label="图片" prop="tupian"> <e-upload-image v-model="form.tupian" is-paste></e-upload-image> </el-form-item>

                    <el-form-item label="电话" prop="dianhua" :rules="[{validator:rule.checkPhone, message:'请输入正确手机号码'}]">
                        <el-input type="text" placeholder="输入电话" style="width: 450px" v-model="form.dianhua" />
                    </el-form-item>

                    <el-form-item label="地址" prop="dizhi"> <el-input type="text" placeholder="输入地址" style="width: 450px" v-model="form.dizhi" /> </el-form-item>

                    <el-form-item label="简介" prop="jianjie"> <el-input type="textarea" v-model="form.jianjie"></el-input> </el-form-item>

                    <el-form-item label="创建人" prop="chuangjianren"> <el-input v-model="form.chuangjianren" readonly style="width: 250px"></el-input> </el-form-item>

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
    import { useZuzhixinxiCreateForm, canZuzhixinxiInsert } from "@/module";
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
    const { form } = useZuzhixinxiCreateForm();
    const emit = defineEmits(["success"]);
    const formModel = ref();
    const loading = ref(false);
    var submit = () => {
        formModel.value.validate().then((res) => {
            if (loading.value) return;
            loading.value = true;
            canZuzhixinxiInsert(form).then(
                (res) => {
                    loading.value = false;
                    if (res.code == 0) {
                        emit("success", res.data);
                        if (props.isHouxu) {
                            ElMessage.success("添加成功");
                            const f = useZuzhixinxiCreateForm();
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
    .views-zuzhixinxi-add {
    }
</style>
