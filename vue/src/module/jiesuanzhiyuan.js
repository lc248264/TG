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

export const JiesuanzhiyuanCreateForm = () => {
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
        kaishishijian: "",
        jieshushijian: "",
        huodongshizhang: "",
        shenqingren: $session.username,
        wanchengqingkuang: "",
        shenhezhuangtai: "待审核",
        yijian: "",
    };

    return form;
};

function exportForm(form, readMap) {
    var autoText = [
        "huodongshenqingid",
        "zuzhihuodongid",
        "zuzhixinxiid",
        "mingcheng",
        "diqu",
        "chuangjianren",
        "huodongzhuti",
        "kaishishijian",
        "jieshushijian",
        "huodongshizhang",
        "shenqingren",
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
export const canJiesuanzhiyuanCreateForm = (id, readMap) => {
    return new Promise(async (resolve, reject) => {
        var form = JiesuanzhiyuanCreateForm();
        if (!readMap || !readMap.id) {
            readMap = await canHuodongshenqingFindById(id).catch(reject);
        }
        exportForm(form, readMap);
        form.huodongshenqingid = readMap.id;
        resolve({ form, readMap });
    });
};

/**
 * 响应式获取结算志愿 模块的表单字段数据
 * @return {UnwrapNestedRefs<{}>}
 */
export const useJiesuanzhiyuanCreateForm = (id) => {
    const form = JiesuanzhiyuanCreateForm();
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

export const canJiesuanzhiyuanSelect = (filter, result) => {
    http.post("/api/jiesuanzhiyuan/selectPages").then((res) => {
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
export const useJiesuanzhiyuanSelect = (filter) => {
    const result = reactive({
        lists: [],
        total: {},
    });
    canJiesuanzhiyuanSelect(filter, result);
    return result;
};

/**
 * 根据
 * @param id
 * @return {Promise|form}
 */
export const canJiesuanzhiyuanFindById = (id) => {
    return new Promise((resolve, reject) => {
        // 读取后台数据
        http.get("/api/jiesuanzhiyuan/findById", { id }).then((res) => {
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
export const useJiesuanzhiyuanFindById = (id) => {
    var form = reactive({});

    canJiesuanzhiyuanFindById(id).then((res) => {
        extend(form, res);
    });
    return form;
};

/**
 * 根据数据,插入到数据库中
 * @param data
 * @return {Promise<unknown>}
 */
export const canJiesuanzhiyuanInsert = (data) => {
    return new Promise((resolve, reject) => {
        http.post("/api/jiesuanzhiyuan/insert", data)
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
export const canJiesuanzhiyuanUpdate = (data) => {
    return new Promise((resolve, reject) => {
        http.post("/api/jiesuanzhiyuan/update", data)
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
export const canJiesuanzhiyuanDelete = (id) => {
    var res = [];
    if (!isArray(id)) {
        res.push(id);
    } else {
        res = id;
    }

    return new Promise((resolve, reject) => {
        http.post("/api/jiesuanzhiyuan/delete", res)
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
