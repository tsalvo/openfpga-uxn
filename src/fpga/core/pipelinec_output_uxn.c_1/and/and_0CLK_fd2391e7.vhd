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
-- Submodules: 64
entity and_0CLK_fd2391e7 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end and_0CLK_fd2391e7;
architecture arch of and_0CLK_fd2391e7 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1006_c6_a155]
signal BIN_OP_EQ_uxn_opcodes_h_l1006_c6_a155_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1006_c6_a155_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1006_c6_a155_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1006_c1_5ae7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_5ae7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_5ae7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_5ae7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_5ae7_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1006_c2_8a17]
signal t8_MUX_uxn_opcodes_h_l1006_c2_8a17_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1006_c2_8a17_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1006_c2_8a17_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1006_c2_8a17_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1006_c2_8a17]
signal n8_MUX_uxn_opcodes_h_l1006_c2_8a17_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1006_c2_8a17_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1006_c2_8a17_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1006_c2_8a17_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1006_c2_8a17]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1006_c2_8a17_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1006_c2_8a17_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1006_c2_8a17_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1006_c2_8a17_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1006_c2_8a17]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c2_8a17_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c2_8a17_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c2_8a17_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c2_8a17_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1006_c2_8a17]
signal result_stack_value_MUX_uxn_opcodes_h_l1006_c2_8a17_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1006_c2_8a17_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1006_c2_8a17_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1006_c2_8a17_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1006_c2_8a17]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c2_8a17_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c2_8a17_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c2_8a17_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c2_8a17_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1006_c2_8a17]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1006_c2_8a17_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1006_c2_8a17_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1006_c2_8a17_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1006_c2_8a17_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1006_c2_8a17]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1006_c2_8a17_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1006_c2_8a17_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1006_c2_8a17_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1006_c2_8a17_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1006_c2_8a17]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c2_8a17_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c2_8a17_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c2_8a17_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c2_8a17_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l1007_c3_466f[uxn_opcodes_h_l1007_c3_466f]
signal printf_uxn_opcodes_h_l1007_c3_466f_uxn_opcodes_h_l1007_c3_466f_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1012_c11_2eb0]
signal BIN_OP_EQ_uxn_opcodes_h_l1012_c11_2eb0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1012_c11_2eb0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1012_c11_2eb0_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1012_c7_3a01]
signal t8_MUX_uxn_opcodes_h_l1012_c7_3a01_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1012_c7_3a01_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1012_c7_3a01_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1012_c7_3a01_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1012_c7_3a01]
signal n8_MUX_uxn_opcodes_h_l1012_c7_3a01_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1012_c7_3a01_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1012_c7_3a01_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1012_c7_3a01_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1012_c7_3a01]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1012_c7_3a01_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1012_c7_3a01_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1012_c7_3a01_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1012_c7_3a01_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1012_c7_3a01]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1012_c7_3a01_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1012_c7_3a01_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1012_c7_3a01_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1012_c7_3a01_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1012_c7_3a01]
signal result_stack_value_MUX_uxn_opcodes_h_l1012_c7_3a01_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1012_c7_3a01_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1012_c7_3a01_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1012_c7_3a01_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1012_c7_3a01]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1012_c7_3a01_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1012_c7_3a01_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1012_c7_3a01_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1012_c7_3a01_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1012_c7_3a01]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1012_c7_3a01_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1012_c7_3a01_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1012_c7_3a01_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1012_c7_3a01_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1012_c7_3a01]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1012_c7_3a01_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1012_c7_3a01_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1012_c7_3a01_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1012_c7_3a01_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1012_c7_3a01]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1012_c7_3a01_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1012_c7_3a01_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1012_c7_3a01_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1012_c7_3a01_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1015_c11_5b10]
signal BIN_OP_EQ_uxn_opcodes_h_l1015_c11_5b10_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1015_c11_5b10_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1015_c11_5b10_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1015_c7_50e6]
signal t8_MUX_uxn_opcodes_h_l1015_c7_50e6_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1015_c7_50e6_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1015_c7_50e6_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1015_c7_50e6_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1015_c7_50e6]
signal n8_MUX_uxn_opcodes_h_l1015_c7_50e6_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1015_c7_50e6_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1015_c7_50e6_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1015_c7_50e6_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1015_c7_50e6]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1015_c7_50e6_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1015_c7_50e6_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1015_c7_50e6_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1015_c7_50e6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1015_c7_50e6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c7_50e6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c7_50e6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c7_50e6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c7_50e6_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1015_c7_50e6]
signal result_stack_value_MUX_uxn_opcodes_h_l1015_c7_50e6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1015_c7_50e6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1015_c7_50e6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1015_c7_50e6_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1015_c7_50e6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c7_50e6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c7_50e6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c7_50e6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c7_50e6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1015_c7_50e6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1015_c7_50e6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1015_c7_50e6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1015_c7_50e6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1015_c7_50e6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1015_c7_50e6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1015_c7_50e6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1015_c7_50e6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1015_c7_50e6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1015_c7_50e6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1015_c7_50e6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c7_50e6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c7_50e6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c7_50e6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c7_50e6_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1019_c11_1d76]
signal BIN_OP_EQ_uxn_opcodes_h_l1019_c11_1d76_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1019_c11_1d76_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1019_c11_1d76_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1019_c7_1538]
signal n8_MUX_uxn_opcodes_h_l1019_c7_1538_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1019_c7_1538_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1019_c7_1538_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1019_c7_1538_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1019_c7_1538]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1019_c7_1538_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1019_c7_1538_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1019_c7_1538_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1019_c7_1538_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1019_c7_1538]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1019_c7_1538_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1019_c7_1538_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1019_c7_1538_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1019_c7_1538_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1019_c7_1538]
signal result_stack_value_MUX_uxn_opcodes_h_l1019_c7_1538_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1019_c7_1538_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1019_c7_1538_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1019_c7_1538_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1019_c7_1538]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1019_c7_1538_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1019_c7_1538_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1019_c7_1538_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1019_c7_1538_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1019_c7_1538]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_1538_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_1538_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_1538_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_1538_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1019_c7_1538]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_1538_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_1538_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_1538_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_1538_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1019_c7_1538]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1019_c7_1538_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1019_c7_1538_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1019_c7_1538_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1019_c7_1538_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1022_c11_7769]
signal BIN_OP_EQ_uxn_opcodes_h_l1022_c11_7769_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1022_c11_7769_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1022_c11_7769_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1022_c7_7517]
signal n8_MUX_uxn_opcodes_h_l1022_c7_7517_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1022_c7_7517_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1022_c7_7517_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1022_c7_7517_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1022_c7_7517]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1022_c7_7517_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1022_c7_7517_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1022_c7_7517_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1022_c7_7517_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1022_c7_7517]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1022_c7_7517_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1022_c7_7517_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1022_c7_7517_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1022_c7_7517_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1022_c7_7517]
signal result_stack_value_MUX_uxn_opcodes_h_l1022_c7_7517_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1022_c7_7517_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1022_c7_7517_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1022_c7_7517_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1022_c7_7517]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1022_c7_7517_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1022_c7_7517_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1022_c7_7517_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1022_c7_7517_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1022_c7_7517]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1022_c7_7517_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1022_c7_7517_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1022_c7_7517_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1022_c7_7517_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1022_c7_7517]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1022_c7_7517_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1022_c7_7517_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1022_c7_7517_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1022_c7_7517_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1022_c7_7517]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1022_c7_7517_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1022_c7_7517_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1022_c7_7517_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1022_c7_7517_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1026_c32_db41]
signal BIN_OP_AND_uxn_opcodes_h_l1026_c32_db41_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1026_c32_db41_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1026_c32_db41_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1026_c32_6bc3]
signal BIN_OP_GT_uxn_opcodes_h_l1026_c32_6bc3_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1026_c32_6bc3_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1026_c32_6bc3_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1026_c32_68df]
signal MUX_uxn_opcodes_h_l1026_c32_68df_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1026_c32_68df_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1026_c32_68df_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1026_c32_68df_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1028_c11_2c9c]
signal BIN_OP_EQ_uxn_opcodes_h_l1028_c11_2c9c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1028_c11_2c9c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1028_c11_2c9c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1028_c7_1de2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_1de2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_1de2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_1de2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_1de2_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1028_c7_1de2]
signal result_stack_value_MUX_uxn_opcodes_h_l1028_c7_1de2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1028_c7_1de2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1028_c7_1de2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1028_c7_1de2_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1028_c7_1de2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_1de2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_1de2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_1de2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_1de2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1028_c7_1de2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_1de2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_1de2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_1de2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_1de2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1028_c7_1de2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_1de2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_1de2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_1de2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_1de2_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1032_c24_551e]
signal BIN_OP_AND_uxn_opcodes_h_l1032_c24_551e_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1032_c24_551e_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1032_c24_551e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1034_c11_abfe]
signal BIN_OP_EQ_uxn_opcodes_h_l1034_c11_abfe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1034_c11_abfe_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1034_c11_abfe_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1034_c7_c3b5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1034_c7_c3b5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1034_c7_c3b5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1034_c7_c3b5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1034_c7_c3b5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1034_c7_c3b5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1034_c7_c3b5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1034_c7_c3b5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1034_c7_c3b5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1034_c7_c3b5_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : signed;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_read := ref_toks_1;
      base.sp_relative_shift := ref_toks_2;
      base.stack_value := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1006_c6_a155
BIN_OP_EQ_uxn_opcodes_h_l1006_c6_a155 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1006_c6_a155_left,
BIN_OP_EQ_uxn_opcodes_h_l1006_c6_a155_right,
BIN_OP_EQ_uxn_opcodes_h_l1006_c6_a155_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_5ae7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_5ae7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_5ae7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_5ae7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_5ae7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_5ae7_return_output);

-- t8_MUX_uxn_opcodes_h_l1006_c2_8a17
t8_MUX_uxn_opcodes_h_l1006_c2_8a17 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1006_c2_8a17_cond,
t8_MUX_uxn_opcodes_h_l1006_c2_8a17_iftrue,
t8_MUX_uxn_opcodes_h_l1006_c2_8a17_iffalse,
t8_MUX_uxn_opcodes_h_l1006_c2_8a17_return_output);

-- n8_MUX_uxn_opcodes_h_l1006_c2_8a17
n8_MUX_uxn_opcodes_h_l1006_c2_8a17 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1006_c2_8a17_cond,
n8_MUX_uxn_opcodes_h_l1006_c2_8a17_iftrue,
n8_MUX_uxn_opcodes_h_l1006_c2_8a17_iffalse,
n8_MUX_uxn_opcodes_h_l1006_c2_8a17_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1006_c2_8a17
result_is_stack_read_MUX_uxn_opcodes_h_l1006_c2_8a17 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1006_c2_8a17_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1006_c2_8a17_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1006_c2_8a17_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1006_c2_8a17_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c2_8a17
result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c2_8a17 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c2_8a17_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c2_8a17_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c2_8a17_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c2_8a17_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1006_c2_8a17
result_stack_value_MUX_uxn_opcodes_h_l1006_c2_8a17 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1006_c2_8a17_cond,
result_stack_value_MUX_uxn_opcodes_h_l1006_c2_8a17_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1006_c2_8a17_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1006_c2_8a17_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c2_8a17
result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c2_8a17 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c2_8a17_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c2_8a17_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c2_8a17_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c2_8a17_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1006_c2_8a17
result_is_stack_write_MUX_uxn_opcodes_h_l1006_c2_8a17 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1006_c2_8a17_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1006_c2_8a17_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1006_c2_8a17_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1006_c2_8a17_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1006_c2_8a17
result_is_opc_done_MUX_uxn_opcodes_h_l1006_c2_8a17 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1006_c2_8a17_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1006_c2_8a17_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1006_c2_8a17_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1006_c2_8a17_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c2_8a17
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c2_8a17 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c2_8a17_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c2_8a17_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c2_8a17_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c2_8a17_return_output);

-- printf_uxn_opcodes_h_l1007_c3_466f_uxn_opcodes_h_l1007_c3_466f
printf_uxn_opcodes_h_l1007_c3_466f_uxn_opcodes_h_l1007_c3_466f : entity work.printf_uxn_opcodes_h_l1007_c3_466f_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1007_c3_466f_uxn_opcodes_h_l1007_c3_466f_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1012_c11_2eb0
BIN_OP_EQ_uxn_opcodes_h_l1012_c11_2eb0 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1012_c11_2eb0_left,
BIN_OP_EQ_uxn_opcodes_h_l1012_c11_2eb0_right,
BIN_OP_EQ_uxn_opcodes_h_l1012_c11_2eb0_return_output);

-- t8_MUX_uxn_opcodes_h_l1012_c7_3a01
t8_MUX_uxn_opcodes_h_l1012_c7_3a01 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1012_c7_3a01_cond,
t8_MUX_uxn_opcodes_h_l1012_c7_3a01_iftrue,
t8_MUX_uxn_opcodes_h_l1012_c7_3a01_iffalse,
t8_MUX_uxn_opcodes_h_l1012_c7_3a01_return_output);

-- n8_MUX_uxn_opcodes_h_l1012_c7_3a01
n8_MUX_uxn_opcodes_h_l1012_c7_3a01 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1012_c7_3a01_cond,
n8_MUX_uxn_opcodes_h_l1012_c7_3a01_iftrue,
n8_MUX_uxn_opcodes_h_l1012_c7_3a01_iffalse,
n8_MUX_uxn_opcodes_h_l1012_c7_3a01_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1012_c7_3a01
result_is_stack_read_MUX_uxn_opcodes_h_l1012_c7_3a01 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1012_c7_3a01_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1012_c7_3a01_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1012_c7_3a01_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1012_c7_3a01_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1012_c7_3a01
result_sp_relative_shift_MUX_uxn_opcodes_h_l1012_c7_3a01 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1012_c7_3a01_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1012_c7_3a01_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1012_c7_3a01_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1012_c7_3a01_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1012_c7_3a01
result_stack_value_MUX_uxn_opcodes_h_l1012_c7_3a01 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1012_c7_3a01_cond,
result_stack_value_MUX_uxn_opcodes_h_l1012_c7_3a01_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1012_c7_3a01_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1012_c7_3a01_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1012_c7_3a01
result_is_sp_shift_MUX_uxn_opcodes_h_l1012_c7_3a01 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1012_c7_3a01_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1012_c7_3a01_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1012_c7_3a01_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1012_c7_3a01_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1012_c7_3a01
result_is_stack_write_MUX_uxn_opcodes_h_l1012_c7_3a01 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1012_c7_3a01_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1012_c7_3a01_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1012_c7_3a01_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1012_c7_3a01_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1012_c7_3a01
result_is_opc_done_MUX_uxn_opcodes_h_l1012_c7_3a01 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1012_c7_3a01_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1012_c7_3a01_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1012_c7_3a01_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1012_c7_3a01_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1012_c7_3a01
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1012_c7_3a01 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1012_c7_3a01_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1012_c7_3a01_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1012_c7_3a01_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1012_c7_3a01_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1015_c11_5b10
BIN_OP_EQ_uxn_opcodes_h_l1015_c11_5b10 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1015_c11_5b10_left,
BIN_OP_EQ_uxn_opcodes_h_l1015_c11_5b10_right,
BIN_OP_EQ_uxn_opcodes_h_l1015_c11_5b10_return_output);

-- t8_MUX_uxn_opcodes_h_l1015_c7_50e6
t8_MUX_uxn_opcodes_h_l1015_c7_50e6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1015_c7_50e6_cond,
t8_MUX_uxn_opcodes_h_l1015_c7_50e6_iftrue,
t8_MUX_uxn_opcodes_h_l1015_c7_50e6_iffalse,
t8_MUX_uxn_opcodes_h_l1015_c7_50e6_return_output);

-- n8_MUX_uxn_opcodes_h_l1015_c7_50e6
n8_MUX_uxn_opcodes_h_l1015_c7_50e6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1015_c7_50e6_cond,
n8_MUX_uxn_opcodes_h_l1015_c7_50e6_iftrue,
n8_MUX_uxn_opcodes_h_l1015_c7_50e6_iffalse,
n8_MUX_uxn_opcodes_h_l1015_c7_50e6_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1015_c7_50e6
result_is_stack_read_MUX_uxn_opcodes_h_l1015_c7_50e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1015_c7_50e6_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1015_c7_50e6_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1015_c7_50e6_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1015_c7_50e6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c7_50e6
result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c7_50e6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c7_50e6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c7_50e6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c7_50e6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c7_50e6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1015_c7_50e6
result_stack_value_MUX_uxn_opcodes_h_l1015_c7_50e6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1015_c7_50e6_cond,
result_stack_value_MUX_uxn_opcodes_h_l1015_c7_50e6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1015_c7_50e6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1015_c7_50e6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c7_50e6
result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c7_50e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c7_50e6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c7_50e6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c7_50e6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c7_50e6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1015_c7_50e6
result_is_stack_write_MUX_uxn_opcodes_h_l1015_c7_50e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1015_c7_50e6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1015_c7_50e6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1015_c7_50e6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1015_c7_50e6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1015_c7_50e6
result_is_opc_done_MUX_uxn_opcodes_h_l1015_c7_50e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1015_c7_50e6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1015_c7_50e6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1015_c7_50e6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1015_c7_50e6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c7_50e6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c7_50e6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c7_50e6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c7_50e6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c7_50e6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c7_50e6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1019_c11_1d76
BIN_OP_EQ_uxn_opcodes_h_l1019_c11_1d76 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1019_c11_1d76_left,
BIN_OP_EQ_uxn_opcodes_h_l1019_c11_1d76_right,
BIN_OP_EQ_uxn_opcodes_h_l1019_c11_1d76_return_output);

-- n8_MUX_uxn_opcodes_h_l1019_c7_1538
n8_MUX_uxn_opcodes_h_l1019_c7_1538 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1019_c7_1538_cond,
n8_MUX_uxn_opcodes_h_l1019_c7_1538_iftrue,
n8_MUX_uxn_opcodes_h_l1019_c7_1538_iffalse,
n8_MUX_uxn_opcodes_h_l1019_c7_1538_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1019_c7_1538
result_is_stack_read_MUX_uxn_opcodes_h_l1019_c7_1538 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1019_c7_1538_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1019_c7_1538_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1019_c7_1538_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1019_c7_1538_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1019_c7_1538
result_sp_relative_shift_MUX_uxn_opcodes_h_l1019_c7_1538 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1019_c7_1538_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1019_c7_1538_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1019_c7_1538_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1019_c7_1538_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1019_c7_1538
result_stack_value_MUX_uxn_opcodes_h_l1019_c7_1538 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1019_c7_1538_cond,
result_stack_value_MUX_uxn_opcodes_h_l1019_c7_1538_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1019_c7_1538_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1019_c7_1538_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1019_c7_1538
result_is_sp_shift_MUX_uxn_opcodes_h_l1019_c7_1538 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1019_c7_1538_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1019_c7_1538_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1019_c7_1538_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1019_c7_1538_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_1538
result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_1538 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_1538_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_1538_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_1538_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_1538_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_1538
result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_1538 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_1538_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_1538_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_1538_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_1538_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1019_c7_1538
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1019_c7_1538 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1019_c7_1538_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1019_c7_1538_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1019_c7_1538_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1019_c7_1538_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1022_c11_7769
BIN_OP_EQ_uxn_opcodes_h_l1022_c11_7769 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1022_c11_7769_left,
BIN_OP_EQ_uxn_opcodes_h_l1022_c11_7769_right,
BIN_OP_EQ_uxn_opcodes_h_l1022_c11_7769_return_output);

-- n8_MUX_uxn_opcodes_h_l1022_c7_7517
n8_MUX_uxn_opcodes_h_l1022_c7_7517 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1022_c7_7517_cond,
n8_MUX_uxn_opcodes_h_l1022_c7_7517_iftrue,
n8_MUX_uxn_opcodes_h_l1022_c7_7517_iffalse,
n8_MUX_uxn_opcodes_h_l1022_c7_7517_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1022_c7_7517
result_is_stack_read_MUX_uxn_opcodes_h_l1022_c7_7517 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1022_c7_7517_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1022_c7_7517_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1022_c7_7517_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1022_c7_7517_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1022_c7_7517
result_sp_relative_shift_MUX_uxn_opcodes_h_l1022_c7_7517 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1022_c7_7517_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1022_c7_7517_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1022_c7_7517_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1022_c7_7517_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1022_c7_7517
result_stack_value_MUX_uxn_opcodes_h_l1022_c7_7517 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1022_c7_7517_cond,
result_stack_value_MUX_uxn_opcodes_h_l1022_c7_7517_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1022_c7_7517_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1022_c7_7517_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1022_c7_7517
result_is_sp_shift_MUX_uxn_opcodes_h_l1022_c7_7517 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1022_c7_7517_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1022_c7_7517_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1022_c7_7517_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1022_c7_7517_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1022_c7_7517
result_is_stack_write_MUX_uxn_opcodes_h_l1022_c7_7517 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1022_c7_7517_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1022_c7_7517_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1022_c7_7517_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1022_c7_7517_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1022_c7_7517
result_is_opc_done_MUX_uxn_opcodes_h_l1022_c7_7517 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1022_c7_7517_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1022_c7_7517_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1022_c7_7517_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1022_c7_7517_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1022_c7_7517
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1022_c7_7517 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1022_c7_7517_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1022_c7_7517_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1022_c7_7517_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1022_c7_7517_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1026_c32_db41
BIN_OP_AND_uxn_opcodes_h_l1026_c32_db41 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1026_c32_db41_left,
BIN_OP_AND_uxn_opcodes_h_l1026_c32_db41_right,
BIN_OP_AND_uxn_opcodes_h_l1026_c32_db41_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1026_c32_6bc3
BIN_OP_GT_uxn_opcodes_h_l1026_c32_6bc3 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1026_c32_6bc3_left,
BIN_OP_GT_uxn_opcodes_h_l1026_c32_6bc3_right,
BIN_OP_GT_uxn_opcodes_h_l1026_c32_6bc3_return_output);

-- MUX_uxn_opcodes_h_l1026_c32_68df
MUX_uxn_opcodes_h_l1026_c32_68df : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1026_c32_68df_cond,
MUX_uxn_opcodes_h_l1026_c32_68df_iftrue,
MUX_uxn_opcodes_h_l1026_c32_68df_iffalse,
MUX_uxn_opcodes_h_l1026_c32_68df_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1028_c11_2c9c
BIN_OP_EQ_uxn_opcodes_h_l1028_c11_2c9c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1028_c11_2c9c_left,
BIN_OP_EQ_uxn_opcodes_h_l1028_c11_2c9c_right,
BIN_OP_EQ_uxn_opcodes_h_l1028_c11_2c9c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_1de2
result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_1de2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_1de2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_1de2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_1de2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_1de2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1028_c7_1de2
result_stack_value_MUX_uxn_opcodes_h_l1028_c7_1de2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1028_c7_1de2_cond,
result_stack_value_MUX_uxn_opcodes_h_l1028_c7_1de2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1028_c7_1de2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1028_c7_1de2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_1de2
result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_1de2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_1de2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_1de2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_1de2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_1de2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_1de2
result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_1de2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_1de2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_1de2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_1de2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_1de2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_1de2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_1de2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_1de2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_1de2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_1de2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_1de2_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1032_c24_551e
BIN_OP_AND_uxn_opcodes_h_l1032_c24_551e : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1032_c24_551e_left,
BIN_OP_AND_uxn_opcodes_h_l1032_c24_551e_right,
BIN_OP_AND_uxn_opcodes_h_l1032_c24_551e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1034_c11_abfe
BIN_OP_EQ_uxn_opcodes_h_l1034_c11_abfe : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1034_c11_abfe_left,
BIN_OP_EQ_uxn_opcodes_h_l1034_c11_abfe_right,
BIN_OP_EQ_uxn_opcodes_h_l1034_c11_abfe_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1034_c7_c3b5
result_is_stack_write_MUX_uxn_opcodes_h_l1034_c7_c3b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1034_c7_c3b5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1034_c7_c3b5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1034_c7_c3b5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1034_c7_c3b5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1034_c7_c3b5
result_is_opc_done_MUX_uxn_opcodes_h_l1034_c7_c3b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1034_c7_c3b5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1034_c7_c3b5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1034_c7_c3b5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1034_c7_c3b5_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 n8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1006_c6_a155_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_5ae7_return_output,
 t8_MUX_uxn_opcodes_h_l1006_c2_8a17_return_output,
 n8_MUX_uxn_opcodes_h_l1006_c2_8a17_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1006_c2_8a17_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c2_8a17_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1006_c2_8a17_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c2_8a17_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1006_c2_8a17_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1006_c2_8a17_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c2_8a17_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1012_c11_2eb0_return_output,
 t8_MUX_uxn_opcodes_h_l1012_c7_3a01_return_output,
 n8_MUX_uxn_opcodes_h_l1012_c7_3a01_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1012_c7_3a01_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1012_c7_3a01_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1012_c7_3a01_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1012_c7_3a01_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1012_c7_3a01_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1012_c7_3a01_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1012_c7_3a01_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1015_c11_5b10_return_output,
 t8_MUX_uxn_opcodes_h_l1015_c7_50e6_return_output,
 n8_MUX_uxn_opcodes_h_l1015_c7_50e6_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1015_c7_50e6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c7_50e6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1015_c7_50e6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c7_50e6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1015_c7_50e6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1015_c7_50e6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c7_50e6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1019_c11_1d76_return_output,
 n8_MUX_uxn_opcodes_h_l1019_c7_1538_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1019_c7_1538_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1019_c7_1538_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1019_c7_1538_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1019_c7_1538_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_1538_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_1538_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1019_c7_1538_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1022_c11_7769_return_output,
 n8_MUX_uxn_opcodes_h_l1022_c7_7517_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1022_c7_7517_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1022_c7_7517_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1022_c7_7517_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1022_c7_7517_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1022_c7_7517_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1022_c7_7517_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1022_c7_7517_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1026_c32_db41_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1026_c32_6bc3_return_output,
 MUX_uxn_opcodes_h_l1026_c32_68df_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1028_c11_2c9c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_1de2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1028_c7_1de2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_1de2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_1de2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_1de2_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1032_c24_551e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1034_c11_abfe_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1034_c7_c3b5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1034_c7_c3b5_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c6_a155_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c6_a155_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c6_a155_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_5ae7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_5ae7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_5ae7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_5ae7_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1006_c2_8a17_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1006_c2_8a17_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1012_c7_3a01_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1006_c2_8a17_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1006_c2_8a17_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1006_c2_8a17_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1006_c2_8a17_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1012_c7_3a01_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1006_c2_8a17_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1006_c2_8a17_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1006_c2_8a17_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1006_c2_8a17_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1012_c7_3a01_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1006_c2_8a17_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1006_c2_8a17_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c2_8a17_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c2_8a17_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1012_c7_3a01_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c2_8a17_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c2_8a17_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1006_c2_8a17_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1006_c2_8a17_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1012_c7_3a01_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1006_c2_8a17_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1006_c2_8a17_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c2_8a17_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c2_8a17_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1012_c7_3a01_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c2_8a17_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c2_8a17_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1006_c2_8a17_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1006_c2_8a17_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1012_c7_3a01_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1006_c2_8a17_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1006_c2_8a17_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1006_c2_8a17_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1006_c2_8a17_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1012_c7_3a01_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1006_c2_8a17_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1006_c2_8a17_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c2_8a17_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1009_c3_24b8 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c2_8a17_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1012_c7_3a01_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c2_8a17_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c2_8a17_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1007_c3_466f_uxn_opcodes_h_l1007_c3_466f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_2eb0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_2eb0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_2eb0_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1012_c7_3a01_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1012_c7_3a01_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1015_c7_50e6_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1012_c7_3a01_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1012_c7_3a01_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1012_c7_3a01_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1015_c7_50e6_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1012_c7_3a01_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1012_c7_3a01_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1012_c7_3a01_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1015_c7_50e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1012_c7_3a01_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1012_c7_3a01_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1012_c7_3a01_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c7_50e6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1012_c7_3a01_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1012_c7_3a01_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1012_c7_3a01_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1015_c7_50e6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1012_c7_3a01_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1012_c7_3a01_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1012_c7_3a01_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c7_50e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1012_c7_3a01_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1012_c7_3a01_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1012_c7_3a01_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1015_c7_50e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1012_c7_3a01_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1012_c7_3a01_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1012_c7_3a01_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1015_c7_50e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1012_c7_3a01_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1012_c7_3a01_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1013_c3_d49a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1012_c7_3a01_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c7_50e6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1012_c7_3a01_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_5b10_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_5b10_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_5b10_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1015_c7_50e6_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1015_c7_50e6_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1015_c7_50e6_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1015_c7_50e6_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1015_c7_50e6_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1019_c7_1538_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1015_c7_50e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1015_c7_50e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1015_c7_50e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1019_c7_1538_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1015_c7_50e6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c7_50e6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c7_50e6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1019_c7_1538_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c7_50e6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1015_c7_50e6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1015_c7_50e6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1019_c7_1538_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1015_c7_50e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c7_50e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c7_50e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1019_c7_1538_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c7_50e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1015_c7_50e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1015_c7_50e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_1538_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1015_c7_50e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1015_c7_50e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1015_c7_50e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_1538_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1015_c7_50e6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c7_50e6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1017_c3_739e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c7_50e6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1019_c7_1538_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c7_50e6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_1d76_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_1d76_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_1d76_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1019_c7_1538_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1019_c7_1538_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1022_c7_7517_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1019_c7_1538_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1019_c7_1538_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1019_c7_1538_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1022_c7_7517_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1019_c7_1538_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1019_c7_1538_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1019_c7_1538_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1022_c7_7517_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1019_c7_1538_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1019_c7_1538_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1019_c7_1538_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1022_c7_7517_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1019_c7_1538_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1019_c7_1538_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1019_c7_1538_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1022_c7_7517_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1019_c7_1538_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_1538_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_1538_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1022_c7_7517_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_1538_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_1538_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_1538_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1022_c7_7517_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_1538_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1019_c7_1538_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1020_c3_e5fc : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1019_c7_1538_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1022_c7_7517_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1019_c7_1538_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_7769_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_7769_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_7769_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1022_c7_7517_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1022_c7_7517_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1022_c7_7517_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1022_c7_7517_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1022_c7_7517_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1022_c7_7517_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1022_c7_7517_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1022_c7_7517_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1022_c7_7517_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1022_c7_7517_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1022_c7_7517_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1028_c7_1de2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1022_c7_7517_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1022_c7_7517_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1022_c7_7517_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_1de2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1022_c7_7517_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1022_c7_7517_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1022_c7_7517_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_1de2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1022_c7_7517_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1022_c7_7517_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1022_c7_7517_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_1de2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1022_c7_7517_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1022_c7_7517_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1022_c7_7517_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_1de2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1022_c7_7517_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1026_c32_68df_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1026_c32_68df_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1026_c32_68df_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1026_c32_db41_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1026_c32_db41_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1026_c32_db41_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1026_c32_6bc3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1026_c32_6bc3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1026_c32_6bc3_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1026_c32_68df_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_2c9c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_2c9c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_2c9c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_1de2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_1de2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_1de2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1028_c7_1de2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1028_c7_1de2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1028_c7_1de2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_1de2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_1de2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1034_c7_c3b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_1de2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_1de2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_1de2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1034_c7_c3b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_1de2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_1de2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1031_c3_d685 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_1de2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_1de2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1032_c24_551e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1032_c24_551e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1032_c24_551e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_abfe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_abfe_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_abfe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1034_c7_c3b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1034_c7_c3b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1034_c7_c3b5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1034_c7_c3b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1034_c7_c3b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1034_c7_c3b5_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1006_l1022_l1019_l1015_l1012_DUPLICATE_37bd_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1006_l1028_l1022_l1019_l1015_l1012_DUPLICATE_0559_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1006_l1028_l1019_l1015_l1012_DUPLICATE_d1cd_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1006_l1034_l1022_l1019_l1015_l1012_DUPLICATE_fd0b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1015_l1019_l1012_l1022_DUPLICATE_ae70_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1034_l1028_l1022_l1019_l1015_l1012_DUPLICATE_4a1b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1028_l1022_DUPLICATE_7d3d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l1039_l1002_DUPLICATE_e79d_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_AND_uxn_opcodes_h_l1026_c32_db41_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1009_c3_24b8 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c2_8a17_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1009_c3_24b8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_2c9c_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1017_c3_739e := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c7_50e6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1017_c3_739e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_abfe_right := to_unsigned(6, 3);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1026_c32_6bc3_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1013_c3_d49a := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1012_c7_3a01_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1013_c3_d49a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c6_a155_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_5b10_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_1d76_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1034_c7_c3b5_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1034_c7_c3b5_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1026_c32_68df_iffalse := resize(to_signed(-1, 2), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_2eb0_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1031_c3_d685 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_1de2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1031_c3_d685;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1022_c7_7517_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_1de2_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1020_c3_e5fc := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1019_c7_1538_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1020_c3_e5fc;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_1de2_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1022_c7_7517_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1006_c2_8a17_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_5ae7_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1006_c2_8a17_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_7769_right := to_unsigned(4, 3);
     VAR_MUX_uxn_opcodes_h_l1026_c32_68df_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_5ae7_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1026_c32_db41_left := VAR_ins;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1032_c24_551e_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1006_c2_8a17_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1012_c7_3a01_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1015_c7_50e6_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1019_c7_1538_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1022_c7_7517_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c6_a155_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_2eb0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_5b10_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_1d76_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_7769_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_2c9c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_abfe_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1022_c7_7517_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1015_c7_50e6_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1032_c24_551e_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1006_c2_8a17_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1012_c7_3a01_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1015_c7_50e6_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1006_l1034_l1022_l1019_l1015_l1012_DUPLICATE_fd0b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1006_l1034_l1022_l1019_l1015_l1012_DUPLICATE_fd0b_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1006_c6_a155] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1006_c6_a155_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c6_a155_left;
     BIN_OP_EQ_uxn_opcodes_h_l1006_c6_a155_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c6_a155_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c6_a155_return_output := BIN_OP_EQ_uxn_opcodes_h_l1006_c6_a155_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1026_c32_db41] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1026_c32_db41_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1026_c32_db41_left;
     BIN_OP_AND_uxn_opcodes_h_l1026_c32_db41_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1026_c32_db41_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1026_c32_db41_return_output := BIN_OP_AND_uxn_opcodes_h_l1026_c32_db41_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1034_c11_abfe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1034_c11_abfe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_abfe_left;
     BIN_OP_EQ_uxn_opcodes_h_l1034_c11_abfe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_abfe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_abfe_return_output := BIN_OP_EQ_uxn_opcodes_h_l1034_c11_abfe_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1012_c11_2eb0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1012_c11_2eb0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_2eb0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1012_c11_2eb0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_2eb0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_2eb0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1012_c11_2eb0_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1028_l1022_DUPLICATE_7d3d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1028_l1022_DUPLICATE_7d3d_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1006_l1028_l1019_l1015_l1012_DUPLICATE_d1cd LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1006_l1028_l1019_l1015_l1012_DUPLICATE_d1cd_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1015_l1019_l1012_l1022_DUPLICATE_ae70 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1015_l1019_l1012_l1022_DUPLICATE_ae70_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1034_l1028_l1022_l1019_l1015_l1012_DUPLICATE_4a1b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1034_l1028_l1022_l1019_l1015_l1012_DUPLICATE_4a1b_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1006_l1028_l1022_l1019_l1015_l1012_DUPLICATE_0559 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1006_l1028_l1022_l1019_l1015_l1012_DUPLICATE_0559_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1019_c11_1d76] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1019_c11_1d76_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_1d76_left;
     BIN_OP_EQ_uxn_opcodes_h_l1019_c11_1d76_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_1d76_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_1d76_return_output := BIN_OP_EQ_uxn_opcodes_h_l1019_c11_1d76_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1006_l1022_l1019_l1015_l1012_DUPLICATE_37bd LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1006_l1022_l1019_l1015_l1012_DUPLICATE_37bd_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1015_c11_5b10] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1015_c11_5b10_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_5b10_left;
     BIN_OP_EQ_uxn_opcodes_h_l1015_c11_5b10_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_5b10_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_5b10_return_output := BIN_OP_EQ_uxn_opcodes_h_l1015_c11_5b10_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1032_c24_551e] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1032_c24_551e_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1032_c24_551e_left;
     BIN_OP_AND_uxn_opcodes_h_l1032_c24_551e_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1032_c24_551e_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1032_c24_551e_return_output := BIN_OP_AND_uxn_opcodes_h_l1032_c24_551e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1028_c11_2c9c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1028_c11_2c9c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_2c9c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1028_c11_2c9c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_2c9c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_2c9c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1028_c11_2c9c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1022_c11_7769] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1022_c11_7769_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_7769_left;
     BIN_OP_EQ_uxn_opcodes_h_l1022_c11_7769_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_7769_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_7769_return_output := BIN_OP_EQ_uxn_opcodes_h_l1022_c11_7769_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1026_c32_6bc3_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1026_c32_db41_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1028_c7_1de2_iftrue := VAR_BIN_OP_AND_uxn_opcodes_h_l1032_c24_551e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_5ae7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c6_a155_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1006_c2_8a17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c6_a155_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1006_c2_8a17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c6_a155_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c2_8a17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c6_a155_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1006_c2_8a17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c6_a155_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1006_c2_8a17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c6_a155_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c2_8a17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c6_a155_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c2_8a17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c6_a155_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1006_c2_8a17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c6_a155_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1006_c2_8a17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c6_a155_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1012_c7_3a01_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_2eb0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1012_c7_3a01_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_2eb0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1012_c7_3a01_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_2eb0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1012_c7_3a01_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_2eb0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1012_c7_3a01_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_2eb0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1012_c7_3a01_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_2eb0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1012_c7_3a01_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_2eb0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1012_c7_3a01_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_2eb0_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1012_c7_3a01_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_2eb0_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1015_c7_50e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_5b10_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1015_c7_50e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_5b10_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c7_50e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_5b10_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1015_c7_50e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_5b10_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1015_c7_50e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_5b10_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c7_50e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_5b10_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c7_50e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_5b10_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1015_c7_50e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_5b10_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1015_c7_50e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_5b10_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1019_c7_1538_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_1d76_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_1538_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_1d76_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1019_c7_1538_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_1d76_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1019_c7_1538_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_1d76_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_1538_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_1d76_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1019_c7_1538_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_1d76_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1019_c7_1538_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_1d76_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1019_c7_1538_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_1d76_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1022_c7_7517_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_7769_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1022_c7_7517_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_7769_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1022_c7_7517_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_7769_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1022_c7_7517_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_7769_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1022_c7_7517_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_7769_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1022_c7_7517_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_7769_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1022_c7_7517_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_7769_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1022_c7_7517_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_7769_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_1de2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_2c9c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_1de2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_2c9c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_1de2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_2c9c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_1de2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_2c9c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1028_c7_1de2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_2c9c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1034_c7_c3b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_abfe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1034_c7_c3b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_abfe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c2_8a17_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1006_l1022_l1019_l1015_l1012_DUPLICATE_37bd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1012_c7_3a01_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1006_l1022_l1019_l1015_l1012_DUPLICATE_37bd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c7_50e6_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1006_l1022_l1019_l1015_l1012_DUPLICATE_37bd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1019_c7_1538_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1006_l1022_l1019_l1015_l1012_DUPLICATE_37bd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1022_c7_7517_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1006_l1022_l1019_l1015_l1012_DUPLICATE_37bd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1012_c7_3a01_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1034_l1028_l1022_l1019_l1015_l1012_DUPLICATE_4a1b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1015_c7_50e6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1034_l1028_l1022_l1019_l1015_l1012_DUPLICATE_4a1b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_1538_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1034_l1028_l1022_l1019_l1015_l1012_DUPLICATE_4a1b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1022_c7_7517_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1034_l1028_l1022_l1019_l1015_l1012_DUPLICATE_4a1b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_1de2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1034_l1028_l1022_l1019_l1015_l1012_DUPLICATE_4a1b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1034_c7_c3b5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1034_l1028_l1022_l1019_l1015_l1012_DUPLICATE_4a1b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c2_8a17_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1006_l1028_l1019_l1015_l1012_DUPLICATE_d1cd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1012_c7_3a01_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1006_l1028_l1019_l1015_l1012_DUPLICATE_d1cd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c7_50e6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1006_l1028_l1019_l1015_l1012_DUPLICATE_d1cd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1019_c7_1538_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1006_l1028_l1019_l1015_l1012_DUPLICATE_d1cd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_1de2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1006_l1028_l1019_l1015_l1012_DUPLICATE_d1cd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1012_c7_3a01_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1015_l1019_l1012_l1022_DUPLICATE_ae70_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1015_c7_50e6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1015_l1019_l1012_l1022_DUPLICATE_ae70_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1019_c7_1538_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1015_l1019_l1012_l1022_DUPLICATE_ae70_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1022_c7_7517_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1015_l1019_l1012_l1022_DUPLICATE_ae70_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1006_c2_8a17_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1006_l1034_l1022_l1019_l1015_l1012_DUPLICATE_fd0b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1012_c7_3a01_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1006_l1034_l1022_l1019_l1015_l1012_DUPLICATE_fd0b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1015_c7_50e6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1006_l1034_l1022_l1019_l1015_l1012_DUPLICATE_fd0b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_1538_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1006_l1034_l1022_l1019_l1015_l1012_DUPLICATE_fd0b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1022_c7_7517_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1006_l1034_l1022_l1019_l1015_l1012_DUPLICATE_fd0b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1034_c7_c3b5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1006_l1034_l1022_l1019_l1015_l1012_DUPLICATE_fd0b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1022_c7_7517_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1028_l1022_DUPLICATE_7d3d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_1de2_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1028_l1022_DUPLICATE_7d3d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1006_c2_8a17_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1006_l1028_l1022_l1019_l1015_l1012_DUPLICATE_0559_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1012_c7_3a01_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1006_l1028_l1022_l1019_l1015_l1012_DUPLICATE_0559_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1015_c7_50e6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1006_l1028_l1022_l1019_l1015_l1012_DUPLICATE_0559_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1019_c7_1538_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1006_l1028_l1022_l1019_l1015_l1012_DUPLICATE_0559_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1022_c7_7517_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1006_l1028_l1022_l1019_l1015_l1012_DUPLICATE_0559_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1028_c7_1de2_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1006_l1028_l1022_l1019_l1015_l1012_DUPLICATE_0559_return_output;
     -- t8_MUX[uxn_opcodes_h_l1015_c7_50e6] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1015_c7_50e6_cond <= VAR_t8_MUX_uxn_opcodes_h_l1015_c7_50e6_cond;
     t8_MUX_uxn_opcodes_h_l1015_c7_50e6_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1015_c7_50e6_iftrue;
     t8_MUX_uxn_opcodes_h_l1015_c7_50e6_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1015_c7_50e6_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1015_c7_50e6_return_output := t8_MUX_uxn_opcodes_h_l1015_c7_50e6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1028_c7_1de2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_1de2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_1de2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_1de2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_1de2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_1de2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_1de2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_1de2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_1de2_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1006_c1_5ae7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_5ae7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_5ae7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_5ae7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_5ae7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_5ae7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_5ae7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_5ae7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_5ae7_return_output;

     -- n8_MUX[uxn_opcodes_h_l1022_c7_7517] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1022_c7_7517_cond <= VAR_n8_MUX_uxn_opcodes_h_l1022_c7_7517_cond;
     n8_MUX_uxn_opcodes_h_l1022_c7_7517_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1022_c7_7517_iftrue;
     n8_MUX_uxn_opcodes_h_l1022_c7_7517_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1022_c7_7517_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1022_c7_7517_return_output := n8_MUX_uxn_opcodes_h_l1022_c7_7517_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1026_c32_6bc3] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1026_c32_6bc3_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1026_c32_6bc3_left;
     BIN_OP_GT_uxn_opcodes_h_l1026_c32_6bc3_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1026_c32_6bc3_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1026_c32_6bc3_return_output := BIN_OP_GT_uxn_opcodes_h_l1026_c32_6bc3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1028_c7_1de2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_1de2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_1de2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_1de2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_1de2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_1de2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_1de2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_1de2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_1de2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1034_c7_c3b5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1034_c7_c3b5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1034_c7_c3b5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1034_c7_c3b5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1034_c7_c3b5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1034_c7_c3b5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1034_c7_c3b5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1034_c7_c3b5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1034_c7_c3b5_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1028_c7_1de2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1028_c7_1de2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1028_c7_1de2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1028_c7_1de2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1028_c7_1de2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1028_c7_1de2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1028_c7_1de2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1028_c7_1de2_return_output := result_stack_value_MUX_uxn_opcodes_h_l1028_c7_1de2_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1022_c7_7517] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1022_c7_7517_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1022_c7_7517_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1022_c7_7517_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1022_c7_7517_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1022_c7_7517_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1022_c7_7517_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1022_c7_7517_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1022_c7_7517_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1034_c7_c3b5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1034_c7_c3b5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1034_c7_c3b5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1034_c7_c3b5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1034_c7_c3b5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1034_c7_c3b5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1034_c7_c3b5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1034_c7_c3b5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1034_c7_c3b5_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1026_c32_68df_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1026_c32_6bc3_return_output;
     VAR_printf_uxn_opcodes_h_l1007_c3_466f_uxn_opcodes_h_l1007_c3_466f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_5ae7_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1019_c7_1538_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1022_c7_7517_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_1de2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1034_c7_c3b5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1022_c7_7517_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_1de2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1019_c7_1538_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1022_c7_7517_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_1de2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1034_c7_c3b5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1022_c7_7517_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_1de2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1022_c7_7517_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1028_c7_1de2_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1012_c7_3a01_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1015_c7_50e6_return_output;
     -- t8_MUX[uxn_opcodes_h_l1012_c7_3a01] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1012_c7_3a01_cond <= VAR_t8_MUX_uxn_opcodes_h_l1012_c7_3a01_cond;
     t8_MUX_uxn_opcodes_h_l1012_c7_3a01_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1012_c7_3a01_iftrue;
     t8_MUX_uxn_opcodes_h_l1012_c7_3a01_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1012_c7_3a01_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1012_c7_3a01_return_output := t8_MUX_uxn_opcodes_h_l1012_c7_3a01_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1028_c7_1de2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_1de2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_1de2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_1de2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_1de2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_1de2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_1de2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_1de2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_1de2_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1022_c7_7517] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1022_c7_7517_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1022_c7_7517_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1022_c7_7517_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1022_c7_7517_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1022_c7_7517_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1022_c7_7517_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1022_c7_7517_return_output := result_stack_value_MUX_uxn_opcodes_h_l1022_c7_7517_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1022_c7_7517] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1022_c7_7517_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1022_c7_7517_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1022_c7_7517_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1022_c7_7517_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1022_c7_7517_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1022_c7_7517_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1022_c7_7517_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1022_c7_7517_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1019_c7_1538] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1019_c7_1538_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1019_c7_1538_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1019_c7_1538_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1019_c7_1538_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1019_c7_1538_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1019_c7_1538_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1019_c7_1538_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1019_c7_1538_return_output;

     -- MUX[uxn_opcodes_h_l1026_c32_68df] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1026_c32_68df_cond <= VAR_MUX_uxn_opcodes_h_l1026_c32_68df_cond;
     MUX_uxn_opcodes_h_l1026_c32_68df_iftrue <= VAR_MUX_uxn_opcodes_h_l1026_c32_68df_iftrue;
     MUX_uxn_opcodes_h_l1026_c32_68df_iffalse <= VAR_MUX_uxn_opcodes_h_l1026_c32_68df_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1026_c32_68df_return_output := MUX_uxn_opcodes_h_l1026_c32_68df_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1028_c7_1de2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_1de2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_1de2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_1de2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_1de2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_1de2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_1de2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_1de2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_1de2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1022_c7_7517] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1022_c7_7517_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1022_c7_7517_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1022_c7_7517_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1022_c7_7517_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1022_c7_7517_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1022_c7_7517_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1022_c7_7517_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1022_c7_7517_return_output;

     -- n8_MUX[uxn_opcodes_h_l1019_c7_1538] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1019_c7_1538_cond <= VAR_n8_MUX_uxn_opcodes_h_l1019_c7_1538_cond;
     n8_MUX_uxn_opcodes_h_l1019_c7_1538_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1019_c7_1538_iftrue;
     n8_MUX_uxn_opcodes_h_l1019_c7_1538_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1019_c7_1538_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1019_c7_1538_return_output := n8_MUX_uxn_opcodes_h_l1019_c7_1538_return_output;

     -- printf_uxn_opcodes_h_l1007_c3_466f[uxn_opcodes_h_l1007_c3_466f] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1007_c3_466f_uxn_opcodes_h_l1007_c3_466f_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1007_c3_466f_uxn_opcodes_h_l1007_c3_466f_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1022_c7_7517_iftrue := VAR_MUX_uxn_opcodes_h_l1026_c32_68df_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1015_c7_50e6_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1019_c7_1538_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1022_c7_7517_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_1de2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1019_c7_1538_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1022_c7_7517_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1015_c7_50e6_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1019_c7_1538_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1022_c7_7517_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_1de2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1019_c7_1538_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1022_c7_7517_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1019_c7_1538_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1022_c7_7517_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1006_c2_8a17_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1012_c7_3a01_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1022_c7_7517] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1022_c7_7517_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1022_c7_7517_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1022_c7_7517_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1022_c7_7517_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1022_c7_7517_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1022_c7_7517_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1022_c7_7517_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1022_c7_7517_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1019_c7_1538] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1019_c7_1538_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1019_c7_1538_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1019_c7_1538_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1019_c7_1538_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1019_c7_1538_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1019_c7_1538_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1019_c7_1538_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1019_c7_1538_return_output;

     -- n8_MUX[uxn_opcodes_h_l1015_c7_50e6] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1015_c7_50e6_cond <= VAR_n8_MUX_uxn_opcodes_h_l1015_c7_50e6_cond;
     n8_MUX_uxn_opcodes_h_l1015_c7_50e6_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1015_c7_50e6_iftrue;
     n8_MUX_uxn_opcodes_h_l1015_c7_50e6_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1015_c7_50e6_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1015_c7_50e6_return_output := n8_MUX_uxn_opcodes_h_l1015_c7_50e6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1019_c7_1538] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1019_c7_1538_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1019_c7_1538_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1019_c7_1538_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1019_c7_1538_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1019_c7_1538_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1019_c7_1538_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1019_c7_1538_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1019_c7_1538_return_output;

     -- t8_MUX[uxn_opcodes_h_l1006_c2_8a17] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1006_c2_8a17_cond <= VAR_t8_MUX_uxn_opcodes_h_l1006_c2_8a17_cond;
     t8_MUX_uxn_opcodes_h_l1006_c2_8a17_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1006_c2_8a17_iftrue;
     t8_MUX_uxn_opcodes_h_l1006_c2_8a17_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1006_c2_8a17_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1006_c2_8a17_return_output := t8_MUX_uxn_opcodes_h_l1006_c2_8a17_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1022_c7_7517] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1022_c7_7517_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1022_c7_7517_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1022_c7_7517_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1022_c7_7517_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1022_c7_7517_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1022_c7_7517_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1022_c7_7517_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1022_c7_7517_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1015_c7_50e6] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1015_c7_50e6_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1015_c7_50e6_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1015_c7_50e6_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1015_c7_50e6_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1015_c7_50e6_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1015_c7_50e6_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1015_c7_50e6_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1015_c7_50e6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1022_c7_7517] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1022_c7_7517_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1022_c7_7517_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1022_c7_7517_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1022_c7_7517_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1022_c7_7517_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1022_c7_7517_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1022_c7_7517_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1022_c7_7517_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1019_c7_1538] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1019_c7_1538_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1019_c7_1538_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1019_c7_1538_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1019_c7_1538_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1019_c7_1538_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1019_c7_1538_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1019_c7_1538_return_output := result_stack_value_MUX_uxn_opcodes_h_l1019_c7_1538_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1012_c7_3a01_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1015_c7_50e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_1538_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1022_c7_7517_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c7_50e6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1019_c7_1538_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1012_c7_3a01_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1015_c7_50e6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_1538_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1022_c7_7517_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1019_c7_1538_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1022_c7_7517_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c7_50e6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1019_c7_1538_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1015_c7_50e6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1019_c7_1538_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1006_c2_8a17_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1015_c7_50e6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c7_50e6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c7_50e6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c7_50e6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c7_50e6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c7_50e6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c7_50e6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c7_50e6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c7_50e6_return_output;

     -- n8_MUX[uxn_opcodes_h_l1012_c7_3a01] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1012_c7_3a01_cond <= VAR_n8_MUX_uxn_opcodes_h_l1012_c7_3a01_cond;
     n8_MUX_uxn_opcodes_h_l1012_c7_3a01_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1012_c7_3a01_iftrue;
     n8_MUX_uxn_opcodes_h_l1012_c7_3a01_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1012_c7_3a01_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1012_c7_3a01_return_output := n8_MUX_uxn_opcodes_h_l1012_c7_3a01_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1019_c7_1538] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_1538_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_1538_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_1538_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_1538_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_1538_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_1538_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_1538_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_1538_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1015_c7_50e6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1015_c7_50e6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1015_c7_50e6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1015_c7_50e6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1015_c7_50e6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1015_c7_50e6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1015_c7_50e6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1015_c7_50e6_return_output := result_stack_value_MUX_uxn_opcodes_h_l1015_c7_50e6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1015_c7_50e6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c7_50e6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c7_50e6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c7_50e6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c7_50e6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c7_50e6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c7_50e6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c7_50e6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c7_50e6_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1012_c7_3a01] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1012_c7_3a01_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1012_c7_3a01_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1012_c7_3a01_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1012_c7_3a01_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1012_c7_3a01_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1012_c7_3a01_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1012_c7_3a01_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1012_c7_3a01_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1019_c7_1538] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1019_c7_1538_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1019_c7_1538_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1019_c7_1538_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1019_c7_1538_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1019_c7_1538_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1019_c7_1538_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1019_c7_1538_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1019_c7_1538_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1019_c7_1538] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_1538_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_1538_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_1538_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_1538_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_1538_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_1538_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_1538_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_1538_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l1006_c2_8a17_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1012_c7_3a01_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1015_c7_50e6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_1538_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1012_c7_3a01_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1015_c7_50e6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1006_c2_8a17_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1012_c7_3a01_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1015_c7_50e6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_1538_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c7_50e6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1019_c7_1538_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1012_c7_3a01_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1015_c7_50e6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1012_c7_3a01_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1015_c7_50e6_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1012_c7_3a01] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1012_c7_3a01_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1012_c7_3a01_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1012_c7_3a01_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1012_c7_3a01_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1012_c7_3a01_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1012_c7_3a01_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1012_c7_3a01_return_output := result_stack_value_MUX_uxn_opcodes_h_l1012_c7_3a01_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1015_c7_50e6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c7_50e6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c7_50e6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c7_50e6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c7_50e6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c7_50e6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c7_50e6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c7_50e6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c7_50e6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1012_c7_3a01] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1012_c7_3a01_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1012_c7_3a01_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1012_c7_3a01_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1012_c7_3a01_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1012_c7_3a01_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1012_c7_3a01_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1012_c7_3a01_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1012_c7_3a01_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1006_c2_8a17] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1006_c2_8a17_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1006_c2_8a17_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1006_c2_8a17_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1006_c2_8a17_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1006_c2_8a17_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1006_c2_8a17_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1006_c2_8a17_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1006_c2_8a17_return_output;

     -- n8_MUX[uxn_opcodes_h_l1006_c2_8a17] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1006_c2_8a17_cond <= VAR_n8_MUX_uxn_opcodes_h_l1006_c2_8a17_cond;
     n8_MUX_uxn_opcodes_h_l1006_c2_8a17_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1006_c2_8a17_iftrue;
     n8_MUX_uxn_opcodes_h_l1006_c2_8a17_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1006_c2_8a17_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1006_c2_8a17_return_output := n8_MUX_uxn_opcodes_h_l1006_c2_8a17_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1015_c7_50e6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1015_c7_50e6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1015_c7_50e6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1015_c7_50e6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1015_c7_50e6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1015_c7_50e6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1015_c7_50e6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1015_c7_50e6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1015_c7_50e6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1012_c7_3a01] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1012_c7_3a01_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1012_c7_3a01_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1012_c7_3a01_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1012_c7_3a01_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1012_c7_3a01_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1012_c7_3a01_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1012_c7_3a01_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1012_c7_3a01_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1015_c7_50e6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1015_c7_50e6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1015_c7_50e6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1015_c7_50e6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1015_c7_50e6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1015_c7_50e6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1015_c7_50e6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1015_c7_50e6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1015_c7_50e6_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1006_c2_8a17_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1012_c7_3a01_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1015_c7_50e6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c2_8a17_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1012_c7_3a01_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1012_c7_3a01_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1015_c7_50e6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1012_c7_3a01_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1015_c7_50e6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c2_8a17_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1012_c7_3a01_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1006_c2_8a17_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1012_c7_3a01_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1006_c2_8a17] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c2_8a17_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c2_8a17_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c2_8a17_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c2_8a17_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c2_8a17_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c2_8a17_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c2_8a17_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c2_8a17_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1012_c7_3a01] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1012_c7_3a01_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1012_c7_3a01_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1012_c7_3a01_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1012_c7_3a01_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1012_c7_3a01_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1012_c7_3a01_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1012_c7_3a01_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1012_c7_3a01_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1006_c2_8a17] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c2_8a17_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c2_8a17_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c2_8a17_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c2_8a17_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c2_8a17_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c2_8a17_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c2_8a17_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c2_8a17_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1006_c2_8a17] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1006_c2_8a17_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1006_c2_8a17_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1006_c2_8a17_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1006_c2_8a17_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1006_c2_8a17_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1006_c2_8a17_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1006_c2_8a17_return_output := result_stack_value_MUX_uxn_opcodes_h_l1006_c2_8a17_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1012_c7_3a01] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1012_c7_3a01_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1012_c7_3a01_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1012_c7_3a01_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1012_c7_3a01_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1012_c7_3a01_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1012_c7_3a01_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1012_c7_3a01_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1012_c7_3a01_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1012_c7_3a01] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1012_c7_3a01_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1012_c7_3a01_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1012_c7_3a01_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1012_c7_3a01_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1012_c7_3a01_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1012_c7_3a01_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1012_c7_3a01_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1012_c7_3a01_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1006_c2_8a17_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1012_c7_3a01_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1006_c2_8a17_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1012_c7_3a01_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c2_8a17_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1012_c7_3a01_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1006_c2_8a17] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1006_c2_8a17_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1006_c2_8a17_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1006_c2_8a17_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1006_c2_8a17_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1006_c2_8a17_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1006_c2_8a17_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1006_c2_8a17_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1006_c2_8a17_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1006_c2_8a17] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c2_8a17_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c2_8a17_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c2_8a17_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c2_8a17_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c2_8a17_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c2_8a17_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c2_8a17_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c2_8a17_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1006_c2_8a17] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1006_c2_8a17_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1006_c2_8a17_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1006_c2_8a17_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1006_c2_8a17_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1006_c2_8a17_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1006_c2_8a17_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1006_c2_8a17_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1006_c2_8a17_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l1039_l1002_DUPLICATE_e79d LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l1039_l1002_DUPLICATE_e79d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1006_c2_8a17_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c2_8a17_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1006_c2_8a17_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c2_8a17_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1006_c2_8a17_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1006_c2_8a17_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c2_8a17_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l1039_l1002_DUPLICATE_e79d_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l1039_l1002_DUPLICATE_e79d_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
