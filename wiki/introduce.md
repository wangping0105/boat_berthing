# 简介
- 一个基本的架构包含api开发, devise登录, 几张基础表, cap自动化, whenever 任务
sidekiq队列, bootstrap前端

rails g model department name:string parent_id:integer path:string
rails g model user_department user_id:integer department_id:integer