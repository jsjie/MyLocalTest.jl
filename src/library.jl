function set_lib!()
    if(isnothing(lib_dftd4.handle))
        lib_dftd4.handle = dlopen(lib_dftd4_name; throw_error=false)
    end
    return !isnothing(lib_dftd4.handle)
end

function close_lib_dftd4!()
    global lib_dftd4
    !isnothing(lib_dftd4.handle) && dlclose(lib_dftd4.handle)
    lib_dftd4.handle = nothing
    return
end

function reload_lib_dftd4()
    global lib_dftd4, lib_dftd4_name
    !isnothing(lib_dftd4.handle) && dlclose(lib_dftd4.handle)
    lib_dftd4.handle = dlopen(lib_dftd4_name; throw_error=false)
    return !isnothing(lib_dftd4.handle)
end

function get_func_ptr(name)
    global lib_dftd4
    return dlsym(lib_dftd4.handle, name; throw_error=false)
end
