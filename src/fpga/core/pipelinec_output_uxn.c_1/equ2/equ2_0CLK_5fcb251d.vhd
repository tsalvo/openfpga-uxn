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
-- Submodules: 108
entity equ2_0CLK_5fcb251d is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end equ2_0CLK_5fcb251d;
architecture arch of equ2_0CLK_5fcb251d is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l950_c6_0d77]
signal BIN_OP_EQ_uxn_opcodes_h_l950_c6_0d77_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l950_c6_0d77_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l950_c6_0d77_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l950_c1_7850]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l950_c1_7850_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l950_c1_7850_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l950_c1_7850_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l950_c1_7850_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l950_c2_7edb]
signal n16_MUX_uxn_opcodes_h_l950_c2_7edb_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l950_c2_7edb_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l950_c2_7edb_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l950_c2_7edb_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l950_c2_7edb]
signal t16_MUX_uxn_opcodes_h_l950_c2_7edb_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l950_c2_7edb_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l950_c2_7edb_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l950_c2_7edb_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l950_c2_7edb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l950_c2_7edb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l950_c2_7edb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l950_c2_7edb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l950_c2_7edb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l950_c2_7edb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l950_c2_7edb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l950_c2_7edb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l950_c2_7edb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l950_c2_7edb_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l950_c2_7edb]
signal result_stack_value_MUX_uxn_opcodes_h_l950_c2_7edb_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l950_c2_7edb_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l950_c2_7edb_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l950_c2_7edb_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l950_c2_7edb]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l950_c2_7edb_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l950_c2_7edb_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l950_c2_7edb_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l950_c2_7edb_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l950_c2_7edb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c2_7edb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c2_7edb_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c2_7edb_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c2_7edb_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l950_c2_7edb]
signal result_is_stack_read_MUX_uxn_opcodes_h_l950_c2_7edb_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l950_c2_7edb_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l950_c2_7edb_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l950_c2_7edb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l950_c2_7edb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c2_7edb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c2_7edb_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c2_7edb_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c2_7edb_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l950_c2_7edb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l950_c2_7edb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l950_c2_7edb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l950_c2_7edb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l950_c2_7edb_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l951_c3_d13e[uxn_opcodes_h_l951_c3_d13e]
signal printf_uxn_opcodes_h_l951_c3_d13e_uxn_opcodes_h_l951_c3_d13e_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l958_c11_c75e]
signal BIN_OP_EQ_uxn_opcodes_h_l958_c11_c75e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l958_c11_c75e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l958_c11_c75e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l958_c7_4077]
signal n16_MUX_uxn_opcodes_h_l958_c7_4077_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l958_c7_4077_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l958_c7_4077_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l958_c7_4077_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l958_c7_4077]
signal t16_MUX_uxn_opcodes_h_l958_c7_4077_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l958_c7_4077_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l958_c7_4077_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l958_c7_4077_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l958_c7_4077]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c7_4077_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c7_4077_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c7_4077_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c7_4077_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l958_c7_4077]
signal result_is_opc_done_MUX_uxn_opcodes_h_l958_c7_4077_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l958_c7_4077_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l958_c7_4077_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l958_c7_4077_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l958_c7_4077]
signal result_is_stack_write_MUX_uxn_opcodes_h_l958_c7_4077_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l958_c7_4077_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l958_c7_4077_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l958_c7_4077_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l958_c7_4077]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l958_c7_4077_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l958_c7_4077_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l958_c7_4077_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l958_c7_4077_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l958_c7_4077]
signal result_stack_value_MUX_uxn_opcodes_h_l958_c7_4077_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l958_c7_4077_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l958_c7_4077_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l958_c7_4077_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l958_c7_4077]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c7_4077_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c7_4077_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c7_4077_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c7_4077_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l958_c7_4077]
signal result_is_stack_read_MUX_uxn_opcodes_h_l958_c7_4077_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l958_c7_4077_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l958_c7_4077_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l958_c7_4077_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l962_c11_dccd]
signal BIN_OP_EQ_uxn_opcodes_h_l962_c11_dccd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l962_c11_dccd_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l962_c11_dccd_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l962_c7_2eb7]
signal n16_MUX_uxn_opcodes_h_l962_c7_2eb7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l962_c7_2eb7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l962_c7_2eb7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l962_c7_2eb7_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l962_c7_2eb7]
signal t16_MUX_uxn_opcodes_h_l962_c7_2eb7_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l962_c7_2eb7_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l962_c7_2eb7_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l962_c7_2eb7_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l962_c7_2eb7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_2eb7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_2eb7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_2eb7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_2eb7_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l962_c7_2eb7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_2eb7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_2eb7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_2eb7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_2eb7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l962_c7_2eb7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_2eb7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_2eb7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_2eb7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_2eb7_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l962_c7_2eb7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_2eb7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_2eb7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_2eb7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_2eb7_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l962_c7_2eb7]
signal result_stack_value_MUX_uxn_opcodes_h_l962_c7_2eb7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l962_c7_2eb7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l962_c7_2eb7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l962_c7_2eb7_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l962_c7_2eb7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_2eb7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_2eb7_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_2eb7_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_2eb7_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l962_c7_2eb7]
signal result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_2eb7_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_2eb7_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_2eb7_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_2eb7_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l968_c11_5255]
signal BIN_OP_EQ_uxn_opcodes_h_l968_c11_5255_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l968_c11_5255_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l968_c11_5255_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l968_c7_52be]
signal n16_MUX_uxn_opcodes_h_l968_c7_52be_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l968_c7_52be_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l968_c7_52be_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l968_c7_52be_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l968_c7_52be]
signal t16_MUX_uxn_opcodes_h_l968_c7_52be_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l968_c7_52be_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l968_c7_52be_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l968_c7_52be_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l968_c7_52be]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_52be_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_52be_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_52be_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_52be_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l968_c7_52be]
signal result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_52be_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_52be_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_52be_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_52be_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l968_c7_52be]
signal result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_52be_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_52be_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_52be_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_52be_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l968_c7_52be]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l968_c7_52be_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l968_c7_52be_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l968_c7_52be_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l968_c7_52be_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l968_c7_52be]
signal result_stack_value_MUX_uxn_opcodes_h_l968_c7_52be_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l968_c7_52be_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l968_c7_52be_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l968_c7_52be_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l968_c7_52be]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_52be_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_52be_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_52be_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_52be_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l968_c7_52be]
signal result_is_stack_read_MUX_uxn_opcodes_h_l968_c7_52be_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l968_c7_52be_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l968_c7_52be_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l968_c7_52be_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l972_c11_c7ce]
signal BIN_OP_EQ_uxn_opcodes_h_l972_c11_c7ce_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l972_c11_c7ce_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l972_c11_c7ce_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l972_c7_799a]
signal n16_MUX_uxn_opcodes_h_l972_c7_799a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l972_c7_799a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l972_c7_799a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l972_c7_799a_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l972_c7_799a]
signal t16_MUX_uxn_opcodes_h_l972_c7_799a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l972_c7_799a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l972_c7_799a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l972_c7_799a_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l972_c7_799a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_799a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_799a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_799a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_799a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l972_c7_799a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_799a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_799a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_799a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_799a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l972_c7_799a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_799a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_799a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_799a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_799a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l972_c7_799a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_799a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_799a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_799a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_799a_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l972_c7_799a]
signal result_stack_value_MUX_uxn_opcodes_h_l972_c7_799a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l972_c7_799a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l972_c7_799a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l972_c7_799a_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l972_c7_799a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_799a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_799a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_799a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_799a_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l972_c7_799a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l972_c7_799a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l972_c7_799a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l972_c7_799a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l972_c7_799a_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l973_c3_cfd2]
signal BIN_OP_OR_uxn_opcodes_h_l973_c3_cfd2_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l973_c3_cfd2_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l973_c3_cfd2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l977_c11_b263]
signal BIN_OP_EQ_uxn_opcodes_h_l977_c11_b263_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l977_c11_b263_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l977_c11_b263_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l977_c7_a917]
signal n16_MUX_uxn_opcodes_h_l977_c7_a917_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l977_c7_a917_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l977_c7_a917_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l977_c7_a917_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l977_c7_a917]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_a917_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_a917_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_a917_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_a917_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l977_c7_a917]
signal result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_a917_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_a917_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_a917_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_a917_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l977_c7_a917]
signal result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_a917_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_a917_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_a917_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_a917_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l977_c7_a917]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_a917_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_a917_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_a917_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_a917_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l977_c7_a917]
signal result_stack_value_MUX_uxn_opcodes_h_l977_c7_a917_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l977_c7_a917_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l977_c7_a917_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l977_c7_a917_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l977_c7_a917]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_a917_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_a917_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_a917_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_a917_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l977_c7_a917]
signal result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_a917_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_a917_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_a917_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_a917_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l981_c11_bd65]
signal BIN_OP_EQ_uxn_opcodes_h_l981_c11_bd65_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l981_c11_bd65_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l981_c11_bd65_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l981_c7_a900]
signal n16_MUX_uxn_opcodes_h_l981_c7_a900_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l981_c7_a900_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l981_c7_a900_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l981_c7_a900_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l981_c7_a900]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_a900_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_a900_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_a900_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_a900_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l981_c7_a900]
signal result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_a900_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_a900_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_a900_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_a900_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l981_c7_a900]
signal result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_a900_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_a900_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_a900_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_a900_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l981_c7_a900]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l981_c7_a900_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l981_c7_a900_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l981_c7_a900_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l981_c7_a900_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l981_c7_a900]
signal result_stack_value_MUX_uxn_opcodes_h_l981_c7_a900_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l981_c7_a900_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l981_c7_a900_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l981_c7_a900_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l981_c7_a900]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_a900_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_a900_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_a900_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_a900_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l981_c7_a900]
signal result_is_stack_read_MUX_uxn_opcodes_h_l981_c7_a900_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l981_c7_a900_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l981_c7_a900_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l981_c7_a900_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l987_c11_e9d2]
signal BIN_OP_EQ_uxn_opcodes_h_l987_c11_e9d2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l987_c11_e9d2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l987_c11_e9d2_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l987_c7_0128]
signal n16_MUX_uxn_opcodes_h_l987_c7_0128_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l987_c7_0128_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l987_c7_0128_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l987_c7_0128_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l987_c7_0128]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_0128_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_0128_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_0128_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_0128_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l987_c7_0128]
signal result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_0128_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_0128_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_0128_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_0128_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l987_c7_0128]
signal result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_0128_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_0128_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_0128_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_0128_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l987_c7_0128]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_0128_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_0128_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_0128_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_0128_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l987_c7_0128]
signal result_stack_value_MUX_uxn_opcodes_h_l987_c7_0128_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l987_c7_0128_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l987_c7_0128_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l987_c7_0128_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l987_c7_0128]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_0128_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_0128_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_0128_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_0128_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l987_c7_0128]
signal result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_0128_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_0128_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_0128_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_0128_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l991_c11_2ef5]
signal BIN_OP_EQ_uxn_opcodes_h_l991_c11_2ef5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l991_c11_2ef5_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l991_c11_2ef5_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l991_c7_b56a]
signal n16_MUX_uxn_opcodes_h_l991_c7_b56a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l991_c7_b56a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l991_c7_b56a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l991_c7_b56a_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l991_c7_b56a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_b56a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_b56a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_b56a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_b56a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l991_c7_b56a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_b56a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_b56a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_b56a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_b56a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l991_c7_b56a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_b56a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_b56a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_b56a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_b56a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l991_c7_b56a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_b56a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_b56a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_b56a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_b56a_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l991_c7_b56a]
signal result_stack_value_MUX_uxn_opcodes_h_l991_c7_b56a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l991_c7_b56a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l991_c7_b56a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l991_c7_b56a_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l991_c7_b56a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_b56a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_b56a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_b56a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_b56a_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l991_c7_b56a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_b56a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_b56a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_b56a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_b56a_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l992_c3_9d74]
signal BIN_OP_OR_uxn_opcodes_h_l992_c3_9d74_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l992_c3_9d74_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l992_c3_9d74_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l995_c32_6b96]
signal BIN_OP_AND_uxn_opcodes_h_l995_c32_6b96_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l995_c32_6b96_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l995_c32_6b96_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l995_c32_5f19]
signal BIN_OP_GT_uxn_opcodes_h_l995_c32_5f19_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l995_c32_5f19_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l995_c32_5f19_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l995_c32_40ce]
signal MUX_uxn_opcodes_h_l995_c32_40ce_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l995_c32_40ce_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l995_c32_40ce_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l995_c32_40ce_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l997_c11_ed74]
signal BIN_OP_EQ_uxn_opcodes_h_l997_c11_ed74_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l997_c11_ed74_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l997_c11_ed74_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l997_c7_e1b1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_e1b1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_e1b1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_e1b1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_e1b1_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l997_c7_e1b1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_e1b1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_e1b1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_e1b1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_e1b1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l997_c7_e1b1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_e1b1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_e1b1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_e1b1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_e1b1_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l997_c7_e1b1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_e1b1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_e1b1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_e1b1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_e1b1_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l997_c7_e1b1]
signal result_stack_value_MUX_uxn_opcodes_h_l997_c7_e1b1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l997_c7_e1b1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l997_c7_e1b1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l997_c7_e1b1_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1001_c24_f1e7]
signal BIN_OP_EQ_uxn_opcodes_h_l1001_c24_f1e7_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1001_c24_f1e7_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1001_c24_f1e7_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1001_c24_253f]
signal MUX_uxn_opcodes_h_l1001_c24_253f_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1001_c24_253f_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1001_c24_253f_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1001_c24_253f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1003_c11_c058]
signal BIN_OP_EQ_uxn_opcodes_h_l1003_c11_c058_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1003_c11_c058_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1003_c11_c058_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1003_c7_63c9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_63c9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_63c9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_63c9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_63c9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1003_c7_63c9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_63c9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_63c9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_63c9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_63c9_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l964_DUPLICATE_d534
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l964_DUPLICATE_d534_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l964_DUPLICATE_d534_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_49dd( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_opc_done := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.stack_value := ref_toks_3;
      base.is_stack_index_flipped := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_stack_read := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;
      base.is_sp_shift := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l950_c6_0d77
BIN_OP_EQ_uxn_opcodes_h_l950_c6_0d77 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l950_c6_0d77_left,
BIN_OP_EQ_uxn_opcodes_h_l950_c6_0d77_right,
BIN_OP_EQ_uxn_opcodes_h_l950_c6_0d77_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l950_c1_7850
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l950_c1_7850 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l950_c1_7850_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l950_c1_7850_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l950_c1_7850_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l950_c1_7850_return_output);

-- n16_MUX_uxn_opcodes_h_l950_c2_7edb
n16_MUX_uxn_opcodes_h_l950_c2_7edb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l950_c2_7edb_cond,
n16_MUX_uxn_opcodes_h_l950_c2_7edb_iftrue,
n16_MUX_uxn_opcodes_h_l950_c2_7edb_iffalse,
n16_MUX_uxn_opcodes_h_l950_c2_7edb_return_output);

-- t16_MUX_uxn_opcodes_h_l950_c2_7edb
t16_MUX_uxn_opcodes_h_l950_c2_7edb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l950_c2_7edb_cond,
t16_MUX_uxn_opcodes_h_l950_c2_7edb_iftrue,
t16_MUX_uxn_opcodes_h_l950_c2_7edb_iffalse,
t16_MUX_uxn_opcodes_h_l950_c2_7edb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l950_c2_7edb
result_is_opc_done_MUX_uxn_opcodes_h_l950_c2_7edb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l950_c2_7edb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l950_c2_7edb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l950_c2_7edb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l950_c2_7edb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l950_c2_7edb
result_is_stack_write_MUX_uxn_opcodes_h_l950_c2_7edb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l950_c2_7edb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l950_c2_7edb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l950_c2_7edb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l950_c2_7edb_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l950_c2_7edb
result_stack_value_MUX_uxn_opcodes_h_l950_c2_7edb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l950_c2_7edb_cond,
result_stack_value_MUX_uxn_opcodes_h_l950_c2_7edb_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l950_c2_7edb_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l950_c2_7edb_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l950_c2_7edb
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l950_c2_7edb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l950_c2_7edb_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l950_c2_7edb_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l950_c2_7edb_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l950_c2_7edb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c2_7edb
result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c2_7edb : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c2_7edb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c2_7edb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c2_7edb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c2_7edb_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l950_c2_7edb
result_is_stack_read_MUX_uxn_opcodes_h_l950_c2_7edb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l950_c2_7edb_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l950_c2_7edb_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l950_c2_7edb_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l950_c2_7edb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c2_7edb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c2_7edb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c2_7edb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c2_7edb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c2_7edb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c2_7edb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l950_c2_7edb
result_is_sp_shift_MUX_uxn_opcodes_h_l950_c2_7edb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l950_c2_7edb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l950_c2_7edb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l950_c2_7edb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l950_c2_7edb_return_output);

-- printf_uxn_opcodes_h_l951_c3_d13e_uxn_opcodes_h_l951_c3_d13e
printf_uxn_opcodes_h_l951_c3_d13e_uxn_opcodes_h_l951_c3_d13e : entity work.printf_uxn_opcodes_h_l951_c3_d13e_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l951_c3_d13e_uxn_opcodes_h_l951_c3_d13e_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l958_c11_c75e
BIN_OP_EQ_uxn_opcodes_h_l958_c11_c75e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l958_c11_c75e_left,
BIN_OP_EQ_uxn_opcodes_h_l958_c11_c75e_right,
BIN_OP_EQ_uxn_opcodes_h_l958_c11_c75e_return_output);

-- n16_MUX_uxn_opcodes_h_l958_c7_4077
n16_MUX_uxn_opcodes_h_l958_c7_4077 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l958_c7_4077_cond,
n16_MUX_uxn_opcodes_h_l958_c7_4077_iftrue,
n16_MUX_uxn_opcodes_h_l958_c7_4077_iffalse,
n16_MUX_uxn_opcodes_h_l958_c7_4077_return_output);

-- t16_MUX_uxn_opcodes_h_l958_c7_4077
t16_MUX_uxn_opcodes_h_l958_c7_4077 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l958_c7_4077_cond,
t16_MUX_uxn_opcodes_h_l958_c7_4077_iftrue,
t16_MUX_uxn_opcodes_h_l958_c7_4077_iffalse,
t16_MUX_uxn_opcodes_h_l958_c7_4077_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c7_4077
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c7_4077 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c7_4077_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c7_4077_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c7_4077_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c7_4077_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l958_c7_4077
result_is_opc_done_MUX_uxn_opcodes_h_l958_c7_4077 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l958_c7_4077_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l958_c7_4077_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l958_c7_4077_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l958_c7_4077_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l958_c7_4077
result_is_stack_write_MUX_uxn_opcodes_h_l958_c7_4077 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l958_c7_4077_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l958_c7_4077_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l958_c7_4077_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l958_c7_4077_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l958_c7_4077
result_is_sp_shift_MUX_uxn_opcodes_h_l958_c7_4077 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l958_c7_4077_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l958_c7_4077_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l958_c7_4077_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l958_c7_4077_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l958_c7_4077
result_stack_value_MUX_uxn_opcodes_h_l958_c7_4077 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l958_c7_4077_cond,
result_stack_value_MUX_uxn_opcodes_h_l958_c7_4077_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l958_c7_4077_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l958_c7_4077_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c7_4077
result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c7_4077 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c7_4077_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c7_4077_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c7_4077_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c7_4077_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l958_c7_4077
result_is_stack_read_MUX_uxn_opcodes_h_l958_c7_4077 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l958_c7_4077_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l958_c7_4077_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l958_c7_4077_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l958_c7_4077_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l962_c11_dccd
BIN_OP_EQ_uxn_opcodes_h_l962_c11_dccd : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l962_c11_dccd_left,
BIN_OP_EQ_uxn_opcodes_h_l962_c11_dccd_right,
BIN_OP_EQ_uxn_opcodes_h_l962_c11_dccd_return_output);

-- n16_MUX_uxn_opcodes_h_l962_c7_2eb7
n16_MUX_uxn_opcodes_h_l962_c7_2eb7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l962_c7_2eb7_cond,
n16_MUX_uxn_opcodes_h_l962_c7_2eb7_iftrue,
n16_MUX_uxn_opcodes_h_l962_c7_2eb7_iffalse,
n16_MUX_uxn_opcodes_h_l962_c7_2eb7_return_output);

-- t16_MUX_uxn_opcodes_h_l962_c7_2eb7
t16_MUX_uxn_opcodes_h_l962_c7_2eb7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l962_c7_2eb7_cond,
t16_MUX_uxn_opcodes_h_l962_c7_2eb7_iftrue,
t16_MUX_uxn_opcodes_h_l962_c7_2eb7_iffalse,
t16_MUX_uxn_opcodes_h_l962_c7_2eb7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_2eb7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_2eb7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_2eb7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_2eb7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_2eb7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_2eb7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_2eb7
result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_2eb7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_2eb7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_2eb7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_2eb7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_2eb7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_2eb7
result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_2eb7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_2eb7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_2eb7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_2eb7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_2eb7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_2eb7
result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_2eb7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_2eb7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_2eb7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_2eb7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_2eb7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l962_c7_2eb7
result_stack_value_MUX_uxn_opcodes_h_l962_c7_2eb7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l962_c7_2eb7_cond,
result_stack_value_MUX_uxn_opcodes_h_l962_c7_2eb7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l962_c7_2eb7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l962_c7_2eb7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_2eb7
result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_2eb7 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_2eb7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_2eb7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_2eb7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_2eb7_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_2eb7
result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_2eb7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_2eb7_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_2eb7_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_2eb7_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_2eb7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l968_c11_5255
BIN_OP_EQ_uxn_opcodes_h_l968_c11_5255 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l968_c11_5255_left,
BIN_OP_EQ_uxn_opcodes_h_l968_c11_5255_right,
BIN_OP_EQ_uxn_opcodes_h_l968_c11_5255_return_output);

-- n16_MUX_uxn_opcodes_h_l968_c7_52be
n16_MUX_uxn_opcodes_h_l968_c7_52be : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l968_c7_52be_cond,
n16_MUX_uxn_opcodes_h_l968_c7_52be_iftrue,
n16_MUX_uxn_opcodes_h_l968_c7_52be_iffalse,
n16_MUX_uxn_opcodes_h_l968_c7_52be_return_output);

-- t16_MUX_uxn_opcodes_h_l968_c7_52be
t16_MUX_uxn_opcodes_h_l968_c7_52be : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l968_c7_52be_cond,
t16_MUX_uxn_opcodes_h_l968_c7_52be_iftrue,
t16_MUX_uxn_opcodes_h_l968_c7_52be_iffalse,
t16_MUX_uxn_opcodes_h_l968_c7_52be_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_52be
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_52be : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_52be_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_52be_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_52be_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_52be_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_52be
result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_52be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_52be_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_52be_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_52be_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_52be_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_52be
result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_52be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_52be_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_52be_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_52be_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_52be_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l968_c7_52be
result_is_sp_shift_MUX_uxn_opcodes_h_l968_c7_52be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l968_c7_52be_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l968_c7_52be_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l968_c7_52be_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l968_c7_52be_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l968_c7_52be
result_stack_value_MUX_uxn_opcodes_h_l968_c7_52be : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l968_c7_52be_cond,
result_stack_value_MUX_uxn_opcodes_h_l968_c7_52be_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l968_c7_52be_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l968_c7_52be_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_52be
result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_52be : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_52be_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_52be_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_52be_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_52be_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l968_c7_52be
result_is_stack_read_MUX_uxn_opcodes_h_l968_c7_52be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l968_c7_52be_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l968_c7_52be_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l968_c7_52be_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l968_c7_52be_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l972_c11_c7ce
BIN_OP_EQ_uxn_opcodes_h_l972_c11_c7ce : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l972_c11_c7ce_left,
BIN_OP_EQ_uxn_opcodes_h_l972_c11_c7ce_right,
BIN_OP_EQ_uxn_opcodes_h_l972_c11_c7ce_return_output);

-- n16_MUX_uxn_opcodes_h_l972_c7_799a
n16_MUX_uxn_opcodes_h_l972_c7_799a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l972_c7_799a_cond,
n16_MUX_uxn_opcodes_h_l972_c7_799a_iftrue,
n16_MUX_uxn_opcodes_h_l972_c7_799a_iffalse,
n16_MUX_uxn_opcodes_h_l972_c7_799a_return_output);

-- t16_MUX_uxn_opcodes_h_l972_c7_799a
t16_MUX_uxn_opcodes_h_l972_c7_799a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l972_c7_799a_cond,
t16_MUX_uxn_opcodes_h_l972_c7_799a_iftrue,
t16_MUX_uxn_opcodes_h_l972_c7_799a_iffalse,
t16_MUX_uxn_opcodes_h_l972_c7_799a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_799a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_799a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_799a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_799a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_799a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_799a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_799a
result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_799a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_799a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_799a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_799a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_799a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_799a
result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_799a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_799a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_799a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_799a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_799a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_799a
result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_799a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_799a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_799a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_799a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_799a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l972_c7_799a
result_stack_value_MUX_uxn_opcodes_h_l972_c7_799a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l972_c7_799a_cond,
result_stack_value_MUX_uxn_opcodes_h_l972_c7_799a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l972_c7_799a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l972_c7_799a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_799a
result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_799a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_799a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_799a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_799a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_799a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l972_c7_799a
result_is_stack_read_MUX_uxn_opcodes_h_l972_c7_799a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l972_c7_799a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l972_c7_799a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l972_c7_799a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l972_c7_799a_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l973_c3_cfd2
BIN_OP_OR_uxn_opcodes_h_l973_c3_cfd2 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l973_c3_cfd2_left,
BIN_OP_OR_uxn_opcodes_h_l973_c3_cfd2_right,
BIN_OP_OR_uxn_opcodes_h_l973_c3_cfd2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l977_c11_b263
BIN_OP_EQ_uxn_opcodes_h_l977_c11_b263 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l977_c11_b263_left,
BIN_OP_EQ_uxn_opcodes_h_l977_c11_b263_right,
BIN_OP_EQ_uxn_opcodes_h_l977_c11_b263_return_output);

-- n16_MUX_uxn_opcodes_h_l977_c7_a917
n16_MUX_uxn_opcodes_h_l977_c7_a917 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l977_c7_a917_cond,
n16_MUX_uxn_opcodes_h_l977_c7_a917_iftrue,
n16_MUX_uxn_opcodes_h_l977_c7_a917_iffalse,
n16_MUX_uxn_opcodes_h_l977_c7_a917_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_a917
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_a917 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_a917_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_a917_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_a917_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_a917_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_a917
result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_a917 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_a917_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_a917_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_a917_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_a917_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_a917
result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_a917 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_a917_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_a917_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_a917_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_a917_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_a917
result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_a917 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_a917_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_a917_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_a917_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_a917_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l977_c7_a917
result_stack_value_MUX_uxn_opcodes_h_l977_c7_a917 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l977_c7_a917_cond,
result_stack_value_MUX_uxn_opcodes_h_l977_c7_a917_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l977_c7_a917_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l977_c7_a917_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_a917
result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_a917 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_a917_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_a917_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_a917_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_a917_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_a917
result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_a917 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_a917_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_a917_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_a917_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_a917_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l981_c11_bd65
BIN_OP_EQ_uxn_opcodes_h_l981_c11_bd65 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l981_c11_bd65_left,
BIN_OP_EQ_uxn_opcodes_h_l981_c11_bd65_right,
BIN_OP_EQ_uxn_opcodes_h_l981_c11_bd65_return_output);

-- n16_MUX_uxn_opcodes_h_l981_c7_a900
n16_MUX_uxn_opcodes_h_l981_c7_a900 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l981_c7_a900_cond,
n16_MUX_uxn_opcodes_h_l981_c7_a900_iftrue,
n16_MUX_uxn_opcodes_h_l981_c7_a900_iffalse,
n16_MUX_uxn_opcodes_h_l981_c7_a900_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_a900
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_a900 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_a900_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_a900_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_a900_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_a900_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_a900
result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_a900 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_a900_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_a900_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_a900_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_a900_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_a900
result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_a900 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_a900_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_a900_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_a900_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_a900_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l981_c7_a900
result_is_sp_shift_MUX_uxn_opcodes_h_l981_c7_a900 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l981_c7_a900_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l981_c7_a900_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l981_c7_a900_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l981_c7_a900_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l981_c7_a900
result_stack_value_MUX_uxn_opcodes_h_l981_c7_a900 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l981_c7_a900_cond,
result_stack_value_MUX_uxn_opcodes_h_l981_c7_a900_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l981_c7_a900_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l981_c7_a900_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_a900
result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_a900 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_a900_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_a900_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_a900_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_a900_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l981_c7_a900
result_is_stack_read_MUX_uxn_opcodes_h_l981_c7_a900 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l981_c7_a900_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l981_c7_a900_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l981_c7_a900_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l981_c7_a900_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l987_c11_e9d2
BIN_OP_EQ_uxn_opcodes_h_l987_c11_e9d2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l987_c11_e9d2_left,
BIN_OP_EQ_uxn_opcodes_h_l987_c11_e9d2_right,
BIN_OP_EQ_uxn_opcodes_h_l987_c11_e9d2_return_output);

-- n16_MUX_uxn_opcodes_h_l987_c7_0128
n16_MUX_uxn_opcodes_h_l987_c7_0128 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l987_c7_0128_cond,
n16_MUX_uxn_opcodes_h_l987_c7_0128_iftrue,
n16_MUX_uxn_opcodes_h_l987_c7_0128_iffalse,
n16_MUX_uxn_opcodes_h_l987_c7_0128_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_0128
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_0128 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_0128_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_0128_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_0128_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_0128_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_0128
result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_0128 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_0128_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_0128_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_0128_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_0128_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_0128
result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_0128 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_0128_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_0128_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_0128_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_0128_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_0128
result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_0128 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_0128_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_0128_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_0128_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_0128_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l987_c7_0128
result_stack_value_MUX_uxn_opcodes_h_l987_c7_0128 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l987_c7_0128_cond,
result_stack_value_MUX_uxn_opcodes_h_l987_c7_0128_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l987_c7_0128_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l987_c7_0128_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_0128
result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_0128 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_0128_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_0128_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_0128_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_0128_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_0128
result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_0128 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_0128_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_0128_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_0128_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_0128_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l991_c11_2ef5
BIN_OP_EQ_uxn_opcodes_h_l991_c11_2ef5 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l991_c11_2ef5_left,
BIN_OP_EQ_uxn_opcodes_h_l991_c11_2ef5_right,
BIN_OP_EQ_uxn_opcodes_h_l991_c11_2ef5_return_output);

-- n16_MUX_uxn_opcodes_h_l991_c7_b56a
n16_MUX_uxn_opcodes_h_l991_c7_b56a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l991_c7_b56a_cond,
n16_MUX_uxn_opcodes_h_l991_c7_b56a_iftrue,
n16_MUX_uxn_opcodes_h_l991_c7_b56a_iffalse,
n16_MUX_uxn_opcodes_h_l991_c7_b56a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_b56a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_b56a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_b56a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_b56a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_b56a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_b56a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_b56a
result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_b56a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_b56a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_b56a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_b56a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_b56a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_b56a
result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_b56a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_b56a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_b56a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_b56a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_b56a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_b56a
result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_b56a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_b56a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_b56a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_b56a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_b56a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l991_c7_b56a
result_stack_value_MUX_uxn_opcodes_h_l991_c7_b56a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l991_c7_b56a_cond,
result_stack_value_MUX_uxn_opcodes_h_l991_c7_b56a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l991_c7_b56a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l991_c7_b56a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_b56a
result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_b56a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_b56a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_b56a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_b56a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_b56a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_b56a
result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_b56a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_b56a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_b56a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_b56a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_b56a_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l992_c3_9d74
BIN_OP_OR_uxn_opcodes_h_l992_c3_9d74 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l992_c3_9d74_left,
BIN_OP_OR_uxn_opcodes_h_l992_c3_9d74_right,
BIN_OP_OR_uxn_opcodes_h_l992_c3_9d74_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l995_c32_6b96
BIN_OP_AND_uxn_opcodes_h_l995_c32_6b96 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l995_c32_6b96_left,
BIN_OP_AND_uxn_opcodes_h_l995_c32_6b96_right,
BIN_OP_AND_uxn_opcodes_h_l995_c32_6b96_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l995_c32_5f19
BIN_OP_GT_uxn_opcodes_h_l995_c32_5f19 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l995_c32_5f19_left,
BIN_OP_GT_uxn_opcodes_h_l995_c32_5f19_right,
BIN_OP_GT_uxn_opcodes_h_l995_c32_5f19_return_output);

-- MUX_uxn_opcodes_h_l995_c32_40ce
MUX_uxn_opcodes_h_l995_c32_40ce : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l995_c32_40ce_cond,
MUX_uxn_opcodes_h_l995_c32_40ce_iftrue,
MUX_uxn_opcodes_h_l995_c32_40ce_iffalse,
MUX_uxn_opcodes_h_l995_c32_40ce_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l997_c11_ed74
BIN_OP_EQ_uxn_opcodes_h_l997_c11_ed74 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l997_c11_ed74_left,
BIN_OP_EQ_uxn_opcodes_h_l997_c11_ed74_right,
BIN_OP_EQ_uxn_opcodes_h_l997_c11_ed74_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_e1b1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_e1b1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_e1b1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_e1b1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_e1b1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_e1b1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_e1b1
result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_e1b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_e1b1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_e1b1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_e1b1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_e1b1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_e1b1
result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_e1b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_e1b1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_e1b1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_e1b1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_e1b1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_e1b1
result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_e1b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_e1b1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_e1b1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_e1b1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_e1b1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l997_c7_e1b1
result_stack_value_MUX_uxn_opcodes_h_l997_c7_e1b1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l997_c7_e1b1_cond,
result_stack_value_MUX_uxn_opcodes_h_l997_c7_e1b1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l997_c7_e1b1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l997_c7_e1b1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1001_c24_f1e7
BIN_OP_EQ_uxn_opcodes_h_l1001_c24_f1e7 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1001_c24_f1e7_left,
BIN_OP_EQ_uxn_opcodes_h_l1001_c24_f1e7_right,
BIN_OP_EQ_uxn_opcodes_h_l1001_c24_f1e7_return_output);

-- MUX_uxn_opcodes_h_l1001_c24_253f
MUX_uxn_opcodes_h_l1001_c24_253f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1001_c24_253f_cond,
MUX_uxn_opcodes_h_l1001_c24_253f_iftrue,
MUX_uxn_opcodes_h_l1001_c24_253f_iffalse,
MUX_uxn_opcodes_h_l1001_c24_253f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1003_c11_c058
BIN_OP_EQ_uxn_opcodes_h_l1003_c11_c058 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1003_c11_c058_left,
BIN_OP_EQ_uxn_opcodes_h_l1003_c11_c058_right,
BIN_OP_EQ_uxn_opcodes_h_l1003_c11_c058_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_63c9
result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_63c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_63c9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_63c9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_63c9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_63c9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_63c9
result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_63c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_63c9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_63c9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_63c9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_63c9_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l964_DUPLICATE_d534
CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l964_DUPLICATE_d534 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l964_DUPLICATE_d534_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l964_DUPLICATE_d534_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 t16,
 n16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l950_c6_0d77_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l950_c1_7850_return_output,
 n16_MUX_uxn_opcodes_h_l950_c2_7edb_return_output,
 t16_MUX_uxn_opcodes_h_l950_c2_7edb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l950_c2_7edb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l950_c2_7edb_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l950_c2_7edb_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l950_c2_7edb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c2_7edb_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l950_c2_7edb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c2_7edb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l950_c2_7edb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l958_c11_c75e_return_output,
 n16_MUX_uxn_opcodes_h_l958_c7_4077_return_output,
 t16_MUX_uxn_opcodes_h_l958_c7_4077_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c7_4077_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l958_c7_4077_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l958_c7_4077_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l958_c7_4077_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l958_c7_4077_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c7_4077_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l958_c7_4077_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l962_c11_dccd_return_output,
 n16_MUX_uxn_opcodes_h_l962_c7_2eb7_return_output,
 t16_MUX_uxn_opcodes_h_l962_c7_2eb7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_2eb7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_2eb7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_2eb7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_2eb7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l962_c7_2eb7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_2eb7_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_2eb7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l968_c11_5255_return_output,
 n16_MUX_uxn_opcodes_h_l968_c7_52be_return_output,
 t16_MUX_uxn_opcodes_h_l968_c7_52be_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_52be_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_52be_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_52be_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l968_c7_52be_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l968_c7_52be_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_52be_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l968_c7_52be_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l972_c11_c7ce_return_output,
 n16_MUX_uxn_opcodes_h_l972_c7_799a_return_output,
 t16_MUX_uxn_opcodes_h_l972_c7_799a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_799a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_799a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_799a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_799a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l972_c7_799a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_799a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l972_c7_799a_return_output,
 BIN_OP_OR_uxn_opcodes_h_l973_c3_cfd2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l977_c11_b263_return_output,
 n16_MUX_uxn_opcodes_h_l977_c7_a917_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_a917_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_a917_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_a917_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_a917_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l977_c7_a917_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_a917_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_a917_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l981_c11_bd65_return_output,
 n16_MUX_uxn_opcodes_h_l981_c7_a900_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_a900_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_a900_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_a900_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l981_c7_a900_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l981_c7_a900_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_a900_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l981_c7_a900_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l987_c11_e9d2_return_output,
 n16_MUX_uxn_opcodes_h_l987_c7_0128_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_0128_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_0128_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_0128_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_0128_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l987_c7_0128_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_0128_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_0128_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l991_c11_2ef5_return_output,
 n16_MUX_uxn_opcodes_h_l991_c7_b56a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_b56a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_b56a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_b56a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_b56a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l991_c7_b56a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_b56a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_b56a_return_output,
 BIN_OP_OR_uxn_opcodes_h_l992_c3_9d74_return_output,
 BIN_OP_AND_uxn_opcodes_h_l995_c32_6b96_return_output,
 BIN_OP_GT_uxn_opcodes_h_l995_c32_5f19_return_output,
 MUX_uxn_opcodes_h_l995_c32_40ce_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l997_c11_ed74_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_e1b1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_e1b1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_e1b1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_e1b1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l997_c7_e1b1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1001_c24_f1e7_return_output,
 MUX_uxn_opcodes_h_l1001_c24_253f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1003_c11_c058_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_63c9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_63c9_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l964_DUPLICATE_d534_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c6_0d77_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c6_0d77_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c6_0d77_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l950_c1_7850_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l950_c1_7850_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l950_c1_7850_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l950_c1_7850_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l950_c2_7edb_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l950_c2_7edb_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l958_c7_4077_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l950_c2_7edb_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l950_c2_7edb_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l950_c2_7edb_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l950_c2_7edb_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l958_c7_4077_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l950_c2_7edb_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l950_c2_7edb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c2_7edb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c2_7edb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l958_c7_4077_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c2_7edb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c2_7edb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c2_7edb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c2_7edb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l958_c7_4077_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c2_7edb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c2_7edb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l950_c2_7edb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l950_c2_7edb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l958_c7_4077_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l950_c2_7edb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l950_c2_7edb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l950_c2_7edb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l950_c2_7edb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l950_c2_7edb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l950_c2_7edb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l950_c2_7edb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c2_7edb_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c2_7edb_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c7_4077_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c2_7edb_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c2_7edb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l950_c2_7edb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l950_c2_7edb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l958_c7_4077_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l950_c2_7edb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l950_c2_7edb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c2_7edb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l954_c3_dd2e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c2_7edb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c7_4077_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c2_7edb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c2_7edb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l950_c2_7edb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l950_c2_7edb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l958_c7_4077_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l950_c2_7edb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l950_c2_7edb_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l951_c3_d13e_uxn_opcodes_h_l951_c3_d13e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l958_c11_c75e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l958_c11_c75e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l958_c11_c75e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l958_c7_4077_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l958_c7_4077_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l962_c7_2eb7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l958_c7_4077_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l958_c7_4077_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l958_c7_4077_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l962_c7_2eb7_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l958_c7_4077_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c7_4077_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l960_c3_d7b9 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c7_4077_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_2eb7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c7_4077_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l958_c7_4077_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l958_c7_4077_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_2eb7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l958_c7_4077_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l958_c7_4077_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l958_c7_4077_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_2eb7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l958_c7_4077_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l958_c7_4077_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l958_c7_4077_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_2eb7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l958_c7_4077_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l958_c7_4077_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l958_c7_4077_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c7_2eb7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l958_c7_4077_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c7_4077_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c7_4077_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_2eb7_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c7_4077_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l958_c7_4077_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l958_c7_4077_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_2eb7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l958_c7_4077_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_dccd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_dccd_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_dccd_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l962_c7_2eb7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l962_c7_2eb7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l968_c7_52be_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l962_c7_2eb7_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l962_c7_2eb7_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l962_c7_2eb7_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l968_c7_52be_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l962_c7_2eb7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_2eb7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l966_c3_16a0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_2eb7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_52be_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_2eb7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_2eb7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_2eb7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_52be_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_2eb7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_2eb7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_2eb7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_52be_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_2eb7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_2eb7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_2eb7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l968_c7_52be_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_2eb7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c7_2eb7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c7_2eb7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l968_c7_52be_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c7_2eb7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_2eb7_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_2eb7_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_52be_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_2eb7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_2eb7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_2eb7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l968_c7_52be_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_2eb7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_5255_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_5255_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_5255_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l968_c7_52be_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l968_c7_52be_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l972_c7_799a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l968_c7_52be_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l968_c7_52be_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l968_c7_52be_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l972_c7_799a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l968_c7_52be_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_52be_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l970_c3_34f1 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_52be_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_799a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_52be_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_52be_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_52be_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_799a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_52be_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_52be_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_52be_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_799a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_52be_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l968_c7_52be_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l968_c7_52be_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_799a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l968_c7_52be_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l968_c7_52be_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l968_c7_52be_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l972_c7_799a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l968_c7_52be_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_52be_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_52be_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_799a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_52be_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l968_c7_52be_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l968_c7_52be_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l972_c7_799a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l968_c7_52be_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_c7ce_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_c7ce_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_c7ce_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l972_c7_799a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l972_c7_799a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l977_c7_a917_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l972_c7_799a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l972_c7_799a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l972_c7_799a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l972_c7_799a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_799a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l975_c3_4d73 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_799a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_a917_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_799a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_799a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_799a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_a917_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_799a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_799a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_799a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_a917_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_799a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_799a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_799a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_a917_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_799a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l972_c7_799a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l972_c7_799a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_a917_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l972_c7_799a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_799a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_799a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_a917_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_799a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l972_c7_799a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l972_c7_799a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_a917_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l972_c7_799a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l973_c3_cfd2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l973_c3_cfd2_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l973_c3_cfd2_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_b263_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_b263_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_b263_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l977_c7_a917_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l977_c7_a917_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l981_c7_a900_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l977_c7_a917_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_a917_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l979_c3_2ff8 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_a917_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_a900_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_a917_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_a917_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_a917_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_a900_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_a917_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_a917_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_a917_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_a900_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_a917_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_a917_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_a917_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l981_c7_a900_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_a917_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_a917_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_a917_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l981_c7_a900_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_a917_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_a917_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_a917_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_a900_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_a917_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_a917_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_a917_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l981_c7_a900_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_a917_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_bd65_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_bd65_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_bd65_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l981_c7_a900_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l981_c7_a900_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l987_c7_0128_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l981_c7_a900_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_a900_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l985_c3_2466 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_a900_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_0128_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_a900_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_a900_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_a900_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_0128_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_a900_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_a900_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_a900_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_0128_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_a900_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l981_c7_a900_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l981_c7_a900_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_0128_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l981_c7_a900_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l981_c7_a900_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l981_c7_a900_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l987_c7_0128_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l981_c7_a900_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_a900_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_a900_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_0128_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_a900_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l981_c7_a900_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l981_c7_a900_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_0128_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l981_c7_a900_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_e9d2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_e9d2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_e9d2_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l987_c7_0128_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l987_c7_0128_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l991_c7_b56a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l987_c7_0128_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_0128_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l989_c3_aa42 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_0128_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_b56a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_0128_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_0128_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_0128_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_b56a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_0128_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_0128_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_0128_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_b56a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_0128_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_0128_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_0128_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_b56a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_0128_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l987_c7_0128_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l987_c7_0128_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l991_c7_b56a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l987_c7_0128_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_0128_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_0128_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_b56a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_0128_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_0128_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_0128_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_b56a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_0128_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_2ef5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_2ef5_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_2ef5_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l991_c7_b56a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l991_c7_b56a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l991_c7_b56a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_b56a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_b56a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_e1b1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_b56a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_b56a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_b56a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_e1b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_b56a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_b56a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_b56a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_e1b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_b56a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_b56a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_b56a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_e1b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_b56a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l991_c7_b56a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l991_c7_b56a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l997_c7_e1b1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l991_c7_b56a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_b56a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_b56a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_b56a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_b56a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_b56a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l991_c7_b56a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_b56a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l992_c3_9d74_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l992_c3_9d74_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l992_c3_9d74_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l995_c32_40ce_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l995_c32_40ce_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l995_c32_40ce_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l995_c32_6b96_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l995_c32_6b96_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l995_c32_6b96_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l995_c32_5f19_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l995_c32_5f19_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l995_c32_5f19_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l995_c32_40ce_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l997_c11_ed74_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l997_c11_ed74_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l997_c11_ed74_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_e1b1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1000_c3_1859 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_e1b1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_e1b1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_e1b1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_e1b1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_63c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_e1b1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_e1b1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_e1b1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_63c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_e1b1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_e1b1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_e1b1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_e1b1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l997_c7_e1b1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l997_c7_e1b1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l997_c7_e1b1_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1001_c24_253f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1001_c24_253f_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1001_c24_253f_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c24_f1e7_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c24_f1e7_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c24_f1e7_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1001_c24_253f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_c058_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_c058_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_c058_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_63c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_63c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_63c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_63c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_63c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_63c9_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l962_l991_l958_l987_l950_l981_l977_l972_l968_l997_DUPLICATE_89d1_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l962_l991_l958_l987_l950_l981_l977_l972_l968_DUPLICATE_aad2_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l962_l958_l987_l950_l981_l977_l972_l968_l997_DUPLICATE_cf60_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l962_l991_l958_l987_l981_l977_l972_l1003_l968_l997_DUPLICATE_256e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l962_l991_l958_l987_l981_l977_l972_l1003_l968_DUPLICATE_c535_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l982_l992_l963_l973_DUPLICATE_717a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l964_DUPLICATE_d534_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l964_DUPLICATE_d534_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l991_l997_DUPLICATE_50de_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l1008_l946_DUPLICATE_6d7d_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_GT_uxn_opcodes_h_l995_c32_5f19_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l985_c3_2466 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_a900_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l985_c3_2466;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_63c9_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l995_c32_6b96_right := to_unsigned(128, 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c2_7edb_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_a917_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_2ef5_right := to_unsigned(8, 4);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l968_c7_52be_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l997_c11_ed74_right := to_unsigned(9, 4);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l972_c7_799a_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l975_c3_4d73 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_799a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l975_c3_4d73;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c6_0d77_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l979_c3_2ff8 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_a917_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l979_c3_2ff8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_5255_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_e9d2_right := to_unsigned(7, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l950_c1_7850_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_c7ce_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_bd65_right := to_unsigned(6, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_b56a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_dccd_right := to_unsigned(2, 2);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_b56a_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l989_c3_aa42 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_0128_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l989_c3_aa42;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l960_c3_d7b9 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c7_4077_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l960_c3_d7b9;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c2_7edb_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_2eb7_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l958_c7_4077_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l995_c32_40ce_iffalse := resize(to_signed(-3, 3), 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_e1b1_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_0128_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l995_c32_40ce_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l950_c2_7edb_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1000_c3_1859 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_e1b1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1000_c3_1859;
     VAR_MUX_uxn_opcodes_h_l1001_c24_253f_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l958_c11_c75e_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_e1b1_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l981_c7_a900_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_63c9_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l970_c3_34f1 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_52be_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l970_c3_34f1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_c058_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_b263_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l966_c3_16a0 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_2eb7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l966_c3_16a0;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l950_c2_7edb_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1001_c24_253f_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l954_c3_dd2e := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c2_7edb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l954_c3_dd2e;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_pc := pc;
     VAR_previous_stack_read := previous_stack_read;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l950_c1_7850_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l995_c32_6b96_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c24_f1e7_left := n16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l992_c3_9d74_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l950_c2_7edb_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l958_c7_4077_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l962_c7_2eb7_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l968_c7_52be_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l972_c7_799a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l977_c7_a917_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l987_c7_0128_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l991_c7_b56a_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_c058_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c6_0d77_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l958_c11_c75e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_dccd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_5255_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_c7ce_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_b263_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_bd65_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_e9d2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_2ef5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l997_c11_ed74_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c24_f1e7_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l973_c3_cfd2_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l950_c2_7edb_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l958_c7_4077_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l968_c7_52be_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l972_c7_799a_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l981_c11_bd65] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l981_c11_bd65_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_bd65_left;
     BIN_OP_EQ_uxn_opcodes_h_l981_c11_bd65_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_bd65_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_bd65_return_output := BIN_OP_EQ_uxn_opcodes_h_l981_c11_bd65_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l950_c6_0d77] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l950_c6_0d77_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c6_0d77_left;
     BIN_OP_EQ_uxn_opcodes_h_l950_c6_0d77_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c6_0d77_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c6_0d77_return_output := BIN_OP_EQ_uxn_opcodes_h_l950_c6_0d77_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l982_l992_l963_l973_DUPLICATE_717a LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l982_l992_l963_l973_DUPLICATE_717a_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1003_c11_c058] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1003_c11_c058_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_c058_left;
     BIN_OP_EQ_uxn_opcodes_h_l1003_c11_c058_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_c058_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_c058_return_output := BIN_OP_EQ_uxn_opcodes_h_l1003_c11_c058_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l968_c11_5255] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l968_c11_5255_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_5255_left;
     BIN_OP_EQ_uxn_opcodes_h_l968_c11_5255_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_5255_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_5255_return_output := BIN_OP_EQ_uxn_opcodes_h_l968_c11_5255_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l987_c11_e9d2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l987_c11_e9d2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_e9d2_left;
     BIN_OP_EQ_uxn_opcodes_h_l987_c11_e9d2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_e9d2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_e9d2_return_output := BIN_OP_EQ_uxn_opcodes_h_l987_c11_e9d2_return_output;

     -- result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l991_c7_b56a] LATENCY=0
     VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l991_c7_b56a_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l972_c11_c7ce] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l972_c11_c7ce_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_c7ce_left;
     BIN_OP_EQ_uxn_opcodes_h_l972_c11_c7ce_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_c7ce_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_c7ce_return_output := BIN_OP_EQ_uxn_opcodes_h_l972_c11_c7ce_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l962_l991_l958_l987_l981_l977_l972_l1003_l968_DUPLICATE_c535 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l962_l991_l958_l987_l981_l977_l972_l1003_l968_DUPLICATE_c535_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l991_c11_2ef5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l991_c11_2ef5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_2ef5_left;
     BIN_OP_EQ_uxn_opcodes_h_l991_c11_2ef5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_2ef5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_2ef5_return_output := BIN_OP_EQ_uxn_opcodes_h_l991_c11_2ef5_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l962_l991_l958_l987_l981_l977_l972_l1003_l968_l997_DUPLICATE_256e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l962_l991_l958_l987_l981_l977_l972_l1003_l968_l997_DUPLICATE_256e_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l991_l997_DUPLICATE_50de LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l991_l997_DUPLICATE_50de_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l962_l991_l958_l987_l950_l981_l977_l972_l968_DUPLICATE_aad2 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l962_l991_l958_l987_l950_l981_l977_l972_l968_DUPLICATE_aad2_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l997_c11_ed74] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l997_c11_ed74_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l997_c11_ed74_left;
     BIN_OP_EQ_uxn_opcodes_h_l997_c11_ed74_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l997_c11_ed74_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l997_c11_ed74_return_output := BIN_OP_EQ_uxn_opcodes_h_l997_c11_ed74_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l995_c32_6b96] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l995_c32_6b96_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l995_c32_6b96_left;
     BIN_OP_AND_uxn_opcodes_h_l995_c32_6b96_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l995_c32_6b96_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l995_c32_6b96_return_output := BIN_OP_AND_uxn_opcodes_h_l995_c32_6b96_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l962_l958_l987_l950_l981_l977_l972_l968_l997_DUPLICATE_cf60 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l962_l958_l987_l950_l981_l977_l972_l968_l997_DUPLICATE_cf60_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l962_c11_dccd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l962_c11_dccd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_dccd_left;
     BIN_OP_EQ_uxn_opcodes_h_l962_c11_dccd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_dccd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_dccd_return_output := BIN_OP_EQ_uxn_opcodes_h_l962_c11_dccd_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l962_l991_l958_l987_l950_l981_l977_l972_l968_l997_DUPLICATE_89d1 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l962_l991_l958_l987_l950_l981_l977_l972_l968_l997_DUPLICATE_89d1_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1001_c24_f1e7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1001_c24_f1e7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c24_f1e7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1001_c24_f1e7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c24_f1e7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c24_f1e7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1001_c24_f1e7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l958_c11_c75e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l958_c11_c75e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l958_c11_c75e_left;
     BIN_OP_EQ_uxn_opcodes_h_l958_c11_c75e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l958_c11_c75e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l958_c11_c75e_return_output := BIN_OP_EQ_uxn_opcodes_h_l958_c11_c75e_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l950_c2_7edb] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l950_c2_7edb_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l977_c11_b263] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l977_c11_b263_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_b263_left;
     BIN_OP_EQ_uxn_opcodes_h_l977_c11_b263_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_b263_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_b263_return_output := BIN_OP_EQ_uxn_opcodes_h_l977_c11_b263_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l995_c32_5f19_left := VAR_BIN_OP_AND_uxn_opcodes_h_l995_c32_6b96_return_output;
     VAR_MUX_uxn_opcodes_h_l1001_c24_253f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c24_f1e7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_63c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_c058_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_63c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_c058_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l950_c1_7850_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c6_0d77_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l950_c2_7edb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c6_0d77_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c2_7edb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c6_0d77_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l950_c2_7edb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c6_0d77_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l950_c2_7edb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c6_0d77_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l950_c2_7edb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c6_0d77_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c2_7edb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c6_0d77_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c2_7edb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c6_0d77_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c2_7edb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c6_0d77_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l950_c2_7edb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c6_0d77_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l950_c2_7edb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c6_0d77_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l958_c7_4077_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l958_c11_c75e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l958_c7_4077_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l958_c11_c75e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l958_c7_4077_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l958_c11_c75e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l958_c7_4077_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l958_c11_c75e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l958_c7_4077_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l958_c11_c75e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c7_4077_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l958_c11_c75e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c7_4077_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l958_c11_c75e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l958_c7_4077_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l958_c11_c75e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l958_c7_4077_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l958_c11_c75e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l962_c7_2eb7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_dccd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_2eb7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_dccd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_2eb7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_dccd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_2eb7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_dccd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_2eb7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_dccd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_2eb7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_dccd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_2eb7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_dccd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c7_2eb7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_dccd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l962_c7_2eb7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_dccd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l968_c7_52be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_5255_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_52be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_5255_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l968_c7_52be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_5255_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l968_c7_52be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_5255_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_52be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_5255_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_52be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_5255_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_52be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_5255_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l968_c7_52be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_5255_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l968_c7_52be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_5255_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l972_c7_799a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_c7ce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_799a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_c7ce_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_799a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_c7ce_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l972_c7_799a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_c7ce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_799a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_c7ce_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_799a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_c7ce_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_799a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_c7ce_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l972_c7_799a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_c7ce_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l972_c7_799a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_c7ce_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l977_c7_a917_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_b263_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_a917_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_b263_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_a917_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_b263_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_a917_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_b263_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_a917_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_b263_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_a917_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_b263_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_a917_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_b263_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_a917_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_b263_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l981_c7_a900_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_bd65_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_a900_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_bd65_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l981_c7_a900_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_bd65_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l981_c7_a900_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_bd65_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_a900_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_bd65_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_a900_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_bd65_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_a900_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_bd65_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l981_c7_a900_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_bd65_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l987_c7_0128_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_e9d2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_0128_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_e9d2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_0128_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_e9d2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_0128_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_e9d2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_0128_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_e9d2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_0128_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_e9d2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_0128_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_e9d2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l987_c7_0128_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_e9d2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l991_c7_b56a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_2ef5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_b56a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_2ef5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_b56a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_2ef5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_b56a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_2ef5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_b56a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_2ef5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_b56a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_2ef5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_b56a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_2ef5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l991_c7_b56a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_2ef5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_e1b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l997_c11_ed74_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_e1b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l997_c11_ed74_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_e1b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l997_c11_ed74_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_e1b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l997_c11_ed74_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l997_c7_e1b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l997_c11_ed74_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l973_c3_cfd2_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l982_l992_l963_l973_DUPLICATE_717a_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l992_c3_9d74_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l982_l992_l963_l973_DUPLICATE_717a_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l964_DUPLICATE_d534_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l982_l992_l963_l973_DUPLICATE_717a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c2_7edb_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l962_l991_l958_l987_l950_l981_l977_l972_l968_DUPLICATE_aad2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c7_4077_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l962_l991_l958_l987_l950_l981_l977_l972_l968_DUPLICATE_aad2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_2eb7_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l962_l991_l958_l987_l950_l981_l977_l972_l968_DUPLICATE_aad2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_52be_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l962_l991_l958_l987_l950_l981_l977_l972_l968_DUPLICATE_aad2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_799a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l962_l991_l958_l987_l950_l981_l977_l972_l968_DUPLICATE_aad2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_a917_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l962_l991_l958_l987_l950_l981_l977_l972_l968_DUPLICATE_aad2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_a900_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l962_l991_l958_l987_l950_l981_l977_l972_l968_DUPLICATE_aad2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_0128_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l962_l991_l958_l987_l950_l981_l977_l972_l968_DUPLICATE_aad2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_b56a_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l962_l991_l958_l987_l950_l981_l977_l972_l968_DUPLICATE_aad2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_63c9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l962_l991_l958_l987_l981_l977_l972_l1003_l968_l997_DUPLICATE_256e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l958_c7_4077_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l962_l991_l958_l987_l981_l977_l972_l1003_l968_l997_DUPLICATE_256e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_2eb7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l962_l991_l958_l987_l981_l977_l972_l1003_l968_l997_DUPLICATE_256e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_52be_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l962_l991_l958_l987_l981_l977_l972_l1003_l968_l997_DUPLICATE_256e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_799a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l962_l991_l958_l987_l981_l977_l972_l1003_l968_l997_DUPLICATE_256e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_a917_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l962_l991_l958_l987_l981_l977_l972_l1003_l968_l997_DUPLICATE_256e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_a900_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l962_l991_l958_l987_l981_l977_l972_l1003_l968_l997_DUPLICATE_256e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_0128_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l962_l991_l958_l987_l981_l977_l972_l1003_l968_l997_DUPLICATE_256e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_b56a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l962_l991_l958_l987_l981_l977_l972_l1003_l968_l997_DUPLICATE_256e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_e1b1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l962_l991_l958_l987_l981_l977_l972_l1003_l968_l997_DUPLICATE_256e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l950_c2_7edb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l962_l958_l987_l950_l981_l977_l972_l968_l997_DUPLICATE_cf60_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l958_c7_4077_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l962_l958_l987_l950_l981_l977_l972_l968_l997_DUPLICATE_cf60_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_2eb7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l962_l958_l987_l950_l981_l977_l972_l968_l997_DUPLICATE_cf60_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l968_c7_52be_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l962_l958_l987_l950_l981_l977_l972_l968_l997_DUPLICATE_cf60_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_799a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l962_l958_l987_l950_l981_l977_l972_l968_l997_DUPLICATE_cf60_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_a917_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l962_l958_l987_l950_l981_l977_l972_l968_l997_DUPLICATE_cf60_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l981_c7_a900_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l962_l958_l987_l950_l981_l977_l972_l968_l997_DUPLICATE_cf60_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_0128_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l962_l958_l987_l950_l981_l977_l972_l968_l997_DUPLICATE_cf60_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_e1b1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l962_l958_l987_l950_l981_l977_l972_l968_l997_DUPLICATE_cf60_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_63c9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l962_l991_l958_l987_l981_l977_l972_l1003_l968_DUPLICATE_c535_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l958_c7_4077_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l962_l991_l958_l987_l981_l977_l972_l1003_l968_DUPLICATE_c535_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_2eb7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l962_l991_l958_l987_l981_l977_l972_l1003_l968_DUPLICATE_c535_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_52be_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l962_l991_l958_l987_l981_l977_l972_l1003_l968_DUPLICATE_c535_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_799a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l962_l991_l958_l987_l981_l977_l972_l1003_l968_DUPLICATE_c535_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_a917_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l962_l991_l958_l987_l981_l977_l972_l1003_l968_DUPLICATE_c535_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_a900_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l962_l991_l958_l987_l981_l977_l972_l1003_l968_DUPLICATE_c535_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_0128_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l962_l991_l958_l987_l981_l977_l972_l1003_l968_DUPLICATE_c535_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_b56a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l962_l991_l958_l987_l981_l977_l972_l1003_l968_DUPLICATE_c535_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_b56a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l991_l997_DUPLICATE_50de_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_e1b1_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l991_l997_DUPLICATE_50de_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l950_c2_7edb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l962_l991_l958_l987_l950_l981_l977_l972_l968_l997_DUPLICATE_89d1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l958_c7_4077_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l962_l991_l958_l987_l950_l981_l977_l972_l968_l997_DUPLICATE_89d1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c7_2eb7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l962_l991_l958_l987_l950_l981_l977_l972_l968_l997_DUPLICATE_89d1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l968_c7_52be_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l962_l991_l958_l987_l950_l981_l977_l972_l968_l997_DUPLICATE_89d1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l972_c7_799a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l962_l991_l958_l987_l950_l981_l977_l972_l968_l997_DUPLICATE_89d1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_a917_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l962_l991_l958_l987_l950_l981_l977_l972_l968_l997_DUPLICATE_89d1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l981_c7_a900_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l962_l991_l958_l987_l950_l981_l977_l972_l968_l997_DUPLICATE_89d1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l987_c7_0128_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l962_l991_l958_l987_l950_l981_l977_l972_l968_l997_DUPLICATE_89d1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l991_c7_b56a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l962_l991_l958_l987_l950_l981_l977_l972_l968_l997_DUPLICATE_89d1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l997_c7_e1b1_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l962_l991_l958_l987_l950_l981_l977_l972_l968_l997_DUPLICATE_89d1_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l950_c2_7edb_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l950_c2_7edb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_b56a_iffalse := VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l991_c7_b56a_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l950_c1_7850] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l950_c1_7850_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l950_c1_7850_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l950_c1_7850_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l950_c1_7850_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l950_c1_7850_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l950_c1_7850_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l950_c1_7850_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l950_c1_7850_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l964_DUPLICATE_d534 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l964_DUPLICATE_d534_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l964_DUPLICATE_d534_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l964_DUPLICATE_d534_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l964_DUPLICATE_d534_return_output;

     -- MUX[uxn_opcodes_h_l1001_c24_253f] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1001_c24_253f_cond <= VAR_MUX_uxn_opcodes_h_l1001_c24_253f_cond;
     MUX_uxn_opcodes_h_l1001_c24_253f_iftrue <= VAR_MUX_uxn_opcodes_h_l1001_c24_253f_iftrue;
     MUX_uxn_opcodes_h_l1001_c24_253f_iffalse <= VAR_MUX_uxn_opcodes_h_l1001_c24_253f_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1001_c24_253f_return_output := MUX_uxn_opcodes_h_l1001_c24_253f_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l973_c3_cfd2] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l973_c3_cfd2_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l973_c3_cfd2_left;
     BIN_OP_OR_uxn_opcodes_h_l973_c3_cfd2_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l973_c3_cfd2_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l973_c3_cfd2_return_output := BIN_OP_OR_uxn_opcodes_h_l973_c3_cfd2_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l950_c2_7edb] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l950_c2_7edb_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l950_c2_7edb_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l950_c2_7edb_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l950_c2_7edb_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l950_c2_7edb_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l950_c2_7edb_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l950_c2_7edb_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l950_c2_7edb_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l995_c32_5f19] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l995_c32_5f19_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l995_c32_5f19_left;
     BIN_OP_GT_uxn_opcodes_h_l995_c32_5f19_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l995_c32_5f19_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l995_c32_5f19_return_output := BIN_OP_GT_uxn_opcodes_h_l995_c32_5f19_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l997_c7_e1b1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_e1b1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_e1b1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_e1b1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_e1b1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_e1b1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_e1b1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_e1b1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_e1b1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1003_c7_63c9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_63c9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_63c9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_63c9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_63c9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_63c9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_63c9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_63c9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_63c9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l997_c7_e1b1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_e1b1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_e1b1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_e1b1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_e1b1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_e1b1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_e1b1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_e1b1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_e1b1_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l992_c3_9d74] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l992_c3_9d74_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l992_c3_9d74_left;
     BIN_OP_OR_uxn_opcodes_h_l992_c3_9d74_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l992_c3_9d74_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l992_c3_9d74_return_output := BIN_OP_OR_uxn_opcodes_h_l992_c3_9d74_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1003_c7_63c9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_63c9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_63c9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_63c9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_63c9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_63c9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_63c9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_63c9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_63c9_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l991_c7_b56a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_b56a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_b56a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_b56a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_b56a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_b56a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_b56a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_b56a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_b56a_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l995_c32_40ce_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l995_c32_5f19_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l972_c7_799a_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l973_c3_cfd2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l991_c7_b56a_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l992_c3_9d74_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l981_c7_a900_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l964_DUPLICATE_d534_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l962_c7_2eb7_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l964_DUPLICATE_d534_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l997_c7_e1b1_iftrue := VAR_MUX_uxn_opcodes_h_l1001_c24_253f_return_output;
     VAR_printf_uxn_opcodes_h_l951_c3_d13e_uxn_opcodes_h_l951_c3_d13e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l950_c1_7850_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_e1b1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_63c9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_b56a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_e1b1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_0128_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_b56a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_e1b1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_63c9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_b56a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_e1b1_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l997_c7_e1b1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_e1b1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_e1b1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_e1b1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_e1b1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_e1b1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_e1b1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_e1b1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_e1b1_return_output;

     -- t16_MUX[uxn_opcodes_h_l972_c7_799a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l972_c7_799a_cond <= VAR_t16_MUX_uxn_opcodes_h_l972_c7_799a_cond;
     t16_MUX_uxn_opcodes_h_l972_c7_799a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l972_c7_799a_iftrue;
     t16_MUX_uxn_opcodes_h_l972_c7_799a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l972_c7_799a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l972_c7_799a_return_output := t16_MUX_uxn_opcodes_h_l972_c7_799a_return_output;

     -- printf_uxn_opcodes_h_l951_c3_d13e[uxn_opcodes_h_l951_c3_d13e] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l951_c3_d13e_uxn_opcodes_h_l951_c3_d13e_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l951_c3_d13e_uxn_opcodes_h_l951_c3_d13e_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- n16_MUX[uxn_opcodes_h_l991_c7_b56a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l991_c7_b56a_cond <= VAR_n16_MUX_uxn_opcodes_h_l991_c7_b56a_cond;
     n16_MUX_uxn_opcodes_h_l991_c7_b56a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l991_c7_b56a_iftrue;
     n16_MUX_uxn_opcodes_h_l991_c7_b56a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l991_c7_b56a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l991_c7_b56a_return_output := n16_MUX_uxn_opcodes_h_l991_c7_b56a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l991_c7_b56a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_b56a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_b56a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_b56a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_b56a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_b56a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_b56a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_b56a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_b56a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l991_c7_b56a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_b56a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_b56a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_b56a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_b56a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_b56a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_b56a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_b56a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_b56a_return_output;

     -- MUX[uxn_opcodes_h_l995_c32_40ce] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l995_c32_40ce_cond <= VAR_MUX_uxn_opcodes_h_l995_c32_40ce_cond;
     MUX_uxn_opcodes_h_l995_c32_40ce_iftrue <= VAR_MUX_uxn_opcodes_h_l995_c32_40ce_iftrue;
     MUX_uxn_opcodes_h_l995_c32_40ce_iffalse <= VAR_MUX_uxn_opcodes_h_l995_c32_40ce_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l995_c32_40ce_return_output := MUX_uxn_opcodes_h_l995_c32_40ce_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l997_c7_e1b1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_e1b1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_e1b1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_e1b1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_e1b1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_e1b1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_e1b1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_e1b1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_e1b1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l997_c7_e1b1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l997_c7_e1b1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l997_c7_e1b1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l997_c7_e1b1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l997_c7_e1b1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l997_c7_e1b1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l997_c7_e1b1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l997_c7_e1b1_return_output := result_stack_value_MUX_uxn_opcodes_h_l997_c7_e1b1_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l987_c7_0128] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_0128_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_0128_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_0128_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_0128_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_0128_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_0128_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_0128_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_0128_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_b56a_iftrue := VAR_MUX_uxn_opcodes_h_l995_c32_40ce_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l987_c7_0128_iffalse := VAR_n16_MUX_uxn_opcodes_h_l991_c7_b56a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_b56a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_e1b1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_0128_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_b56a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l981_c7_a900_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_0128_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_b56a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_e1b1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_0128_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_b56a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l991_c7_b56a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l997_c7_e1b1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l968_c7_52be_iffalse := VAR_t16_MUX_uxn_opcodes_h_l972_c7_799a_return_output;
     -- n16_MUX[uxn_opcodes_h_l987_c7_0128] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l987_c7_0128_cond <= VAR_n16_MUX_uxn_opcodes_h_l987_c7_0128_cond;
     n16_MUX_uxn_opcodes_h_l987_c7_0128_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l987_c7_0128_iftrue;
     n16_MUX_uxn_opcodes_h_l987_c7_0128_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l987_c7_0128_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l987_c7_0128_return_output := n16_MUX_uxn_opcodes_h_l987_c7_0128_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l991_c7_b56a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l991_c7_b56a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l991_c7_b56a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l991_c7_b56a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l991_c7_b56a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l991_c7_b56a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l991_c7_b56a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l991_c7_b56a_return_output := result_stack_value_MUX_uxn_opcodes_h_l991_c7_b56a_return_output;

     -- t16_MUX[uxn_opcodes_h_l968_c7_52be] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l968_c7_52be_cond <= VAR_t16_MUX_uxn_opcodes_h_l968_c7_52be_cond;
     t16_MUX_uxn_opcodes_h_l968_c7_52be_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l968_c7_52be_iftrue;
     t16_MUX_uxn_opcodes_h_l968_c7_52be_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l968_c7_52be_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l968_c7_52be_return_output := t16_MUX_uxn_opcodes_h_l968_c7_52be_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l987_c7_0128] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_0128_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_0128_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_0128_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_0128_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_0128_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_0128_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_0128_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_0128_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l991_c7_b56a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_b56a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_b56a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_b56a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_b56a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_b56a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_b56a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_b56a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_b56a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l981_c7_a900] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l981_c7_a900_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l981_c7_a900_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l981_c7_a900_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l981_c7_a900_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l981_c7_a900_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l981_c7_a900_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l981_c7_a900_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l981_c7_a900_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l991_c7_b56a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_b56a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_b56a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_b56a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_b56a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_b56a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_b56a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_b56a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_b56a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l987_c7_0128] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_0128_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_0128_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_0128_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_0128_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_0128_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_0128_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_0128_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_0128_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l991_c7_b56a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_b56a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_b56a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_b56a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_b56a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_b56a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_b56a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_b56a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_b56a_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l981_c7_a900_iffalse := VAR_n16_MUX_uxn_opcodes_h_l987_c7_0128_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_0128_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_b56a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l981_c7_a900_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_0128_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_a917_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l981_c7_a900_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_0128_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_b56a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_0128_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_b56a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_a900_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_0128_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l987_c7_0128_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l991_c7_b56a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l962_c7_2eb7_iffalse := VAR_t16_MUX_uxn_opcodes_h_l968_c7_52be_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l987_c7_0128] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l987_c7_0128_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l987_c7_0128_cond;
     result_stack_value_MUX_uxn_opcodes_h_l987_c7_0128_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l987_c7_0128_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l987_c7_0128_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l987_c7_0128_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l987_c7_0128_return_output := result_stack_value_MUX_uxn_opcodes_h_l987_c7_0128_return_output;

     -- t16_MUX[uxn_opcodes_h_l962_c7_2eb7] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l962_c7_2eb7_cond <= VAR_t16_MUX_uxn_opcodes_h_l962_c7_2eb7_cond;
     t16_MUX_uxn_opcodes_h_l962_c7_2eb7_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l962_c7_2eb7_iftrue;
     t16_MUX_uxn_opcodes_h_l962_c7_2eb7_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l962_c7_2eb7_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l962_c7_2eb7_return_output := t16_MUX_uxn_opcodes_h_l962_c7_2eb7_return_output;

     -- n16_MUX[uxn_opcodes_h_l981_c7_a900] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l981_c7_a900_cond <= VAR_n16_MUX_uxn_opcodes_h_l981_c7_a900_cond;
     n16_MUX_uxn_opcodes_h_l981_c7_a900_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l981_c7_a900_iftrue;
     n16_MUX_uxn_opcodes_h_l981_c7_a900_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l981_c7_a900_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l981_c7_a900_return_output := n16_MUX_uxn_opcodes_h_l981_c7_a900_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l987_c7_0128] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_0128_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_0128_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_0128_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_0128_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_0128_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_0128_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_0128_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_0128_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l981_c7_a900] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l981_c7_a900_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l981_c7_a900_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l981_c7_a900_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l981_c7_a900_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l981_c7_a900_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l981_c7_a900_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l981_c7_a900_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l981_c7_a900_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l981_c7_a900] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_a900_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_a900_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_a900_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_a900_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_a900_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_a900_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_a900_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_a900_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l977_c7_a917] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_a917_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_a917_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_a917_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_a917_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_a917_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_a917_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_a917_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_a917_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l987_c7_0128] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_0128_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_0128_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_0128_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_0128_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_0128_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_0128_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_0128_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_0128_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l987_c7_0128] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_0128_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_0128_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_0128_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_0128_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_0128_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_0128_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_0128_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_0128_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l977_c7_a917_iffalse := VAR_n16_MUX_uxn_opcodes_h_l981_c7_a900_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_a900_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_0128_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_a917_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l981_c7_a900_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l972_c7_799a_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_a917_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_a900_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_0128_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_a900_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_0128_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_a917_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_a900_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l981_c7_a900_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l987_c7_0128_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l958_c7_4077_iffalse := VAR_t16_MUX_uxn_opcodes_h_l962_c7_2eb7_return_output;
     -- n16_MUX[uxn_opcodes_h_l977_c7_a917] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l977_c7_a917_cond <= VAR_n16_MUX_uxn_opcodes_h_l977_c7_a917_cond;
     n16_MUX_uxn_opcodes_h_l977_c7_a917_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l977_c7_a917_iftrue;
     n16_MUX_uxn_opcodes_h_l977_c7_a917_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l977_c7_a917_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l977_c7_a917_return_output := n16_MUX_uxn_opcodes_h_l977_c7_a917_return_output;

     -- t16_MUX[uxn_opcodes_h_l958_c7_4077] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l958_c7_4077_cond <= VAR_t16_MUX_uxn_opcodes_h_l958_c7_4077_cond;
     t16_MUX_uxn_opcodes_h_l958_c7_4077_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l958_c7_4077_iftrue;
     t16_MUX_uxn_opcodes_h_l958_c7_4077_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l958_c7_4077_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l958_c7_4077_return_output := t16_MUX_uxn_opcodes_h_l958_c7_4077_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l981_c7_a900] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l981_c7_a900_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l981_c7_a900_cond;
     result_stack_value_MUX_uxn_opcodes_h_l981_c7_a900_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l981_c7_a900_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l981_c7_a900_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l981_c7_a900_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l981_c7_a900_return_output := result_stack_value_MUX_uxn_opcodes_h_l981_c7_a900_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l972_c7_799a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l972_c7_799a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l972_c7_799a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l972_c7_799a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l972_c7_799a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l972_c7_799a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l972_c7_799a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l972_c7_799a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l972_c7_799a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l981_c7_a900] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_a900_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_a900_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_a900_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_a900_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_a900_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_a900_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_a900_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_a900_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l977_c7_a917] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_a917_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_a917_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_a917_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_a917_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_a917_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_a917_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_a917_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_a917_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l981_c7_a900] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_a900_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_a900_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_a900_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_a900_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_a900_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_a900_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_a900_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_a900_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l981_c7_a900] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_a900_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_a900_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_a900_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_a900_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_a900_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_a900_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_a900_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_a900_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l977_c7_a917] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_a917_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_a917_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_a917_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_a917_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_a917_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_a917_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_a917_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_a917_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l972_c7_799a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l977_c7_a917_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_a917_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_a900_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_799a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_a917_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l968_c7_52be_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l972_c7_799a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_a917_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_a900_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_a917_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_a900_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_799a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_a917_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_a917_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l981_c7_a900_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l950_c2_7edb_iffalse := VAR_t16_MUX_uxn_opcodes_h_l958_c7_4077_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l972_c7_799a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_799a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_799a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_799a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_799a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_799a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_799a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_799a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_799a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l972_c7_799a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_799a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_799a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_799a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_799a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_799a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_799a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_799a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_799a_return_output;

     -- t16_MUX[uxn_opcodes_h_l950_c2_7edb] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l950_c2_7edb_cond <= VAR_t16_MUX_uxn_opcodes_h_l950_c2_7edb_cond;
     t16_MUX_uxn_opcodes_h_l950_c2_7edb_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l950_c2_7edb_iftrue;
     t16_MUX_uxn_opcodes_h_l950_c2_7edb_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l950_c2_7edb_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l950_c2_7edb_return_output := t16_MUX_uxn_opcodes_h_l950_c2_7edb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l977_c7_a917] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_a917_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_a917_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_a917_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_a917_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_a917_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_a917_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_a917_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_a917_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l968_c7_52be] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l968_c7_52be_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l968_c7_52be_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l968_c7_52be_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l968_c7_52be_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l968_c7_52be_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l968_c7_52be_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l968_c7_52be_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l968_c7_52be_return_output;

     -- n16_MUX[uxn_opcodes_h_l972_c7_799a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l972_c7_799a_cond <= VAR_n16_MUX_uxn_opcodes_h_l972_c7_799a_cond;
     n16_MUX_uxn_opcodes_h_l972_c7_799a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l972_c7_799a_iftrue;
     n16_MUX_uxn_opcodes_h_l972_c7_799a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l972_c7_799a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l972_c7_799a_return_output := n16_MUX_uxn_opcodes_h_l972_c7_799a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l977_c7_a917] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l977_c7_a917_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_a917_cond;
     result_stack_value_MUX_uxn_opcodes_h_l977_c7_a917_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_a917_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l977_c7_a917_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_a917_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_a917_return_output := result_stack_value_MUX_uxn_opcodes_h_l977_c7_a917_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l977_c7_a917] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_a917_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_a917_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_a917_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_a917_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_a917_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_a917_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_a917_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_a917_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l977_c7_a917] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_a917_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_a917_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_a917_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_a917_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_a917_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_a917_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_a917_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_a917_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l968_c7_52be_iffalse := VAR_n16_MUX_uxn_opcodes_h_l972_c7_799a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_799a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_a917_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l968_c7_52be_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_799a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_2eb7_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l968_c7_52be_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_799a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_a917_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_799a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_a917_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_52be_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_799a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l972_c7_799a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_a917_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l950_c2_7edb_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l972_c7_799a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_799a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_799a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_799a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_799a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_799a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_799a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_799a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_799a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l962_c7_2eb7] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_2eb7_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_2eb7_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_2eb7_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_2eb7_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_2eb7_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_2eb7_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_2eb7_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_2eb7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l968_c7_52be] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l968_c7_52be_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l968_c7_52be_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l968_c7_52be_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l968_c7_52be_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l968_c7_52be_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l968_c7_52be_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l968_c7_52be_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l968_c7_52be_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l972_c7_799a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_799a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_799a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_799a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_799a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_799a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_799a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_799a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_799a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l972_c7_799a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_799a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_799a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_799a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_799a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_799a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_799a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_799a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_799a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l968_c7_52be] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_52be_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_52be_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_52be_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_52be_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_52be_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_52be_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_52be_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_52be_return_output;

     -- n16_MUX[uxn_opcodes_h_l968_c7_52be] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l968_c7_52be_cond <= VAR_n16_MUX_uxn_opcodes_h_l968_c7_52be_cond;
     n16_MUX_uxn_opcodes_h_l968_c7_52be_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l968_c7_52be_iftrue;
     n16_MUX_uxn_opcodes_h_l968_c7_52be_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l968_c7_52be_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l968_c7_52be_return_output := n16_MUX_uxn_opcodes_h_l968_c7_52be_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l972_c7_799a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l972_c7_799a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l972_c7_799a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l972_c7_799a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l972_c7_799a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l972_c7_799a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l972_c7_799a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l972_c7_799a_return_output := result_stack_value_MUX_uxn_opcodes_h_l972_c7_799a_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l962_c7_2eb7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l968_c7_52be_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_52be_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_799a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_2eb7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l968_c7_52be_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l958_c7_4077_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_2eb7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_52be_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_799a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_52be_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_799a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_2eb7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_52be_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l968_c7_52be_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l972_c7_799a_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l958_c7_4077] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l958_c7_4077_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l958_c7_4077_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l958_c7_4077_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l958_c7_4077_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l958_c7_4077_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l958_c7_4077_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l958_c7_4077_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l958_c7_4077_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l962_c7_2eb7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_2eb7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_2eb7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_2eb7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_2eb7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_2eb7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_2eb7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_2eb7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_2eb7_return_output;

     -- n16_MUX[uxn_opcodes_h_l962_c7_2eb7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l962_c7_2eb7_cond <= VAR_n16_MUX_uxn_opcodes_h_l962_c7_2eb7_cond;
     n16_MUX_uxn_opcodes_h_l962_c7_2eb7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l962_c7_2eb7_iftrue;
     n16_MUX_uxn_opcodes_h_l962_c7_2eb7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l962_c7_2eb7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l962_c7_2eb7_return_output := n16_MUX_uxn_opcodes_h_l962_c7_2eb7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l962_c7_2eb7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_2eb7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_2eb7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_2eb7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_2eb7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_2eb7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_2eb7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_2eb7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_2eb7_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l968_c7_52be] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l968_c7_52be_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l968_c7_52be_cond;
     result_stack_value_MUX_uxn_opcodes_h_l968_c7_52be_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l968_c7_52be_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l968_c7_52be_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l968_c7_52be_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l968_c7_52be_return_output := result_stack_value_MUX_uxn_opcodes_h_l968_c7_52be_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l968_c7_52be] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_52be_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_52be_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_52be_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_52be_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_52be_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_52be_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_52be_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_52be_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l968_c7_52be] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_52be_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_52be_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_52be_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_52be_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_52be_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_52be_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_52be_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_52be_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l968_c7_52be] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_52be_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_52be_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_52be_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_52be_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_52be_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_52be_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_52be_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_52be_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l958_c7_4077_iffalse := VAR_n16_MUX_uxn_opcodes_h_l962_c7_2eb7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_2eb7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_52be_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l958_c7_4077_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_2eb7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l950_c2_7edb_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l958_c7_4077_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_2eb7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_52be_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_2eb7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_52be_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c7_4077_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_2eb7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c7_2eb7_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l968_c7_52be_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l962_c7_2eb7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_2eb7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_2eb7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_2eb7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_2eb7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_2eb7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_2eb7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_2eb7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_2eb7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l958_c7_4077] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l958_c7_4077_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l958_c7_4077_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l958_c7_4077_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l958_c7_4077_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l958_c7_4077_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l958_c7_4077_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l958_c7_4077_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l958_c7_4077_return_output;

     -- n16_MUX[uxn_opcodes_h_l958_c7_4077] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l958_c7_4077_cond <= VAR_n16_MUX_uxn_opcodes_h_l958_c7_4077_cond;
     n16_MUX_uxn_opcodes_h_l958_c7_4077_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l958_c7_4077_iftrue;
     n16_MUX_uxn_opcodes_h_l958_c7_4077_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l958_c7_4077_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l958_c7_4077_return_output := n16_MUX_uxn_opcodes_h_l958_c7_4077_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l958_c7_4077] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c7_4077_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c7_4077_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c7_4077_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c7_4077_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c7_4077_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c7_4077_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c7_4077_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c7_4077_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l950_c2_7edb] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l950_c2_7edb_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l950_c2_7edb_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l950_c2_7edb_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l950_c2_7edb_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l950_c2_7edb_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l950_c2_7edb_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l950_c2_7edb_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l950_c2_7edb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l962_c7_2eb7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_2eb7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_2eb7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_2eb7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_2eb7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_2eb7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_2eb7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_2eb7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_2eb7_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l962_c7_2eb7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l962_c7_2eb7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c7_2eb7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l962_c7_2eb7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c7_2eb7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l962_c7_2eb7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c7_2eb7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c7_2eb7_return_output := result_stack_value_MUX_uxn_opcodes_h_l962_c7_2eb7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l962_c7_2eb7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_2eb7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_2eb7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_2eb7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_2eb7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_2eb7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_2eb7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_2eb7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_2eb7_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l950_c2_7edb_iffalse := VAR_n16_MUX_uxn_opcodes_h_l958_c7_4077_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l958_c7_4077_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_2eb7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l950_c2_7edb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l958_c7_4077_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l958_c7_4077_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_2eb7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c7_4077_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_2eb7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c2_7edb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c7_4077_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l958_c7_4077_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c7_2eb7_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l958_c7_4077] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l958_c7_4077_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l958_c7_4077_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l958_c7_4077_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l958_c7_4077_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l958_c7_4077_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l958_c7_4077_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l958_c7_4077_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l958_c7_4077_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l958_c7_4077] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l958_c7_4077_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l958_c7_4077_cond;
     result_stack_value_MUX_uxn_opcodes_h_l958_c7_4077_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l958_c7_4077_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l958_c7_4077_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l958_c7_4077_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l958_c7_4077_return_output := result_stack_value_MUX_uxn_opcodes_h_l958_c7_4077_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l958_c7_4077] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c7_4077_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c7_4077_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c7_4077_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c7_4077_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c7_4077_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c7_4077_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c7_4077_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c7_4077_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l958_c7_4077] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l958_c7_4077_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l958_c7_4077_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l958_c7_4077_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l958_c7_4077_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l958_c7_4077_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l958_c7_4077_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l958_c7_4077_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l958_c7_4077_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l950_c2_7edb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l950_c2_7edb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l950_c2_7edb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l950_c2_7edb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l950_c2_7edb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l950_c2_7edb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l950_c2_7edb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l950_c2_7edb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l950_c2_7edb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l950_c2_7edb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c2_7edb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c2_7edb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c2_7edb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c2_7edb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c2_7edb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c2_7edb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c2_7edb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c2_7edb_return_output;

     -- n16_MUX[uxn_opcodes_h_l950_c2_7edb] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l950_c2_7edb_cond <= VAR_n16_MUX_uxn_opcodes_h_l950_c2_7edb_cond;
     n16_MUX_uxn_opcodes_h_l950_c2_7edb_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l950_c2_7edb_iftrue;
     n16_MUX_uxn_opcodes_h_l950_c2_7edb_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l950_c2_7edb_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l950_c2_7edb_return_output := n16_MUX_uxn_opcodes_h_l950_c2_7edb_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l950_c2_7edb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c2_7edb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l958_c7_4077_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c2_7edb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l958_c7_4077_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c2_7edb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c7_4077_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l950_c2_7edb_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l958_c7_4077_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l950_c2_7edb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l950_c2_7edb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c2_7edb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l950_c2_7edb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c2_7edb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l950_c2_7edb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c2_7edb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c2_7edb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l950_c2_7edb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l950_c2_7edb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c2_7edb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c2_7edb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c2_7edb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c2_7edb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c2_7edb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c2_7edb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c2_7edb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c2_7edb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l950_c2_7edb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l950_c2_7edb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c2_7edb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l950_c2_7edb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c2_7edb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l950_c2_7edb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c2_7edb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c2_7edb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l950_c2_7edb_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l950_c2_7edb] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l950_c2_7edb_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l950_c2_7edb_cond;
     result_stack_value_MUX_uxn_opcodes_h_l950_c2_7edb_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l950_c2_7edb_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l950_c2_7edb_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l950_c2_7edb_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l950_c2_7edb_return_output := result_stack_value_MUX_uxn_opcodes_h_l950_c2_7edb_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l1008_l946_DUPLICATE_6d7d LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l1008_l946_DUPLICATE_6d7d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_49dd(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c2_7edb_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c2_7edb_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l950_c2_7edb_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l950_c2_7edb_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c2_7edb_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l950_c2_7edb_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c2_7edb_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l950_c2_7edb_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l1008_l946_DUPLICATE_6d7d_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l1008_l946_DUPLICATE_6d7d_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
