class ErrorsController < ApplicationController
  def show
    exception = request.env["action_dispatch.exception"]
    @status = ActionDispatch::ExceptionWrapper.status_code_for_exception(exception.class.name)
    @message = case @status
               when 404 then "페이지를 찾을 수 없습니다."
               when 422 then "요청을 처리할 수 없어요."
               else "서버에서 오류가 발생했어요."
               end

    render "errors/show", status: @status
  end
end
