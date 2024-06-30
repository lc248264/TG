<template>
    <div class="views-huodongshenqing-add">
        <div>
            <el-card class="box-card">
                <template #header>
                    <div class="clearfix">
                        <span class="title"> 添加活动申请 </span>
                    </div>
                </template>

                <el-form :model="form" ref="formModel" label-width="140px" status-icon validate-on-rule-change>
                    <el-form-item v-if="isRead" label="编号" prop="bianhao"> {{ form.bianhao }} </el-form-item>

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

                    <el-form-item v-if="isRead" label="活动地址" prop="huodongdizhi"> {{ form.huodongdizhi }} </el-form-item>

                    <el-form-item label="姓名" prop="xingming"> <el-input type="text" placeholder="输入姓名" style="width: 450px" v-model="form.xingming" /> </el-form-item>

                    <el-form-item label="电话" prop="dianhua"> <el-input type="text" placeholder="输入电话" style="width: 450px" v-model="form.dianhua" /> </el-form-item>

                    <el-form-item label="申请原因" prop="shenqingyuanyin"> <el-input type="textarea" v-model="form.shenqingyuanyin"></el-input> </el-form-item>

                    <el-form-item label="申请人" prop="shenqingren"> <el-input v-model="form.shenqingren" readonly style="width: 250px"></el-input> </el-form-item>

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
    import { useHuodongshenqingCreateForm, canHuodongshenqingInsert } from "@/module";

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
    const { form, readMap } = useHuodongshenqingCreateForm(props.id);
    const emit = defineEmits(["success"]);
    const formModel = ref();
    const loading = ref(false);
    var submit = () => {
        formModel.value.validate().then((res) => {
            if (loading.value) return;
            loading.value = true;
            canHuodongshenqingInsert(form).then(
                (res) => {
                    loading.value = false;
                    if (res.code == 0) {
                        emit("success", res.data);
                        if (props.isHouxu) {
                            ElMessage.success("添加成功");
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
    .views-huodongshenqing-add {
    }
</style>
