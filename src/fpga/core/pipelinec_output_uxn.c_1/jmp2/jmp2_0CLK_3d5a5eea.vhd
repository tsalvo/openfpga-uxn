-- Timing params:
--   Fixed?: True
--   Pipeline Slices: []
--   Input regs?: False
--   Output regs?: False
library std;
use std.textio.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 57
entity jmp2_0CLK_3d5a5eea is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jmp2_0CLK_3d5a5eea;
architecture arch of jmp2_0CLK_3d5a5eea is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l674_c6_b3cd]
signal BIN_OP_EQ_uxn_opcodes_h_l674_c6_b3cd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l674_c6_b3cd_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l674_c6_b3cd_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l674_c1_0269]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l674_c1_0269_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l674_c1_0269_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l674_c1_0269_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l674_c1_0269_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l674_c2_c4b6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l674_c2_c4b6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l674_c2_c4b6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l674_c2_c4b6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l674_c2_c4b6_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l674_c2_c4b6]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l674_c2_c4b6_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l674_c2_c4b6_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l674_c2_c4b6_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l674_c2_c4b6_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l674_c2_c4b6]
signal result_pc_MUX_uxn_opcodes_h_l674_c2_c4b6_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l674_c2_c4b6_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l674_c2_c4b6_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l674_c2_c4b6_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l674_c2_c4b6]
signal result_is_stack_read_MUX_uxn_opcodes_h_l674_c2_c4b6_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l674_c2_c4b6_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l674_c2_c4b6_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l674_c2_c4b6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l674_c2_c4b6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c2_c4b6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c2_c4b6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c2_c4b6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c2_c4b6_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l674_c2_c4b6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c2_c4b6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c2_c4b6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c2_c4b6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c2_c4b6_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l674_c2_c4b6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l674_c2_c4b6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l674_c2_c4b6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l674_c2_c4b6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l674_c2_c4b6_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l674_c2_c4b6]
signal t16_MUX_uxn_opcodes_h_l674_c2_c4b6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l674_c2_c4b6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l674_c2_c4b6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l674_c2_c4b6_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l675_c3_d842[uxn_opcodes_h_l675_c3_d842]
signal printf_uxn_opcodes_h_l675_c3_d842_uxn_opcodes_h_l675_c3_d842_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l680_c11_f74c]
signal BIN_OP_EQ_uxn_opcodes_h_l680_c11_f74c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l680_c11_f74c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l680_c11_f74c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l680_c7_8534]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l680_c7_8534_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l680_c7_8534_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l680_c7_8534_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l680_c7_8534_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l680_c7_8534]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l680_c7_8534_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l680_c7_8534_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l680_c7_8534_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l680_c7_8534_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l680_c7_8534]
signal result_pc_MUX_uxn_opcodes_h_l680_c7_8534_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l680_c7_8534_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l680_c7_8534_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l680_c7_8534_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l680_c7_8534]
signal result_is_stack_read_MUX_uxn_opcodes_h_l680_c7_8534_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l680_c7_8534_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l680_c7_8534_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l680_c7_8534_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l680_c7_8534]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l680_c7_8534_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l680_c7_8534_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l680_c7_8534_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l680_c7_8534_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l680_c7_8534]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l680_c7_8534_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l680_c7_8534_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l680_c7_8534_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l680_c7_8534_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l680_c7_8534]
signal result_is_opc_done_MUX_uxn_opcodes_h_l680_c7_8534_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l680_c7_8534_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l680_c7_8534_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l680_c7_8534_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l680_c7_8534]
signal t16_MUX_uxn_opcodes_h_l680_c7_8534_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l680_c7_8534_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l680_c7_8534_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l680_c7_8534_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l683_c11_57bc]
signal BIN_OP_EQ_uxn_opcodes_h_l683_c11_57bc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l683_c11_57bc_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l683_c11_57bc_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l683_c7_dafb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l683_c7_dafb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l683_c7_dafb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l683_c7_dafb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l683_c7_dafb_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l683_c7_dafb]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l683_c7_dafb_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l683_c7_dafb_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l683_c7_dafb_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l683_c7_dafb_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l683_c7_dafb]
signal result_pc_MUX_uxn_opcodes_h_l683_c7_dafb_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l683_c7_dafb_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l683_c7_dafb_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l683_c7_dafb_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l683_c7_dafb]
signal result_is_stack_read_MUX_uxn_opcodes_h_l683_c7_dafb_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l683_c7_dafb_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l683_c7_dafb_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l683_c7_dafb_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l683_c7_dafb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l683_c7_dafb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l683_c7_dafb_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l683_c7_dafb_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l683_c7_dafb_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l683_c7_dafb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l683_c7_dafb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l683_c7_dafb_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l683_c7_dafb_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l683_c7_dafb_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l683_c7_dafb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l683_c7_dafb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l683_c7_dafb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l683_c7_dafb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l683_c7_dafb_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l683_c7_dafb]
signal t16_MUX_uxn_opcodes_h_l683_c7_dafb_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l683_c7_dafb_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l683_c7_dafb_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l683_c7_dafb_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l685_c3_d1b6]
signal CONST_SL_8_uxn_opcodes_h_l685_c3_d1b6_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l685_c3_d1b6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l688_c11_c74e]
signal BIN_OP_EQ_uxn_opcodes_h_l688_c11_c74e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l688_c11_c74e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l688_c11_c74e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l688_c7_0a6c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_0a6c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_0a6c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_0a6c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_0a6c_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l688_c7_0a6c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_0a6c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_0a6c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_0a6c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_0a6c_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l688_c7_0a6c]
signal result_pc_MUX_uxn_opcodes_h_l688_c7_0a6c_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l688_c7_0a6c_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l688_c7_0a6c_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l688_c7_0a6c_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l688_c7_0a6c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_0a6c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_0a6c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_0a6c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_0a6c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l688_c7_0a6c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_0a6c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_0a6c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_0a6c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_0a6c_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l688_c7_0a6c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_0a6c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_0a6c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_0a6c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_0a6c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l688_c7_0a6c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_0a6c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_0a6c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_0a6c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_0a6c_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l688_c7_0a6c]
signal t16_MUX_uxn_opcodes_h_l688_c7_0a6c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l688_c7_0a6c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l688_c7_0a6c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l688_c7_0a6c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l691_c11_5c94]
signal BIN_OP_EQ_uxn_opcodes_h_l691_c11_5c94_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l691_c11_5c94_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l691_c11_5c94_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l691_c7_e57e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l691_c7_e57e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l691_c7_e57e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l691_c7_e57e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l691_c7_e57e_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l691_c7_e57e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l691_c7_e57e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l691_c7_e57e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l691_c7_e57e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l691_c7_e57e_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l691_c7_e57e]
signal result_pc_MUX_uxn_opcodes_h_l691_c7_e57e_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l691_c7_e57e_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l691_c7_e57e_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l691_c7_e57e_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l691_c7_e57e]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_e57e_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_e57e_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_e57e_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_e57e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l691_c7_e57e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_e57e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_e57e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_e57e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_e57e_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l691_c7_e57e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_e57e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_e57e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_e57e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_e57e_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l691_c7_e57e]
signal t16_MUX_uxn_opcodes_h_l691_c7_e57e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l691_c7_e57e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l691_c7_e57e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l691_c7_e57e_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l692_c3_c02e]
signal BIN_OP_OR_uxn_opcodes_h_l692_c3_c02e_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l692_c3_c02e_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l692_c3_c02e_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l695_c32_d3a9]
signal BIN_OP_AND_uxn_opcodes_h_l695_c32_d3a9_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l695_c32_d3a9_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l695_c32_d3a9_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l695_c32_9ef9]
signal BIN_OP_GT_uxn_opcodes_h_l695_c32_9ef9_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l695_c32_9ef9_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l695_c32_9ef9_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l695_c32_6b9a]
signal MUX_uxn_opcodes_h_l695_c32_6b9a_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l695_c32_6b9a_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l695_c32_6b9a_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l695_c32_6b9a_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l699_c11_80b2]
signal BIN_OP_EQ_uxn_opcodes_h_l699_c11_80b2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l699_c11_80b2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l699_c11_80b2_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l699_c7_d904]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_d904_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_d904_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_d904_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_d904_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l699_c7_d904]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_d904_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_d904_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_d904_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_d904_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l699_c7_d904]
signal result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_d904_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_d904_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_d904_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_d904_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_cc54( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_sp_shift := ref_toks_1;
      base.is_pc_updated := ref_toks_2;
      base.pc := ref_toks_3;
      base.is_stack_read := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.is_opc_done := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l674_c6_b3cd
BIN_OP_EQ_uxn_opcodes_h_l674_c6_b3cd : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l674_c6_b3cd_left,
BIN_OP_EQ_uxn_opcodes_h_l674_c6_b3cd_right,
BIN_OP_EQ_uxn_opcodes_h_l674_c6_b3cd_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l674_c1_0269
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l674_c1_0269 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l674_c1_0269_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l674_c1_0269_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l674_c1_0269_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l674_c1_0269_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l674_c2_c4b6
result_is_sp_shift_MUX_uxn_opcodes_h_l674_c2_c4b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l674_c2_c4b6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l674_c2_c4b6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l674_c2_c4b6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l674_c2_c4b6_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l674_c2_c4b6
result_is_pc_updated_MUX_uxn_opcodes_h_l674_c2_c4b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l674_c2_c4b6_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l674_c2_c4b6_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l674_c2_c4b6_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l674_c2_c4b6_return_output);

-- result_pc_MUX_uxn_opcodes_h_l674_c2_c4b6
result_pc_MUX_uxn_opcodes_h_l674_c2_c4b6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l674_c2_c4b6_cond,
result_pc_MUX_uxn_opcodes_h_l674_c2_c4b6_iftrue,
result_pc_MUX_uxn_opcodes_h_l674_c2_c4b6_iffalse,
result_pc_MUX_uxn_opcodes_h_l674_c2_c4b6_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l674_c2_c4b6
result_is_stack_read_MUX_uxn_opcodes_h_l674_c2_c4b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l674_c2_c4b6_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l674_c2_c4b6_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l674_c2_c4b6_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l674_c2_c4b6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c2_c4b6
result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c2_c4b6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c2_c4b6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c2_c4b6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c2_c4b6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c2_c4b6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c2_c4b6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c2_c4b6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c2_c4b6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c2_c4b6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c2_c4b6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c2_c4b6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l674_c2_c4b6
result_is_opc_done_MUX_uxn_opcodes_h_l674_c2_c4b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l674_c2_c4b6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l674_c2_c4b6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l674_c2_c4b6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l674_c2_c4b6_return_output);

-- t16_MUX_uxn_opcodes_h_l674_c2_c4b6
t16_MUX_uxn_opcodes_h_l674_c2_c4b6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l674_c2_c4b6_cond,
t16_MUX_uxn_opcodes_h_l674_c2_c4b6_iftrue,
t16_MUX_uxn_opcodes_h_l674_c2_c4b6_iffalse,
t16_MUX_uxn_opcodes_h_l674_c2_c4b6_return_output);

-- printf_uxn_opcodes_h_l675_c3_d842_uxn_opcodes_h_l675_c3_d842
printf_uxn_opcodes_h_l675_c3_d842_uxn_opcodes_h_l675_c3_d842 : entity work.printf_uxn_opcodes_h_l675_c3_d842_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l675_c3_d842_uxn_opcodes_h_l675_c3_d842_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l680_c11_f74c
BIN_OP_EQ_uxn_opcodes_h_l680_c11_f74c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l680_c11_f74c_left,
BIN_OP_EQ_uxn_opcodes_h_l680_c11_f74c_right,
BIN_OP_EQ_uxn_opcodes_h_l680_c11_f74c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l680_c7_8534
result_is_sp_shift_MUX_uxn_opcodes_h_l680_c7_8534 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l680_c7_8534_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l680_c7_8534_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l680_c7_8534_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l680_c7_8534_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l680_c7_8534
result_is_pc_updated_MUX_uxn_opcodes_h_l680_c7_8534 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l680_c7_8534_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l680_c7_8534_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l680_c7_8534_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l680_c7_8534_return_output);

-- result_pc_MUX_uxn_opcodes_h_l680_c7_8534
result_pc_MUX_uxn_opcodes_h_l680_c7_8534 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l680_c7_8534_cond,
result_pc_MUX_uxn_opcodes_h_l680_c7_8534_iftrue,
result_pc_MUX_uxn_opcodes_h_l680_c7_8534_iffalse,
result_pc_MUX_uxn_opcodes_h_l680_c7_8534_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l680_c7_8534
result_is_stack_read_MUX_uxn_opcodes_h_l680_c7_8534 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l680_c7_8534_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l680_c7_8534_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l680_c7_8534_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l680_c7_8534_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l680_c7_8534
result_sp_relative_shift_MUX_uxn_opcodes_h_l680_c7_8534 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l680_c7_8534_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l680_c7_8534_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l680_c7_8534_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l680_c7_8534_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l680_c7_8534
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l680_c7_8534 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l680_c7_8534_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l680_c7_8534_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l680_c7_8534_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l680_c7_8534_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l680_c7_8534
result_is_opc_done_MUX_uxn_opcodes_h_l680_c7_8534 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l680_c7_8534_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l680_c7_8534_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l680_c7_8534_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l680_c7_8534_return_output);

-- t16_MUX_uxn_opcodes_h_l680_c7_8534
t16_MUX_uxn_opcodes_h_l680_c7_8534 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l680_c7_8534_cond,
t16_MUX_uxn_opcodes_h_l680_c7_8534_iftrue,
t16_MUX_uxn_opcodes_h_l680_c7_8534_iffalse,
t16_MUX_uxn_opcodes_h_l680_c7_8534_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l683_c11_57bc
BIN_OP_EQ_uxn_opcodes_h_l683_c11_57bc : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l683_c11_57bc_left,
BIN_OP_EQ_uxn_opcodes_h_l683_c11_57bc_right,
BIN_OP_EQ_uxn_opcodes_h_l683_c11_57bc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l683_c7_dafb
result_is_sp_shift_MUX_uxn_opcodes_h_l683_c7_dafb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l683_c7_dafb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l683_c7_dafb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l683_c7_dafb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l683_c7_dafb_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l683_c7_dafb
result_is_pc_updated_MUX_uxn_opcodes_h_l683_c7_dafb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l683_c7_dafb_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l683_c7_dafb_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l683_c7_dafb_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l683_c7_dafb_return_output);

-- result_pc_MUX_uxn_opcodes_h_l683_c7_dafb
result_pc_MUX_uxn_opcodes_h_l683_c7_dafb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l683_c7_dafb_cond,
result_pc_MUX_uxn_opcodes_h_l683_c7_dafb_iftrue,
result_pc_MUX_uxn_opcodes_h_l683_c7_dafb_iffalse,
result_pc_MUX_uxn_opcodes_h_l683_c7_dafb_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l683_c7_dafb
result_is_stack_read_MUX_uxn_opcodes_h_l683_c7_dafb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l683_c7_dafb_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l683_c7_dafb_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l683_c7_dafb_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l683_c7_dafb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l683_c7_dafb
result_sp_relative_shift_MUX_uxn_opcodes_h_l683_c7_dafb : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l683_c7_dafb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l683_c7_dafb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l683_c7_dafb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l683_c7_dafb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l683_c7_dafb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l683_c7_dafb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l683_c7_dafb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l683_c7_dafb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l683_c7_dafb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l683_c7_dafb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l683_c7_dafb
result_is_opc_done_MUX_uxn_opcodes_h_l683_c7_dafb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l683_c7_dafb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l683_c7_dafb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l683_c7_dafb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l683_c7_dafb_return_output);

-- t16_MUX_uxn_opcodes_h_l683_c7_dafb
t16_MUX_uxn_opcodes_h_l683_c7_dafb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l683_c7_dafb_cond,
t16_MUX_uxn_opcodes_h_l683_c7_dafb_iftrue,
t16_MUX_uxn_opcodes_h_l683_c7_dafb_iffalse,
t16_MUX_uxn_opcodes_h_l683_c7_dafb_return_output);

-- CONST_SL_8_uxn_opcodes_h_l685_c3_d1b6
CONST_SL_8_uxn_opcodes_h_l685_c3_d1b6 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l685_c3_d1b6_x,
CONST_SL_8_uxn_opcodes_h_l685_c3_d1b6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l688_c11_c74e
BIN_OP_EQ_uxn_opcodes_h_l688_c11_c74e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l688_c11_c74e_left,
BIN_OP_EQ_uxn_opcodes_h_l688_c11_c74e_right,
BIN_OP_EQ_uxn_opcodes_h_l688_c11_c74e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_0a6c
result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_0a6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_0a6c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_0a6c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_0a6c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_0a6c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_0a6c
result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_0a6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_0a6c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_0a6c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_0a6c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_0a6c_return_output);

-- result_pc_MUX_uxn_opcodes_h_l688_c7_0a6c
result_pc_MUX_uxn_opcodes_h_l688_c7_0a6c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l688_c7_0a6c_cond,
result_pc_MUX_uxn_opcodes_h_l688_c7_0a6c_iftrue,
result_pc_MUX_uxn_opcodes_h_l688_c7_0a6c_iffalse,
result_pc_MUX_uxn_opcodes_h_l688_c7_0a6c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_0a6c
result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_0a6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_0a6c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_0a6c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_0a6c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_0a6c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_0a6c
result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_0a6c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_0a6c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_0a6c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_0a6c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_0a6c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_0a6c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_0a6c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_0a6c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_0a6c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_0a6c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_0a6c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_0a6c
result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_0a6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_0a6c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_0a6c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_0a6c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_0a6c_return_output);

-- t16_MUX_uxn_opcodes_h_l688_c7_0a6c
t16_MUX_uxn_opcodes_h_l688_c7_0a6c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l688_c7_0a6c_cond,
t16_MUX_uxn_opcodes_h_l688_c7_0a6c_iftrue,
t16_MUX_uxn_opcodes_h_l688_c7_0a6c_iffalse,
t16_MUX_uxn_opcodes_h_l688_c7_0a6c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l691_c11_5c94
BIN_OP_EQ_uxn_opcodes_h_l691_c11_5c94 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l691_c11_5c94_left,
BIN_OP_EQ_uxn_opcodes_h_l691_c11_5c94_right,
BIN_OP_EQ_uxn_opcodes_h_l691_c11_5c94_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l691_c7_e57e
result_is_sp_shift_MUX_uxn_opcodes_h_l691_c7_e57e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l691_c7_e57e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l691_c7_e57e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l691_c7_e57e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l691_c7_e57e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l691_c7_e57e
result_is_stack_read_MUX_uxn_opcodes_h_l691_c7_e57e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l691_c7_e57e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l691_c7_e57e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l691_c7_e57e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l691_c7_e57e_return_output);

-- result_pc_MUX_uxn_opcodes_h_l691_c7_e57e
result_pc_MUX_uxn_opcodes_h_l691_c7_e57e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l691_c7_e57e_cond,
result_pc_MUX_uxn_opcodes_h_l691_c7_e57e_iftrue,
result_pc_MUX_uxn_opcodes_h_l691_c7_e57e_iffalse,
result_pc_MUX_uxn_opcodes_h_l691_c7_e57e_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_e57e
result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_e57e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_e57e_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_e57e_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_e57e_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_e57e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_e57e
result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_e57e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_e57e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_e57e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_e57e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_e57e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_e57e
result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_e57e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_e57e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_e57e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_e57e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_e57e_return_output);

-- t16_MUX_uxn_opcodes_h_l691_c7_e57e
t16_MUX_uxn_opcodes_h_l691_c7_e57e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l691_c7_e57e_cond,
t16_MUX_uxn_opcodes_h_l691_c7_e57e_iftrue,
t16_MUX_uxn_opcodes_h_l691_c7_e57e_iffalse,
t16_MUX_uxn_opcodes_h_l691_c7_e57e_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l692_c3_c02e
BIN_OP_OR_uxn_opcodes_h_l692_c3_c02e : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l692_c3_c02e_left,
BIN_OP_OR_uxn_opcodes_h_l692_c3_c02e_right,
BIN_OP_OR_uxn_opcodes_h_l692_c3_c02e_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l695_c32_d3a9
BIN_OP_AND_uxn_opcodes_h_l695_c32_d3a9 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l695_c32_d3a9_left,
BIN_OP_AND_uxn_opcodes_h_l695_c32_d3a9_right,
BIN_OP_AND_uxn_opcodes_h_l695_c32_d3a9_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l695_c32_9ef9
BIN_OP_GT_uxn_opcodes_h_l695_c32_9ef9 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l695_c32_9ef9_left,
BIN_OP_GT_uxn_opcodes_h_l695_c32_9ef9_right,
BIN_OP_GT_uxn_opcodes_h_l695_c32_9ef9_return_output);

-- MUX_uxn_opcodes_h_l695_c32_6b9a
MUX_uxn_opcodes_h_l695_c32_6b9a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l695_c32_6b9a_cond,
MUX_uxn_opcodes_h_l695_c32_6b9a_iftrue,
MUX_uxn_opcodes_h_l695_c32_6b9a_iffalse,
MUX_uxn_opcodes_h_l695_c32_6b9a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l699_c11_80b2
BIN_OP_EQ_uxn_opcodes_h_l699_c11_80b2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l699_c11_80b2_left,
BIN_OP_EQ_uxn_opcodes_h_l699_c11_80b2_right,
BIN_OP_EQ_uxn_opcodes_h_l699_c11_80b2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_d904
result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_d904 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_d904_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_d904_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_d904_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_d904_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_d904
result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_d904 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_d904_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_d904_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_d904_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_d904_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_d904
result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_d904 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_d904_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_d904_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_d904_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_d904_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l674_c6_b3cd_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l674_c1_0269_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l674_c2_c4b6_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l674_c2_c4b6_return_output,
 result_pc_MUX_uxn_opcodes_h_l674_c2_c4b6_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l674_c2_c4b6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c2_c4b6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c2_c4b6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l674_c2_c4b6_return_output,
 t16_MUX_uxn_opcodes_h_l674_c2_c4b6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l680_c11_f74c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l680_c7_8534_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l680_c7_8534_return_output,
 result_pc_MUX_uxn_opcodes_h_l680_c7_8534_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l680_c7_8534_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l680_c7_8534_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l680_c7_8534_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l680_c7_8534_return_output,
 t16_MUX_uxn_opcodes_h_l680_c7_8534_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l683_c11_57bc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l683_c7_dafb_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l683_c7_dafb_return_output,
 result_pc_MUX_uxn_opcodes_h_l683_c7_dafb_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l683_c7_dafb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l683_c7_dafb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l683_c7_dafb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l683_c7_dafb_return_output,
 t16_MUX_uxn_opcodes_h_l683_c7_dafb_return_output,
 CONST_SL_8_uxn_opcodes_h_l685_c3_d1b6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l688_c11_c74e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_0a6c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_0a6c_return_output,
 result_pc_MUX_uxn_opcodes_h_l688_c7_0a6c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_0a6c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_0a6c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_0a6c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_0a6c_return_output,
 t16_MUX_uxn_opcodes_h_l688_c7_0a6c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l691_c11_5c94_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l691_c7_e57e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l691_c7_e57e_return_output,
 result_pc_MUX_uxn_opcodes_h_l691_c7_e57e_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_e57e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_e57e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_e57e_return_output,
 t16_MUX_uxn_opcodes_h_l691_c7_e57e_return_output,
 BIN_OP_OR_uxn_opcodes_h_l692_c3_c02e_return_output,
 BIN_OP_AND_uxn_opcodes_h_l695_c32_d3a9_return_output,
 BIN_OP_GT_uxn_opcodes_h_l695_c32_9ef9_return_output,
 MUX_uxn_opcodes_h_l695_c32_6b9a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l699_c11_80b2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_d904_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_d904_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_d904_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c6_b3cd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c6_b3cd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c6_b3cd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l674_c1_0269_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l674_c1_0269_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l674_c1_0269_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l674_c1_0269_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l674_c2_c4b6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l674_c2_c4b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l680_c7_8534_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l674_c2_c4b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l674_c2_c4b6_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l674_c2_c4b6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l674_c2_c4b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l680_c7_8534_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l674_c2_c4b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l674_c2_c4b6_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l674_c2_c4b6_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l674_c2_c4b6_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l680_c7_8534_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l674_c2_c4b6_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l674_c2_c4b6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l674_c2_c4b6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l674_c2_c4b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l680_c7_8534_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l674_c2_c4b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l674_c2_c4b6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c2_c4b6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c2_c4b6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l680_c7_8534_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c2_c4b6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c2_c4b6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c2_c4b6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l677_c3_0f1b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c2_c4b6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l680_c7_8534_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c2_c4b6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c2_c4b6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c2_c4b6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c2_c4b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l680_c7_8534_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c2_c4b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c2_c4b6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l674_c2_c4b6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l674_c2_c4b6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l680_c7_8534_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l674_c2_c4b6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l674_c2_c4b6_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l675_c3_d842_uxn_opcodes_h_l675_c3_d842_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l680_c11_f74c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l680_c11_f74c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l680_c11_f74c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l680_c7_8534_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l680_c7_8534_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l683_c7_dafb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l680_c7_8534_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l680_c7_8534_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l680_c7_8534_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l683_c7_dafb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l680_c7_8534_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l680_c7_8534_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l680_c7_8534_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l683_c7_dafb_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l680_c7_8534_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l680_c7_8534_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l680_c7_8534_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l683_c7_dafb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l680_c7_8534_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l680_c7_8534_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l680_c7_8534_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l683_c7_dafb_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l680_c7_8534_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l680_c7_8534_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l681_c3_ae06 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l680_c7_8534_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l683_c7_dafb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l680_c7_8534_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l680_c7_8534_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l680_c7_8534_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l683_c7_dafb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l680_c7_8534_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l680_c7_8534_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l680_c7_8534_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l683_c7_dafb_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l680_c7_8534_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l683_c11_57bc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l683_c11_57bc_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l683_c11_57bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l683_c7_dafb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l683_c7_dafb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_0a6c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l683_c7_dafb_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l683_c7_dafb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l683_c7_dafb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_0a6c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l683_c7_dafb_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l683_c7_dafb_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l683_c7_dafb_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l688_c7_0a6c_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l683_c7_dafb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l683_c7_dafb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l683_c7_dafb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_0a6c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l683_c7_dafb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l683_c7_dafb_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l683_c7_dafb_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_0a6c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l683_c7_dafb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l683_c7_dafb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l686_c3_187b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l683_c7_dafb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_0a6c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l683_c7_dafb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l683_c7_dafb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l683_c7_dafb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_0a6c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l683_c7_dafb_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l683_c7_dafb_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l683_c7_dafb_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l688_c7_0a6c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l683_c7_dafb_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l685_c3_d1b6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l685_c3_d1b6_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_c74e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_c74e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_c74e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_0a6c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_0a6c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l691_c7_e57e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_0a6c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_0a6c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_0a6c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_e57e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_0a6c_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l688_c7_0a6c_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l688_c7_0a6c_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l691_c7_e57e_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l688_c7_0a6c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_0a6c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_0a6c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l691_c7_e57e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_0a6c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_0a6c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_0a6c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_e57e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_0a6c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_0a6c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l689_c3_d21f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_0a6c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l688_c7_0a6c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_0a6c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_0a6c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_0a6c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_e57e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_0a6c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l688_c7_0a6c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l688_c7_0a6c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l691_c7_e57e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l688_c7_0a6c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l691_c11_5c94_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l691_c11_5c94_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l691_c11_5c94_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l691_c7_e57e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l691_c7_e57e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_d904_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l691_c7_e57e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l691_c7_e57e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l691_c7_e57e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l691_c7_e57e_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l691_c7_e57e_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l691_c7_e57e_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l691_c7_e57e_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_e57e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_e57e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_d904_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_e57e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_e57e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_e57e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_e57e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_e57e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_e57e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_d904_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_e57e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l691_c7_e57e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l691_c7_e57e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l691_c7_e57e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l692_c3_c02e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l692_c3_c02e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l692_c3_c02e_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l695_c32_6b9a_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l695_c32_6b9a_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l695_c32_6b9a_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l695_c32_d3a9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l695_c32_d3a9_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l695_c32_d3a9_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l695_c32_9ef9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l695_c32_9ef9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l695_c32_9ef9_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l695_c32_6b9a_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l699_c11_80b2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l699_c11_80b2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l699_c11_80b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_d904_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_d904_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_d904_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_d904_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_d904_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_d904_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_d904_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_d904_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_d904_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l674_l699_l688_l683_l680_DUPLICATE_351d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l674_l699_l688_l683_l680_DUPLICATE_cf2b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l674_l691_l688_l683_l680_DUPLICATE_f5d6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l674_l691_l688_l683_l680_DUPLICATE_d103_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l683_l688_l680_l691_DUPLICATE_58d3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l699_l691_l688_l683_l680_DUPLICATE_94c2_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l692_l684_DUPLICATE_022f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_cc54_uxn_opcodes_h_l705_l670_DUPLICATE_6fbf_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l686_c3_187b := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l683_c7_dafb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l686_c3_187b;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l674_c1_0269_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_c74e_right := to_unsigned(3, 2);
     VAR_MUX_uxn_opcodes_h_l695_c32_6b9a_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l691_c7_e57e_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l699_c11_80b2_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c6_b3cd_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l683_c11_57bc_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c2_c4b6_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_d904_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l689_c3_d21f := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_0a6c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l689_c3_d21f;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l681_c3_ae06 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l680_c7_8534_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l681_c3_ae06;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_d904_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l695_c32_d3a9_right := to_unsigned(128, 8);
     VAR_BIN_OP_GT_uxn_opcodes_h_l695_c32_9ef9_right := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_d904_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l691_c11_5c94_right := to_unsigned(4, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l674_c2_c4b6_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l677_c3_0f1b := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c2_c4b6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l677_c3_0f1b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l680_c11_f74c_right := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l695_c32_6b9a_iffalse := resize(to_signed(-2, 3), 8);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_e57e_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l691_c7_e57e_iftrue := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_previous_stack_read := previous_stack_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l674_c1_0269_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l695_c32_d3a9_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c6_b3cd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l680_c11_f74c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l683_c11_57bc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_c74e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l691_c11_5c94_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l699_c11_80b2_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l692_c3_c02e_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l674_c2_c4b6_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l680_c7_8534_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l688_c7_0a6c_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l691_c7_e57e_iffalse := t16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l674_l699_l688_l683_l680_DUPLICATE_351d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l674_l699_l688_l683_l680_DUPLICATE_351d_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l699_c11_80b2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l699_c11_80b2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l699_c11_80b2_left;
     BIN_OP_EQ_uxn_opcodes_h_l699_c11_80b2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l699_c11_80b2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l699_c11_80b2_return_output := BIN_OP_EQ_uxn_opcodes_h_l699_c11_80b2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l680_c11_f74c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l680_c11_f74c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l680_c11_f74c_left;
     BIN_OP_EQ_uxn_opcodes_h_l680_c11_f74c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l680_c11_f74c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l680_c11_f74c_return_output := BIN_OP_EQ_uxn_opcodes_h_l680_c11_f74c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l691_c11_5c94] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l691_c11_5c94_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l691_c11_5c94_left;
     BIN_OP_EQ_uxn_opcodes_h_l691_c11_5c94_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l691_c11_5c94_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l691_c11_5c94_return_output := BIN_OP_EQ_uxn_opcodes_h_l691_c11_5c94_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l699_l691_l688_l683_l680_DUPLICATE_94c2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l699_l691_l688_l683_l680_DUPLICATE_94c2_return_output := result.is_opc_done;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l674_l691_l688_l683_l680_DUPLICATE_d103 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l674_l691_l688_l683_l680_DUPLICATE_d103_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l688_c11_c74e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l688_c11_c74e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_c74e_left;
     BIN_OP_EQ_uxn_opcodes_h_l688_c11_c74e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_c74e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_c74e_return_output := BIN_OP_EQ_uxn_opcodes_h_l688_c11_c74e_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l695_c32_d3a9] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l695_c32_d3a9_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l695_c32_d3a9_left;
     BIN_OP_AND_uxn_opcodes_h_l695_c32_d3a9_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l695_c32_d3a9_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l695_c32_d3a9_return_output := BIN_OP_AND_uxn_opcodes_h_l695_c32_d3a9_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l692_l684_DUPLICATE_022f LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l692_l684_DUPLICATE_022f_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l674_c6_b3cd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l674_c6_b3cd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c6_b3cd_left;
     BIN_OP_EQ_uxn_opcodes_h_l674_c6_b3cd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c6_b3cd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c6_b3cd_return_output := BIN_OP_EQ_uxn_opcodes_h_l674_c6_b3cd_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l688_c7_0a6c] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l688_c7_0a6c_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l674_l691_l688_l683_l680_DUPLICATE_f5d6 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l674_l691_l688_l683_l680_DUPLICATE_f5d6_return_output := result.pc;

     -- BIN_OP_EQ[uxn_opcodes_h_l683_c11_57bc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l683_c11_57bc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l683_c11_57bc_left;
     BIN_OP_EQ_uxn_opcodes_h_l683_c11_57bc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l683_c11_57bc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l683_c11_57bc_return_output := BIN_OP_EQ_uxn_opcodes_h_l683_c11_57bc_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l683_l688_l680_l691_DUPLICATE_58d3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l683_l688_l680_l691_DUPLICATE_58d3_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l674_l699_l688_l683_l680_DUPLICATE_cf2b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l674_l699_l688_l683_l680_DUPLICATE_cf2b_return_output := result.is_pc_updated;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l695_c32_9ef9_left := VAR_BIN_OP_AND_uxn_opcodes_h_l695_c32_d3a9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l674_c1_0269_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c6_b3cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c2_c4b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c6_b3cd_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l674_c2_c4b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c6_b3cd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l674_c2_c4b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c6_b3cd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l674_c2_c4b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c6_b3cd_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l674_c2_c4b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c6_b3cd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c2_c4b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c6_b3cd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c2_c4b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c6_b3cd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l674_c2_c4b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c6_b3cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l680_c7_8534_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l680_c11_f74c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l680_c7_8534_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l680_c11_f74c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l680_c7_8534_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l680_c11_f74c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l680_c7_8534_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l680_c11_f74c_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l680_c7_8534_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l680_c11_f74c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l680_c7_8534_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l680_c11_f74c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l680_c7_8534_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l680_c11_f74c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l680_c7_8534_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l680_c11_f74c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l683_c7_dafb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l683_c11_57bc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l683_c7_dafb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l683_c11_57bc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l683_c7_dafb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l683_c11_57bc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l683_c7_dafb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l683_c11_57bc_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l683_c7_dafb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l683_c11_57bc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l683_c7_dafb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l683_c11_57bc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l683_c7_dafb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l683_c11_57bc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l683_c7_dafb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l683_c11_57bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_0a6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_c74e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_0a6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_c74e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_0a6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_c74e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_0a6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_c74e_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l688_c7_0a6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_c74e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_0a6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_c74e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_0a6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_c74e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l688_c7_0a6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_c74e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_e57e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l691_c11_5c94_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_e57e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l691_c11_5c94_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l691_c7_e57e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l691_c11_5c94_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l691_c7_e57e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l691_c11_5c94_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l691_c7_e57e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l691_c11_5c94_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_e57e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l691_c11_5c94_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l691_c7_e57e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l691_c11_5c94_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_d904_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l699_c11_80b2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_d904_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l699_c11_80b2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_d904_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l699_c11_80b2_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l692_c3_c02e_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l692_l684_DUPLICATE_022f_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l685_c3_d1b6_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l692_l684_DUPLICATE_022f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c2_c4b6_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l674_l691_l688_l683_l680_DUPLICATE_d103_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l680_c7_8534_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l674_l691_l688_l683_l680_DUPLICATE_d103_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l683_c7_dafb_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l674_l691_l688_l683_l680_DUPLICATE_d103_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_0a6c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l674_l691_l688_l683_l680_DUPLICATE_d103_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_e57e_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l674_l691_l688_l683_l680_DUPLICATE_d103_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l674_c2_c4b6_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l674_l691_l688_l683_l680_DUPLICATE_f5d6_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l680_c7_8534_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l674_l691_l688_l683_l680_DUPLICATE_f5d6_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l683_c7_dafb_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l674_l691_l688_l683_l680_DUPLICATE_f5d6_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l688_c7_0a6c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l674_l691_l688_l683_l680_DUPLICATE_f5d6_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l691_c7_e57e_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l674_l691_l688_l683_l680_DUPLICATE_f5d6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l680_c7_8534_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l699_l691_l688_l683_l680_DUPLICATE_94c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l683_c7_dafb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l699_l691_l688_l683_l680_DUPLICATE_94c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_0a6c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l699_l691_l688_l683_l680_DUPLICATE_94c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_e57e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l699_l691_l688_l683_l680_DUPLICATE_94c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_d904_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l699_l691_l688_l683_l680_DUPLICATE_94c2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l674_c2_c4b6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l674_l699_l688_l683_l680_DUPLICATE_cf2b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l680_c7_8534_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l674_l699_l688_l683_l680_DUPLICATE_cf2b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l683_c7_dafb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l674_l699_l688_l683_l680_DUPLICATE_cf2b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_0a6c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l674_l699_l688_l683_l680_DUPLICATE_cf2b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_d904_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l674_l699_l688_l683_l680_DUPLICATE_cf2b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l674_c2_c4b6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l674_l699_l688_l683_l680_DUPLICATE_351d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l680_c7_8534_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l674_l699_l688_l683_l680_DUPLICATE_351d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l683_c7_dafb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l674_l699_l688_l683_l680_DUPLICATE_351d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_0a6c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l674_l699_l688_l683_l680_DUPLICATE_351d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_d904_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l674_l699_l688_l683_l680_DUPLICATE_351d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l680_c7_8534_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l683_l688_l680_l691_DUPLICATE_58d3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l683_c7_dafb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l683_l688_l680_l691_DUPLICATE_58d3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_0a6c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l683_l688_l680_l691_DUPLICATE_58d3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l691_c7_e57e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l683_l688_l680_l691_DUPLICATE_58d3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_0a6c_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l688_c7_0a6c_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l699_c7_d904] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_d904_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_d904_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_d904_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_d904_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_d904_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_d904_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_d904_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_d904_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l674_c1_0269] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l674_c1_0269_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l674_c1_0269_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l674_c1_0269_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l674_c1_0269_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l674_c1_0269_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l674_c1_0269_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l674_c1_0269_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l674_c1_0269_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l691_c7_e57e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l691_c7_e57e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l691_c7_e57e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l691_c7_e57e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l691_c7_e57e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l691_c7_e57e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l691_c7_e57e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l691_c7_e57e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l691_c7_e57e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l699_c7_d904] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_d904_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_d904_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_d904_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_d904_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_d904_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_d904_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_d904_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_d904_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l692_c3_c02e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l692_c3_c02e_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l692_c3_c02e_left;
     BIN_OP_OR_uxn_opcodes_h_l692_c3_c02e_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l692_c3_c02e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l692_c3_c02e_return_output := BIN_OP_OR_uxn_opcodes_h_l692_c3_c02e_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l695_c32_9ef9] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l695_c32_9ef9_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l695_c32_9ef9_left;
     BIN_OP_GT_uxn_opcodes_h_l695_c32_9ef9_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l695_c32_9ef9_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l695_c32_9ef9_return_output := BIN_OP_GT_uxn_opcodes_h_l695_c32_9ef9_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l685_c3_d1b6] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l685_c3_d1b6_x <= VAR_CONST_SL_8_uxn_opcodes_h_l685_c3_d1b6_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l685_c3_d1b6_return_output := CONST_SL_8_uxn_opcodes_h_l685_c3_d1b6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l688_c7_0a6c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_0a6c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_0a6c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_0a6c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_0a6c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_0a6c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_0a6c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_0a6c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_0a6c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l699_c7_d904] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_d904_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_d904_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_d904_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_d904_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_d904_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_d904_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_d904_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_d904_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l695_c32_6b9a_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l695_c32_9ef9_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l691_c7_e57e_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l692_c3_c02e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l691_c7_e57e_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l692_c3_c02e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l683_c7_dafb_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l685_c3_d1b6_return_output;
     VAR_printf_uxn_opcodes_h_l675_c3_d842_uxn_opcodes_h_l675_c3_d842_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l674_c1_0269_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_e57e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_d904_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_e57e_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_d904_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l691_c7_e57e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_d904_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_0a6c_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l691_c7_e57e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l683_c7_dafb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_0a6c_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l691_c7_e57e] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_e57e_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_e57e_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_e57e_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_e57e_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_e57e_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_e57e_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_e57e_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_e57e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l683_c7_dafb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l683_c7_dafb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l683_c7_dafb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l683_c7_dafb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l683_c7_dafb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l683_c7_dafb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l683_c7_dafb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l683_c7_dafb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l683_c7_dafb_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l691_c7_e57e] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l691_c7_e57e_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l691_c7_e57e_cond;
     result_pc_MUX_uxn_opcodes_h_l691_c7_e57e_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l691_c7_e57e_iftrue;
     result_pc_MUX_uxn_opcodes_h_l691_c7_e57e_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l691_c7_e57e_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l691_c7_e57e_return_output := result_pc_MUX_uxn_opcodes_h_l691_c7_e57e_return_output;

     -- t16_MUX[uxn_opcodes_h_l691_c7_e57e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l691_c7_e57e_cond <= VAR_t16_MUX_uxn_opcodes_h_l691_c7_e57e_cond;
     t16_MUX_uxn_opcodes_h_l691_c7_e57e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l691_c7_e57e_iftrue;
     t16_MUX_uxn_opcodes_h_l691_c7_e57e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l691_c7_e57e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l691_c7_e57e_return_output := t16_MUX_uxn_opcodes_h_l691_c7_e57e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l691_c7_e57e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l691_c7_e57e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l691_c7_e57e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l691_c7_e57e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l691_c7_e57e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l691_c7_e57e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l691_c7_e57e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l691_c7_e57e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l691_c7_e57e_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l688_c7_0a6c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_0a6c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_0a6c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_0a6c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_0a6c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_0a6c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_0a6c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_0a6c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_0a6c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l691_c7_e57e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_e57e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_e57e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_e57e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_e57e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_e57e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_e57e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_e57e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_e57e_return_output;

     -- printf_uxn_opcodes_h_l675_c3_d842[uxn_opcodes_h_l675_c3_d842] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l675_c3_d842_uxn_opcodes_h_l675_c3_d842_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l675_c3_d842_uxn_opcodes_h_l675_c3_d842_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- MUX[uxn_opcodes_h_l695_c32_6b9a] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l695_c32_6b9a_cond <= VAR_MUX_uxn_opcodes_h_l695_c32_6b9a_cond;
     MUX_uxn_opcodes_h_l695_c32_6b9a_iftrue <= VAR_MUX_uxn_opcodes_h_l695_c32_6b9a_iftrue;
     MUX_uxn_opcodes_h_l695_c32_6b9a_iffalse <= VAR_MUX_uxn_opcodes_h_l695_c32_6b9a_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l695_c32_6b9a_return_output := MUX_uxn_opcodes_h_l695_c32_6b9a_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_e57e_iftrue := VAR_MUX_uxn_opcodes_h_l695_c32_6b9a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_0a6c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_e57e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_0a6c_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_e57e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_0a6c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l691_c7_e57e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l683_c7_dafb_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_0a6c_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l688_c7_0a6c_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l691_c7_e57e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l680_c7_8534_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l683_c7_dafb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l688_c7_0a6c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l691_c7_e57e_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l683_c7_dafb] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l683_c7_dafb_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l683_c7_dafb_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l683_c7_dafb_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l683_c7_dafb_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l683_c7_dafb_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l683_c7_dafb_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l683_c7_dafb_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l683_c7_dafb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l688_c7_0a6c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_0a6c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_0a6c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_0a6c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_0a6c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_0a6c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_0a6c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_0a6c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_0a6c_return_output;

     -- t16_MUX[uxn_opcodes_h_l688_c7_0a6c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l688_c7_0a6c_cond <= VAR_t16_MUX_uxn_opcodes_h_l688_c7_0a6c_cond;
     t16_MUX_uxn_opcodes_h_l688_c7_0a6c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l688_c7_0a6c_iftrue;
     t16_MUX_uxn_opcodes_h_l688_c7_0a6c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l688_c7_0a6c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l688_c7_0a6c_return_output := t16_MUX_uxn_opcodes_h_l688_c7_0a6c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l688_c7_0a6c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_0a6c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_0a6c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_0a6c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_0a6c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_0a6c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_0a6c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_0a6c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_0a6c_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l688_c7_0a6c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_0a6c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_0a6c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_0a6c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_0a6c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_0a6c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_0a6c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_0a6c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_0a6c_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l688_c7_0a6c] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l688_c7_0a6c_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l688_c7_0a6c_cond;
     result_pc_MUX_uxn_opcodes_h_l688_c7_0a6c_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l688_c7_0a6c_iftrue;
     result_pc_MUX_uxn_opcodes_h_l688_c7_0a6c_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l688_c7_0a6c_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l688_c7_0a6c_return_output := result_pc_MUX_uxn_opcodes_h_l688_c7_0a6c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l680_c7_8534] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l680_c7_8534_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l680_c7_8534_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l680_c7_8534_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l680_c7_8534_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l680_c7_8534_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l680_c7_8534_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l680_c7_8534_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l680_c7_8534_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l691_c7_e57e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_e57e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_e57e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_e57e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_e57e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_e57e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_e57e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_e57e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_e57e_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l683_c7_dafb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_0a6c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l683_c7_dafb_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_0a6c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l683_c7_dafb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_0a6c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l680_c7_8534_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l683_c7_dafb_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l683_c7_dafb_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l688_c7_0a6c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_0a6c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_e57e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c2_c4b6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l680_c7_8534_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l683_c7_dafb_iffalse := VAR_t16_MUX_uxn_opcodes_h_l688_c7_0a6c_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l683_c7_dafb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l683_c7_dafb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l683_c7_dafb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l683_c7_dafb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l683_c7_dafb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l683_c7_dafb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l683_c7_dafb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l683_c7_dafb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l683_c7_dafb_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l683_c7_dafb] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l683_c7_dafb_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l683_c7_dafb_cond;
     result_pc_MUX_uxn_opcodes_h_l683_c7_dafb_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l683_c7_dafb_iftrue;
     result_pc_MUX_uxn_opcodes_h_l683_c7_dafb_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l683_c7_dafb_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l683_c7_dafb_return_output := result_pc_MUX_uxn_opcodes_h_l683_c7_dafb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l683_c7_dafb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l683_c7_dafb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l683_c7_dafb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l683_c7_dafb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l683_c7_dafb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l683_c7_dafb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l683_c7_dafb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l683_c7_dafb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l683_c7_dafb_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l680_c7_8534] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l680_c7_8534_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l680_c7_8534_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l680_c7_8534_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l680_c7_8534_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l680_c7_8534_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l680_c7_8534_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l680_c7_8534_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l680_c7_8534_return_output;

     -- t16_MUX[uxn_opcodes_h_l683_c7_dafb] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l683_c7_dafb_cond <= VAR_t16_MUX_uxn_opcodes_h_l683_c7_dafb_cond;
     t16_MUX_uxn_opcodes_h_l683_c7_dafb_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l683_c7_dafb_iftrue;
     t16_MUX_uxn_opcodes_h_l683_c7_dafb_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l683_c7_dafb_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l683_c7_dafb_return_output := t16_MUX_uxn_opcodes_h_l683_c7_dafb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l688_c7_0a6c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_0a6c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_0a6c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_0a6c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_0a6c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_0a6c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_0a6c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_0a6c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_0a6c_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l683_c7_dafb] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l683_c7_dafb_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l683_c7_dafb_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l683_c7_dafb_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l683_c7_dafb_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l683_c7_dafb_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l683_c7_dafb_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l683_c7_dafb_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l683_c7_dafb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l674_c2_c4b6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c2_c4b6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c2_c4b6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c2_c4b6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c2_c4b6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c2_c4b6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c2_c4b6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c2_c4b6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c2_c4b6_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l680_c7_8534_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l683_c7_dafb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l680_c7_8534_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l683_c7_dafb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l680_c7_8534_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l683_c7_dafb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l674_c2_c4b6_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l680_c7_8534_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l680_c7_8534_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l683_c7_dafb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l683_c7_dafb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_0a6c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l680_c7_8534_iffalse := VAR_t16_MUX_uxn_opcodes_h_l683_c7_dafb_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l680_c7_8534] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l680_c7_8534_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l680_c7_8534_cond;
     result_pc_MUX_uxn_opcodes_h_l680_c7_8534_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l680_c7_8534_iftrue;
     result_pc_MUX_uxn_opcodes_h_l680_c7_8534_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l680_c7_8534_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l680_c7_8534_return_output := result_pc_MUX_uxn_opcodes_h_l680_c7_8534_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l680_c7_8534] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l680_c7_8534_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l680_c7_8534_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l680_c7_8534_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l680_c7_8534_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l680_c7_8534_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l680_c7_8534_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l680_c7_8534_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l680_c7_8534_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l680_c7_8534] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l680_c7_8534_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l680_c7_8534_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l680_c7_8534_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l680_c7_8534_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l680_c7_8534_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l680_c7_8534_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l680_c7_8534_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l680_c7_8534_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l683_c7_dafb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l683_c7_dafb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l683_c7_dafb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l683_c7_dafb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l683_c7_dafb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l683_c7_dafb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l683_c7_dafb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l683_c7_dafb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l683_c7_dafb_return_output;

     -- t16_MUX[uxn_opcodes_h_l680_c7_8534] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l680_c7_8534_cond <= VAR_t16_MUX_uxn_opcodes_h_l680_c7_8534_cond;
     t16_MUX_uxn_opcodes_h_l680_c7_8534_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l680_c7_8534_iftrue;
     t16_MUX_uxn_opcodes_h_l680_c7_8534_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l680_c7_8534_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l680_c7_8534_return_output := t16_MUX_uxn_opcodes_h_l680_c7_8534_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l680_c7_8534] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l680_c7_8534_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l680_c7_8534_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l680_c7_8534_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l680_c7_8534_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l680_c7_8534_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l680_c7_8534_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l680_c7_8534_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l680_c7_8534_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l674_c2_c4b6] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l674_c2_c4b6_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l674_c2_c4b6_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l674_c2_c4b6_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l674_c2_c4b6_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l674_c2_c4b6_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l674_c2_c4b6_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l674_c2_c4b6_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l674_c2_c4b6_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c2_c4b6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l680_c7_8534_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l674_c2_c4b6_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l680_c7_8534_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l674_c2_c4b6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l680_c7_8534_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l674_c2_c4b6_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l680_c7_8534_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l680_c7_8534_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l683_c7_dafb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l674_c2_c4b6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l680_c7_8534_return_output;
     -- t16_MUX[uxn_opcodes_h_l674_c2_c4b6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l674_c2_c4b6_cond <= VAR_t16_MUX_uxn_opcodes_h_l674_c2_c4b6_cond;
     t16_MUX_uxn_opcodes_h_l674_c2_c4b6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l674_c2_c4b6_iftrue;
     t16_MUX_uxn_opcodes_h_l674_c2_c4b6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l674_c2_c4b6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l674_c2_c4b6_return_output := t16_MUX_uxn_opcodes_h_l674_c2_c4b6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l674_c2_c4b6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l674_c2_c4b6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c2_c4b6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l674_c2_c4b6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c2_c4b6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l674_c2_c4b6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c2_c4b6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c2_c4b6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l674_c2_c4b6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l680_c7_8534] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l680_c7_8534_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l680_c7_8534_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l680_c7_8534_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l680_c7_8534_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l680_c7_8534_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l680_c7_8534_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l680_c7_8534_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l680_c7_8534_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l674_c2_c4b6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l674_c2_c4b6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l674_c2_c4b6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l674_c2_c4b6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l674_c2_c4b6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l674_c2_c4b6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l674_c2_c4b6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l674_c2_c4b6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l674_c2_c4b6_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l674_c2_c4b6] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l674_c2_c4b6_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l674_c2_c4b6_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l674_c2_c4b6_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l674_c2_c4b6_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l674_c2_c4b6_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l674_c2_c4b6_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l674_c2_c4b6_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l674_c2_c4b6_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l674_c2_c4b6] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l674_c2_c4b6_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l674_c2_c4b6_cond;
     result_pc_MUX_uxn_opcodes_h_l674_c2_c4b6_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l674_c2_c4b6_iftrue;
     result_pc_MUX_uxn_opcodes_h_l674_c2_c4b6_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l674_c2_c4b6_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l674_c2_c4b6_return_output := result_pc_MUX_uxn_opcodes_h_l674_c2_c4b6_return_output;

     -- Submodule level 7
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c2_c4b6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l680_c7_8534_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l674_c2_c4b6_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l674_c2_c4b6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c2_c4b6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c2_c4b6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c2_c4b6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c2_c4b6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c2_c4b6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c2_c4b6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c2_c4b6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c2_c4b6_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_cc54_uxn_opcodes_h_l705_l670_DUPLICATE_6fbf LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_cc54_uxn_opcodes_h_l705_l670_DUPLICATE_6fbf_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_cc54(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l674_c2_c4b6_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l674_c2_c4b6_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l674_c2_c4b6_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l674_c2_c4b6_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c2_c4b6_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c2_c4b6_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c2_c4b6_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_cc54_uxn_opcodes_h_l705_l670_DUPLICATE_6fbf_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_cc54_uxn_opcodes_h_l705_l670_DUPLICATE_6fbf_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
