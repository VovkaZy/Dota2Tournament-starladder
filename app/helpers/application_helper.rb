# frozen_string_literal: true

module ApplicationHelper
  def bootstrap_flash_for(flash_type)
    {
      success: 'alert-success',
      error: 'alert-danger',
      alert: 'alert-warning',
      notice: 'alert-info'
    }[flash_type.to_sym] || flash_type.to_s
  end

  def datetime_formatter(datetime)
    datetime.strftime('%e %B %Y, %R')
  end
end
