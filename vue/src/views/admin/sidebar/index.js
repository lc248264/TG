import { useUserStore } from "@/stores/user";

import guanliyuan from "./guanliyuan";
import zhiyuanzhe from "./zhiyuanzhe";
import guanfangzuzhi from "./guanfangzuzhi";

export function getMenus() {
    return new Promise((resolve, reject) => {
        var userStore = useUserStore();
        var cx = userStore.getSession("cx");
        if (cx == "管理员") {
            resolve(guanliyuan);
        }
        if (cx == "志愿者") {
            resolve(zhiyuanzhe);
        }
        if (cx == "官方组织") {
            resolve(guanfangzuzhi);
        }
    });
}

export default {
    getMenus,
};
