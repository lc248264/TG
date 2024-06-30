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

export const TieziCreateForm = () => {
    var route = unref(router.currentRoute);
    const userStore = useUserStore();
    const $session = userStore.session;
    if (!route.query) {
        route = useRoute();
    }
    const form = {
        biaoti: "",
        tupian: "",
        shipin: "",
        neirong: "",
        faburen: $session.username,
    };

    return form;
};

/**
 * 异步模式获取数据
 * @param id
 * @param readMap
 * @return {Promise}
 */
export const canTieziCreateForm = () => {
    return new Promise(async (resolve, reject) => {
        var form = TieziCreateForm();
        resolve({ form });
    });
};

/**
 * 响应式获取帖子 模块的表单字段数据
 * @return {UnwrapNestedRefs<{}>}
 */
export const useTieziCreateForm = () => {
    const form = TieziCreateForm();
    const formReactive = reactive(form);

    return { form: formReactive };
};

export const canTieziSelect = (filter, result) => {
    http.post("/api/tiezi/selectPages").then((res) => {
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
export const useTieziSelect = (filter) => {
    const result = reactive({
        lists: [],
        total: {},
    });
    canTieziSelect(filter, result);
    return result;
};

/**
 * 根据
 * @param id
 * @return {Promise|form}
 */
export const canTieziFindById = (id) => {
    return new Promise((resolve, reject) => {
        // 读取后台数据
        http.get("/api/tiezi/findById", { id }).then((res) => {
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
export const useTieziFindById = (id) => {
    var form = reactive({});

    canTieziFindById(id).then((res) => {
        extend(form, res);
    });
    return form;
};

/**
 * 根据数据,插入到数据库中
 * @param data
 * @return {Promise<unknown>}
 */
export const canTieziInsert = (data) => {
    return new Promise((resolve, reject) => {
        http.post("/api/tiezi/insert", data)
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
export const canTieziUpdate = (data) => {
    return new Promise((resolve, reject) => {
        http.post("/api/tiezi/update", data)
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
export const canTieziDelete = (id) => {
    var res = [];
    if (!isArray(id)) {
        res.push(id);
    } else {
        res = id;
    }

    return new Promise((resolve, reject) => {
        http.post("/api/tiezi/delete", res)
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

export const useTiezidianzan = (id, iss, count) => {
    const is_dianzan = iss ? iss : ref(false);
    const dianzanCount = count ? count : ref(0);

    http.get("/api/tiezi/getdianzan", { id }).then((res) => {
        if (res.code == 0) {
            is_dianzan.value = res.data.is_dianzan;
            dianzanCount.value = res.data.dianzanCount;
        }
    });

    return { is_dianzan, dianzanCount };
};
