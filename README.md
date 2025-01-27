# TG志愿服务平台
## 项目背景
随着高校信息化建设的飞速发展，大多数高校已经初步建成了数字化校园。然而，目前的数字化校园仍存在一些问题，例如志愿活动的管理和协调依然面临一些困难。志愿活动在高校内广泛开展，包括社会服务、学术活动、文化活动等。因此，需要一个综合的校园志愿管理平台来解决志愿活动的管理问题。
## 项目的目的和意义
本项目旨在设计和开发一款校园志愿管理平台，为高校提供一套全面的志愿活动管理工具。这个平台将有助于学生更好地参与志愿活动，提高校园志愿服务的效率和质量，同时也将为学校提供志愿活动的数据分析和管理工具。
## 采取的技术路线
### 前端技术
小程序：前端主要采用小程序，这是一种轻量级的应用程序，专门设计用于移动设备，如微信小程序。小程序面向用户，用户界面部分使用WXML（WeChat Markup Language）定义页面结构，WXSS（WeChat Style Sheet）定义页面样式，JS编写页面逻辑。小程序适用于移动设备，并且能够为用户提供便捷的志愿活动浏览和报名。
浏览器界面：管理员界面采用传统的浏览器界面，方便活动的管理与审批，可以通过网页浏览器访问。这部分可以使用HTML、CSS和JavaScript构建，以实现管理人员的管理，审批、数据分析等功能。
### 后端技术
1. Spring Boot + Spring + MyBatis框架：后端采用Spring Boot、Spring和MyBatis相结合的框架，这是现代Java企业级应用开发的常见组合。它提供了良好的模块化支持和各种工具，以简化开发工作，提升开发效率。
2. Spring：Spring提供了控制反转（IoC）和面向切面编程（AOP）的容器框架，有助于管理应用的组件和依赖注入。Spring能够处理事务管理、安全性等重要方面，提供了全面的企业级应用程序开发支持。
3. Spring Boot：Spring Boot通过简化配置和自动化配置，极大地简化了Spring应用程序的开发和部署。它内置了Web服务器（如Tomcat），开发人员无需手动配置即可快速启动应用。Spring Boot还提供了多种起步依赖和开发工具，使得开发过程更加高效。
4. MyBatis：MyBatis是一个Java持久层框架，用于数据库操作。它简化了SQL操作，通过XML或注解将Java对象映射到数据库记录，方便管理数据库访问。MyBatis可以与Spring Boot无缝集成，实现数据层的高效操作和管理。
### 通信和数据储存
1. 通信协议：前端与后端之间的通信采用HTTP协议，这是一种标准的Web通信协议，用于传输数据。
2. 数据交换格式：数据交换采用JSON格式，这是一种轻量级的数据交换格式，易于解析和处理。
3. 数据库：系统的数据存储采用关系型数据库MySQL，用于存储用户信息、志愿活动数据、报名信息、志愿时长等关键信息。
