function dftd4_new_error()
    return ccall(
        (:dftd4_new_error, lib_dftd4_name),
        Ptr{Any},
        ()
    )
end

function dftd4_new_structure(error, n_atoms, numbers, positions, charge, lattice, periodic)
    return ccall(
        (:dftd4_new_structure, lib_dftd4_name),
        Ptr{Any},
        # (Ptr{Any}, Cint, Vector{Cint}, Vector{Cdouble}, Cdouble, Vector{Cdouble}, Vector{Bool}),
        (Ptr{Any}, Int64, Ptr{Vector{Int64}}, Ptr{Vector{Float64}}, Ptr{Float64}, Ptr{Vector{Float64}}, Ptr{Vector{Bool}}),
        error, n_atoms, numbers, positions, charge, lattice, periodic
    )
end

function dftd4_new_d4_model(error, mol)
    return ccall(
        (:dftd4_new_d4_model, lib_dftd4_name),
        Ptr{Any},
        (Ptr{Any}, Ptr{Any}),
        error, mol
    )
end

function dftd4_new_rational_damping(error)
    # 目前只有PBE的参数
    return ccall(
        (:dftd4_new_rational_damping, lib_dftd4_name),
        Ptr{Any},
        (Ptr{Any}, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble),
        error, 1.0, 0.95948085, 1.0, 0.38574991, 4.80688534, 16.0
    )
end

function dftd4_get_dispersion(error, mol, disp, param, energy, gradient, sigma)
    return ccall(
        (:dftd4_get_dispersion, lib_dftd4_name),
        Cvoid,
        (Ptr{Any}, Ptr{Any}, Ptr{Any}, Ptr{Any}, Ptr{Float64}, Ptr{Vector{Float64}}, Ptr{Vector{Float64}}),
        # (Ptr{Any}, Ptr{Any}, Ptr{Any}, Ptr{Any}, Vector{Cdouble}, Vector{Cdouble}, Vector{Cdouble}),
        error, mol, disp, param, energy, gradient, sigma
    )
end

function dftd4_delete_param(param)
    return ccall(
        (:dftd4_delete_param, lib_dftd4_name),
        Cvoid,
        (Ptr{Any}, ),
        param
    )
end

function dftd4_delete_model(disp)
    return ccall(
        (:dftd4_delete_model, lib_dftd4_name),
        Cvoid,
        (Ptr{Any}, ),
        disp
    )
end

function dftd4_delete_structure(mol)
    return ccall(
        (:dftd4_delete_structure, lib_dftd4_name),
        Cvoid,
        (Ptr{Any}, ),
        mol
    )
end

function dftd4_delete_error(error)
    return ccall(
        (:dftd4_delete_error, lib_dftd4_name),
        Cvoid,
        (Ptr{Any}, ),
        error
    )
end

function dftd4_check_error(error)
    return ccall(
        (:dftd4_check_error, lib_dftd4_name),
        Cint,
        (Ptr{Any}, ),
        error
    )
end
