require "byebug"

class PolyTreeNode
    attr_reader :value, :parent, :children
    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(node)
        if node.nil?
            self.parent.children.delete(self)
            @parent = nil
        elsif self.parent.nil?
            @parent = node
            node.children << self
        else
            @parent.children.delete(self)
            @parent = node
            node.children << self
        end
    end

    def add_child(child)
        child.parent = self
    end

    def remove_child(child)
        child.parent = nil
    end
        
    def inspect
        self.value
    end

    # def dfs(target)
    #     p self
    #     stack = [self] #[a] #[b,c]
    #     until stack.length == 0
    #         # debugger
    #         p stack
    #         node = stack.pop
    #         return node if node.value == target
    #         node.children.each do |child|
    #             stack << child

    #         end
    #         nil
    #         # if node.children.length > 0
    #         #     node.children.each do |child|
    #         #         stack.unshift(child)
    #         #     end
    #         # end
    #         # node.children.each do |child|
    #         #     child.dfs(target)
    #         # end 
    #     end

    #     # if stack[-1].value == target
    #     #     return true
    #     # end
    #     # while stack.length != 0
    #     #     node = stack[-1]
            
    #     #     if stack[-1].children.length > 0
    #     #         stack << node.children
    #     #     end
    #     #     stack.delete(node)
    #     # end
    #     # return nil
    # end

    def dfs(target)
        # return nil if self is nil
        return self if self.value == target
        self.children.each do |child|
            search_result = child.dfs(target)
            return search_result if !search_result.nil?
        end
        nil
    end
        

    def bfs(target)
        return self if self.value == target
        queue = [self]
        until self.empty?
            node = queue.shift
            return node if node.value == target
            node.children.each do |child|
                queue << child
            end
        end
        return nil
    end
            
end