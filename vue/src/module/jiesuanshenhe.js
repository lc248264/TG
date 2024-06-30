import http from "@/utils/ajax/http";
import { useRoute } from "vue-router";
import { useUserStore } from "@/stores";
import { reactive, ref, unref } from "vue";
import rule from "@/utils/rule";
import { extend, isArray } from "@/utils/extend";
import { ElMessageBox } from "element-plus";
import router from "@/router";

import { canJiesuanzhiyuanFindById } from "./jiesuanzhiyuan";

/**
 * 响应式的对象数据
 */

export const JiesuanshenheCreateForm = () => {
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
        huodongzhuti: "",
        huodongshizhang: "",
        shenqingren: $session.username,
        wanchengqingkuang: "",
        shenhe: "",
        jiesuanshizhang: "",
        beizhu: "",
    };

    return form;
};

function exportForm(form, readMap) {
    var autoText = [
        "jiesuanzhiyuanid",
        "zuzhixinxiid",
        "zuzhihuodongid",
        "huodongshenqingid",
        "mingcheng",
        "diqu",
        "chuangjianren",
        "huodongzhuti",
        "huodongshizhang",
        "shenqingren",
        "wanchengqingkuang",
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
export const canJiesuanshenheCreateForm = (id, readMap) => {
    return new Promise(async (resolve, reject) => {
        var form = JiesuanshenheCreateForm();
        if (!readMap || !readMap.id) {
            readMap = await canJiesuanzhiyuanFindById(id).catch(reject);
        }
        exportForm(form, readMap);
        form.jiesuanzhiyuanid = readMap.id;
        resolve({ form, readMap });
    });
};

/**
 * 响应式获取结算审核 模块的表单字段数据
 * @return {UnwrapNestedRefs<{}>}
 */
export const useJiesuanshenheCreateForm = (id) => {
    const form = JiesuanshenheCreateForm();
    const formReactive = reactive(form);

    const readMap = reactive({});
    canJiesuanzhiyuanFindById(id).then(
        (map) => {
            exportForm(formReactive, map);
            extend(readMap, map);
            formReactive.jiesuanzhiyuanid = map.id;
        },
        (err) => {
            ElMessageBox.alert(err.message);
        }
    );
    return { form: formReactive, readMap };
};

export const canJiesuanshenheSelect = (filter, result) => {
    http.post("/api/jiesuanshenhe/selectPages").then((res) => {
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
export const useJiesuanshenheSelect = (filter) => {
    const result = reactive({
        lists: [],
        total: {},
    });
    canJiesuanshenheSelect(filter, result);
    return result;
};

/**
 * 根据
 * @param id
 * @return {Promise|form}
 */
export const canJiesuanshenheFindById = (id) => {
    return new Promise((resolve, reject) => {
        // 读取后台数据
        http.get("/api/jiesuanshenhe/findById", { id }).then((res) => {
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
export const useJiesuanshenheFindById = (id) => {
    var form = reactive({});

    canJiesuanshenheFindById(id).then((res) => {
        extend(form, res);
    });
    return form;
};

/**
 * 根据数据,插入到数据库中
 * @param data
 * @return {Promise<unknown>}
 */
export const canJiesuanshenheInsert = (data) => {
    return new Promise((resolve, reject) => {
        http.post("/api/jiesuanshenhe/insert", data)
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
export const canJiesuanshenheUpdate = (data) => {
    return new Promise((resolve, reject) => {
        http.post("/api/jiesuanshenhe/update", data)
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
export const canJiesuanshenheDelete = (id) => {
    var res = [];
    if (!isArray(id)) {
        res.push(id);
    } else {
        res = id;
    }

    return new Promise((resolve, reject) => {
        http.post("/api/jiesuanshenhe/delete", res)
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