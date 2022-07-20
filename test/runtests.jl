using MyLocalTest
using Test

@testset "MyLocalTest.jl" begin
    # Write your tests here.

    # lattice = reshape([
    #     4.648726,   0.0,        0.0,
    #     -2.324363,  4.025915,   0.0,
    #     0.0,        0.0,        12.850138
    # ], (1, :))

    # positions = reshape([
    #     0.0, 0.0, 3.2125345,
    #     0.0, 0.0, 9.6376035,
    #     0.0, 2.683944675305, 3.2125345,
    #     0.0, -2.683944675305, 9.6376035
    # ], (1, :))
    n_atoms = Int32(4)
    lattice = [4.64873  0.0  0.0  -2.32436  4.02592  0.0  0.0  0.0  12.8501]
    positions = [0.0  0.0  3.21253  0.0  0.0  9.6376  -2.32436e-6  2.68394  3.21253  2.32436e-6  -2.68394  9.6376]
    numbers = [Int32(6), Int32(6), Int32(6), Int32(6)]

    charge = Ref(0.0)
    periodic = [true, true, true]

    d4_error = MyLocalTest.dftd4_new_error()
    mol = MyLocalTest.dftd4_new_structure(
        d4_error, n_atoms, numbers, positions, charge, lattice, periodic
    )
    disp = MyLocalTest.dftd4_new_d4_model(d4_error, mol)
    param = MyLocalTest.dftd4_new_rational_damping(d4_error)

    energy = zeros(1)
    gradient = zeros(3 * n_atoms)
    sigma = zeros(9)
    MyLocalTest.dftd4_get_dispersion(
        d4_error, mol, disp, param, energy, gradient, sigma
    )

    MyLocalTest.dftd4_delete_param(param)
    MyLocalTest.dftd4_delete_param(disp)
    MyLocalTest.dftd4_delete_param(mol)
    MyLocalTest.dftd4_delete_param(d4_error)

    @test 1 == 1
end
