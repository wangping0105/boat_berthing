module UserManagementsHelper
  def new_or_edit(entity)
    entity.new_record? ? "新增" : "编辑"
  end
end
