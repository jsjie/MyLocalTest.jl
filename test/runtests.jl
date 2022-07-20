using MyLocalTest
using Test

@testset "MyLocalTest.jl" begin
    # Write your tests here.
    n_atoms = Int32(4)
    lattice = [
        4.648726,   0.0,        0.0,
        -2.324363,  4.025915,   0.0,
        0.0,        0.0,        12.850138
    ]
    positions = [
        0.0, 0.0, 3.2125345,
        0.0, 0.0, 9.6376035,
        0.0, 2.683944675305, 3.2125345,
        0.0, -2.683944675305, 9.6376035
    ]
    numbers = [Int32(6), Int32(6), Int32(6), Int32(6)]

    charge = 0.0
    periodic = [true, true, true]

    error = MyLocalTest.dftd4_new_error()
    mol = MyLocalTest.dftd4_new_structure(
        error, n_atoms, numbers, positions, charge, lattice, periodic
    )
    disp = MyLocalTest.dftd4_new_d4_model(error, mol)
    param = MyLocalTest.dftd4_new_rational_damping(error)

    energy = Ref(0.0)
    gradient = zeros(3 * n_atoms)
    sigma = zeros(9)
    MyLocalTest.dftd4_get_dispersion(
        error, mol, disp, param, energy, gradient, sigma
    )

    MyLocalTest.dftd4_delete_param(param)
    MyLocalTest.dftd4_delete_param(disp)
    MyLocalTest.dftd4_delete_param(mol)
    MyLocalTest.dftd4_delete_param(error)

    @test 1 == 1
end
