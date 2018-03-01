module Beardown
  class Document
    REGEXP_LIST_TODO = /^(\t*) *([\+\-])\s+(.+)\n?/

    def scan_list_todo(s)
      t_count = s[1].length
      check_status = case s[2]
                     when "-" then "uncheck"
                     when "+" then "checked"
                     end
      content = s[3]

      ex_svg = :add_extension_todo_svg
      @extensions << ex_svg unless @extensions.include? ex_svg

      convert_list_todo(t_count, check_status, content)
    end

    def convert_list_todo(t_count, check_status, content)
      ul_open = %(<ul class='todo-list #{check_status}'><li><svg width="16" height="16" viewBox="0 0 16 16"><use xlink:href="#todobox-#{check_status}"></use></svg>)
      ul_close = %(</li></ul>)
      "<ul>" * t_count + ul_open + scan_spans(StringScanner.new(content)) + ul_close + "</ul>" * t_count + "\n"
    end

    def add_extension_todo_svg
      <<~HEREDOC
        <svg display="none" version=1.1 xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
        <defs>
            <symbol id="todobox-uncheck"><g fill="none" fill-rule="evenodd">
                <path d="M.5 12.853c0 1.462 1.185 2.647 2.647 2.647h9.706c1.462 0 2.647-1.185 2.647-2.647V3.147C15.5 1.685 14.315.5 12.853.5H3.147C1.685.5.5 1.685.5 3.147v9.706z" fill="#FFF"/>
                <path d="M.5 12.853c0 1.462 1.185 2.647 2.647 2.647h9.706c1.462 0 2.647-1.185 2.647-2.647V3.147C15.5 1.685 14.315.5 12.853.5H3.147C1.685.5.5 1.685.5 3.147v9.706z" stroke="#B4B4B4"/></g>
            </symbol>
            <symbol id="todobox-checked"><g fill="none" fill-rule="evenodd">
                <path d="M.5 12.853c0 1.462 1.185 2.647 2.647 2.647h9.706c1.462 0 2.647-1.185 2.647-2.647V3.147C15.5 1.685 14.315.5 12.853.5H3.147C1.685.5.5 1.685.5 3.147v9.706z" fill="#FFF"/>
                <path d="M.5 12.853c0 1.462 1.185 2.647 2.647 2.647h9.706c1.462 0 2.647-1.185 2.647-2.647V3.147C15.5 1.685 14.315.5 12.853.5H3.147C1.685.5.5 1.685.5 3.147v9.706z" stroke="#B4B4B4"/>
                <path d="M12.526 4.615L6.636 9.58l-2.482-.836c-.19-.06-.408.003-.518.15-.116.15-.106.352.026.495l2.722 2.91c.086.09.21.144.34.144h.046c.12-.013.234-.07.307-.156l6.1-7.125c.143-.166.123-.407-.046-.548-.164-.138-.435-.14-.604 0z" fill="#555"/></g></symbol>
        </defs>
        </svg>
      HEREDOC
    end
  end
end

