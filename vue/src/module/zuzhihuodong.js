import http from "@/utils/ajax/http";
import { useRoute } from "vue-router";
import { useUserStore } from "@/stores";
import { reactive, ref, unref } from "vue";
import rule from "@/utils/rule";
import { extend, isArray } from "@/utils/extend";
import { ElMessageBox } from "element-plus";
import router from "@/router";

import { canZuzhixinxiFindById } from "./zuzhixinxi";

/**
 * 响应式的对象数据
 */

export const ZuzhihuodongCreateForm = () => {
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
        tupian: "",
        kaishishijian: rule.date("Y-m-d H:i:s"),
        jieshushijian: rule.date("Y-m-d H:i:s"),
        huodongrenshu: "",
        huodongdizhi: "",
        shenhezhuangtai: "待审核",
        huodongjieshao: "",
    };

    return form;
};

function exportForm(form, readMap) {
    var autoText = ["zuzhixinxiid", "bianhao", "mingcheng", "diqu", "chuangjianren"];
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
export const canZuzhihuodongCreateForm = (id, readMap) => {
    return new Promise(async (resolve, reject) => {
        var form = ZuzhihuodongCreateForm();
        if (!readMap || !readMap.id) {
            readMap = await canZuzhixinxiFindById(id).catch(reject);
        }
        exportForm(form, readMap);
        form.zuzhixinxiid = readMap.id;
        resolve({ form, readMap });
    });
};

/**
 * 响应式获取组织活动 模块的表单字段数据
 * @return {UnwrapNestedRefs<{}>}
 */
export const useZuzhihuodongCreateForm = (id) => {
    const form = ZuzhihuodongCreateForm();
    const formReactive = reactive(form);

    const readMap = reactive({});
    canZuzhixinxiFindById(id).then(
        (map) => {
            exportForm(formReactive, map);
            extend(readMap, map);
            formReactive.zuzhixinxiid = map.id;
        },
        (err) => {
            ElMessageBox.alert(err.message);
        }
    );
    return { form: formReactive, readMap };
};

export const canZuzhihuodongSelect = (filter, result) => {
    http.post("/api/zuzhihuodong/selectPages").then((res) => {
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
export const useZuzhihuodongSelect = (filter) => {
    const result = reactive({
        lists: [],
        total: {},
    });
    canZuzhihuodongSelect(filter, result);
    return result;
};

/**
 * 根据
 * @param id
 * @return {Promise|form}
 */
export const canZuzhihuodongFindById = (id) => {
    return new Promise((resolve, reject) => {
        // 读取后台数据
        http.get("/api/zuzhihuodong/findById", { id }).then((res) => {
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
export const useZuzhihuodongFindById = (id) => {
    var form = reactive({});

    canZuzhihuodongFindById(id).then((res) => {
        extend(form, res);
    });
    return form;
};

/**
 * 根据数据,插入到数据库中
 * @param data
 * @return {Promise<unknown>}
 */
export const canZuzhihuodongInsert = (data) => {
    return new Promise((resolve, reject) => {
        http.post("/api/zuzhihuodong/insert", data)
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
export const canZuzhihuodongUpdate = (data) => {
    return new Promise((resolve, reject) => {
        http.post("/api/zuzhihuodong/update", data)
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
export const canZuzhihuodongDelete = (id) => {
    var res = [];
    if (!isArray(id)) {
        res.push(id);
    } else {
        res = id;
    }

    return new Promise((resolve, reject) => {
        http.post("/api/zuzhihuodong/delete", res)
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
