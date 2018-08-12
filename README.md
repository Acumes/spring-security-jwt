# 基于spring-boot当前最新版整合security与jwt

- 前后端分离
- 前端管理项目(新手Vue): https://github.com/Acumes/Vue-Admin
- 前端管理项目(高级Vue):https://github.com/Acumes/Vue-element-admin
- spring-security基于角色的权限管理 >>> 权限后补
- 统一异常管理
- spring-data-redis整合
- 整合swagger-ui接口文档，访问地址 http://localhost:8082/swagger-ui.html
- ![image](https://github.com/Acumes/img/blob/master/8_05/20180805133116701.png)
- Mybatis数据源
- druid sql监控
- ![image](https://github.com/Acumes/img/blob/master/8_05/20180805132948843.png)

- 项目依赖Mysql、Redis
- 在application.properties中配置数据库连接、Redis连接及web访问端口
- 执行dbscript中的数据库初始化脚本
- 启动Application

- 获取token
- ![image](https://github.com/Acumes/img/blob/master/8_05/20180805134159519.png)

- 直接访问：http://localhost:8002/#/login    admin/admin 登录
- ![image](https://github.com/Acumes/img/blob/master/8_08/3.png)
- 登录成功 >> 首页
- ![image](https://github.com/Acumes/img/blob/master/8_08/1.png)
- 用户管理 >  实现了增删改查  分页查询
- ![image](https://github.com/Acumes/img/blob/master/8_08/2.png)

- 权限添加就不在这个Vue-admin 中添加， >>>> 后补这个项目完善 >>>> :https://github.com/Acumes/Vue-element-admin


- 博客地址:https://blog.csdn.net/a295277302/article/details/81430537
