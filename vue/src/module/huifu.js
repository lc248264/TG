import http from "@/utils/ajax/http";
import { useRoute } from "vue-router";
import { useUserStore } from "@/stores";
import { reactive, ref, unref } from "vue";
import rule from "@/utils/rule";
import { extend, isArray } from "@/utils/extend";
import { ElMessageBox } from "element-plus";
import router from "@/router";

import { canTieziFindById } from "./tiezi";

/**
 * 响应式的对象数据
 */

export const HuifuCreateForm = () => {
    var route = unref(router.currentRoute);
    const userStore = useUserStore();
    const $session = userStore.session;
    if (!route.query) {
        route = useRoute();
    }
    const form = {
        biaoti: "",
        huifuneirong: "",
        huifuren: $session.username,
    };

    return form;
};

function exportForm(form, readMap) {
    var autoText = ["tieziid", "biaoti"];
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
export const canHuifuCreateForm = (id, readMap) => {
    return new Promise(async (resolve, reject) => {
        var form = HuifuCreateForm();
        if (!readMap || !readMap.id) {
            readMap = await canTieziFindById(id).catch(reject);
        }
        exportForm(form, readMap);
        form.tieziid = readMap.id;
        resolve({ form, readMap });
    });
};

/**
 * 响应式获取回复 模块的表单字段数据
 * @return {UnwrapNestedRefs<{}>}
 */
export const useHuifuCreateForm = (id) => {
    const form = HuifuCreateForm();
    const formReactive = reactive(form);

    const readMap = reactive({});
    canTieziFindById(id).then(
        (map) => {
            exportForm(formReactive, map);
            extend(readMap, map);
            formReactive.tieziid = map.id;
        },
        (err) => {
            ElMessageBox.alert(err.message);
        }
    );
    return { form: formReactive, readMap };
};

export const canHuifuSelect = (filter, result) => {
    http.post("/api/huifu/selectPages").then((res) => {
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
export const useHuifuSelect = (filter) => {
    const result = reactive({
        lists: [],
        total: {},
    });
    canHuifuSelect(filter, result);
    return result;
};

/**
 * 根据
 * @param id
 * @return {Promise|form}
 */
export const canHuifuFindById = (id) => {
    return new Promise((resolve, reject) => {
        // 读取后台数据
        http.get("/api/huifu/findById", { id }).then((res) => {
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
export const useHuifuFindById = (id) => {
    var form = reactive({});

    canHuifuFindById(id).then((res) => {
        extend(form, res);
    });
    return form;
};

/**
 * 根据数据,插入到数据库中
 * @param data
 * @return {Promise<unknown>}
 */
export const canHuifuInsert = (data) => {
    return new Promise((resolve, reject) => {
        http.post("/api/huifu/insert", data)
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
export const canHuifuUpdate = (data) => {
    return new Promise((resolve, reject) => {
        http.post("/api/huifu/update", data)
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
export const canHuifuDelete = (id) => {
    var res = [];
    if (!isArray(id)) {
        res.push(id);
    } else {
        res = id;
    }

    return new Promise((resolve, reject) => {
        http.post("/api/huifu/delete", res)
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
