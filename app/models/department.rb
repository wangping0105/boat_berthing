class Department < ApplicationRecord
  validates_uniqueness_of :name, message: "部门已经存在"
  validates_presence_of :name, message: "部门不能为空"
end
