import http from "@/utils/ajax/http";
import { useRoute } from "vue-router";
import { useUserStore } from "@/stores";
import { reactive, ref, unref } from "vue";
import rule from "@/utils/rule";
import { extend, isArray } from "@/utils/extend";
import { ElMessageBox } from "element-plus";
import router from "@/router";

import { canHuodongshenqingFindById } from "./huodongshenqing";

/**
 * 响应式的对象数据
 */

export const ShenheshenqingCreateForm = () => {
    var route = unref(router.currentRoute);
    const userStore = useUserStore();
    const $session = userStore.session;
    if (!route.query) {
        route = useRoute();
    }
    const form = {
        mingcheng: "",
        diqu: "",
        chuangjianren: $session.username,
        xingming: "",
        dianhua: "",
        shenqingren: $session.username,
        shenhe: "",
        yijian: "",
    };

    return form;
};

function exportForm(form, readMap) {
    var autoText = ["huodongshenqingid", "zuzhihuodongid", "zuzhixinxiid", "mingcheng", "diqu", "chuangjianren", "xingming", "dianhua", "shenqingren"];
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
export const canShenheshenqingCreateForm = (id, readMap) => {
    return new Promise(async (resolve, reject) => {
        var form = ShenheshenqingCreateForm();
        if (!readMap || !readMap.id) {
            readMap = await canHuodongshenqingFindById(id).catch(reject);
        }
        exportForm(form, readMap);
        form.huodongshenqingid = readMap.id;
        resolve({ form, readMap });
    });
};

/**
 * 响应式获取审核申请 模块的表单字段数据
 * @return {UnwrapNestedRefs<{}>}
 */
export const useShenheshenqingCreateForm = (id) => {
    const form = ShenheshenqingCreateForm();
    const formReactive = reactive(form);

    const readMap = reactive({});
    canHuodongshenqingFindById(id).then(
        (map) => {
            exportForm(formReactive, map);
            extend(readMap, map);
            formReactive.huodongshenqingid = map.id;
        },
        (err) => {
            ElMessageBox.alert(err.message);
        }
    );
    return { form: formReactive, readMap };
};

export const canShenheshenqingSelect = (filter, result) => {
    http.post("/api/shenheshenqing/selectPages").then((res) => {
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
export const useShenheshenqingSelect = (filter) => {
    const result = reactive({
        lists: [],
        total: {},
    });
    canShenheshenqingSelect(filter, result);
    return result;
};

/**
 * 根据
 * @param id
 * @return {Promise|form}
 */
export const canShenheshenqingFindById = (id) => {
    return new Promise((resolve, reject) => {
        // 读取后台数据
        http.get("/api/shenheshenqing/findById", { id }).then((res) => {
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
export const useShenheshenqingFindById = (id) => {
    var form = reactive({});

    canShenheshenqingFindById(id).then((res) => {
        extend(form, res);
    });
    return form;
};

/**
 * 根据数据,插入到数据库中
 * @param data
 * @return {Promise<unknown>}
 */
export const canShenheshenqingInsert = (data) => {
    return new Promise((resolve, reject) => {
        http.post("/api/shenheshenqing/insert", data)
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
export const canShenheshenqingUpdate = (data) => {
    return new Promise((resolve, reject) => {
        http.post("/api/shenheshenqing/update", data)
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
export const canShenheshenqingDelete = (id) => {
    var res = [];
    if (!isArray(id)) {
        res.push(id);
    } else {
        res = id;
    }

    return new Promise((resolve, reject) => {
        http.post("/api/shenheshenqing/delete", res)
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
