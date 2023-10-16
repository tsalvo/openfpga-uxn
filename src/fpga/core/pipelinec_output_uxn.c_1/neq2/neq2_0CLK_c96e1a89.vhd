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
-- Submodules: 91
entity neq2_0CLK_c96e1a89 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end neq2_0CLK_c96e1a89;
architecture arch of neq2_0CLK_c96e1a89 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1350_c6_faa1]
signal BIN_OP_EQ_uxn_opcodes_h_l1350_c6_faa1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1350_c6_faa1_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1350_c6_faa1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1350_c1_4f2f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1350_c1_4f2f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1350_c1_4f2f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1350_c1_4f2f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1350_c1_4f2f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1350_c2_a11c]
signal n16_MUX_uxn_opcodes_h_l1350_c2_a11c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1350_c2_a11c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1350_c2_a11c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1350_c2_a11c_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1350_c2_a11c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c2_a11c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c2_a11c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c2_a11c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c2_a11c_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1350_c2_a11c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c2_a11c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c2_a11c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c2_a11c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c2_a11c_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1350_c2_a11c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c2_a11c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c2_a11c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c2_a11c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c2_a11c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1350_c2_a11c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1350_c2_a11c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1350_c2_a11c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1350_c2_a11c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1350_c2_a11c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1350_c2_a11c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1350_c2_a11c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1350_c2_a11c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1350_c2_a11c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1350_c2_a11c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1350_c2_a11c]
signal result_u8_value_MUX_uxn_opcodes_h_l1350_c2_a11c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1350_c2_a11c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1350_c2_a11c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1350_c2_a11c_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1350_c2_a11c]
signal t16_MUX_uxn_opcodes_h_l1350_c2_a11c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1350_c2_a11c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1350_c2_a11c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1350_c2_a11c_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1351_c3_f169[uxn_opcodes_h_l1351_c3_f169]
signal printf_uxn_opcodes_h_l1351_c3_f169_uxn_opcodes_h_l1351_c3_f169_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1355_c11_7ebe]
signal BIN_OP_EQ_uxn_opcodes_h_l1355_c11_7ebe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1355_c11_7ebe_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1355_c11_7ebe_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1355_c7_d899]
signal n16_MUX_uxn_opcodes_h_l1355_c7_d899_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1355_c7_d899_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1355_c7_d899_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1355_c7_d899_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1355_c7_d899]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c7_d899_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c7_d899_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c7_d899_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c7_d899_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1355_c7_d899]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c7_d899_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c7_d899_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c7_d899_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c7_d899_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1355_c7_d899]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c7_d899_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c7_d899_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c7_d899_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c7_d899_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1355_c7_d899]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1355_c7_d899_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1355_c7_d899_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1355_c7_d899_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1355_c7_d899_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1355_c7_d899]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1355_c7_d899_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1355_c7_d899_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1355_c7_d899_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1355_c7_d899_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1355_c7_d899]
signal result_u8_value_MUX_uxn_opcodes_h_l1355_c7_d899_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1355_c7_d899_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1355_c7_d899_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1355_c7_d899_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1355_c7_d899]
signal t16_MUX_uxn_opcodes_h_l1355_c7_d899_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1355_c7_d899_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1355_c7_d899_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1355_c7_d899_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1358_c11_3ebb]
signal BIN_OP_EQ_uxn_opcodes_h_l1358_c11_3ebb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1358_c11_3ebb_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1358_c11_3ebb_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1358_c7_fa45]
signal n16_MUX_uxn_opcodes_h_l1358_c7_fa45_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1358_c7_fa45_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1358_c7_fa45_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1358_c7_fa45_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1358_c7_fa45]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_fa45_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_fa45_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_fa45_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_fa45_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1358_c7_fa45]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_fa45_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_fa45_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_fa45_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_fa45_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1358_c7_fa45]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_fa45_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_fa45_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_fa45_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_fa45_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1358_c7_fa45]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_fa45_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_fa45_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_fa45_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_fa45_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1358_c7_fa45]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_fa45_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_fa45_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_fa45_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_fa45_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1358_c7_fa45]
signal result_u8_value_MUX_uxn_opcodes_h_l1358_c7_fa45_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1358_c7_fa45_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1358_c7_fa45_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1358_c7_fa45_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1358_c7_fa45]
signal t16_MUX_uxn_opcodes_h_l1358_c7_fa45_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1358_c7_fa45_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1358_c7_fa45_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1358_c7_fa45_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1363_c11_9b5c]
signal BIN_OP_EQ_uxn_opcodes_h_l1363_c11_9b5c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1363_c11_9b5c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1363_c11_9b5c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1363_c7_86d7]
signal n16_MUX_uxn_opcodes_h_l1363_c7_86d7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1363_c7_86d7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1363_c7_86d7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1363_c7_86d7_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1363_c7_86d7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_86d7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_86d7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_86d7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_86d7_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1363_c7_86d7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_86d7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_86d7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_86d7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_86d7_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1363_c7_86d7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_86d7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_86d7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_86d7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_86d7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1363_c7_86d7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_86d7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_86d7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_86d7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_86d7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1363_c7_86d7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_86d7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_86d7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_86d7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_86d7_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1363_c7_86d7]
signal result_u8_value_MUX_uxn_opcodes_h_l1363_c7_86d7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1363_c7_86d7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1363_c7_86d7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1363_c7_86d7_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1363_c7_86d7]
signal t16_MUX_uxn_opcodes_h_l1363_c7_86d7_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1363_c7_86d7_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1363_c7_86d7_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1363_c7_86d7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1366_c11_fc38]
signal BIN_OP_EQ_uxn_opcodes_h_l1366_c11_fc38_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1366_c11_fc38_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1366_c11_fc38_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1366_c7_8443]
signal n16_MUX_uxn_opcodes_h_l1366_c7_8443_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1366_c7_8443_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1366_c7_8443_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1366_c7_8443_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1366_c7_8443]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_8443_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_8443_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_8443_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_8443_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1366_c7_8443]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_8443_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_8443_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_8443_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_8443_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1366_c7_8443]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_8443_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_8443_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_8443_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_8443_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1366_c7_8443]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_8443_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_8443_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_8443_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_8443_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1366_c7_8443]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_8443_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_8443_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_8443_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_8443_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1366_c7_8443]
signal result_u8_value_MUX_uxn_opcodes_h_l1366_c7_8443_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1366_c7_8443_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1366_c7_8443_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1366_c7_8443_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1366_c7_8443]
signal t16_MUX_uxn_opcodes_h_l1366_c7_8443_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1366_c7_8443_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1366_c7_8443_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1366_c7_8443_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1367_c3_73ba]
signal BIN_OP_OR_uxn_opcodes_h_l1367_c3_73ba_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1367_c3_73ba_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1367_c3_73ba_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1370_c11_9d85]
signal BIN_OP_EQ_uxn_opcodes_h_l1370_c11_9d85_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1370_c11_9d85_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1370_c11_9d85_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1370_c7_26da]
signal n16_MUX_uxn_opcodes_h_l1370_c7_26da_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1370_c7_26da_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1370_c7_26da_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1370_c7_26da_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1370_c7_26da]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_26da_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_26da_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_26da_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_26da_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1370_c7_26da]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_26da_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_26da_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_26da_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_26da_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1370_c7_26da]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_26da_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_26da_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_26da_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_26da_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1370_c7_26da]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_26da_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_26da_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_26da_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_26da_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1370_c7_26da]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_26da_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_26da_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_26da_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_26da_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1370_c7_26da]
signal result_u8_value_MUX_uxn_opcodes_h_l1370_c7_26da_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1370_c7_26da_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1370_c7_26da_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1370_c7_26da_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1373_c11_651b]
signal BIN_OP_EQ_uxn_opcodes_h_l1373_c11_651b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1373_c11_651b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1373_c11_651b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1373_c7_9a55]
signal n16_MUX_uxn_opcodes_h_l1373_c7_9a55_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1373_c7_9a55_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1373_c7_9a55_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1373_c7_9a55_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1373_c7_9a55]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_9a55_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_9a55_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_9a55_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_9a55_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1373_c7_9a55]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_9a55_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_9a55_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_9a55_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_9a55_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1373_c7_9a55]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_9a55_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_9a55_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_9a55_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_9a55_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1373_c7_9a55]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_9a55_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_9a55_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_9a55_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_9a55_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1373_c7_9a55]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_9a55_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_9a55_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_9a55_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_9a55_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1373_c7_9a55]
signal result_u8_value_MUX_uxn_opcodes_h_l1373_c7_9a55_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1373_c7_9a55_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1373_c7_9a55_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1373_c7_9a55_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1378_c11_f143]
signal BIN_OP_EQ_uxn_opcodes_h_l1378_c11_f143_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1378_c11_f143_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1378_c11_f143_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1378_c7_27ff]
signal n16_MUX_uxn_opcodes_h_l1378_c7_27ff_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1378_c7_27ff_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1378_c7_27ff_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1378_c7_27ff_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1378_c7_27ff]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_27ff_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_27ff_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_27ff_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_27ff_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1378_c7_27ff]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_27ff_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_27ff_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_27ff_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_27ff_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1378_c7_27ff]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_27ff_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_27ff_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_27ff_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_27ff_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1378_c7_27ff]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_27ff_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_27ff_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_27ff_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_27ff_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1378_c7_27ff]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_27ff_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_27ff_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_27ff_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_27ff_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1378_c7_27ff]
signal result_u8_value_MUX_uxn_opcodes_h_l1378_c7_27ff_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1378_c7_27ff_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1378_c7_27ff_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1378_c7_27ff_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1381_c11_9f13]
signal BIN_OP_EQ_uxn_opcodes_h_l1381_c11_9f13_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1381_c11_9f13_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1381_c11_9f13_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1381_c7_3aec]
signal n16_MUX_uxn_opcodes_h_l1381_c7_3aec_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1381_c7_3aec_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1381_c7_3aec_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1381_c7_3aec_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1381_c7_3aec]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_3aec_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_3aec_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_3aec_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_3aec_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1381_c7_3aec]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_3aec_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_3aec_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_3aec_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_3aec_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1381_c7_3aec]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_3aec_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_3aec_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_3aec_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_3aec_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1381_c7_3aec]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_3aec_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_3aec_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_3aec_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_3aec_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1381_c7_3aec]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_3aec_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_3aec_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_3aec_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_3aec_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1381_c7_3aec]
signal result_u8_value_MUX_uxn_opcodes_h_l1381_c7_3aec_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1381_c7_3aec_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1381_c7_3aec_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1381_c7_3aec_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1382_c3_ffa9]
signal BIN_OP_OR_uxn_opcodes_h_l1382_c3_ffa9_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1382_c3_ffa9_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1382_c3_ffa9_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1384_c30_b41c]
signal sp_relative_shift_uxn_opcodes_h_l1384_c30_b41c_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1384_c30_b41c_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1384_c30_b41c_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1384_c30_b41c_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1387_c21_bb07]
signal BIN_OP_EQ_uxn_opcodes_h_l1387_c21_bb07_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1387_c21_bb07_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1387_c21_bb07_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1387_c21_21af]
signal MUX_uxn_opcodes_h_l1387_c21_21af_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1387_c21_21af_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1387_c21_21af_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1387_c21_21af_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1389_c11_9229]
signal BIN_OP_EQ_uxn_opcodes_h_l1389_c11_9229_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1389_c11_9229_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1389_c11_9229_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1389_c7_566c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_566c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_566c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_566c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_566c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1389_c7_566c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_566c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_566c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_566c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_566c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1389_c7_566c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_566c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_566c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_566c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_566c_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1375_l1360_DUPLICATE_09cc
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1375_l1360_DUPLICATE_09cc_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1375_l1360_DUPLICATE_09cc_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_8cda( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.u8_value := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1350_c6_faa1
BIN_OP_EQ_uxn_opcodes_h_l1350_c6_faa1 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1350_c6_faa1_left,
BIN_OP_EQ_uxn_opcodes_h_l1350_c6_faa1_right,
BIN_OP_EQ_uxn_opcodes_h_l1350_c6_faa1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1350_c1_4f2f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1350_c1_4f2f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1350_c1_4f2f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1350_c1_4f2f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1350_c1_4f2f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1350_c1_4f2f_return_output);

-- n16_MUX_uxn_opcodes_h_l1350_c2_a11c
n16_MUX_uxn_opcodes_h_l1350_c2_a11c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1350_c2_a11c_cond,
n16_MUX_uxn_opcodes_h_l1350_c2_a11c_iftrue,
n16_MUX_uxn_opcodes_h_l1350_c2_a11c_iffalse,
n16_MUX_uxn_opcodes_h_l1350_c2_a11c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c2_a11c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c2_a11c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c2_a11c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c2_a11c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c2_a11c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c2_a11c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c2_a11c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c2_a11c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c2_a11c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c2_a11c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c2_a11c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c2_a11c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c2_a11c
result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c2_a11c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c2_a11c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c2_a11c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c2_a11c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c2_a11c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1350_c2_a11c
result_is_opc_done_MUX_uxn_opcodes_h_l1350_c2_a11c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1350_c2_a11c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1350_c2_a11c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1350_c2_a11c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1350_c2_a11c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1350_c2_a11c
result_is_stack_write_MUX_uxn_opcodes_h_l1350_c2_a11c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1350_c2_a11c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1350_c2_a11c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1350_c2_a11c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1350_c2_a11c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1350_c2_a11c
result_u8_value_MUX_uxn_opcodes_h_l1350_c2_a11c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1350_c2_a11c_cond,
result_u8_value_MUX_uxn_opcodes_h_l1350_c2_a11c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1350_c2_a11c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1350_c2_a11c_return_output);

-- t16_MUX_uxn_opcodes_h_l1350_c2_a11c
t16_MUX_uxn_opcodes_h_l1350_c2_a11c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1350_c2_a11c_cond,
t16_MUX_uxn_opcodes_h_l1350_c2_a11c_iftrue,
t16_MUX_uxn_opcodes_h_l1350_c2_a11c_iffalse,
t16_MUX_uxn_opcodes_h_l1350_c2_a11c_return_output);

-- printf_uxn_opcodes_h_l1351_c3_f169_uxn_opcodes_h_l1351_c3_f169
printf_uxn_opcodes_h_l1351_c3_f169_uxn_opcodes_h_l1351_c3_f169 : entity work.printf_uxn_opcodes_h_l1351_c3_f169_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1351_c3_f169_uxn_opcodes_h_l1351_c3_f169_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1355_c11_7ebe
BIN_OP_EQ_uxn_opcodes_h_l1355_c11_7ebe : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1355_c11_7ebe_left,
BIN_OP_EQ_uxn_opcodes_h_l1355_c11_7ebe_right,
BIN_OP_EQ_uxn_opcodes_h_l1355_c11_7ebe_return_output);

-- n16_MUX_uxn_opcodes_h_l1355_c7_d899
n16_MUX_uxn_opcodes_h_l1355_c7_d899 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1355_c7_d899_cond,
n16_MUX_uxn_opcodes_h_l1355_c7_d899_iftrue,
n16_MUX_uxn_opcodes_h_l1355_c7_d899_iffalse,
n16_MUX_uxn_opcodes_h_l1355_c7_d899_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c7_d899
result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c7_d899 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c7_d899_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c7_d899_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c7_d899_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c7_d899_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c7_d899
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c7_d899 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c7_d899_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c7_d899_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c7_d899_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c7_d899_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c7_d899
result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c7_d899 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c7_d899_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c7_d899_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c7_d899_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c7_d899_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1355_c7_d899
result_is_opc_done_MUX_uxn_opcodes_h_l1355_c7_d899 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1355_c7_d899_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1355_c7_d899_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1355_c7_d899_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1355_c7_d899_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1355_c7_d899
result_is_stack_write_MUX_uxn_opcodes_h_l1355_c7_d899 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1355_c7_d899_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1355_c7_d899_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1355_c7_d899_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1355_c7_d899_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1355_c7_d899
result_u8_value_MUX_uxn_opcodes_h_l1355_c7_d899 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1355_c7_d899_cond,
result_u8_value_MUX_uxn_opcodes_h_l1355_c7_d899_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1355_c7_d899_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1355_c7_d899_return_output);

-- t16_MUX_uxn_opcodes_h_l1355_c7_d899
t16_MUX_uxn_opcodes_h_l1355_c7_d899 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1355_c7_d899_cond,
t16_MUX_uxn_opcodes_h_l1355_c7_d899_iftrue,
t16_MUX_uxn_opcodes_h_l1355_c7_d899_iffalse,
t16_MUX_uxn_opcodes_h_l1355_c7_d899_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1358_c11_3ebb
BIN_OP_EQ_uxn_opcodes_h_l1358_c11_3ebb : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1358_c11_3ebb_left,
BIN_OP_EQ_uxn_opcodes_h_l1358_c11_3ebb_right,
BIN_OP_EQ_uxn_opcodes_h_l1358_c11_3ebb_return_output);

-- n16_MUX_uxn_opcodes_h_l1358_c7_fa45
n16_MUX_uxn_opcodes_h_l1358_c7_fa45 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1358_c7_fa45_cond,
n16_MUX_uxn_opcodes_h_l1358_c7_fa45_iftrue,
n16_MUX_uxn_opcodes_h_l1358_c7_fa45_iffalse,
n16_MUX_uxn_opcodes_h_l1358_c7_fa45_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_fa45
result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_fa45 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_fa45_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_fa45_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_fa45_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_fa45_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_fa45
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_fa45 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_fa45_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_fa45_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_fa45_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_fa45_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_fa45
result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_fa45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_fa45_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_fa45_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_fa45_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_fa45_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_fa45
result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_fa45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_fa45_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_fa45_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_fa45_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_fa45_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_fa45
result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_fa45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_fa45_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_fa45_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_fa45_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_fa45_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1358_c7_fa45
result_u8_value_MUX_uxn_opcodes_h_l1358_c7_fa45 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1358_c7_fa45_cond,
result_u8_value_MUX_uxn_opcodes_h_l1358_c7_fa45_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1358_c7_fa45_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1358_c7_fa45_return_output);

-- t16_MUX_uxn_opcodes_h_l1358_c7_fa45
t16_MUX_uxn_opcodes_h_l1358_c7_fa45 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1358_c7_fa45_cond,
t16_MUX_uxn_opcodes_h_l1358_c7_fa45_iftrue,
t16_MUX_uxn_opcodes_h_l1358_c7_fa45_iffalse,
t16_MUX_uxn_opcodes_h_l1358_c7_fa45_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1363_c11_9b5c
BIN_OP_EQ_uxn_opcodes_h_l1363_c11_9b5c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1363_c11_9b5c_left,
BIN_OP_EQ_uxn_opcodes_h_l1363_c11_9b5c_right,
BIN_OP_EQ_uxn_opcodes_h_l1363_c11_9b5c_return_output);

-- n16_MUX_uxn_opcodes_h_l1363_c7_86d7
n16_MUX_uxn_opcodes_h_l1363_c7_86d7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1363_c7_86d7_cond,
n16_MUX_uxn_opcodes_h_l1363_c7_86d7_iftrue,
n16_MUX_uxn_opcodes_h_l1363_c7_86d7_iffalse,
n16_MUX_uxn_opcodes_h_l1363_c7_86d7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_86d7
result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_86d7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_86d7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_86d7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_86d7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_86d7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_86d7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_86d7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_86d7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_86d7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_86d7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_86d7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_86d7
result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_86d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_86d7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_86d7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_86d7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_86d7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_86d7
result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_86d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_86d7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_86d7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_86d7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_86d7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_86d7
result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_86d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_86d7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_86d7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_86d7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_86d7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1363_c7_86d7
result_u8_value_MUX_uxn_opcodes_h_l1363_c7_86d7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1363_c7_86d7_cond,
result_u8_value_MUX_uxn_opcodes_h_l1363_c7_86d7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1363_c7_86d7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1363_c7_86d7_return_output);

-- t16_MUX_uxn_opcodes_h_l1363_c7_86d7
t16_MUX_uxn_opcodes_h_l1363_c7_86d7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1363_c7_86d7_cond,
t16_MUX_uxn_opcodes_h_l1363_c7_86d7_iftrue,
t16_MUX_uxn_opcodes_h_l1363_c7_86d7_iffalse,
t16_MUX_uxn_opcodes_h_l1363_c7_86d7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1366_c11_fc38
BIN_OP_EQ_uxn_opcodes_h_l1366_c11_fc38 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1366_c11_fc38_left,
BIN_OP_EQ_uxn_opcodes_h_l1366_c11_fc38_right,
BIN_OP_EQ_uxn_opcodes_h_l1366_c11_fc38_return_output);

-- n16_MUX_uxn_opcodes_h_l1366_c7_8443
n16_MUX_uxn_opcodes_h_l1366_c7_8443 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1366_c7_8443_cond,
n16_MUX_uxn_opcodes_h_l1366_c7_8443_iftrue,
n16_MUX_uxn_opcodes_h_l1366_c7_8443_iffalse,
n16_MUX_uxn_opcodes_h_l1366_c7_8443_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_8443
result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_8443 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_8443_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_8443_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_8443_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_8443_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_8443
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_8443 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_8443_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_8443_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_8443_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_8443_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_8443
result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_8443 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_8443_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_8443_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_8443_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_8443_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_8443
result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_8443 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_8443_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_8443_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_8443_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_8443_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_8443
result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_8443 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_8443_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_8443_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_8443_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_8443_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1366_c7_8443
result_u8_value_MUX_uxn_opcodes_h_l1366_c7_8443 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1366_c7_8443_cond,
result_u8_value_MUX_uxn_opcodes_h_l1366_c7_8443_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1366_c7_8443_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1366_c7_8443_return_output);

-- t16_MUX_uxn_opcodes_h_l1366_c7_8443
t16_MUX_uxn_opcodes_h_l1366_c7_8443 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1366_c7_8443_cond,
t16_MUX_uxn_opcodes_h_l1366_c7_8443_iftrue,
t16_MUX_uxn_opcodes_h_l1366_c7_8443_iffalse,
t16_MUX_uxn_opcodes_h_l1366_c7_8443_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1367_c3_73ba
BIN_OP_OR_uxn_opcodes_h_l1367_c3_73ba : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1367_c3_73ba_left,
BIN_OP_OR_uxn_opcodes_h_l1367_c3_73ba_right,
BIN_OP_OR_uxn_opcodes_h_l1367_c3_73ba_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1370_c11_9d85
BIN_OP_EQ_uxn_opcodes_h_l1370_c11_9d85 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1370_c11_9d85_left,
BIN_OP_EQ_uxn_opcodes_h_l1370_c11_9d85_right,
BIN_OP_EQ_uxn_opcodes_h_l1370_c11_9d85_return_output);

-- n16_MUX_uxn_opcodes_h_l1370_c7_26da
n16_MUX_uxn_opcodes_h_l1370_c7_26da : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1370_c7_26da_cond,
n16_MUX_uxn_opcodes_h_l1370_c7_26da_iftrue,
n16_MUX_uxn_opcodes_h_l1370_c7_26da_iffalse,
n16_MUX_uxn_opcodes_h_l1370_c7_26da_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_26da
result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_26da : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_26da_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_26da_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_26da_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_26da_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_26da
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_26da : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_26da_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_26da_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_26da_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_26da_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_26da
result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_26da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_26da_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_26da_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_26da_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_26da_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_26da
result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_26da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_26da_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_26da_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_26da_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_26da_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_26da
result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_26da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_26da_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_26da_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_26da_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_26da_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1370_c7_26da
result_u8_value_MUX_uxn_opcodes_h_l1370_c7_26da : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1370_c7_26da_cond,
result_u8_value_MUX_uxn_opcodes_h_l1370_c7_26da_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1370_c7_26da_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1370_c7_26da_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1373_c11_651b
BIN_OP_EQ_uxn_opcodes_h_l1373_c11_651b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1373_c11_651b_left,
BIN_OP_EQ_uxn_opcodes_h_l1373_c11_651b_right,
BIN_OP_EQ_uxn_opcodes_h_l1373_c11_651b_return_output);

-- n16_MUX_uxn_opcodes_h_l1373_c7_9a55
n16_MUX_uxn_opcodes_h_l1373_c7_9a55 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1373_c7_9a55_cond,
n16_MUX_uxn_opcodes_h_l1373_c7_9a55_iftrue,
n16_MUX_uxn_opcodes_h_l1373_c7_9a55_iffalse,
n16_MUX_uxn_opcodes_h_l1373_c7_9a55_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_9a55
result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_9a55 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_9a55_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_9a55_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_9a55_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_9a55_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_9a55
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_9a55 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_9a55_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_9a55_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_9a55_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_9a55_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_9a55
result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_9a55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_9a55_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_9a55_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_9a55_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_9a55_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_9a55
result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_9a55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_9a55_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_9a55_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_9a55_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_9a55_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_9a55
result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_9a55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_9a55_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_9a55_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_9a55_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_9a55_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1373_c7_9a55
result_u8_value_MUX_uxn_opcodes_h_l1373_c7_9a55 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1373_c7_9a55_cond,
result_u8_value_MUX_uxn_opcodes_h_l1373_c7_9a55_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1373_c7_9a55_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1373_c7_9a55_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1378_c11_f143
BIN_OP_EQ_uxn_opcodes_h_l1378_c11_f143 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1378_c11_f143_left,
BIN_OP_EQ_uxn_opcodes_h_l1378_c11_f143_right,
BIN_OP_EQ_uxn_opcodes_h_l1378_c11_f143_return_output);

-- n16_MUX_uxn_opcodes_h_l1378_c7_27ff
n16_MUX_uxn_opcodes_h_l1378_c7_27ff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1378_c7_27ff_cond,
n16_MUX_uxn_opcodes_h_l1378_c7_27ff_iftrue,
n16_MUX_uxn_opcodes_h_l1378_c7_27ff_iffalse,
n16_MUX_uxn_opcodes_h_l1378_c7_27ff_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_27ff
result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_27ff : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_27ff_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_27ff_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_27ff_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_27ff_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_27ff
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_27ff : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_27ff_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_27ff_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_27ff_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_27ff_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_27ff
result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_27ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_27ff_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_27ff_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_27ff_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_27ff_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_27ff
result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_27ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_27ff_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_27ff_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_27ff_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_27ff_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_27ff
result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_27ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_27ff_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_27ff_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_27ff_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_27ff_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1378_c7_27ff
result_u8_value_MUX_uxn_opcodes_h_l1378_c7_27ff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1378_c7_27ff_cond,
result_u8_value_MUX_uxn_opcodes_h_l1378_c7_27ff_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1378_c7_27ff_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1378_c7_27ff_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1381_c11_9f13
BIN_OP_EQ_uxn_opcodes_h_l1381_c11_9f13 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1381_c11_9f13_left,
BIN_OP_EQ_uxn_opcodes_h_l1381_c11_9f13_right,
BIN_OP_EQ_uxn_opcodes_h_l1381_c11_9f13_return_output);

-- n16_MUX_uxn_opcodes_h_l1381_c7_3aec
n16_MUX_uxn_opcodes_h_l1381_c7_3aec : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1381_c7_3aec_cond,
n16_MUX_uxn_opcodes_h_l1381_c7_3aec_iftrue,
n16_MUX_uxn_opcodes_h_l1381_c7_3aec_iffalse,
n16_MUX_uxn_opcodes_h_l1381_c7_3aec_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_3aec
result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_3aec : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_3aec_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_3aec_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_3aec_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_3aec_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_3aec
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_3aec : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_3aec_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_3aec_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_3aec_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_3aec_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_3aec
result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_3aec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_3aec_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_3aec_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_3aec_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_3aec_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_3aec
result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_3aec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_3aec_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_3aec_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_3aec_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_3aec_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_3aec
result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_3aec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_3aec_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_3aec_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_3aec_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_3aec_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1381_c7_3aec
result_u8_value_MUX_uxn_opcodes_h_l1381_c7_3aec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1381_c7_3aec_cond,
result_u8_value_MUX_uxn_opcodes_h_l1381_c7_3aec_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1381_c7_3aec_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1381_c7_3aec_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1382_c3_ffa9
BIN_OP_OR_uxn_opcodes_h_l1382_c3_ffa9 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1382_c3_ffa9_left,
BIN_OP_OR_uxn_opcodes_h_l1382_c3_ffa9_right,
BIN_OP_OR_uxn_opcodes_h_l1382_c3_ffa9_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1384_c30_b41c
sp_relative_shift_uxn_opcodes_h_l1384_c30_b41c : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1384_c30_b41c_ins,
sp_relative_shift_uxn_opcodes_h_l1384_c30_b41c_x,
sp_relative_shift_uxn_opcodes_h_l1384_c30_b41c_y,
sp_relative_shift_uxn_opcodes_h_l1384_c30_b41c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1387_c21_bb07
BIN_OP_EQ_uxn_opcodes_h_l1387_c21_bb07 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1387_c21_bb07_left,
BIN_OP_EQ_uxn_opcodes_h_l1387_c21_bb07_right,
BIN_OP_EQ_uxn_opcodes_h_l1387_c21_bb07_return_output);

-- MUX_uxn_opcodes_h_l1387_c21_21af
MUX_uxn_opcodes_h_l1387_c21_21af : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1387_c21_21af_cond,
MUX_uxn_opcodes_h_l1387_c21_21af_iftrue,
MUX_uxn_opcodes_h_l1387_c21_21af_iffalse,
MUX_uxn_opcodes_h_l1387_c21_21af_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1389_c11_9229
BIN_OP_EQ_uxn_opcodes_h_l1389_c11_9229 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1389_c11_9229_left,
BIN_OP_EQ_uxn_opcodes_h_l1389_c11_9229_right,
BIN_OP_EQ_uxn_opcodes_h_l1389_c11_9229_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_566c
result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_566c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_566c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_566c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_566c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_566c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_566c
result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_566c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_566c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_566c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_566c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_566c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_566c
result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_566c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_566c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_566c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_566c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_566c_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1375_l1360_DUPLICATE_09cc
CONST_SL_8_uint16_t_uxn_opcodes_h_l1375_l1360_DUPLICATE_09cc : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1375_l1360_DUPLICATE_09cc_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1375_l1360_DUPLICATE_09cc_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 n16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1350_c6_faa1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1350_c1_4f2f_return_output,
 n16_MUX_uxn_opcodes_h_l1350_c2_a11c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c2_a11c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c2_a11c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c2_a11c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1350_c2_a11c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1350_c2_a11c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1350_c2_a11c_return_output,
 t16_MUX_uxn_opcodes_h_l1350_c2_a11c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1355_c11_7ebe_return_output,
 n16_MUX_uxn_opcodes_h_l1355_c7_d899_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c7_d899_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c7_d899_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c7_d899_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1355_c7_d899_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1355_c7_d899_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1355_c7_d899_return_output,
 t16_MUX_uxn_opcodes_h_l1355_c7_d899_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1358_c11_3ebb_return_output,
 n16_MUX_uxn_opcodes_h_l1358_c7_fa45_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_fa45_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_fa45_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_fa45_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_fa45_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_fa45_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1358_c7_fa45_return_output,
 t16_MUX_uxn_opcodes_h_l1358_c7_fa45_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1363_c11_9b5c_return_output,
 n16_MUX_uxn_opcodes_h_l1363_c7_86d7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_86d7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_86d7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_86d7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_86d7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_86d7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1363_c7_86d7_return_output,
 t16_MUX_uxn_opcodes_h_l1363_c7_86d7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1366_c11_fc38_return_output,
 n16_MUX_uxn_opcodes_h_l1366_c7_8443_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_8443_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_8443_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_8443_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_8443_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_8443_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1366_c7_8443_return_output,
 t16_MUX_uxn_opcodes_h_l1366_c7_8443_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1367_c3_73ba_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1370_c11_9d85_return_output,
 n16_MUX_uxn_opcodes_h_l1370_c7_26da_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_26da_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_26da_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_26da_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_26da_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_26da_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1370_c7_26da_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1373_c11_651b_return_output,
 n16_MUX_uxn_opcodes_h_l1373_c7_9a55_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_9a55_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_9a55_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_9a55_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_9a55_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_9a55_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1373_c7_9a55_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1378_c11_f143_return_output,
 n16_MUX_uxn_opcodes_h_l1378_c7_27ff_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_27ff_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_27ff_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_27ff_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_27ff_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_27ff_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1378_c7_27ff_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1381_c11_9f13_return_output,
 n16_MUX_uxn_opcodes_h_l1381_c7_3aec_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_3aec_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_3aec_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_3aec_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_3aec_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_3aec_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1381_c7_3aec_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1382_c3_ffa9_return_output,
 sp_relative_shift_uxn_opcodes_h_l1384_c30_b41c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1387_c21_bb07_return_output,
 MUX_uxn_opcodes_h_l1387_c21_21af_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1389_c11_9229_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_566c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_566c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_566c_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1375_l1360_DUPLICATE_09cc_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c6_faa1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c6_faa1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c6_faa1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1350_c1_4f2f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1350_c1_4f2f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1350_c1_4f2f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1350_c1_4f2f_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1350_c2_a11c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1350_c2_a11c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1355_c7_d899_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1350_c2_a11c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1350_c2_a11c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c2_a11c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c2_a11c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c7_d899_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c2_a11c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c2_a11c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c2_a11c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1352_c3_ab57 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c2_a11c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c7_d899_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c2_a11c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c2_a11c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c2_a11c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c2_a11c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c7_d899_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c2_a11c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c2_a11c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1350_c2_a11c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1350_c2_a11c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1355_c7_d899_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1350_c2_a11c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1350_c2_a11c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1350_c2_a11c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1350_c2_a11c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1355_c7_d899_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1350_c2_a11c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1350_c2_a11c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1350_c2_a11c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1350_c2_a11c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1355_c7_d899_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1350_c2_a11c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1350_c2_a11c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1350_c2_a11c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1350_c2_a11c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1355_c7_d899_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1350_c2_a11c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1350_c2_a11c_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1351_c3_f169_uxn_opcodes_h_l1351_c3_f169_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1355_c11_7ebe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1355_c11_7ebe_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1355_c11_7ebe_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1355_c7_d899_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1355_c7_d899_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1358_c7_fa45_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1355_c7_d899_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c7_d899_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c7_d899_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_fa45_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c7_d899_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c7_d899_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1356_c3_2262 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c7_d899_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_fa45_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c7_d899_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c7_d899_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c7_d899_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_fa45_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c7_d899_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1355_c7_d899_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1355_c7_d899_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_fa45_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1355_c7_d899_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1355_c7_d899_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1355_c7_d899_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_fa45_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1355_c7_d899_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1355_c7_d899_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1355_c7_d899_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1358_c7_fa45_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1355_c7_d899_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1355_c7_d899_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1355_c7_d899_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1358_c7_fa45_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1355_c7_d899_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_3ebb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_3ebb_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_3ebb_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1358_c7_fa45_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1358_c7_fa45_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1363_c7_86d7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1358_c7_fa45_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_fa45_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_fa45_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_86d7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_fa45_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_fa45_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1361_c3_3d7f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_fa45_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_86d7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_fa45_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_fa45_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_fa45_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_86d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_fa45_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_fa45_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_fa45_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_86d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_fa45_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_fa45_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_fa45_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_86d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_fa45_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1358_c7_fa45_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1358_c7_fa45_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1363_c7_86d7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1358_c7_fa45_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1358_c7_fa45_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1358_c7_fa45_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1363_c7_86d7_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1358_c7_fa45_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1363_c11_9b5c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1363_c11_9b5c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1363_c11_9b5c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1363_c7_86d7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1363_c7_86d7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1366_c7_8443_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1363_c7_86d7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_86d7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_86d7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_8443_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_86d7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_86d7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1364_c3_e3c8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_86d7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_8443_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_86d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_86d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_86d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_8443_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_86d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_86d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_86d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_8443_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_86d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_86d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_86d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_8443_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_86d7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1363_c7_86d7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1363_c7_86d7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1366_c7_8443_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1363_c7_86d7_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1363_c7_86d7_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1363_c7_86d7_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1366_c7_8443_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1363_c7_86d7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1366_c11_fc38_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1366_c11_fc38_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1366_c11_fc38_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1366_c7_8443_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1366_c7_8443_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1370_c7_26da_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1366_c7_8443_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_8443_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_8443_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_26da_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_8443_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_8443_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1368_c3_dbc1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_8443_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_26da_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_8443_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_8443_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_8443_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_26da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_8443_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_8443_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_8443_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_26da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_8443_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_8443_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_8443_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_26da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_8443_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1366_c7_8443_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1366_c7_8443_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1370_c7_26da_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1366_c7_8443_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1366_c7_8443_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1366_c7_8443_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1366_c7_8443_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1367_c3_73ba_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1367_c3_73ba_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1367_c3_73ba_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1370_c11_9d85_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1370_c11_9d85_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1370_c11_9d85_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1370_c7_26da_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1370_c7_26da_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1373_c7_9a55_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1370_c7_26da_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_26da_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_26da_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_9a55_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_26da_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_26da_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1371_c3_568a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_26da_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_9a55_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_26da_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_26da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_26da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_9a55_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_26da_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_26da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_26da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_9a55_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_26da_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_26da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_26da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_9a55_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_26da_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1370_c7_26da_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1370_c7_26da_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1373_c7_9a55_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1370_c7_26da_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_651b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_651b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_651b_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1373_c7_9a55_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1373_c7_9a55_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1378_c7_27ff_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1373_c7_9a55_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_9a55_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_9a55_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_27ff_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_9a55_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_9a55_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1376_c3_3d42 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_9a55_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_27ff_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_9a55_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_9a55_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_9a55_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_27ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_9a55_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_9a55_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_9a55_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_27ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_9a55_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_9a55_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_9a55_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_27ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_9a55_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1373_c7_9a55_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1373_c7_9a55_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1378_c7_27ff_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1373_c7_9a55_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_f143_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_f143_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_f143_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1378_c7_27ff_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1378_c7_27ff_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1381_c7_3aec_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1378_c7_27ff_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_27ff_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_27ff_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_3aec_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_27ff_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_27ff_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1379_c3_6333 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_27ff_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_3aec_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_27ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_27ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_27ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_3aec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_27ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_27ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_27ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_3aec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_27ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_27ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_27ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_3aec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_27ff_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1378_c7_27ff_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1378_c7_27ff_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1381_c7_3aec_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1378_c7_27ff_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_9f13_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_9f13_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_9f13_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1381_c7_3aec_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1381_c7_3aec_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1381_c7_3aec_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_3aec_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_3aec_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_3aec_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_3aec_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1386_c3_fae5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_3aec_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1381_c7_3aec_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_3aec_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_3aec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_3aec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_566c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_3aec_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_3aec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_3aec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_566c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_3aec_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_3aec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_3aec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_566c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_3aec_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1381_c7_3aec_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1381_c7_3aec_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1381_c7_3aec_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1382_c3_ffa9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1382_c3_ffa9_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1382_c3_ffa9_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1384_c30_b41c_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1384_c30_b41c_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1384_c30_b41c_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1384_c30_b41c_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1387_c21_21af_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1387_c21_21af_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1387_c21_21af_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1387_c21_bb07_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1387_c21_bb07_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1387_c21_bb07_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1387_c21_21af_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1389_c11_9229_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1389_c11_9229_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1389_c11_9229_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_566c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_566c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_566c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_566c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_566c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_566c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_566c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_566c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_566c_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1358_l1381_l1355_l1378_l1350_l1373_l1370_l1366_l1363_DUPLICATE_9f92_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1389_l1358_l1355_l1378_l1350_l1373_l1370_l1366_l1363_DUPLICATE_8a0c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1389_l1358_l1355_l1378_l1350_l1373_l1370_l1366_l1363_DUPLICATE_8575_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1358_l1381_l1355_l1378_l1350_l1373_l1370_l1366_l1363_DUPLICATE_5542_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1389_l1358_l1381_l1355_l1378_l1373_l1370_l1366_l1363_DUPLICATE_843b_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1359_l1374_l1382_l1367_DUPLICATE_adf9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1375_l1360_DUPLICATE_09cc_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1375_l1360_DUPLICATE_09cc_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l1346_l1395_DUPLICATE_8a39_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1361_c3_3d7f := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_fa45_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1361_c3_3d7f;
     VAR_MUX_uxn_opcodes_h_l1387_c21_21af_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1352_c3_ab57 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c2_a11c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1352_c3_ab57;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_566c_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_566c_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_566c_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1384_c30_b41c_y := resize(to_signed(-3, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c6_faa1_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1356_c3_2262 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c7_d899_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1356_c3_2262;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1389_c11_9229_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1370_c11_9d85_right := to_unsigned(5, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_3aec_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1368_c3_dbc1 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_8443_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1368_c3_dbc1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_3ebb_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_3aec_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1350_c2_a11c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_f143_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1376_c3_3d42 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_9a55_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1376_c3_3d42;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1364_c3_e3c8 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_86d7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1364_c3_e3c8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_9f13_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1371_c3_568a := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_26da_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1371_c3_568a;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1379_c3_6333 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_27ff_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1379_c3_6333;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1386_c3_fae5 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_3aec_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1386_c3_fae5;
     VAR_MUX_uxn_opcodes_h_l1387_c21_21af_iffalse := resize(to_unsigned(1, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1366_c11_fc38_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1355_c11_7ebe_right := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1350_c1_4f2f_iffalse := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1384_c30_b41c_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1363_c11_9b5c_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_651b_right := to_unsigned(6, 3);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1350_c1_4f2f_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1384_c30_b41c_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1382_c3_ffa9_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1350_c2_a11c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1355_c7_d899_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1358_c7_fa45_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1363_c7_86d7_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1366_c7_8443_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1370_c7_26da_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1378_c7_27ff_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1381_c7_3aec_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c6_faa1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1355_c11_7ebe_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_3ebb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1363_c11_9b5c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1366_c11_fc38_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1370_c11_9d85_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_651b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_f143_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_9f13_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1389_c11_9229_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1387_c21_bb07_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1367_c3_73ba_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1350_c2_a11c_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1355_c7_d899_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1363_c7_86d7_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1366_c7_8443_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1363_c11_9b5c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1363_c11_9b5c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1363_c11_9b5c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1363_c11_9b5c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1363_c11_9b5c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1363_c11_9b5c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1363_c11_9b5c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1389_l1358_l1381_l1355_l1378_l1373_l1370_l1366_l1363_DUPLICATE_843b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1389_l1358_l1381_l1355_l1378_l1373_l1370_l1366_l1363_DUPLICATE_843b_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1358_l1381_l1355_l1378_l1350_l1373_l1370_l1366_l1363_DUPLICATE_5542 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1358_l1381_l1355_l1378_l1350_l1373_l1370_l1366_l1363_DUPLICATE_5542_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1378_c11_f143] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1378_c11_f143_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_f143_left;
     BIN_OP_EQ_uxn_opcodes_h_l1378_c11_f143_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_f143_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_f143_return_output := BIN_OP_EQ_uxn_opcodes_h_l1378_c11_f143_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1381_c11_9f13] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1381_c11_9f13_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_9f13_left;
     BIN_OP_EQ_uxn_opcodes_h_l1381_c11_9f13_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_9f13_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_9f13_return_output := BIN_OP_EQ_uxn_opcodes_h_l1381_c11_9f13_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1359_l1374_l1382_l1367_DUPLICATE_adf9 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1359_l1374_l1382_l1367_DUPLICATE_adf9_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1389_l1358_l1355_l1378_l1350_l1373_l1370_l1366_l1363_DUPLICATE_8575 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1389_l1358_l1355_l1378_l1350_l1373_l1370_l1366_l1363_DUPLICATE_8575_return_output := result.is_stack_write;

     -- sp_relative_shift[uxn_opcodes_h_l1384_c30_b41c] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1384_c30_b41c_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1384_c30_b41c_ins;
     sp_relative_shift_uxn_opcodes_h_l1384_c30_b41c_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1384_c30_b41c_x;
     sp_relative_shift_uxn_opcodes_h_l1384_c30_b41c_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1384_c30_b41c_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1384_c30_b41c_return_output := sp_relative_shift_uxn_opcodes_h_l1384_c30_b41c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1373_c11_651b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1373_c11_651b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_651b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1373_c11_651b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_651b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_651b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1373_c11_651b_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1381_c7_3aec] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1381_c7_3aec_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1358_c11_3ebb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1358_c11_3ebb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_3ebb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1358_c11_3ebb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_3ebb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_3ebb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1358_c11_3ebb_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1358_l1381_l1355_l1378_l1350_l1373_l1370_l1366_l1363_DUPLICATE_9f92 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1358_l1381_l1355_l1378_l1350_l1373_l1370_l1366_l1363_DUPLICATE_9f92_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1389_c11_9229] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1389_c11_9229_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1389_c11_9229_left;
     BIN_OP_EQ_uxn_opcodes_h_l1389_c11_9229_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1389_c11_9229_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1389_c11_9229_return_output := BIN_OP_EQ_uxn_opcodes_h_l1389_c11_9229_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1370_c11_9d85] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1370_c11_9d85_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1370_c11_9d85_left;
     BIN_OP_EQ_uxn_opcodes_h_l1370_c11_9d85_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1370_c11_9d85_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1370_c11_9d85_return_output := BIN_OP_EQ_uxn_opcodes_h_l1370_c11_9d85_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1350_c6_faa1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1350_c6_faa1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c6_faa1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1350_c6_faa1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c6_faa1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c6_faa1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1350_c6_faa1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1355_c11_7ebe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1355_c11_7ebe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1355_c11_7ebe_left;
     BIN_OP_EQ_uxn_opcodes_h_l1355_c11_7ebe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1355_c11_7ebe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1355_c11_7ebe_return_output := BIN_OP_EQ_uxn_opcodes_h_l1355_c11_7ebe_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1366_c11_fc38] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1366_c11_fc38_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1366_c11_fc38_left;
     BIN_OP_EQ_uxn_opcodes_h_l1366_c11_fc38_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1366_c11_fc38_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1366_c11_fc38_return_output := BIN_OP_EQ_uxn_opcodes_h_l1366_c11_fc38_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1389_l1358_l1355_l1378_l1350_l1373_l1370_l1366_l1363_DUPLICATE_8a0c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1389_l1358_l1355_l1378_l1350_l1373_l1370_l1366_l1363_DUPLICATE_8a0c_return_output := result.is_sp_shift;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1350_c1_4f2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c6_faa1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1350_c2_a11c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c6_faa1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1350_c2_a11c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c6_faa1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c2_a11c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c6_faa1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1350_c2_a11c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c6_faa1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c2_a11c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c6_faa1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c2_a11c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c6_faa1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1350_c2_a11c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c6_faa1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1350_c2_a11c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c6_faa1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1355_c7_d899_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1355_c11_7ebe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1355_c7_d899_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1355_c11_7ebe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c7_d899_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1355_c11_7ebe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1355_c7_d899_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1355_c11_7ebe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c7_d899_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1355_c11_7ebe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c7_d899_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1355_c11_7ebe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1355_c7_d899_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1355_c11_7ebe_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1355_c7_d899_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1355_c11_7ebe_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1358_c7_fa45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_3ebb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_fa45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_3ebb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_fa45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_3ebb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_fa45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_3ebb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_fa45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_3ebb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_fa45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_3ebb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1358_c7_fa45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_3ebb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1358_c7_fa45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_3ebb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1363_c7_86d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1363_c11_9b5c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_86d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1363_c11_9b5c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_86d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1363_c11_9b5c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_86d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1363_c11_9b5c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_86d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1363_c11_9b5c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_86d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1363_c11_9b5c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1363_c7_86d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1363_c11_9b5c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1363_c7_86d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1363_c11_9b5c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1366_c7_8443_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1366_c11_fc38_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_8443_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1366_c11_fc38_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_8443_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1366_c11_fc38_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_8443_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1366_c11_fc38_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_8443_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1366_c11_fc38_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_8443_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1366_c11_fc38_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1366_c7_8443_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1366_c11_fc38_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1366_c7_8443_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1366_c11_fc38_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1370_c7_26da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1370_c11_9d85_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_26da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1370_c11_9d85_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_26da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1370_c11_9d85_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_26da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1370_c11_9d85_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_26da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1370_c11_9d85_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_26da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1370_c11_9d85_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1370_c7_26da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1370_c11_9d85_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1373_c7_9a55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_651b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_9a55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_651b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_9a55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_651b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_9a55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_651b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_9a55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_651b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_9a55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_651b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1373_c7_9a55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_651b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1378_c7_27ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_f143_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_27ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_f143_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_27ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_f143_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_27ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_f143_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_27ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_f143_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_27ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_f143_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1378_c7_27ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_f143_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1381_c7_3aec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_9f13_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_3aec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_9f13_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_3aec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_9f13_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_3aec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_9f13_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_3aec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_9f13_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_3aec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_9f13_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1381_c7_3aec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_9f13_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_566c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1389_c11_9229_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_566c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1389_c11_9229_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_566c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1389_c11_9229_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1367_c3_73ba_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1359_l1374_l1382_l1367_DUPLICATE_adf9_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1382_c3_ffa9_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1359_l1374_l1382_l1367_DUPLICATE_adf9_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1375_l1360_DUPLICATE_09cc_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1359_l1374_l1382_l1367_DUPLICATE_adf9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c2_a11c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1358_l1381_l1355_l1378_l1350_l1373_l1370_l1366_l1363_DUPLICATE_9f92_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c7_d899_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1358_l1381_l1355_l1378_l1350_l1373_l1370_l1366_l1363_DUPLICATE_9f92_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_fa45_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1358_l1381_l1355_l1378_l1350_l1373_l1370_l1366_l1363_DUPLICATE_9f92_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_86d7_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1358_l1381_l1355_l1378_l1350_l1373_l1370_l1366_l1363_DUPLICATE_9f92_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_8443_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1358_l1381_l1355_l1378_l1350_l1373_l1370_l1366_l1363_DUPLICATE_9f92_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_26da_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1358_l1381_l1355_l1378_l1350_l1373_l1370_l1366_l1363_DUPLICATE_9f92_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_9a55_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1358_l1381_l1355_l1378_l1350_l1373_l1370_l1366_l1363_DUPLICATE_9f92_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_27ff_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1358_l1381_l1355_l1378_l1350_l1373_l1370_l1366_l1363_DUPLICATE_9f92_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_3aec_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1358_l1381_l1355_l1378_l1350_l1373_l1370_l1366_l1363_DUPLICATE_9f92_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1355_c7_d899_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1389_l1358_l1381_l1355_l1378_l1373_l1370_l1366_l1363_DUPLICATE_843b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_fa45_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1389_l1358_l1381_l1355_l1378_l1373_l1370_l1366_l1363_DUPLICATE_843b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_86d7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1389_l1358_l1381_l1355_l1378_l1373_l1370_l1366_l1363_DUPLICATE_843b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_8443_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1389_l1358_l1381_l1355_l1378_l1373_l1370_l1366_l1363_DUPLICATE_843b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_26da_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1389_l1358_l1381_l1355_l1378_l1373_l1370_l1366_l1363_DUPLICATE_843b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_9a55_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1389_l1358_l1381_l1355_l1378_l1373_l1370_l1366_l1363_DUPLICATE_843b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_27ff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1389_l1358_l1381_l1355_l1378_l1373_l1370_l1366_l1363_DUPLICATE_843b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_3aec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1389_l1358_l1381_l1355_l1378_l1373_l1370_l1366_l1363_DUPLICATE_843b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_566c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1389_l1358_l1381_l1355_l1378_l1373_l1370_l1366_l1363_DUPLICATE_843b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c2_a11c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1389_l1358_l1355_l1378_l1350_l1373_l1370_l1366_l1363_DUPLICATE_8a0c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c7_d899_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1389_l1358_l1355_l1378_l1350_l1373_l1370_l1366_l1363_DUPLICATE_8a0c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_fa45_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1389_l1358_l1355_l1378_l1350_l1373_l1370_l1366_l1363_DUPLICATE_8a0c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_86d7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1389_l1358_l1355_l1378_l1350_l1373_l1370_l1366_l1363_DUPLICATE_8a0c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_8443_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1389_l1358_l1355_l1378_l1350_l1373_l1370_l1366_l1363_DUPLICATE_8a0c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_26da_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1389_l1358_l1355_l1378_l1350_l1373_l1370_l1366_l1363_DUPLICATE_8a0c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_9a55_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1389_l1358_l1355_l1378_l1350_l1373_l1370_l1366_l1363_DUPLICATE_8a0c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_27ff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1389_l1358_l1355_l1378_l1350_l1373_l1370_l1366_l1363_DUPLICATE_8a0c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_566c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1389_l1358_l1355_l1378_l1350_l1373_l1370_l1366_l1363_DUPLICATE_8a0c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1350_c2_a11c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1389_l1358_l1355_l1378_l1350_l1373_l1370_l1366_l1363_DUPLICATE_8575_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1355_c7_d899_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1389_l1358_l1355_l1378_l1350_l1373_l1370_l1366_l1363_DUPLICATE_8575_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_fa45_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1389_l1358_l1355_l1378_l1350_l1373_l1370_l1366_l1363_DUPLICATE_8575_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_86d7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1389_l1358_l1355_l1378_l1350_l1373_l1370_l1366_l1363_DUPLICATE_8575_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_8443_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1389_l1358_l1355_l1378_l1350_l1373_l1370_l1366_l1363_DUPLICATE_8575_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_26da_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1389_l1358_l1355_l1378_l1350_l1373_l1370_l1366_l1363_DUPLICATE_8575_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_9a55_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1389_l1358_l1355_l1378_l1350_l1373_l1370_l1366_l1363_DUPLICATE_8575_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_27ff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1389_l1358_l1355_l1378_l1350_l1373_l1370_l1366_l1363_DUPLICATE_8575_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_566c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1389_l1358_l1355_l1378_l1350_l1373_l1370_l1366_l1363_DUPLICATE_8575_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1350_c2_a11c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1358_l1381_l1355_l1378_l1350_l1373_l1370_l1366_l1363_DUPLICATE_5542_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1355_c7_d899_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1358_l1381_l1355_l1378_l1350_l1373_l1370_l1366_l1363_DUPLICATE_5542_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1358_c7_fa45_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1358_l1381_l1355_l1378_l1350_l1373_l1370_l1366_l1363_DUPLICATE_5542_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1363_c7_86d7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1358_l1381_l1355_l1378_l1350_l1373_l1370_l1366_l1363_DUPLICATE_5542_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1366_c7_8443_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1358_l1381_l1355_l1378_l1350_l1373_l1370_l1366_l1363_DUPLICATE_5542_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1370_c7_26da_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1358_l1381_l1355_l1378_l1350_l1373_l1370_l1366_l1363_DUPLICATE_5542_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1373_c7_9a55_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1358_l1381_l1355_l1378_l1350_l1373_l1370_l1366_l1363_DUPLICATE_5542_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1378_c7_27ff_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1358_l1381_l1355_l1378_l1350_l1373_l1370_l1366_l1363_DUPLICATE_5542_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1381_c7_3aec_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1358_l1381_l1355_l1378_l1350_l1373_l1370_l1366_l1363_DUPLICATE_5542_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_3aec_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1381_c7_3aec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_3aec_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1384_c30_b41c_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1381_c7_3aec] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_3aec_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_3aec_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_3aec_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_3aec_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_3aec_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_3aec_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_3aec_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_3aec_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1382_c3_ffa9] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1382_c3_ffa9_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1382_c3_ffa9_left;
     BIN_OP_OR_uxn_opcodes_h_l1382_c3_ffa9_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1382_c3_ffa9_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1382_c3_ffa9_return_output := BIN_OP_OR_uxn_opcodes_h_l1382_c3_ffa9_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1375_l1360_DUPLICATE_09cc LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1375_l1360_DUPLICATE_09cc_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1375_l1360_DUPLICATE_09cc_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1375_l1360_DUPLICATE_09cc_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1375_l1360_DUPLICATE_09cc_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1367_c3_73ba] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1367_c3_73ba_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1367_c3_73ba_left;
     BIN_OP_OR_uxn_opcodes_h_l1367_c3_73ba_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1367_c3_73ba_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1367_c3_73ba_return_output := BIN_OP_OR_uxn_opcodes_h_l1367_c3_73ba_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1389_c7_566c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_566c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_566c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_566c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_566c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_566c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_566c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_566c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_566c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1389_c7_566c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_566c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_566c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_566c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_566c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_566c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_566c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_566c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_566c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1389_c7_566c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_566c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_566c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_566c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_566c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_566c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_566c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_566c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_566c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1381_c7_3aec] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_3aec_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_3aec_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_3aec_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_3aec_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_3aec_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_3aec_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_3aec_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_3aec_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1350_c1_4f2f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1350_c1_4f2f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1350_c1_4f2f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1350_c1_4f2f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1350_c1_4f2f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1350_c1_4f2f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1350_c1_4f2f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1350_c1_4f2f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1350_c1_4f2f_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1366_c7_8443_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1367_c3_73ba_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1387_c21_bb07_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1382_c3_ffa9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1381_c7_3aec_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1382_c3_ffa9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1373_c7_9a55_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1375_l1360_DUPLICATE_09cc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1358_c7_fa45_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1375_l1360_DUPLICATE_09cc_return_output;
     VAR_printf_uxn_opcodes_h_l1351_c3_f169_uxn_opcodes_h_l1351_c3_f169_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1350_c1_4f2f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_3aec_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_566c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_3aec_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_566c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_3aec_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_566c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_27ff_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_3aec_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_27ff_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_3aec_return_output;
     -- t16_MUX[uxn_opcodes_h_l1366_c7_8443] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1366_c7_8443_cond <= VAR_t16_MUX_uxn_opcodes_h_l1366_c7_8443_cond;
     t16_MUX_uxn_opcodes_h_l1366_c7_8443_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1366_c7_8443_iftrue;
     t16_MUX_uxn_opcodes_h_l1366_c7_8443_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1366_c7_8443_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1366_c7_8443_return_output := t16_MUX_uxn_opcodes_h_l1366_c7_8443_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1378_c7_27ff] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_27ff_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_27ff_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_27ff_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_27ff_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_27ff_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_27ff_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_27ff_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_27ff_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1381_c7_3aec] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_3aec_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_3aec_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_3aec_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_3aec_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_3aec_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_3aec_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_3aec_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_3aec_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1381_c7_3aec] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_3aec_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_3aec_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_3aec_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_3aec_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_3aec_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_3aec_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_3aec_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_3aec_return_output;

     -- printf_uxn_opcodes_h_l1351_c3_f169[uxn_opcodes_h_l1351_c3_f169] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1351_c3_f169_uxn_opcodes_h_l1351_c3_f169_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1351_c3_f169_uxn_opcodes_h_l1351_c3_f169_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- n16_MUX[uxn_opcodes_h_l1381_c7_3aec] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1381_c7_3aec_cond <= VAR_n16_MUX_uxn_opcodes_h_l1381_c7_3aec_cond;
     n16_MUX_uxn_opcodes_h_l1381_c7_3aec_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1381_c7_3aec_iftrue;
     n16_MUX_uxn_opcodes_h_l1381_c7_3aec_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1381_c7_3aec_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1381_c7_3aec_return_output := n16_MUX_uxn_opcodes_h_l1381_c7_3aec_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1378_c7_27ff] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_27ff_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_27ff_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_27ff_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_27ff_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_27ff_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_27ff_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_27ff_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_27ff_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1387_c21_bb07] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1387_c21_bb07_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1387_c21_bb07_left;
     BIN_OP_EQ_uxn_opcodes_h_l1387_c21_bb07_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1387_c21_bb07_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1387_c21_bb07_return_output := BIN_OP_EQ_uxn_opcodes_h_l1387_c21_bb07_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1381_c7_3aec] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_3aec_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_3aec_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_3aec_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_3aec_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_3aec_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_3aec_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_3aec_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_3aec_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1387_c21_21af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1387_c21_bb07_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1378_c7_27ff_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1381_c7_3aec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_27ff_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_3aec_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_27ff_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_3aec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_27ff_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_3aec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_9a55_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_27ff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_9a55_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_27ff_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1363_c7_86d7_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1366_c7_8443_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1373_c7_9a55] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_9a55_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_9a55_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_9a55_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_9a55_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_9a55_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_9a55_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_9a55_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_9a55_return_output;

     -- t16_MUX[uxn_opcodes_h_l1363_c7_86d7] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1363_c7_86d7_cond <= VAR_t16_MUX_uxn_opcodes_h_l1363_c7_86d7_cond;
     t16_MUX_uxn_opcodes_h_l1363_c7_86d7_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1363_c7_86d7_iftrue;
     t16_MUX_uxn_opcodes_h_l1363_c7_86d7_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1363_c7_86d7_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1363_c7_86d7_return_output := t16_MUX_uxn_opcodes_h_l1363_c7_86d7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1373_c7_9a55] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_9a55_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_9a55_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_9a55_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_9a55_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_9a55_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_9a55_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_9a55_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_9a55_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1378_c7_27ff] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_27ff_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_27ff_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_27ff_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_27ff_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_27ff_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_27ff_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_27ff_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_27ff_return_output;

     -- MUX[uxn_opcodes_h_l1387_c21_21af] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1387_c21_21af_cond <= VAR_MUX_uxn_opcodes_h_l1387_c21_21af_cond;
     MUX_uxn_opcodes_h_l1387_c21_21af_iftrue <= VAR_MUX_uxn_opcodes_h_l1387_c21_21af_iftrue;
     MUX_uxn_opcodes_h_l1387_c21_21af_iffalse <= VAR_MUX_uxn_opcodes_h_l1387_c21_21af_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1387_c21_21af_return_output := MUX_uxn_opcodes_h_l1387_c21_21af_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1378_c7_27ff] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_27ff_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_27ff_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_27ff_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_27ff_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_27ff_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_27ff_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_27ff_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_27ff_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1378_c7_27ff] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_27ff_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_27ff_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_27ff_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_27ff_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_27ff_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_27ff_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_27ff_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_27ff_return_output;

     -- n16_MUX[uxn_opcodes_h_l1378_c7_27ff] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1378_c7_27ff_cond <= VAR_n16_MUX_uxn_opcodes_h_l1378_c7_27ff_cond;
     n16_MUX_uxn_opcodes_h_l1378_c7_27ff_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1378_c7_27ff_iftrue;
     n16_MUX_uxn_opcodes_h_l1378_c7_27ff_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1378_c7_27ff_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1378_c7_27ff_return_output := n16_MUX_uxn_opcodes_h_l1378_c7_27ff_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1381_c7_3aec_iftrue := VAR_MUX_uxn_opcodes_h_l1387_c21_21af_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1373_c7_9a55_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1378_c7_27ff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_9a55_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_27ff_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_9a55_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_27ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_9a55_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_27ff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_26da_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_9a55_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_26da_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_9a55_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1358_c7_fa45_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1363_c7_86d7_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1373_c7_9a55] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_9a55_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_9a55_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_9a55_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_9a55_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_9a55_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_9a55_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_9a55_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_9a55_return_output;

     -- t16_MUX[uxn_opcodes_h_l1358_c7_fa45] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1358_c7_fa45_cond <= VAR_t16_MUX_uxn_opcodes_h_l1358_c7_fa45_cond;
     t16_MUX_uxn_opcodes_h_l1358_c7_fa45_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1358_c7_fa45_iftrue;
     t16_MUX_uxn_opcodes_h_l1358_c7_fa45_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1358_c7_fa45_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1358_c7_fa45_return_output := t16_MUX_uxn_opcodes_h_l1358_c7_fa45_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1381_c7_3aec] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1381_c7_3aec_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1381_c7_3aec_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1381_c7_3aec_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1381_c7_3aec_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1381_c7_3aec_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1381_c7_3aec_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1381_c7_3aec_return_output := result_u8_value_MUX_uxn_opcodes_h_l1381_c7_3aec_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1373_c7_9a55] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_9a55_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_9a55_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_9a55_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_9a55_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_9a55_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_9a55_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_9a55_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_9a55_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1370_c7_26da] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_26da_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_26da_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_26da_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_26da_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_26da_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_26da_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_26da_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_26da_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1370_c7_26da] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_26da_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_26da_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_26da_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_26da_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_26da_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_26da_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_26da_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_26da_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1373_c7_9a55] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_9a55_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_9a55_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_9a55_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_9a55_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_9a55_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_9a55_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_9a55_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_9a55_return_output;

     -- n16_MUX[uxn_opcodes_h_l1373_c7_9a55] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1373_c7_9a55_cond <= VAR_n16_MUX_uxn_opcodes_h_l1373_c7_9a55_cond;
     n16_MUX_uxn_opcodes_h_l1373_c7_9a55_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1373_c7_9a55_iftrue;
     n16_MUX_uxn_opcodes_h_l1373_c7_9a55_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1373_c7_9a55_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1373_c7_9a55_return_output := n16_MUX_uxn_opcodes_h_l1373_c7_9a55_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1370_c7_26da_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1373_c7_9a55_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_26da_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_9a55_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_26da_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_9a55_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_26da_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_9a55_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_8443_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_26da_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_8443_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_26da_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1378_c7_27ff_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1381_c7_3aec_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1355_c7_d899_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1358_c7_fa45_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1370_c7_26da] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_26da_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_26da_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_26da_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_26da_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_26da_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_26da_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_26da_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_26da_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1370_c7_26da] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_26da_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_26da_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_26da_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_26da_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_26da_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_26da_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_26da_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_26da_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1366_c7_8443] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_8443_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_8443_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_8443_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_8443_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_8443_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_8443_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_8443_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_8443_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1378_c7_27ff] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1378_c7_27ff_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1378_c7_27ff_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1378_c7_27ff_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1378_c7_27ff_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1378_c7_27ff_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1378_c7_27ff_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1378_c7_27ff_return_output := result_u8_value_MUX_uxn_opcodes_h_l1378_c7_27ff_return_output;

     -- t16_MUX[uxn_opcodes_h_l1355_c7_d899] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1355_c7_d899_cond <= VAR_t16_MUX_uxn_opcodes_h_l1355_c7_d899_cond;
     t16_MUX_uxn_opcodes_h_l1355_c7_d899_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1355_c7_d899_iftrue;
     t16_MUX_uxn_opcodes_h_l1355_c7_d899_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1355_c7_d899_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1355_c7_d899_return_output := t16_MUX_uxn_opcodes_h_l1355_c7_d899_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1366_c7_8443] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_8443_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_8443_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_8443_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_8443_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_8443_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_8443_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_8443_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_8443_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1370_c7_26da] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_26da_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_26da_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_26da_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_26da_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_26da_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_26da_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_26da_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_26da_return_output;

     -- n16_MUX[uxn_opcodes_h_l1370_c7_26da] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1370_c7_26da_cond <= VAR_n16_MUX_uxn_opcodes_h_l1370_c7_26da_cond;
     n16_MUX_uxn_opcodes_h_l1370_c7_26da_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1370_c7_26da_iftrue;
     n16_MUX_uxn_opcodes_h_l1370_c7_26da_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1370_c7_26da_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1370_c7_26da_return_output := n16_MUX_uxn_opcodes_h_l1370_c7_26da_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1366_c7_8443_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1370_c7_26da_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_8443_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_26da_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_8443_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_26da_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_8443_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_26da_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_86d7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_8443_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_86d7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_8443_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1373_c7_9a55_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1378_c7_27ff_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1350_c2_a11c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1355_c7_d899_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1363_c7_86d7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_86d7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_86d7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_86d7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_86d7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_86d7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_86d7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_86d7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_86d7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1373_c7_9a55] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1373_c7_9a55_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1373_c7_9a55_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1373_c7_9a55_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1373_c7_9a55_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1373_c7_9a55_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1373_c7_9a55_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1373_c7_9a55_return_output := result_u8_value_MUX_uxn_opcodes_h_l1373_c7_9a55_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1366_c7_8443] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_8443_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_8443_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_8443_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_8443_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_8443_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_8443_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_8443_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_8443_return_output;

     -- t16_MUX[uxn_opcodes_h_l1350_c2_a11c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1350_c2_a11c_cond <= VAR_t16_MUX_uxn_opcodes_h_l1350_c2_a11c_cond;
     t16_MUX_uxn_opcodes_h_l1350_c2_a11c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1350_c2_a11c_iftrue;
     t16_MUX_uxn_opcodes_h_l1350_c2_a11c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1350_c2_a11c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1350_c2_a11c_return_output := t16_MUX_uxn_opcodes_h_l1350_c2_a11c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1366_c7_8443] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_8443_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_8443_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_8443_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_8443_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_8443_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_8443_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_8443_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_8443_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1363_c7_86d7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_86d7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_86d7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_86d7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_86d7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_86d7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_86d7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_86d7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_86d7_return_output;

     -- n16_MUX[uxn_opcodes_h_l1366_c7_8443] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1366_c7_8443_cond <= VAR_n16_MUX_uxn_opcodes_h_l1366_c7_8443_cond;
     n16_MUX_uxn_opcodes_h_l1366_c7_8443_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1366_c7_8443_iftrue;
     n16_MUX_uxn_opcodes_h_l1366_c7_8443_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1366_c7_8443_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1366_c7_8443_return_output := n16_MUX_uxn_opcodes_h_l1366_c7_8443_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1366_c7_8443] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_8443_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_8443_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_8443_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_8443_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_8443_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_8443_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_8443_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_8443_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1363_c7_86d7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1366_c7_8443_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_86d7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_8443_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_86d7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_8443_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_86d7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_8443_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_fa45_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_86d7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_fa45_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_86d7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1370_c7_26da_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1373_c7_9a55_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1350_c2_a11c_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1363_c7_86d7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_86d7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_86d7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_86d7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_86d7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_86d7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_86d7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_86d7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_86d7_return_output;

     -- n16_MUX[uxn_opcodes_h_l1363_c7_86d7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1363_c7_86d7_cond <= VAR_n16_MUX_uxn_opcodes_h_l1363_c7_86d7_cond;
     n16_MUX_uxn_opcodes_h_l1363_c7_86d7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1363_c7_86d7_iftrue;
     n16_MUX_uxn_opcodes_h_l1363_c7_86d7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1363_c7_86d7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1363_c7_86d7_return_output := n16_MUX_uxn_opcodes_h_l1363_c7_86d7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1363_c7_86d7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_86d7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_86d7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_86d7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_86d7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_86d7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_86d7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_86d7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_86d7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1370_c7_26da] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1370_c7_26da_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1370_c7_26da_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1370_c7_26da_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1370_c7_26da_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1370_c7_26da_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1370_c7_26da_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1370_c7_26da_return_output := result_u8_value_MUX_uxn_opcodes_h_l1370_c7_26da_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1358_c7_fa45] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_fa45_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_fa45_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_fa45_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_fa45_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_fa45_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_fa45_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_fa45_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_fa45_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1363_c7_86d7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_86d7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_86d7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_86d7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_86d7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_86d7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_86d7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_86d7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_86d7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1358_c7_fa45] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_fa45_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_fa45_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_fa45_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_fa45_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_fa45_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_fa45_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_fa45_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_fa45_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1358_c7_fa45_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1363_c7_86d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_fa45_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_86d7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_fa45_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_86d7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_fa45_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_86d7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c7_d899_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_fa45_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c7_d899_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_fa45_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1366_c7_8443_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1370_c7_26da_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1355_c7_d899] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c7_d899_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c7_d899_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c7_d899_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c7_d899_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c7_d899_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c7_d899_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c7_d899_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c7_d899_return_output;

     -- n16_MUX[uxn_opcodes_h_l1358_c7_fa45] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1358_c7_fa45_cond <= VAR_n16_MUX_uxn_opcodes_h_l1358_c7_fa45_cond;
     n16_MUX_uxn_opcodes_h_l1358_c7_fa45_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1358_c7_fa45_iftrue;
     n16_MUX_uxn_opcodes_h_l1358_c7_fa45_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1358_c7_fa45_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1358_c7_fa45_return_output := n16_MUX_uxn_opcodes_h_l1358_c7_fa45_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1358_c7_fa45] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_fa45_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_fa45_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_fa45_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_fa45_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_fa45_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_fa45_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_fa45_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_fa45_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1355_c7_d899] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c7_d899_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c7_d899_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c7_d899_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c7_d899_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c7_d899_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c7_d899_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c7_d899_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c7_d899_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1358_c7_fa45] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_fa45_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_fa45_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_fa45_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_fa45_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_fa45_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_fa45_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_fa45_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_fa45_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1366_c7_8443] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1366_c7_8443_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1366_c7_8443_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1366_c7_8443_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1366_c7_8443_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1366_c7_8443_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1366_c7_8443_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1366_c7_8443_return_output := result_u8_value_MUX_uxn_opcodes_h_l1366_c7_8443_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1358_c7_fa45] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_fa45_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_fa45_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_fa45_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_fa45_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_fa45_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_fa45_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_fa45_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_fa45_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1355_c7_d899_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1358_c7_fa45_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1355_c7_d899_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_fa45_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c7_d899_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_fa45_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1355_c7_d899_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_fa45_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c2_a11c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c7_d899_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c2_a11c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c7_d899_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1363_c7_86d7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1366_c7_8443_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1350_c2_a11c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c2_a11c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c2_a11c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c2_a11c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c2_a11c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c2_a11c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c2_a11c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c2_a11c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c2_a11c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1363_c7_86d7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1363_c7_86d7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1363_c7_86d7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1363_c7_86d7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1363_c7_86d7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1363_c7_86d7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1363_c7_86d7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1363_c7_86d7_return_output := result_u8_value_MUX_uxn_opcodes_h_l1363_c7_86d7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1350_c2_a11c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c2_a11c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c2_a11c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c2_a11c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c2_a11c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c2_a11c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c2_a11c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c2_a11c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c2_a11c_return_output;

     -- n16_MUX[uxn_opcodes_h_l1355_c7_d899] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1355_c7_d899_cond <= VAR_n16_MUX_uxn_opcodes_h_l1355_c7_d899_cond;
     n16_MUX_uxn_opcodes_h_l1355_c7_d899_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1355_c7_d899_iftrue;
     n16_MUX_uxn_opcodes_h_l1355_c7_d899_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1355_c7_d899_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1355_c7_d899_return_output := n16_MUX_uxn_opcodes_h_l1355_c7_d899_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1355_c7_d899] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1355_c7_d899_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1355_c7_d899_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1355_c7_d899_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1355_c7_d899_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1355_c7_d899_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1355_c7_d899_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1355_c7_d899_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1355_c7_d899_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1355_c7_d899] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c7_d899_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c7_d899_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c7_d899_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c7_d899_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c7_d899_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c7_d899_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c7_d899_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c7_d899_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1355_c7_d899] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1355_c7_d899_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1355_c7_d899_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1355_c7_d899_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1355_c7_d899_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1355_c7_d899_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1355_c7_d899_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1355_c7_d899_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1355_c7_d899_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1350_c2_a11c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1355_c7_d899_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1350_c2_a11c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1355_c7_d899_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c2_a11c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c7_d899_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1350_c2_a11c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1355_c7_d899_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1358_c7_fa45_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1363_c7_86d7_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1350_c2_a11c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1350_c2_a11c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1350_c2_a11c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1350_c2_a11c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1350_c2_a11c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1350_c2_a11c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1350_c2_a11c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1350_c2_a11c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1350_c2_a11c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1358_c7_fa45] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1358_c7_fa45_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1358_c7_fa45_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1358_c7_fa45_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1358_c7_fa45_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1358_c7_fa45_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1358_c7_fa45_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1358_c7_fa45_return_output := result_u8_value_MUX_uxn_opcodes_h_l1358_c7_fa45_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1350_c2_a11c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1350_c2_a11c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1350_c2_a11c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1350_c2_a11c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1350_c2_a11c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1350_c2_a11c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1350_c2_a11c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1350_c2_a11c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1350_c2_a11c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1350_c2_a11c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c2_a11c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c2_a11c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c2_a11c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c2_a11c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c2_a11c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c2_a11c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c2_a11c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c2_a11c_return_output;

     -- n16_MUX[uxn_opcodes_h_l1350_c2_a11c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1350_c2_a11c_cond <= VAR_n16_MUX_uxn_opcodes_h_l1350_c2_a11c_cond;
     n16_MUX_uxn_opcodes_h_l1350_c2_a11c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1350_c2_a11c_iftrue;
     n16_MUX_uxn_opcodes_h_l1350_c2_a11c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1350_c2_a11c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1350_c2_a11c_return_output := n16_MUX_uxn_opcodes_h_l1350_c2_a11c_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1350_c2_a11c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1355_c7_d899_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1358_c7_fa45_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1355_c7_d899] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1355_c7_d899_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1355_c7_d899_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1355_c7_d899_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1355_c7_d899_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1355_c7_d899_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1355_c7_d899_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1355_c7_d899_return_output := result_u8_value_MUX_uxn_opcodes_h_l1355_c7_d899_return_output;

     -- Submodule level 12
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1350_c2_a11c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1355_c7_d899_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1350_c2_a11c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1350_c2_a11c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1350_c2_a11c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1350_c2_a11c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1350_c2_a11c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1350_c2_a11c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1350_c2_a11c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1350_c2_a11c_return_output := result_u8_value_MUX_uxn_opcodes_h_l1350_c2_a11c_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l1346_l1395_DUPLICATE_8a39 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l1346_l1395_DUPLICATE_8a39_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_8cda(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c2_a11c_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c2_a11c_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c2_a11c_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1350_c2_a11c_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1350_c2_a11c_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1350_c2_a11c_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l1346_l1395_DUPLICATE_8a39_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l1346_l1395_DUPLICATE_8a39_return_output;
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
