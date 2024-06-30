<template>
    <div class="views-jiesuanshenhe-add">
        <div>
            <el-card class="box-card">
                <template #header>
                    <div class="clearfix">
                        <span class="title"> 添加签退审核 </span>
                    </div>
                </template>

                <el-form :model="form" ref="formModel" label-width="140px" status-icon validate-on-rule-change>
                    <el-form-item v-if="isRead" label="名称" prop="mingcheng"> {{ form.mingcheng }} </el-form-item>

                    <el-form-item v-if="isRead" label="地区" prop="diqu">
                        <e-select-view module="diqu" :value="form.diqu" select="id" show="diquming"></e-select-view>
                    </el-form-item>

                    <el-form-item v-if="isRead" label="创建人" prop="chuangjianren"> {{ form.chuangjianren }} </el-form-item>

                    <el-form-item v-if="isRead" label="活动主题" prop="huodongzhuti"> {{ form.huodongzhuti }} </el-form-item>

                    <el-form-item v-if="isRead" label="活动时长" prop="huodongshizhang" :rules="[{validator:rule.checkNumber, message:'输入一个有效数字'}]">
                        {{ form.huodongshizhang }}
                    </el-form-item>

                    <el-form-item v-if="isRead" label="申请人" prop="shenqingren"> {{ form.shenqingren }} </el-form-item>

                    <el-form-item v-if="isRead" label="完成情况" prop="wanchengqingkuang"> {{ form.wanchengqingkuang }} </el-form-item>

                    <el-form-item label="审核" prop="shenhe">
                        <el-select v-model="form.shenhe"
                            ><el-option label="通过" value="通过"></el-option>
                            <el-option label="不通过" value="不通过"></el-option>
                        </el-select>
                    </el-form-item>

                    <el-form-item
                        label="结算时长"
                        prop="jiesuanshizhang"
                        :rules="[{validator:rule.checkNumber, message:'输入一个有效数字'}, {validator:rule.checkMin, value:1}, {validator:rule.checkMax, message:'请输入活动时长内的值', value:readMap.huodongshizhang}]"
                    >
                        <el-input type="number" placeholder="输入结算时长" style="width: 450px" v-model.number="form.jiesuanshizhang" />
                    </el-form-item>

                    <el-form-item label="备注" prop="beizhu"> <el-input type="textarea" v-model="form.beizhu"></el-input> </el-form-item>

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
    import { useJiesuanshenheCreateForm, canJiesuanshenheInsert } from "@/module";

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
    const { form, readMap } = useJiesuanshenheCreateForm(props.id);
    const emit = defineEmits(["success"]);
    const formModel = ref();
    const loading = ref(false);
    var submit = () => {
        formModel.value.validate().then((res) => {
            if (loading.value) return;
            loading.value = true;
            canJiesuanshenheInsert(form).then(
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
    .views-jiesuanshenhe-add {
    }
</style>
