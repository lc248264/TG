import http from "@/utils/ajax/http";
import { useRoute } from "vue-router";
import { useUserStore } from "@/stores";
import { reactive, ref, unref } from "vue";
import rule from "@/utils/rule";
import { extend, isArray } from "@/utils/extend";
import { ElMessageBox } from "element-plus";
import router from "@/router";

import { canZuzhihuodongFindById } from "./zuzhihuodong";

/**
 * 响应式的对象数据
 */

export const HuodongshenqingCreateForm = () => {
    var route = unref(router.currentRoute);
    const userStore = useUserStore();
    const $session = userStore.session;
    if (!route.query) {
        route = useRoute();
    }
    const form = {
        bianhao: "",
        mingcheng: "",
        diqu: "",
        chuangjianren: $session.username,
        huodongzhuti: "",
        kaishishijian: "",
        jieshushijian: "",
        huodongshizhang: "",
        huodongdizhi: "",
        xingming: "",
        dianhua: "",
        shenqingyuanyin: "",
        shenqingzhuangtai: "待审核",
        shenqingren: $session.username,
    };

    return form;
};

function exportForm(form, readMap) {
    var autoText = [
        "zuzhihuodongid",
        "zuzhixinxiid",
        "bianhao",
        "mingcheng",
        "diqu",
        "chuangjianren",
        "huodongzhuti",
        "kaishishijian",
        "jieshushijian",
        "huodongshizhang",
        "huodongdizhi",
    ];
    for (var txt of autoText) {
        form[txt] = readMap[txt];
    }
}

/**
 * 异步模式获取数据
 * @param id
 * @param readMap
 * @return {Promise}
 */
export const canHuodongshenqingCreateForm = (id, readMap) => {
    return new Promise(async (resolve, reject) => {
        var form = HuodongshenqingCreateForm();
        if (!readMap || !readMap.id) {
            readMap = await canZuzhihuodongFindById(id).catch(reject);
        }
        exportForm(form, readMap);
        form.zuzhihuodongid = readMap.id;
        resolve({ form, readMap });
    });
};

/**
 * 响应式获取活动申请 模块的表单字段数据
 * @return {UnwrapNestedRefs<{}>}
 */
export const useHuodongshenqingCreateForm = (id) => {
    const form = HuodongshenqingCreateForm();
    const formReactive = reactive(form);

    const readMap = reactive({});
    canZuzhihuodongFindById(id).then(
        (map) => {
            exportForm(formReactive, map);
            extend(readMap, map);
            formReactive.zuzhihuodongid = map.id;
        },
        (err) => {
            ElMessageBox.alert(err.message);
        }
    );
    return { form: formReactive, readMap };
};

export const canHuodongshenqingSelect = (filter, result) => {
    http.post("/api/huodongshenqing/selectPages").then((res) => {
        if (res.code == 0) {
            extend(result, res.data);
        } else {
            ElMessageBox.alert(res.msg);
        }
    });
};

/**
 * 获取分页数据
 * @param filter
 */
export const useHuodongshenqingSelect = (filter) => {
    const result = reactive({
        lists: [],
        total: {},
    });
    canHuodongshenqingSelect(filter, result);
    return result;
};

/**
 * 根据
 * @param id
 * @return {Promise|form}
 */
export const canHuodongshenqingFindById = (id) => {
    return new Promise((resolve, reject) => {
        // 读取后台数据
        http.get("/api/huodongshenqing/findById", { id }).then((res) => {
            if (res.code == 0) {
                resolve(res.data);
            } else {
                reject(new Error(res.msg));
            }
        }, reject);
    });
};

/**
 * 根据id 获取一行数据
 * @param id
 * @return {UnwrapNestedRefs<{}>}
 */
export const useHuodongshenqingFindById = (id) => {
    var form = reactive({});

    canHuodongshenqingFindById(id).then((res) => {
        extend(form, res);
    });
    return form;
};

/**
 * 根据数据,插入到数据库中
 * @param data
 * @return {Promise<unknown>}
 */
export const canHuodongshenqingInsert = (data) => {
    return new Promise((resolve, reject) => {
        http.post("/api/huodongshenqing/insert", data)
            .json()
            .then(
                (res) => {
                    resolve(res);
                },
                (err) => {
                    reject(err);
                }
            );
    });
};

/**
 * 根据数据更新数据库
 * @param data
 * @return {Promise<unknown>}
 */
export const canHuodongshenqingUpdate = (data) => {
    return new Promise((resolve, reject) => {
        http.post("/api/huodongshenqing/update", data)
            .json()
            .then(
                (res) => {
                    resolve(res);
                },
                (err) => {
                    reject(err);
                }
            );
    });
};

/**
 * 根据id 或者列表id
 * @param id
 * @return {Promise<unknown>}
 */
export const canHuodongshenqingDelete = (id) => {
    var res = [];
    if (!isArray(id)) {
        res.push(id);
    } else {
        res = id;
    }

    return new Promise((resolve, reject) => {
        http.post("/api/huodongshenqing/delete", res)
            .json()
            .then(
                (res) => {
                    resolve(res);
                },
                (err) => {
                    reject(err);
                }
            );
    });
};
