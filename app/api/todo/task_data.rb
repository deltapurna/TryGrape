module Todo
  class TaskData < Grape::API
    resource :tasks do
      desc "List all tasks"
      get do
        Task.all
      end

      desc "Get a task"
      params do
        requires :id, type: Integer, desc: "Task id."
      end
      get ':id' do
        Task.find(params[:id])
      end

      desc "Create a task"
      params do
        requires :name, type: String, desc: "Task name."
      end
      post do
        authenticate!
        current_user.tasks.create!(name: params[:name])
      end
    end
  end
end
