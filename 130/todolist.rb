class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end
end

class TodoList
  attr_accessor :title
  attr_reader :list

  def initialize(title)
    @title = title
    @list = []
  end

  def <<(todo)
    raise TypeError, 'Can only add Todo objects' unless todo.instance_of? Todo

    list << todo
  end
  alias_method :add, :<<

  def size
    list.size
  end

  def first
    list.first
  end

  def last
    list.last
  end

  def item_at(index)
    list[index]
  end

  def mark_done_at(index)
    item_at(index).done!
  end

  def mark_undone_at(index)
    item_at(index).undone!
  end

  def done?
    list.all? { |todo| todo.done? }
  end

  def done!
    list.each_index do |index|
      mark_done_at(index)
    end
  end

  def to_s
    text = "---- #{title} ---- \n"
    text << list.map(&:to_s).join("\n")
    text
  end

  def to_a
    list
  end

  def shift
    list.shift
  end

  def pop
    list.pop
  end

  def remove_at(index)
    list.delete(item_at(index))
  end

  def each
    list.each do |todo|
      yield(todo)
    end
    self
  end

  def select
    new_list = TodoList.new(title)
    each do |todo|
      new_list.add(todo) if yield(todo)
    end
    new_list
  end

  def find_by_title(title)
    select { |todo| todo.title == title }.first
  end

  def all_done
    select { |todo| todo.done? }
  end

  def all_not_done
    select { |todo| !todo.done? }
  end

  def mark_done(title)
    find_by_title(title) && find_by_title(title).done!
  end

  def mark_all_done
    each { |todo| todo.done! }
  end

  def mark_all_undone
    each { |todo| todo.undone! }
  end
end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
list = TodoList.new("Today's Todos")

list.add(todo1)
list.add(todo2)
list.add(todo3)

list.each do |todo|
  puts todo
end
