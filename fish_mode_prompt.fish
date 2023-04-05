function fish_mode_prompt
    if [ $fish_key_bindings = fish_vi_key_bindings ]
        or test "$fish_key_bindings" = "fish_hybrid_key_bindings"
        switch $fish_bind_mode
            case default
                set_color -b eb6f92
            case insert
                set_color -b 9ccfd8
            case visual
                set_color -b f6c177
            case replace_one
                set_color -b c4a7e7
        end
        echo -n " "
    end
end
