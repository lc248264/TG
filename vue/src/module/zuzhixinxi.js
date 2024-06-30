import http from "@/utils/ajax/http";
import { useRoute } from "vue-router";
import { useUserStore } from "@/stores";
import { reactive, ref, unref } from "vue";
import rule from "@/utils/rule";
import { extend, isArray } from "@/utils/extend";
import { ElMessageBox } from "element-plus";
import router from "@/router";

/**
 * 响应式的对象数据
 */

export const ZuzhixinxiCreateForm = () => {
    var route = unref(router.currentRoute);
    const userStore = useUserStore();
    const $session = userStore.session;
    if (!route.query) {
        route = useRoute();
    }
    const form = {
        bianhao: rule.getID(),
        mingcheng: "",
        diqu: "",
        tupian: "",
        dianhua: "",
        dizhi: "",
        jianjie: "",
        shenhezhuangtai: "待审核",
        chuangjianren: $session.username,
    };

    return form;
};

/**
 * 异步模式获取数据
 * @param id
 * @param readMap
 * @return {Promise}
 */
export const canZuzhixinxiCreateForm = () => {
    return new Promise(async (resolve, reject) => {
        var form = ZuzhixinxiCreateForm();
        resolve({ form });
    });
};

/**
 * 响应式获取组织信息 模块的表单字段数据
 * @return {UnwrapNestedRefs<{}>}
 */
export const useZuzhixinxiCreateForm = () => {
    const form = ZuzhixinxiCreateForm();
    const formReactive = reactive(form);

    return { form: formReactive };
};

export const canZuzhixinxiSelect = (filter, result) => {
    http.post("/api/zuzhixinxi/selectPages").then((res) => {
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
export const useZuzhixinxiSelect = (filter) => {
    const result = reactive({
        lists: [],
        total: {},
    });
    canZuzhixinxiSelect(filter, result);
    return result;
};

/**
 * 根据
 * @param id
 * @return {Promise|form}
 */
export const canZuzhixinxiFindById = (id) => {
    return new Promise((resolve, reject) => {
        // 读取后台数据
        http.get("/api/zuzhixinxi/findById", { id }).then((res) => {
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
export const useZuzhixinxiFindById = (id) => {
    var form = reactive({});

    canZuzhixinxiFindById(id).then((res) => {
        extend(form, res);
    });
    return form;
};

/**
 * 根据数据,插入到数据库中
 * @param data
 * @return {Promise<unknown>}
 */
export const canZuzhixinxiInsert = (data) => {
    return new Promise((resolve, reject) => {
        http.post("/api/zuzhixinxi/insert", data)
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
export const canZuzhixinxiUpdate = (data) => {
    return new Promise((resolve, reject) => {
        http.post("/api/zuzhixinxi/update", data)
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
export const canZuzhixinxiDelete = (id) => {
    var res = [];
    if (!isArray(id)) {
        res.push(id);
    } else {
        res = id;
    }

    return new Promise((resolve, reject) => {
        http.post("/api/zuzhixinxi/delete", res)
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
