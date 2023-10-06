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
-- Submodules: 81
entity dup2_0CLK_8f02dccf is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end dup2_0CLK_8f02dccf;
architecture arch of dup2_0CLK_8f02dccf is
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
-- BIN_OP_EQ[uxn_opcodes_h_l3262_c6_4279]
signal BIN_OP_EQ_uxn_opcodes_h_l3262_c6_4279_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3262_c6_4279_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3262_c6_4279_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3262_c1_ae65]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3262_c1_ae65_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3262_c1_ae65_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3262_c1_ae65_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3262_c1_ae65_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l3262_c2_4953]
signal t16_MUX_uxn_opcodes_h_l3262_c2_4953_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l3262_c2_4953_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3262_c2_4953_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3262_c2_4953_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3262_c2_4953]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3262_c2_4953_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3262_c2_4953_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3262_c2_4953_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3262_c2_4953_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3262_c2_4953]
signal result_stack_value_MUX_uxn_opcodes_h_l3262_c2_4953_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3262_c2_4953_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3262_c2_4953_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3262_c2_4953_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3262_c2_4953]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3262_c2_4953_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3262_c2_4953_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3262_c2_4953_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3262_c2_4953_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3262_c2_4953]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3262_c2_4953_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3262_c2_4953_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3262_c2_4953_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3262_c2_4953_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3262_c2_4953]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3262_c2_4953_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3262_c2_4953_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3262_c2_4953_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3262_c2_4953_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3262_c2_4953]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3262_c2_4953_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3262_c2_4953_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3262_c2_4953_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3262_c2_4953_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3262_c2_4953]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3262_c2_4953_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3262_c2_4953_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3262_c2_4953_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3262_c2_4953_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l3263_c3_db84[uxn_opcodes_h_l3263_c3_db84]
signal printf_uxn_opcodes_h_l3263_c3_db84_uxn_opcodes_h_l3263_c3_db84_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3268_c11_e050]
signal BIN_OP_EQ_uxn_opcodes_h_l3268_c11_e050_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3268_c11_e050_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3268_c11_e050_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l3268_c7_ed96]
signal t16_MUX_uxn_opcodes_h_l3268_c7_ed96_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l3268_c7_ed96_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3268_c7_ed96_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3268_c7_ed96_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3268_c7_ed96]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3268_c7_ed96_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3268_c7_ed96_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3268_c7_ed96_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3268_c7_ed96_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3268_c7_ed96]
signal result_stack_value_MUX_uxn_opcodes_h_l3268_c7_ed96_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3268_c7_ed96_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3268_c7_ed96_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3268_c7_ed96_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3268_c7_ed96]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3268_c7_ed96_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3268_c7_ed96_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3268_c7_ed96_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3268_c7_ed96_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3268_c7_ed96]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3268_c7_ed96_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3268_c7_ed96_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3268_c7_ed96_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3268_c7_ed96_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3268_c7_ed96]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3268_c7_ed96_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3268_c7_ed96_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3268_c7_ed96_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3268_c7_ed96_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3268_c7_ed96]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3268_c7_ed96_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3268_c7_ed96_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3268_c7_ed96_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3268_c7_ed96_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3268_c7_ed96]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3268_c7_ed96_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3268_c7_ed96_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3268_c7_ed96_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3268_c7_ed96_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3271_c11_9e88]
signal BIN_OP_EQ_uxn_opcodes_h_l3271_c11_9e88_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3271_c11_9e88_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3271_c11_9e88_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l3271_c7_1574]
signal t16_MUX_uxn_opcodes_h_l3271_c7_1574_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l3271_c7_1574_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3271_c7_1574_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3271_c7_1574_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3271_c7_1574]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3271_c7_1574_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3271_c7_1574_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3271_c7_1574_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3271_c7_1574_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3271_c7_1574]
signal result_stack_value_MUX_uxn_opcodes_h_l3271_c7_1574_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3271_c7_1574_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3271_c7_1574_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3271_c7_1574_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3271_c7_1574]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3271_c7_1574_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3271_c7_1574_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3271_c7_1574_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3271_c7_1574_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3271_c7_1574]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3271_c7_1574_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3271_c7_1574_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3271_c7_1574_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3271_c7_1574_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3271_c7_1574]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3271_c7_1574_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3271_c7_1574_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3271_c7_1574_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3271_c7_1574_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3271_c7_1574]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3271_c7_1574_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3271_c7_1574_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3271_c7_1574_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3271_c7_1574_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3271_c7_1574]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3271_c7_1574_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3271_c7_1574_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3271_c7_1574_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3271_c7_1574_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l3273_c3_feeb]
signal CONST_SL_8_uxn_opcodes_h_l3273_c3_feeb_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l3273_c3_feeb_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3276_c11_a5c9]
signal BIN_OP_EQ_uxn_opcodes_h_l3276_c11_a5c9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3276_c11_a5c9_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3276_c11_a5c9_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l3276_c7_f320]
signal t16_MUX_uxn_opcodes_h_l3276_c7_f320_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l3276_c7_f320_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3276_c7_f320_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3276_c7_f320_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3276_c7_f320]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3276_c7_f320_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3276_c7_f320_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3276_c7_f320_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3276_c7_f320_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3276_c7_f320]
signal result_stack_value_MUX_uxn_opcodes_h_l3276_c7_f320_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3276_c7_f320_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3276_c7_f320_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3276_c7_f320_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3276_c7_f320]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3276_c7_f320_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3276_c7_f320_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3276_c7_f320_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3276_c7_f320_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3276_c7_f320]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3276_c7_f320_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3276_c7_f320_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3276_c7_f320_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3276_c7_f320_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3276_c7_f320]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3276_c7_f320_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3276_c7_f320_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3276_c7_f320_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3276_c7_f320_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3276_c7_f320]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3276_c7_f320_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3276_c7_f320_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3276_c7_f320_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3276_c7_f320_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3276_c7_f320]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3276_c7_f320_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3276_c7_f320_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3276_c7_f320_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3276_c7_f320_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3279_c11_147f]
signal BIN_OP_EQ_uxn_opcodes_h_l3279_c11_147f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3279_c11_147f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3279_c11_147f_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l3279_c7_75b1]
signal t16_MUX_uxn_opcodes_h_l3279_c7_75b1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l3279_c7_75b1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3279_c7_75b1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3279_c7_75b1_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3279_c7_75b1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3279_c7_75b1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3279_c7_75b1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3279_c7_75b1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3279_c7_75b1_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3279_c7_75b1]
signal result_stack_value_MUX_uxn_opcodes_h_l3279_c7_75b1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3279_c7_75b1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3279_c7_75b1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3279_c7_75b1_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3279_c7_75b1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3279_c7_75b1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3279_c7_75b1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3279_c7_75b1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3279_c7_75b1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3279_c7_75b1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3279_c7_75b1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3279_c7_75b1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3279_c7_75b1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3279_c7_75b1_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3279_c7_75b1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3279_c7_75b1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3279_c7_75b1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3279_c7_75b1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3279_c7_75b1_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3279_c7_75b1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3279_c7_75b1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3279_c7_75b1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3279_c7_75b1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3279_c7_75b1_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3279_c7_75b1]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3279_c7_75b1_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3279_c7_75b1_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3279_c7_75b1_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3279_c7_75b1_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l3280_c3_2b75]
signal BIN_OP_OR_uxn_opcodes_h_l3280_c3_2b75_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l3280_c3_2b75_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l3280_c3_2b75_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l3283_c32_5a62]
signal BIN_OP_AND_uxn_opcodes_h_l3283_c32_5a62_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3283_c32_5a62_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3283_c32_5a62_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l3283_c32_f48a]
signal BIN_OP_GT_uxn_opcodes_h_l3283_c32_f48a_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l3283_c32_f48a_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l3283_c32_f48a_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l3283_c32_7ef3]
signal MUX_uxn_opcodes_h_l3283_c32_7ef3_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l3283_c32_7ef3_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l3283_c32_7ef3_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l3283_c32_7ef3_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3285_c11_6ac9]
signal BIN_OP_EQ_uxn_opcodes_h_l3285_c11_6ac9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3285_c11_6ac9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3285_c11_6ac9_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3285_c7_5f34]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3285_c7_5f34_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3285_c7_5f34_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3285_c7_5f34_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3285_c7_5f34_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3285_c7_5f34]
signal result_stack_value_MUX_uxn_opcodes_h_l3285_c7_5f34_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3285_c7_5f34_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3285_c7_5f34_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3285_c7_5f34_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3285_c7_5f34]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3285_c7_5f34_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3285_c7_5f34_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3285_c7_5f34_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3285_c7_5f34_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3285_c7_5f34]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3285_c7_5f34_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3285_c7_5f34_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3285_c7_5f34_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3285_c7_5f34_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3285_c7_5f34]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3285_c7_5f34_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3285_c7_5f34_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3285_c7_5f34_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3285_c7_5f34_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3291_c11_12c8]
signal BIN_OP_EQ_uxn_opcodes_h_l3291_c11_12c8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3291_c11_12c8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3291_c11_12c8_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3291_c7_3547]
signal result_stack_value_MUX_uxn_opcodes_h_l3291_c7_3547_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3291_c7_3547_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3291_c7_3547_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3291_c7_3547_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3291_c7_3547]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3291_c7_3547_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3291_c7_3547_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3291_c7_3547_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3291_c7_3547_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3291_c7_3547]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3291_c7_3547_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3291_c7_3547_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3291_c7_3547_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3291_c7_3547_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3291_c7_3547]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3291_c7_3547_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3291_c7_3547_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3291_c7_3547_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3291_c7_3547_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3295_c11_bb72]
signal BIN_OP_EQ_uxn_opcodes_h_l3295_c11_bb72_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3295_c11_bb72_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3295_c11_bb72_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3295_c7_e694]
signal result_stack_value_MUX_uxn_opcodes_h_l3295_c7_e694_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3295_c7_e694_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3295_c7_e694_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3295_c7_e694_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3295_c7_e694]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3295_c7_e694_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3295_c7_e694_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3295_c7_e694_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3295_c7_e694_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3295_c7_e694]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3295_c7_e694_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3295_c7_e694_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3295_c7_e694_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3295_c7_e694_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3295_c7_e694]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3295_c7_e694_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3295_c7_e694_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3295_c7_e694_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3295_c7_e694_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3299_c11_fd43]
signal BIN_OP_EQ_uxn_opcodes_h_l3299_c11_fd43_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3299_c11_fd43_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3299_c11_fd43_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3299_c7_0905]
signal result_stack_value_MUX_uxn_opcodes_h_l3299_c7_0905_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3299_c7_0905_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3299_c7_0905_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3299_c7_0905_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3299_c7_0905]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3299_c7_0905_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3299_c7_0905_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3299_c7_0905_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3299_c7_0905_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3299_c7_0905]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3299_c7_0905_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3299_c7_0905_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3299_c7_0905_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3299_c7_0905_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3299_c7_0905]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3299_c7_0905_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3299_c7_0905_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3299_c7_0905_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3299_c7_0905_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3303_c11_3945]
signal BIN_OP_EQ_uxn_opcodes_h_l3303_c11_3945_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3303_c11_3945_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3303_c11_3945_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3303_c7_0e85]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3303_c7_0e85_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3303_c7_0e85_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3303_c7_0e85_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3303_c7_0e85_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3303_c7_0e85]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3303_c7_0e85_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3303_c7_0e85_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3303_c7_0e85_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3303_c7_0e85_return_output : unsigned(0 downto 0);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l3301_l3293_DUPLICATE_f98a
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l3301_l3293_DUPLICATE_f98a_x : unsigned(15 downto 0);
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l3301_l3293_DUPLICATE_f98a_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_287e( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_sp_shift := ref_toks_1;
      base.stack_value := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.is_stack_read := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l3262_c6_4279
BIN_OP_EQ_uxn_opcodes_h_l3262_c6_4279 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3262_c6_4279_left,
BIN_OP_EQ_uxn_opcodes_h_l3262_c6_4279_right,
BIN_OP_EQ_uxn_opcodes_h_l3262_c6_4279_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3262_c1_ae65
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3262_c1_ae65 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3262_c1_ae65_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3262_c1_ae65_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3262_c1_ae65_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3262_c1_ae65_return_output);

-- t16_MUX_uxn_opcodes_h_l3262_c2_4953
t16_MUX_uxn_opcodes_h_l3262_c2_4953 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l3262_c2_4953_cond,
t16_MUX_uxn_opcodes_h_l3262_c2_4953_iftrue,
t16_MUX_uxn_opcodes_h_l3262_c2_4953_iffalse,
t16_MUX_uxn_opcodes_h_l3262_c2_4953_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3262_c2_4953
result_is_sp_shift_MUX_uxn_opcodes_h_l3262_c2_4953 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3262_c2_4953_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3262_c2_4953_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3262_c2_4953_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3262_c2_4953_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3262_c2_4953
result_stack_value_MUX_uxn_opcodes_h_l3262_c2_4953 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3262_c2_4953_cond,
result_stack_value_MUX_uxn_opcodes_h_l3262_c2_4953_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3262_c2_4953_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3262_c2_4953_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3262_c2_4953
result_is_stack_write_MUX_uxn_opcodes_h_l3262_c2_4953 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3262_c2_4953_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3262_c2_4953_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3262_c2_4953_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3262_c2_4953_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3262_c2_4953
result_sp_relative_shift_MUX_uxn_opcodes_h_l3262_c2_4953 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3262_c2_4953_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3262_c2_4953_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3262_c2_4953_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3262_c2_4953_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3262_c2_4953
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3262_c2_4953 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3262_c2_4953_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3262_c2_4953_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3262_c2_4953_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3262_c2_4953_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3262_c2_4953
result_is_opc_done_MUX_uxn_opcodes_h_l3262_c2_4953 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3262_c2_4953_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3262_c2_4953_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3262_c2_4953_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3262_c2_4953_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3262_c2_4953
result_is_stack_read_MUX_uxn_opcodes_h_l3262_c2_4953 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3262_c2_4953_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3262_c2_4953_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3262_c2_4953_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3262_c2_4953_return_output);

-- printf_uxn_opcodes_h_l3263_c3_db84_uxn_opcodes_h_l3263_c3_db84
printf_uxn_opcodes_h_l3263_c3_db84_uxn_opcodes_h_l3263_c3_db84 : entity work.printf_uxn_opcodes_h_l3263_c3_db84_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l3263_c3_db84_uxn_opcodes_h_l3263_c3_db84_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l3268_c11_e050
BIN_OP_EQ_uxn_opcodes_h_l3268_c11_e050 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3268_c11_e050_left,
BIN_OP_EQ_uxn_opcodes_h_l3268_c11_e050_right,
BIN_OP_EQ_uxn_opcodes_h_l3268_c11_e050_return_output);

-- t16_MUX_uxn_opcodes_h_l3268_c7_ed96
t16_MUX_uxn_opcodes_h_l3268_c7_ed96 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l3268_c7_ed96_cond,
t16_MUX_uxn_opcodes_h_l3268_c7_ed96_iftrue,
t16_MUX_uxn_opcodes_h_l3268_c7_ed96_iffalse,
t16_MUX_uxn_opcodes_h_l3268_c7_ed96_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3268_c7_ed96
result_is_sp_shift_MUX_uxn_opcodes_h_l3268_c7_ed96 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3268_c7_ed96_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3268_c7_ed96_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3268_c7_ed96_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3268_c7_ed96_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3268_c7_ed96
result_stack_value_MUX_uxn_opcodes_h_l3268_c7_ed96 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3268_c7_ed96_cond,
result_stack_value_MUX_uxn_opcodes_h_l3268_c7_ed96_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3268_c7_ed96_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3268_c7_ed96_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3268_c7_ed96
result_is_stack_write_MUX_uxn_opcodes_h_l3268_c7_ed96 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3268_c7_ed96_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3268_c7_ed96_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3268_c7_ed96_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3268_c7_ed96_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3268_c7_ed96
result_sp_relative_shift_MUX_uxn_opcodes_h_l3268_c7_ed96 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3268_c7_ed96_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3268_c7_ed96_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3268_c7_ed96_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3268_c7_ed96_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3268_c7_ed96
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3268_c7_ed96 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3268_c7_ed96_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3268_c7_ed96_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3268_c7_ed96_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3268_c7_ed96_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3268_c7_ed96
result_is_opc_done_MUX_uxn_opcodes_h_l3268_c7_ed96 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3268_c7_ed96_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3268_c7_ed96_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3268_c7_ed96_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3268_c7_ed96_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3268_c7_ed96
result_is_stack_read_MUX_uxn_opcodes_h_l3268_c7_ed96 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3268_c7_ed96_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3268_c7_ed96_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3268_c7_ed96_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3268_c7_ed96_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3271_c11_9e88
BIN_OP_EQ_uxn_opcodes_h_l3271_c11_9e88 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3271_c11_9e88_left,
BIN_OP_EQ_uxn_opcodes_h_l3271_c11_9e88_right,
BIN_OP_EQ_uxn_opcodes_h_l3271_c11_9e88_return_output);

-- t16_MUX_uxn_opcodes_h_l3271_c7_1574
t16_MUX_uxn_opcodes_h_l3271_c7_1574 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l3271_c7_1574_cond,
t16_MUX_uxn_opcodes_h_l3271_c7_1574_iftrue,
t16_MUX_uxn_opcodes_h_l3271_c7_1574_iffalse,
t16_MUX_uxn_opcodes_h_l3271_c7_1574_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3271_c7_1574
result_is_sp_shift_MUX_uxn_opcodes_h_l3271_c7_1574 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3271_c7_1574_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3271_c7_1574_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3271_c7_1574_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3271_c7_1574_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3271_c7_1574
result_stack_value_MUX_uxn_opcodes_h_l3271_c7_1574 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3271_c7_1574_cond,
result_stack_value_MUX_uxn_opcodes_h_l3271_c7_1574_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3271_c7_1574_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3271_c7_1574_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3271_c7_1574
result_is_stack_write_MUX_uxn_opcodes_h_l3271_c7_1574 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3271_c7_1574_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3271_c7_1574_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3271_c7_1574_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3271_c7_1574_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3271_c7_1574
result_sp_relative_shift_MUX_uxn_opcodes_h_l3271_c7_1574 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3271_c7_1574_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3271_c7_1574_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3271_c7_1574_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3271_c7_1574_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3271_c7_1574
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3271_c7_1574 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3271_c7_1574_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3271_c7_1574_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3271_c7_1574_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3271_c7_1574_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3271_c7_1574
result_is_opc_done_MUX_uxn_opcodes_h_l3271_c7_1574 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3271_c7_1574_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3271_c7_1574_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3271_c7_1574_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3271_c7_1574_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3271_c7_1574
result_is_stack_read_MUX_uxn_opcodes_h_l3271_c7_1574 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3271_c7_1574_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3271_c7_1574_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3271_c7_1574_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3271_c7_1574_return_output);

-- CONST_SL_8_uxn_opcodes_h_l3273_c3_feeb
CONST_SL_8_uxn_opcodes_h_l3273_c3_feeb : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l3273_c3_feeb_x,
CONST_SL_8_uxn_opcodes_h_l3273_c3_feeb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3276_c11_a5c9
BIN_OP_EQ_uxn_opcodes_h_l3276_c11_a5c9 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3276_c11_a5c9_left,
BIN_OP_EQ_uxn_opcodes_h_l3276_c11_a5c9_right,
BIN_OP_EQ_uxn_opcodes_h_l3276_c11_a5c9_return_output);

-- t16_MUX_uxn_opcodes_h_l3276_c7_f320
t16_MUX_uxn_opcodes_h_l3276_c7_f320 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l3276_c7_f320_cond,
t16_MUX_uxn_opcodes_h_l3276_c7_f320_iftrue,
t16_MUX_uxn_opcodes_h_l3276_c7_f320_iffalse,
t16_MUX_uxn_opcodes_h_l3276_c7_f320_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3276_c7_f320
result_is_sp_shift_MUX_uxn_opcodes_h_l3276_c7_f320 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3276_c7_f320_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3276_c7_f320_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3276_c7_f320_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3276_c7_f320_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3276_c7_f320
result_stack_value_MUX_uxn_opcodes_h_l3276_c7_f320 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3276_c7_f320_cond,
result_stack_value_MUX_uxn_opcodes_h_l3276_c7_f320_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3276_c7_f320_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3276_c7_f320_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3276_c7_f320
result_is_stack_write_MUX_uxn_opcodes_h_l3276_c7_f320 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3276_c7_f320_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3276_c7_f320_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3276_c7_f320_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3276_c7_f320_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3276_c7_f320
result_sp_relative_shift_MUX_uxn_opcodes_h_l3276_c7_f320 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3276_c7_f320_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3276_c7_f320_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3276_c7_f320_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3276_c7_f320_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3276_c7_f320
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3276_c7_f320 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3276_c7_f320_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3276_c7_f320_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3276_c7_f320_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3276_c7_f320_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3276_c7_f320
result_is_opc_done_MUX_uxn_opcodes_h_l3276_c7_f320 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3276_c7_f320_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3276_c7_f320_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3276_c7_f320_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3276_c7_f320_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3276_c7_f320
result_is_stack_read_MUX_uxn_opcodes_h_l3276_c7_f320 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3276_c7_f320_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3276_c7_f320_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3276_c7_f320_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3276_c7_f320_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3279_c11_147f
BIN_OP_EQ_uxn_opcodes_h_l3279_c11_147f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3279_c11_147f_left,
BIN_OP_EQ_uxn_opcodes_h_l3279_c11_147f_right,
BIN_OP_EQ_uxn_opcodes_h_l3279_c11_147f_return_output);

-- t16_MUX_uxn_opcodes_h_l3279_c7_75b1
t16_MUX_uxn_opcodes_h_l3279_c7_75b1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l3279_c7_75b1_cond,
t16_MUX_uxn_opcodes_h_l3279_c7_75b1_iftrue,
t16_MUX_uxn_opcodes_h_l3279_c7_75b1_iffalse,
t16_MUX_uxn_opcodes_h_l3279_c7_75b1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3279_c7_75b1
result_is_sp_shift_MUX_uxn_opcodes_h_l3279_c7_75b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3279_c7_75b1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3279_c7_75b1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3279_c7_75b1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3279_c7_75b1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3279_c7_75b1
result_stack_value_MUX_uxn_opcodes_h_l3279_c7_75b1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3279_c7_75b1_cond,
result_stack_value_MUX_uxn_opcodes_h_l3279_c7_75b1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3279_c7_75b1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3279_c7_75b1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3279_c7_75b1
result_is_stack_write_MUX_uxn_opcodes_h_l3279_c7_75b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3279_c7_75b1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3279_c7_75b1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3279_c7_75b1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3279_c7_75b1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3279_c7_75b1
result_sp_relative_shift_MUX_uxn_opcodes_h_l3279_c7_75b1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3279_c7_75b1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3279_c7_75b1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3279_c7_75b1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3279_c7_75b1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3279_c7_75b1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3279_c7_75b1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3279_c7_75b1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3279_c7_75b1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3279_c7_75b1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3279_c7_75b1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3279_c7_75b1
result_is_opc_done_MUX_uxn_opcodes_h_l3279_c7_75b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3279_c7_75b1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3279_c7_75b1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3279_c7_75b1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3279_c7_75b1_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3279_c7_75b1
result_is_stack_read_MUX_uxn_opcodes_h_l3279_c7_75b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3279_c7_75b1_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3279_c7_75b1_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3279_c7_75b1_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3279_c7_75b1_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l3280_c3_2b75
BIN_OP_OR_uxn_opcodes_h_l3280_c3_2b75 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l3280_c3_2b75_left,
BIN_OP_OR_uxn_opcodes_h_l3280_c3_2b75_right,
BIN_OP_OR_uxn_opcodes_h_l3280_c3_2b75_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l3283_c32_5a62
BIN_OP_AND_uxn_opcodes_h_l3283_c32_5a62 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l3283_c32_5a62_left,
BIN_OP_AND_uxn_opcodes_h_l3283_c32_5a62_right,
BIN_OP_AND_uxn_opcodes_h_l3283_c32_5a62_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l3283_c32_f48a
BIN_OP_GT_uxn_opcodes_h_l3283_c32_f48a : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l3283_c32_f48a_left,
BIN_OP_GT_uxn_opcodes_h_l3283_c32_f48a_right,
BIN_OP_GT_uxn_opcodes_h_l3283_c32_f48a_return_output);

-- MUX_uxn_opcodes_h_l3283_c32_7ef3
MUX_uxn_opcodes_h_l3283_c32_7ef3 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l3283_c32_7ef3_cond,
MUX_uxn_opcodes_h_l3283_c32_7ef3_iftrue,
MUX_uxn_opcodes_h_l3283_c32_7ef3_iffalse,
MUX_uxn_opcodes_h_l3283_c32_7ef3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3285_c11_6ac9
BIN_OP_EQ_uxn_opcodes_h_l3285_c11_6ac9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3285_c11_6ac9_left,
BIN_OP_EQ_uxn_opcodes_h_l3285_c11_6ac9_right,
BIN_OP_EQ_uxn_opcodes_h_l3285_c11_6ac9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3285_c7_5f34
result_is_sp_shift_MUX_uxn_opcodes_h_l3285_c7_5f34 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3285_c7_5f34_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3285_c7_5f34_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3285_c7_5f34_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3285_c7_5f34_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3285_c7_5f34
result_stack_value_MUX_uxn_opcodes_h_l3285_c7_5f34 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3285_c7_5f34_cond,
result_stack_value_MUX_uxn_opcodes_h_l3285_c7_5f34_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3285_c7_5f34_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3285_c7_5f34_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3285_c7_5f34
result_is_stack_write_MUX_uxn_opcodes_h_l3285_c7_5f34 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3285_c7_5f34_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3285_c7_5f34_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3285_c7_5f34_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3285_c7_5f34_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3285_c7_5f34
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3285_c7_5f34 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3285_c7_5f34_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3285_c7_5f34_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3285_c7_5f34_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3285_c7_5f34_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3285_c7_5f34
result_is_opc_done_MUX_uxn_opcodes_h_l3285_c7_5f34 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3285_c7_5f34_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3285_c7_5f34_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3285_c7_5f34_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3285_c7_5f34_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3291_c11_12c8
BIN_OP_EQ_uxn_opcodes_h_l3291_c11_12c8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3291_c11_12c8_left,
BIN_OP_EQ_uxn_opcodes_h_l3291_c11_12c8_right,
BIN_OP_EQ_uxn_opcodes_h_l3291_c11_12c8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3291_c7_3547
result_stack_value_MUX_uxn_opcodes_h_l3291_c7_3547 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3291_c7_3547_cond,
result_stack_value_MUX_uxn_opcodes_h_l3291_c7_3547_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3291_c7_3547_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3291_c7_3547_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3291_c7_3547
result_is_opc_done_MUX_uxn_opcodes_h_l3291_c7_3547 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3291_c7_3547_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3291_c7_3547_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3291_c7_3547_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3291_c7_3547_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3291_c7_3547
result_is_stack_write_MUX_uxn_opcodes_h_l3291_c7_3547 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3291_c7_3547_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3291_c7_3547_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3291_c7_3547_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3291_c7_3547_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3291_c7_3547
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3291_c7_3547 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3291_c7_3547_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3291_c7_3547_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3291_c7_3547_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3291_c7_3547_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3295_c11_bb72
BIN_OP_EQ_uxn_opcodes_h_l3295_c11_bb72 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3295_c11_bb72_left,
BIN_OP_EQ_uxn_opcodes_h_l3295_c11_bb72_right,
BIN_OP_EQ_uxn_opcodes_h_l3295_c11_bb72_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3295_c7_e694
result_stack_value_MUX_uxn_opcodes_h_l3295_c7_e694 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3295_c7_e694_cond,
result_stack_value_MUX_uxn_opcodes_h_l3295_c7_e694_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3295_c7_e694_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3295_c7_e694_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3295_c7_e694
result_is_opc_done_MUX_uxn_opcodes_h_l3295_c7_e694 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3295_c7_e694_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3295_c7_e694_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3295_c7_e694_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3295_c7_e694_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3295_c7_e694
result_is_stack_write_MUX_uxn_opcodes_h_l3295_c7_e694 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3295_c7_e694_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3295_c7_e694_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3295_c7_e694_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3295_c7_e694_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3295_c7_e694
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3295_c7_e694 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3295_c7_e694_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3295_c7_e694_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3295_c7_e694_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3295_c7_e694_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3299_c11_fd43
BIN_OP_EQ_uxn_opcodes_h_l3299_c11_fd43 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3299_c11_fd43_left,
BIN_OP_EQ_uxn_opcodes_h_l3299_c11_fd43_right,
BIN_OP_EQ_uxn_opcodes_h_l3299_c11_fd43_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3299_c7_0905
result_stack_value_MUX_uxn_opcodes_h_l3299_c7_0905 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3299_c7_0905_cond,
result_stack_value_MUX_uxn_opcodes_h_l3299_c7_0905_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3299_c7_0905_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3299_c7_0905_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3299_c7_0905
result_is_opc_done_MUX_uxn_opcodes_h_l3299_c7_0905 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3299_c7_0905_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3299_c7_0905_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3299_c7_0905_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3299_c7_0905_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3299_c7_0905
result_is_stack_write_MUX_uxn_opcodes_h_l3299_c7_0905 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3299_c7_0905_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3299_c7_0905_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3299_c7_0905_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3299_c7_0905_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3299_c7_0905
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3299_c7_0905 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3299_c7_0905_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3299_c7_0905_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3299_c7_0905_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3299_c7_0905_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3303_c11_3945
BIN_OP_EQ_uxn_opcodes_h_l3303_c11_3945 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3303_c11_3945_left,
BIN_OP_EQ_uxn_opcodes_h_l3303_c11_3945_right,
BIN_OP_EQ_uxn_opcodes_h_l3303_c11_3945_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3303_c7_0e85
result_is_opc_done_MUX_uxn_opcodes_h_l3303_c7_0e85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3303_c7_0e85_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3303_c7_0e85_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3303_c7_0e85_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3303_c7_0e85_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3303_c7_0e85
result_is_stack_write_MUX_uxn_opcodes_h_l3303_c7_0e85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3303_c7_0e85_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3303_c7_0e85_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3303_c7_0e85_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3303_c7_0e85_return_output);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l3301_l3293_DUPLICATE_f98a
CONST_SR_8_uint16_t_uxn_opcodes_h_l3301_l3293_DUPLICATE_f98a : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uint16_t_uxn_opcodes_h_l3301_l3293_DUPLICATE_f98a_x,
CONST_SR_8_uint16_t_uxn_opcodes_h_l3301_l3293_DUPLICATE_f98a_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l3262_c6_4279_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3262_c1_ae65_return_output,
 t16_MUX_uxn_opcodes_h_l3262_c2_4953_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3262_c2_4953_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3262_c2_4953_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3262_c2_4953_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3262_c2_4953_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3262_c2_4953_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3262_c2_4953_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3262_c2_4953_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3268_c11_e050_return_output,
 t16_MUX_uxn_opcodes_h_l3268_c7_ed96_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3268_c7_ed96_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3268_c7_ed96_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3268_c7_ed96_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3268_c7_ed96_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3268_c7_ed96_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3268_c7_ed96_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3268_c7_ed96_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3271_c11_9e88_return_output,
 t16_MUX_uxn_opcodes_h_l3271_c7_1574_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3271_c7_1574_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3271_c7_1574_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3271_c7_1574_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3271_c7_1574_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3271_c7_1574_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3271_c7_1574_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3271_c7_1574_return_output,
 CONST_SL_8_uxn_opcodes_h_l3273_c3_feeb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3276_c11_a5c9_return_output,
 t16_MUX_uxn_opcodes_h_l3276_c7_f320_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3276_c7_f320_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3276_c7_f320_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3276_c7_f320_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3276_c7_f320_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3276_c7_f320_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3276_c7_f320_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3276_c7_f320_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3279_c11_147f_return_output,
 t16_MUX_uxn_opcodes_h_l3279_c7_75b1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3279_c7_75b1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3279_c7_75b1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3279_c7_75b1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3279_c7_75b1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3279_c7_75b1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3279_c7_75b1_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3279_c7_75b1_return_output,
 BIN_OP_OR_uxn_opcodes_h_l3280_c3_2b75_return_output,
 BIN_OP_AND_uxn_opcodes_h_l3283_c32_5a62_return_output,
 BIN_OP_GT_uxn_opcodes_h_l3283_c32_f48a_return_output,
 MUX_uxn_opcodes_h_l3283_c32_7ef3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3285_c11_6ac9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3285_c7_5f34_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3285_c7_5f34_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3285_c7_5f34_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3285_c7_5f34_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3285_c7_5f34_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3291_c11_12c8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3291_c7_3547_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3291_c7_3547_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3291_c7_3547_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3291_c7_3547_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3295_c11_bb72_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3295_c7_e694_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3295_c7_e694_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3295_c7_e694_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3295_c7_e694_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3299_c11_fd43_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3299_c7_0905_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3299_c7_0905_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3299_c7_0905_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3299_c7_0905_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3303_c11_3945_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3303_c7_0e85_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3303_c7_0e85_return_output,
 CONST_SR_8_uint16_t_uxn_opcodes_h_l3301_l3293_DUPLICATE_f98a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3262_c6_4279_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3262_c6_4279_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3262_c6_4279_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3262_c1_ae65_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3262_c1_ae65_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3262_c1_ae65_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3262_c1_ae65_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3262_c2_4953_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3262_c2_4953_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3268_c7_ed96_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3262_c2_4953_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3262_c2_4953_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3262_c2_4953_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3262_c2_4953_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3268_c7_ed96_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3262_c2_4953_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3262_c2_4953_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3262_c2_4953_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3262_c2_4953_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3268_c7_ed96_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3262_c2_4953_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3262_c2_4953_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3262_c2_4953_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3262_c2_4953_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3268_c7_ed96_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3262_c2_4953_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3262_c2_4953_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3262_c2_4953_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3262_c2_4953_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3268_c7_ed96_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3262_c2_4953_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3262_c2_4953_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3262_c2_4953_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3265_c3_71b8 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3262_c2_4953_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3268_c7_ed96_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3262_c2_4953_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3262_c2_4953_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3262_c2_4953_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3262_c2_4953_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3268_c7_ed96_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3262_c2_4953_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3262_c2_4953_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3262_c2_4953_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3262_c2_4953_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3268_c7_ed96_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3262_c2_4953_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3262_c2_4953_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l3263_c3_db84_uxn_opcodes_h_l3263_c3_db84_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3268_c11_e050_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3268_c11_e050_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3268_c11_e050_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3268_c7_ed96_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3268_c7_ed96_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3271_c7_1574_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3268_c7_ed96_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3268_c7_ed96_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3268_c7_ed96_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3271_c7_1574_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3268_c7_ed96_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3268_c7_ed96_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3268_c7_ed96_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3271_c7_1574_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3268_c7_ed96_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3268_c7_ed96_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3268_c7_ed96_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3271_c7_1574_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3268_c7_ed96_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3268_c7_ed96_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3268_c7_ed96_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3271_c7_1574_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3268_c7_ed96_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3268_c7_ed96_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3269_c3_6ab5 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3268_c7_ed96_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3271_c7_1574_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3268_c7_ed96_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3268_c7_ed96_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3268_c7_ed96_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3271_c7_1574_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3268_c7_ed96_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3268_c7_ed96_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3268_c7_ed96_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3271_c7_1574_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3268_c7_ed96_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3271_c11_9e88_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3271_c11_9e88_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3271_c11_9e88_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3271_c7_1574_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3271_c7_1574_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3276_c7_f320_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3271_c7_1574_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3271_c7_1574_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3271_c7_1574_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3276_c7_f320_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3271_c7_1574_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3271_c7_1574_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3271_c7_1574_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3276_c7_f320_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3271_c7_1574_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3271_c7_1574_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3271_c7_1574_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3276_c7_f320_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3271_c7_1574_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3271_c7_1574_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3271_c7_1574_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3276_c7_f320_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3271_c7_1574_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3271_c7_1574_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3274_c3_ecab : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3271_c7_1574_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3276_c7_f320_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3271_c7_1574_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3271_c7_1574_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3271_c7_1574_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3276_c7_f320_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3271_c7_1574_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3271_c7_1574_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3271_c7_1574_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3276_c7_f320_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3271_c7_1574_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l3273_c3_feeb_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l3273_c3_feeb_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3276_c11_a5c9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3276_c11_a5c9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3276_c11_a5c9_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3276_c7_f320_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3276_c7_f320_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3279_c7_75b1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3276_c7_f320_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3276_c7_f320_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3276_c7_f320_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3279_c7_75b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3276_c7_f320_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3276_c7_f320_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3276_c7_f320_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3279_c7_75b1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3276_c7_f320_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3276_c7_f320_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3276_c7_f320_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3279_c7_75b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3276_c7_f320_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3276_c7_f320_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3276_c7_f320_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3279_c7_75b1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3276_c7_f320_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3276_c7_f320_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3277_c3_a610 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3276_c7_f320_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3279_c7_75b1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3276_c7_f320_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3276_c7_f320_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3276_c7_f320_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3279_c7_75b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3276_c7_f320_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3276_c7_f320_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3276_c7_f320_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3279_c7_75b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3276_c7_f320_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3279_c11_147f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3279_c11_147f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3279_c11_147f_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3279_c7_75b1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3279_c7_75b1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3279_c7_75b1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3279_c7_75b1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3279_c7_75b1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3285_c7_5f34_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3279_c7_75b1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3279_c7_75b1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3279_c7_75b1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3285_c7_5f34_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3279_c7_75b1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3279_c7_75b1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3279_c7_75b1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3285_c7_5f34_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3279_c7_75b1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3279_c7_75b1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3279_c7_75b1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3279_c7_75b1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3279_c7_75b1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3279_c7_75b1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3285_c7_5f34_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3279_c7_75b1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3279_c7_75b1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3279_c7_75b1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3285_c7_5f34_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3279_c7_75b1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3279_c7_75b1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3279_c7_75b1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3279_c7_75b1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l3280_c3_2b75_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l3280_c3_2b75_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l3280_c3_2b75_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3283_c32_7ef3_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3283_c32_7ef3_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3283_c32_7ef3_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3283_c32_5a62_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3283_c32_5a62_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3283_c32_5a62_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3283_c32_f48a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3283_c32_f48a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3283_c32_f48a_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3283_c32_7ef3_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3285_c11_6ac9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3285_c11_6ac9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3285_c11_6ac9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3285_c7_5f34_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3285_c7_5f34_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3285_c7_5f34_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3285_c7_5f34_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3285_c7_5f34_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3291_c7_3547_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3285_c7_5f34_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3285_c7_5f34_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3285_c7_5f34_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3291_c7_3547_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3285_c7_5f34_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3285_c7_5f34_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3288_c3_4942 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3285_c7_5f34_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3291_c7_3547_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3285_c7_5f34_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3285_c7_5f34_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3285_c7_5f34_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3291_c7_3547_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3285_c7_5f34_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3291_c11_12c8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3291_c11_12c8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3291_c11_12c8_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3291_c7_3547_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3291_c7_3547_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3295_c7_e694_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3291_c7_3547_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3291_c7_3547_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3291_c7_3547_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3295_c7_e694_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3291_c7_3547_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3291_c7_3547_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3291_c7_3547_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3295_c7_e694_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3291_c7_3547_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3291_c7_3547_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3292_c3_0232 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3291_c7_3547_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3295_c7_e694_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3291_c7_3547_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3295_c11_bb72_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3295_c11_bb72_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3295_c11_bb72_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3295_c7_e694_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3295_c7_e694_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3299_c7_0905_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3295_c7_e694_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3295_c7_e694_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3295_c7_e694_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3299_c7_0905_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3295_c7_e694_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3295_c7_e694_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3295_c7_e694_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3299_c7_0905_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3295_c7_e694_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3295_c7_e694_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3296_c3_716b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3295_c7_e694_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3299_c7_0905_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3295_c7_e694_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3299_c11_fd43_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3299_c11_fd43_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3299_c11_fd43_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3299_c7_0905_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3299_c7_0905_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3299_c7_0905_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3299_c7_0905_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3299_c7_0905_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3303_c7_0e85_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3299_c7_0905_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3299_c7_0905_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3299_c7_0905_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3303_c7_0e85_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3299_c7_0905_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3299_c7_0905_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3300_c3_1380 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3299_c7_0905_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3299_c7_0905_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3303_c11_3945_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3303_c11_3945_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3303_c11_3945_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3303_c7_0e85_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3303_c7_0e85_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3303_c7_0e85_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3303_c7_0e85_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3303_c7_0e85_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3303_c7_0e85_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3276_l3271_l3268_l3262_l3285_DUPLICATE_2d42_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3276_l3271_l3299_l3268_l3262_l3279_DUPLICATE_bd32_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3276_l3303_l3271_l3299_l3268_l3295_l3262_l3291_l3279_DUPLICATE_1b78_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3276_l3271_l3268_l3262_l3279_DUPLICATE_77c4_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3276_l3303_l3271_l3299_l3268_l3295_l3291_l3285_l3279_DUPLICATE_dcec_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3276_l3268_l3279_l3271_DUPLICATE_5999_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l3280_l3272_DUPLICATE_8c00_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3299_l3279_DUPLICATE_a44e_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l3289_l3297_DUPLICATE_7ca1_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l3301_l3293_DUPLICATE_f98a_x : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l3301_l3293_DUPLICATE_f98a_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l3293_l3301_DUPLICATE_9cbc_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l3258_l3308_DUPLICATE_6a0d_return_output : opcode_result_t;
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
     VAR_MUX_uxn_opcodes_h_l3283_c32_7ef3_iftrue := signed(std_logic_vector(resize(to_unsigned(4, 3), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3271_c11_9e88_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3262_c2_4953_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3279_c7_75b1_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3299_c11_fd43_right := to_unsigned(8, 4);
     VAR_BIN_OP_AND_uxn_opcodes_h_l3283_c32_5a62_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3285_c11_6ac9_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3303_c7_0e85_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l3283_c32_7ef3_iffalse := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3262_c6_4279_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3268_c11_e050_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3292_c3_0232 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3291_c7_3547_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3292_c3_0232;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3285_c7_5f34_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3277_c3_a610 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3276_c7_f320_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3277_c3_a610;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3262_c1_ae65_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l3283_c32_f48a_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3274_c3_ecab := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3271_c7_1574_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3274_c3_ecab;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3303_c11_3945_right := to_unsigned(9, 4);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3262_c2_4953_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3303_c7_0e85_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3279_c11_147f_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3288_c3_4942 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3285_c7_5f34_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3288_c3_4942;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3295_c11_bb72_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3296_c3_716b := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3295_c7_e694_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3296_c3_716b;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3265_c3_71b8 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3262_c2_4953_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3265_c3_71b8;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3285_c7_5f34_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3291_c11_12c8_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3269_c3_6ab5 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3268_c7_ed96_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3269_c3_6ab5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3276_c11_a5c9_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3300_c3_1380 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3299_c7_0905_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3300_c3_1380;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3279_c7_75b1_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3262_c1_ae65_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l3283_c32_5a62_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3262_c6_4279_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3268_c11_e050_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3271_c11_9e88_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3276_c11_a5c9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3279_c11_147f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3285_c11_6ac9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3291_c11_12c8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3295_c11_bb72_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3299_c11_fd43_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3303_c11_3945_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l3280_c3_2b75_left := t16;
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l3301_l3293_DUPLICATE_f98a_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l3262_c2_4953_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l3268_c7_ed96_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l3276_c7_f320_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l3279_c7_75b1_iffalse := t16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3276_l3303_l3271_l3299_l3268_l3295_l3262_l3291_l3279_DUPLICATE_1b78 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3276_l3303_l3271_l3299_l3268_l3295_l3262_l3291_l3279_DUPLICATE_1b78_return_output := result.is_stack_write;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3276_l3271_l3268_l3262_l3279_DUPLICATE_77c4 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3276_l3271_l3268_l3262_l3279_DUPLICATE_77c4_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l3279_c11_147f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3279_c11_147f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3279_c11_147f_left;
     BIN_OP_EQ_uxn_opcodes_h_l3279_c11_147f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3279_c11_147f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3279_c11_147f_return_output := BIN_OP_EQ_uxn_opcodes_h_l3279_c11_147f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3291_c11_12c8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3291_c11_12c8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3291_c11_12c8_left;
     BIN_OP_EQ_uxn_opcodes_h_l3291_c11_12c8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3291_c11_12c8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3291_c11_12c8_return_output := BIN_OP_EQ_uxn_opcodes_h_l3291_c11_12c8_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l3280_l3272_DUPLICATE_8c00 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l3280_l3272_DUPLICATE_8c00_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l3303_c11_3945] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3303_c11_3945_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3303_c11_3945_left;
     BIN_OP_EQ_uxn_opcodes_h_l3303_c11_3945_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3303_c11_3945_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3303_c11_3945_return_output := BIN_OP_EQ_uxn_opcodes_h_l3303_c11_3945_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3276_l3303_l3271_l3299_l3268_l3295_l3291_l3285_l3279_DUPLICATE_dcec LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3276_l3303_l3271_l3299_l3268_l3295_l3291_l3285_l3279_DUPLICATE_dcec_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l3271_c11_9e88] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3271_c11_9e88_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3271_c11_9e88_left;
     BIN_OP_EQ_uxn_opcodes_h_l3271_c11_9e88_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3271_c11_9e88_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3271_c11_9e88_return_output := BIN_OP_EQ_uxn_opcodes_h_l3271_c11_9e88_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3299_c11_fd43] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3299_c11_fd43_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3299_c11_fd43_left;
     BIN_OP_EQ_uxn_opcodes_h_l3299_c11_fd43_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3299_c11_fd43_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3299_c11_fd43_return_output := BIN_OP_EQ_uxn_opcodes_h_l3299_c11_fd43_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3276_l3271_l3299_l3268_l3262_l3279_DUPLICATE_bd32 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3276_l3271_l3299_l3268_l3262_l3279_DUPLICATE_bd32_return_output := result.stack_value;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3299_l3279_DUPLICATE_a44e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3299_l3279_DUPLICATE_a44e_return_output := result.stack_address_sp_offset;

     -- CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l3289_l3297_DUPLICATE_7ca1 LATENCY=0
     VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l3289_l3297_DUPLICATE_7ca1_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- BIN_OP_EQ[uxn_opcodes_h_l3276_c11_a5c9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3276_c11_a5c9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3276_c11_a5c9_left;
     BIN_OP_EQ_uxn_opcodes_h_l3276_c11_a5c9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3276_c11_a5c9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3276_c11_a5c9_return_output := BIN_OP_EQ_uxn_opcodes_h_l3276_c11_a5c9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3268_c11_e050] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3268_c11_e050_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3268_c11_e050_left;
     BIN_OP_EQ_uxn_opcodes_h_l3268_c11_e050_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3268_c11_e050_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3268_c11_e050_return_output := BIN_OP_EQ_uxn_opcodes_h_l3268_c11_e050_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l3283_c32_5a62] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l3283_c32_5a62_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l3283_c32_5a62_left;
     BIN_OP_AND_uxn_opcodes_h_l3283_c32_5a62_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l3283_c32_5a62_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l3283_c32_5a62_return_output := BIN_OP_AND_uxn_opcodes_h_l3283_c32_5a62_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3295_c11_bb72] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3295_c11_bb72_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3295_c11_bb72_left;
     BIN_OP_EQ_uxn_opcodes_h_l3295_c11_bb72_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3295_c11_bb72_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3295_c11_bb72_return_output := BIN_OP_EQ_uxn_opcodes_h_l3295_c11_bb72_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3276_l3271_l3268_l3262_l3285_DUPLICATE_2d42 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3276_l3271_l3268_l3262_l3285_DUPLICATE_2d42_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l3285_c11_6ac9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3285_c11_6ac9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3285_c11_6ac9_left;
     BIN_OP_EQ_uxn_opcodes_h_l3285_c11_6ac9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3285_c11_6ac9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3285_c11_6ac9_return_output := BIN_OP_EQ_uxn_opcodes_h_l3285_c11_6ac9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3262_c6_4279] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3262_c6_4279_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3262_c6_4279_left;
     BIN_OP_EQ_uxn_opcodes_h_l3262_c6_4279_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3262_c6_4279_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3262_c6_4279_return_output := BIN_OP_EQ_uxn_opcodes_h_l3262_c6_4279_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3276_l3268_l3279_l3271_DUPLICATE_5999 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3276_l3268_l3279_l3271_DUPLICATE_5999_return_output := result.is_stack_read;

     -- CONST_SR_8_uint16_t_uxn_opcodes_h_l3301_l3293_DUPLICATE_f98a LATENCY=0
     -- Inputs
     CONST_SR_8_uint16_t_uxn_opcodes_h_l3301_l3293_DUPLICATE_f98a_x <= VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l3301_l3293_DUPLICATE_f98a_x;
     -- Outputs
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l3301_l3293_DUPLICATE_f98a_return_output := CONST_SR_8_uint16_t_uxn_opcodes_h_l3301_l3293_DUPLICATE_f98a_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l3283_c32_f48a_left := VAR_BIN_OP_AND_uxn_opcodes_h_l3283_c32_5a62_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3262_c1_ae65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3262_c6_4279_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3262_c2_4953_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3262_c6_4279_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3262_c2_4953_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3262_c6_4279_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3262_c2_4953_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3262_c6_4279_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3262_c2_4953_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3262_c6_4279_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3262_c2_4953_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3262_c6_4279_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3262_c2_4953_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3262_c6_4279_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3262_c2_4953_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3262_c6_4279_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3262_c2_4953_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3262_c6_4279_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3268_c7_ed96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3268_c11_e050_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3268_c7_ed96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3268_c11_e050_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3268_c7_ed96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3268_c11_e050_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3268_c7_ed96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3268_c11_e050_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3268_c7_ed96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3268_c11_e050_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3268_c7_ed96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3268_c11_e050_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3268_c7_ed96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3268_c11_e050_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3268_c7_ed96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3268_c11_e050_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3271_c7_1574_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3271_c11_9e88_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3271_c7_1574_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3271_c11_9e88_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3271_c7_1574_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3271_c11_9e88_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3271_c7_1574_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3271_c11_9e88_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3271_c7_1574_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3271_c11_9e88_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3271_c7_1574_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3271_c11_9e88_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3271_c7_1574_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3271_c11_9e88_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3271_c7_1574_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3271_c11_9e88_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3276_c7_f320_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3276_c11_a5c9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3276_c7_f320_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3276_c11_a5c9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3276_c7_f320_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3276_c11_a5c9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3276_c7_f320_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3276_c11_a5c9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3276_c7_f320_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3276_c11_a5c9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3276_c7_f320_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3276_c11_a5c9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3276_c7_f320_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3276_c11_a5c9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3276_c7_f320_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3276_c11_a5c9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3279_c7_75b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3279_c11_147f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3279_c7_75b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3279_c11_147f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3279_c7_75b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3279_c11_147f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3279_c7_75b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3279_c11_147f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3279_c7_75b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3279_c11_147f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3279_c7_75b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3279_c11_147f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3279_c7_75b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3279_c11_147f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3279_c7_75b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3279_c11_147f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3285_c7_5f34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3285_c11_6ac9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3285_c7_5f34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3285_c11_6ac9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3285_c7_5f34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3285_c11_6ac9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3285_c7_5f34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3285_c11_6ac9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3285_c7_5f34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3285_c11_6ac9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3291_c7_3547_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3291_c11_12c8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3291_c7_3547_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3291_c11_12c8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3291_c7_3547_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3291_c11_12c8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3291_c7_3547_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3291_c11_12c8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3295_c7_e694_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3295_c11_bb72_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3295_c7_e694_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3295_c11_bb72_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3295_c7_e694_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3295_c11_bb72_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3295_c7_e694_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3295_c11_bb72_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3299_c7_0905_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3299_c11_fd43_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3299_c7_0905_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3299_c11_fd43_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3299_c7_0905_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3299_c11_fd43_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3299_c7_0905_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3299_c11_fd43_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3303_c7_0e85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3303_c11_3945_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3303_c7_0e85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3303_c11_3945_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l3280_c3_2b75_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l3280_l3272_DUPLICATE_8c00_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l3273_c3_feeb_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l3280_l3272_DUPLICATE_8c00_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3285_c7_5f34_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l3289_l3297_DUPLICATE_7ca1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3295_c7_e694_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l3289_l3297_DUPLICATE_7ca1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3262_c2_4953_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3276_l3271_l3268_l3262_l3279_DUPLICATE_77c4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3268_c7_ed96_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3276_l3271_l3268_l3262_l3279_DUPLICATE_77c4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3271_c7_1574_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3276_l3271_l3268_l3262_l3279_DUPLICATE_77c4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3276_c7_f320_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3276_l3271_l3268_l3262_l3279_DUPLICATE_77c4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3279_c7_75b1_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3276_l3271_l3268_l3262_l3279_DUPLICATE_77c4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3268_c7_ed96_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3276_l3303_l3271_l3299_l3268_l3295_l3291_l3285_l3279_DUPLICATE_dcec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3271_c7_1574_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3276_l3303_l3271_l3299_l3268_l3295_l3291_l3285_l3279_DUPLICATE_dcec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3276_c7_f320_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3276_l3303_l3271_l3299_l3268_l3295_l3291_l3285_l3279_DUPLICATE_dcec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3279_c7_75b1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3276_l3303_l3271_l3299_l3268_l3295_l3291_l3285_l3279_DUPLICATE_dcec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3285_c7_5f34_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3276_l3303_l3271_l3299_l3268_l3295_l3291_l3285_l3279_DUPLICATE_dcec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3291_c7_3547_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3276_l3303_l3271_l3299_l3268_l3295_l3291_l3285_l3279_DUPLICATE_dcec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3295_c7_e694_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3276_l3303_l3271_l3299_l3268_l3295_l3291_l3285_l3279_DUPLICATE_dcec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3299_c7_0905_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3276_l3303_l3271_l3299_l3268_l3295_l3291_l3285_l3279_DUPLICATE_dcec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3303_c7_0e85_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3276_l3303_l3271_l3299_l3268_l3295_l3291_l3285_l3279_DUPLICATE_dcec_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3262_c2_4953_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3276_l3271_l3268_l3262_l3285_DUPLICATE_2d42_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3268_c7_ed96_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3276_l3271_l3268_l3262_l3285_DUPLICATE_2d42_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3271_c7_1574_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3276_l3271_l3268_l3262_l3285_DUPLICATE_2d42_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3276_c7_f320_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3276_l3271_l3268_l3262_l3285_DUPLICATE_2d42_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3285_c7_5f34_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3276_l3271_l3268_l3262_l3285_DUPLICATE_2d42_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3268_c7_ed96_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3276_l3268_l3279_l3271_DUPLICATE_5999_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3271_c7_1574_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3276_l3268_l3279_l3271_DUPLICATE_5999_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3276_c7_f320_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3276_l3268_l3279_l3271_DUPLICATE_5999_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3279_c7_75b1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3276_l3268_l3279_l3271_DUPLICATE_5999_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3262_c2_4953_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3276_l3303_l3271_l3299_l3268_l3295_l3262_l3291_l3279_DUPLICATE_1b78_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3268_c7_ed96_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3276_l3303_l3271_l3299_l3268_l3295_l3262_l3291_l3279_DUPLICATE_1b78_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3271_c7_1574_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3276_l3303_l3271_l3299_l3268_l3295_l3262_l3291_l3279_DUPLICATE_1b78_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3276_c7_f320_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3276_l3303_l3271_l3299_l3268_l3295_l3262_l3291_l3279_DUPLICATE_1b78_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3279_c7_75b1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3276_l3303_l3271_l3299_l3268_l3295_l3262_l3291_l3279_DUPLICATE_1b78_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3291_c7_3547_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3276_l3303_l3271_l3299_l3268_l3295_l3262_l3291_l3279_DUPLICATE_1b78_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3295_c7_e694_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3276_l3303_l3271_l3299_l3268_l3295_l3262_l3291_l3279_DUPLICATE_1b78_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3299_c7_0905_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3276_l3303_l3271_l3299_l3268_l3295_l3262_l3291_l3279_DUPLICATE_1b78_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3303_c7_0e85_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3276_l3303_l3271_l3299_l3268_l3295_l3262_l3291_l3279_DUPLICATE_1b78_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3279_c7_75b1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3299_l3279_DUPLICATE_a44e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3299_c7_0905_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3299_l3279_DUPLICATE_a44e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3262_c2_4953_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3276_l3271_l3299_l3268_l3262_l3279_DUPLICATE_bd32_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3268_c7_ed96_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3276_l3271_l3299_l3268_l3262_l3279_DUPLICATE_bd32_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3271_c7_1574_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3276_l3271_l3299_l3268_l3262_l3279_DUPLICATE_bd32_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3276_c7_f320_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3276_l3271_l3299_l3268_l3262_l3279_DUPLICATE_bd32_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3279_c7_75b1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3276_l3271_l3299_l3268_l3262_l3279_DUPLICATE_bd32_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3299_c7_0905_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3276_l3271_l3299_l3268_l3262_l3279_DUPLICATE_bd32_return_output;
     -- CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l3293_l3301_DUPLICATE_9cbc LATENCY=0
     VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l3293_l3301_DUPLICATE_9cbc_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l3301_l3293_DUPLICATE_f98a_return_output);

     -- result_is_stack_read_MUX[uxn_opcodes_h_l3279_c7_75b1] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3279_c7_75b1_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3279_c7_75b1_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3279_c7_75b1_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3279_c7_75b1_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3279_c7_75b1_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3279_c7_75b1_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3279_c7_75b1_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3279_c7_75b1_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l3280_c3_2b75] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l3280_c3_2b75_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l3280_c3_2b75_left;
     BIN_OP_OR_uxn_opcodes_h_l3280_c3_2b75_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l3280_c3_2b75_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l3280_c3_2b75_return_output := BIN_OP_OR_uxn_opcodes_h_l3280_c3_2b75_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3262_c1_ae65] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3262_c1_ae65_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3262_c1_ae65_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3262_c1_ae65_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3262_c1_ae65_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3262_c1_ae65_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3262_c1_ae65_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3262_c1_ae65_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3262_c1_ae65_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3303_c7_0e85] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3303_c7_0e85_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3303_c7_0e85_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3303_c7_0e85_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3303_c7_0e85_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3303_c7_0e85_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3303_c7_0e85_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3303_c7_0e85_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3303_c7_0e85_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3285_c7_5f34] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3285_c7_5f34_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3285_c7_5f34_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3285_c7_5f34_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3285_c7_5f34_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3285_c7_5f34_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3285_c7_5f34_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3285_c7_5f34_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3285_c7_5f34_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3303_c7_0e85] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3303_c7_0e85_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3303_c7_0e85_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3303_c7_0e85_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3303_c7_0e85_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3303_c7_0e85_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3303_c7_0e85_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3303_c7_0e85_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3303_c7_0e85_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l3283_c32_f48a] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l3283_c32_f48a_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l3283_c32_f48a_left;
     BIN_OP_GT_uxn_opcodes_h_l3283_c32_f48a_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l3283_c32_f48a_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l3283_c32_f48a_return_output := BIN_OP_GT_uxn_opcodes_h_l3283_c32_f48a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3299_c7_0905] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3299_c7_0905_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3299_c7_0905_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3299_c7_0905_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3299_c7_0905_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3299_c7_0905_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3299_c7_0905_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3299_c7_0905_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3299_c7_0905_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l3273_c3_feeb] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l3273_c3_feeb_x <= VAR_CONST_SL_8_uxn_opcodes_h_l3273_c3_feeb_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l3273_c3_feeb_return_output := CONST_SL_8_uxn_opcodes_h_l3273_c3_feeb_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l3283_c32_7ef3_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l3283_c32_f48a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3279_c7_75b1_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l3280_c3_2b75_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3291_c7_3547_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l3293_l3301_DUPLICATE_9cbc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3299_c7_0905_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l3293_l3301_DUPLICATE_9cbc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3271_c7_1574_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l3273_c3_feeb_return_output;
     VAR_printf_uxn_opcodes_h_l3263_c3_db84_uxn_opcodes_h_l3263_c3_db84_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3262_c1_ae65_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3299_c7_0905_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3303_c7_0e85_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3279_c7_75b1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3285_c7_5f34_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3276_c7_f320_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3279_c7_75b1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3299_c7_0905_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3303_c7_0e85_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3295_c7_e694_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3299_c7_0905_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l3299_c7_0905] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3299_c7_0905_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3299_c7_0905_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3299_c7_0905_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3299_c7_0905_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3299_c7_0905_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3299_c7_0905_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3299_c7_0905_return_output := result_stack_value_MUX_uxn_opcodes_h_l3299_c7_0905_return_output;

     -- t16_MUX[uxn_opcodes_h_l3279_c7_75b1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l3279_c7_75b1_cond <= VAR_t16_MUX_uxn_opcodes_h_l3279_c7_75b1_cond;
     t16_MUX_uxn_opcodes_h_l3279_c7_75b1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l3279_c7_75b1_iftrue;
     t16_MUX_uxn_opcodes_h_l3279_c7_75b1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l3279_c7_75b1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l3279_c7_75b1_return_output := t16_MUX_uxn_opcodes_h_l3279_c7_75b1_return_output;

     -- MUX[uxn_opcodes_h_l3283_c32_7ef3] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l3283_c32_7ef3_cond <= VAR_MUX_uxn_opcodes_h_l3283_c32_7ef3_cond;
     MUX_uxn_opcodes_h_l3283_c32_7ef3_iftrue <= VAR_MUX_uxn_opcodes_h_l3283_c32_7ef3_iftrue;
     MUX_uxn_opcodes_h_l3283_c32_7ef3_iffalse <= VAR_MUX_uxn_opcodes_h_l3283_c32_7ef3_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l3283_c32_7ef3_return_output := MUX_uxn_opcodes_h_l3283_c32_7ef3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3295_c7_e694] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3295_c7_e694_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3295_c7_e694_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3295_c7_e694_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3295_c7_e694_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3295_c7_e694_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3295_c7_e694_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3295_c7_e694_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3295_c7_e694_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l3276_c7_f320] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3276_c7_f320_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3276_c7_f320_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3276_c7_f320_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3276_c7_f320_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3276_c7_f320_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3276_c7_f320_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3276_c7_f320_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3276_c7_f320_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3299_c7_0905] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3299_c7_0905_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3299_c7_0905_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3299_c7_0905_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3299_c7_0905_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3299_c7_0905_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3299_c7_0905_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3299_c7_0905_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3299_c7_0905_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3299_c7_0905] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3299_c7_0905_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3299_c7_0905_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3299_c7_0905_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3299_c7_0905_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3299_c7_0905_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3299_c7_0905_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3299_c7_0905_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3299_c7_0905_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3279_c7_75b1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3279_c7_75b1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3279_c7_75b1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3279_c7_75b1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3279_c7_75b1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3279_c7_75b1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3279_c7_75b1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3279_c7_75b1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3279_c7_75b1_return_output;

     -- printf_uxn_opcodes_h_l3263_c3_db84[uxn_opcodes_h_l3263_c3_db84] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l3263_c3_db84_uxn_opcodes_h_l3263_c3_db84_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l3263_c3_db84_uxn_opcodes_h_l3263_c3_db84_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3279_c7_75b1_iftrue := VAR_MUX_uxn_opcodes_h_l3283_c32_7ef3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3295_c7_e694_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3299_c7_0905_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3276_c7_f320_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3279_c7_75b1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3271_c7_1574_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3276_c7_f320_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3295_c7_e694_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3299_c7_0905_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3291_c7_3547_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3295_c7_e694_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3295_c7_e694_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3299_c7_0905_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3276_c7_f320_iffalse := VAR_t16_MUX_uxn_opcodes_h_l3279_c7_75b1_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l3271_c7_1574] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3271_c7_1574_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3271_c7_1574_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3271_c7_1574_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3271_c7_1574_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3271_c7_1574_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3271_c7_1574_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3271_c7_1574_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3271_c7_1574_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3291_c7_3547] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3291_c7_3547_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3291_c7_3547_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3291_c7_3547_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3291_c7_3547_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3291_c7_3547_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3291_c7_3547_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3291_c7_3547_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3291_c7_3547_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3295_c7_e694] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3295_c7_e694_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3295_c7_e694_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3295_c7_e694_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3295_c7_e694_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3295_c7_e694_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3295_c7_e694_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3295_c7_e694_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3295_c7_e694_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3295_c7_e694] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3295_c7_e694_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3295_c7_e694_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3295_c7_e694_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3295_c7_e694_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3295_c7_e694_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3295_c7_e694_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3295_c7_e694_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3295_c7_e694_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3276_c7_f320] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3276_c7_f320_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3276_c7_f320_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3276_c7_f320_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3276_c7_f320_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3276_c7_f320_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3276_c7_f320_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3276_c7_f320_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3276_c7_f320_return_output;

     -- t16_MUX[uxn_opcodes_h_l3276_c7_f320] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l3276_c7_f320_cond <= VAR_t16_MUX_uxn_opcodes_h_l3276_c7_f320_cond;
     t16_MUX_uxn_opcodes_h_l3276_c7_f320_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l3276_c7_f320_iftrue;
     t16_MUX_uxn_opcodes_h_l3276_c7_f320_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l3276_c7_f320_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l3276_c7_f320_return_output := t16_MUX_uxn_opcodes_h_l3276_c7_f320_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3279_c7_75b1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3279_c7_75b1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3279_c7_75b1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3279_c7_75b1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3279_c7_75b1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3279_c7_75b1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3279_c7_75b1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3279_c7_75b1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3279_c7_75b1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3295_c7_e694] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3295_c7_e694_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3295_c7_e694_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3295_c7_e694_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3295_c7_e694_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3295_c7_e694_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3295_c7_e694_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3295_c7_e694_return_output := result_stack_value_MUX_uxn_opcodes_h_l3295_c7_e694_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3291_c7_3547_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3295_c7_e694_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3271_c7_1574_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3276_c7_f320_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3268_c7_ed96_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3271_c7_1574_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3291_c7_3547_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3295_c7_e694_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3276_c7_f320_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3279_c7_75b1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3285_c7_5f34_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3291_c7_3547_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3291_c7_3547_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3295_c7_e694_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3271_c7_1574_iffalse := VAR_t16_MUX_uxn_opcodes_h_l3276_c7_f320_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3285_c7_5f34] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3285_c7_5f34_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3285_c7_5f34_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3285_c7_5f34_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3285_c7_5f34_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3285_c7_5f34_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3285_c7_5f34_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3285_c7_5f34_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3285_c7_5f34_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3291_c7_3547] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3291_c7_3547_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3291_c7_3547_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3291_c7_3547_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3291_c7_3547_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3291_c7_3547_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3291_c7_3547_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3291_c7_3547_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3291_c7_3547_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3291_c7_3547] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3291_c7_3547_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3291_c7_3547_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3291_c7_3547_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3291_c7_3547_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3291_c7_3547_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3291_c7_3547_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3291_c7_3547_return_output := result_stack_value_MUX_uxn_opcodes_h_l3291_c7_3547_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3276_c7_f320] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3276_c7_f320_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3276_c7_f320_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3276_c7_f320_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3276_c7_f320_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3276_c7_f320_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3276_c7_f320_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3276_c7_f320_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3276_c7_f320_return_output;

     -- t16_MUX[uxn_opcodes_h_l3271_c7_1574] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l3271_c7_1574_cond <= VAR_t16_MUX_uxn_opcodes_h_l3271_c7_1574_cond;
     t16_MUX_uxn_opcodes_h_l3271_c7_1574_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l3271_c7_1574_iftrue;
     t16_MUX_uxn_opcodes_h_l3271_c7_1574_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l3271_c7_1574_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l3271_c7_1574_return_output := t16_MUX_uxn_opcodes_h_l3271_c7_1574_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3271_c7_1574] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3271_c7_1574_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3271_c7_1574_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3271_c7_1574_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3271_c7_1574_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3271_c7_1574_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3271_c7_1574_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3271_c7_1574_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3271_c7_1574_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3291_c7_3547] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3291_c7_3547_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3291_c7_3547_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3291_c7_3547_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3291_c7_3547_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3291_c7_3547_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3291_c7_3547_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3291_c7_3547_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3291_c7_3547_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l3268_c7_ed96] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3268_c7_ed96_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3268_c7_ed96_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3268_c7_ed96_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3268_c7_ed96_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3268_c7_ed96_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3268_c7_ed96_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3268_c7_ed96_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3268_c7_ed96_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3285_c7_5f34_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3291_c7_3547_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3268_c7_ed96_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3271_c7_1574_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3262_c2_4953_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3268_c7_ed96_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3285_c7_5f34_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3291_c7_3547_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3271_c7_1574_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3276_c7_f320_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3279_c7_75b1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3285_c7_5f34_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3285_c7_5f34_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3291_c7_3547_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3268_c7_ed96_iffalse := VAR_t16_MUX_uxn_opcodes_h_l3271_c7_1574_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l3285_c7_5f34] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3285_c7_5f34_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3285_c7_5f34_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3285_c7_5f34_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3285_c7_5f34_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3285_c7_5f34_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3285_c7_5f34_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3285_c7_5f34_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3285_c7_5f34_return_output;

     -- t16_MUX[uxn_opcodes_h_l3268_c7_ed96] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l3268_c7_ed96_cond <= VAR_t16_MUX_uxn_opcodes_h_l3268_c7_ed96_cond;
     t16_MUX_uxn_opcodes_h_l3268_c7_ed96_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l3268_c7_ed96_iftrue;
     t16_MUX_uxn_opcodes_h_l3268_c7_ed96_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l3268_c7_ed96_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l3268_c7_ed96_return_output := t16_MUX_uxn_opcodes_h_l3268_c7_ed96_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l3262_c2_4953] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3262_c2_4953_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3262_c2_4953_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3262_c2_4953_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3262_c2_4953_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3262_c2_4953_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3262_c2_4953_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3262_c2_4953_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3262_c2_4953_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3279_c7_75b1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3279_c7_75b1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3279_c7_75b1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3279_c7_75b1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3279_c7_75b1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3279_c7_75b1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3279_c7_75b1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3279_c7_75b1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3279_c7_75b1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3285_c7_5f34] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3285_c7_5f34_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3285_c7_5f34_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3285_c7_5f34_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3285_c7_5f34_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3285_c7_5f34_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3285_c7_5f34_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3285_c7_5f34_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3285_c7_5f34_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3271_c7_1574] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3271_c7_1574_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3271_c7_1574_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3271_c7_1574_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3271_c7_1574_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3271_c7_1574_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3271_c7_1574_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3271_c7_1574_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3271_c7_1574_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3268_c7_ed96] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3268_c7_ed96_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3268_c7_ed96_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3268_c7_ed96_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3268_c7_ed96_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3268_c7_ed96_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3268_c7_ed96_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3268_c7_ed96_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3268_c7_ed96_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3285_c7_5f34] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3285_c7_5f34_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3285_c7_5f34_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3285_c7_5f34_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3285_c7_5f34_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3285_c7_5f34_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3285_c7_5f34_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3285_c7_5f34_return_output := result_stack_value_MUX_uxn_opcodes_h_l3285_c7_5f34_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3279_c7_75b1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3285_c7_5f34_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3262_c2_4953_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3268_c7_ed96_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3279_c7_75b1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3285_c7_5f34_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3268_c7_ed96_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3271_c7_1574_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3276_c7_f320_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3279_c7_75b1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3279_c7_75b1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3285_c7_5f34_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3262_c2_4953_iffalse := VAR_t16_MUX_uxn_opcodes_h_l3268_c7_ed96_return_output;
     -- t16_MUX[uxn_opcodes_h_l3262_c2_4953] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l3262_c2_4953_cond <= VAR_t16_MUX_uxn_opcodes_h_l3262_c2_4953_cond;
     t16_MUX_uxn_opcodes_h_l3262_c2_4953_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l3262_c2_4953_iftrue;
     t16_MUX_uxn_opcodes_h_l3262_c2_4953_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l3262_c2_4953_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l3262_c2_4953_return_output := t16_MUX_uxn_opcodes_h_l3262_c2_4953_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3262_c2_4953] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3262_c2_4953_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3262_c2_4953_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3262_c2_4953_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3262_c2_4953_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3262_c2_4953_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3262_c2_4953_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3262_c2_4953_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3262_c2_4953_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3279_c7_75b1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3279_c7_75b1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3279_c7_75b1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3279_c7_75b1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3279_c7_75b1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3279_c7_75b1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3279_c7_75b1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3279_c7_75b1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3279_c7_75b1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3279_c7_75b1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3279_c7_75b1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3279_c7_75b1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3279_c7_75b1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3279_c7_75b1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3279_c7_75b1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3279_c7_75b1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3279_c7_75b1_return_output := result_stack_value_MUX_uxn_opcodes_h_l3279_c7_75b1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3279_c7_75b1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3279_c7_75b1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3279_c7_75b1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3279_c7_75b1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3279_c7_75b1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3279_c7_75b1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3279_c7_75b1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3279_c7_75b1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3279_c7_75b1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3268_c7_ed96] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3268_c7_ed96_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3268_c7_ed96_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3268_c7_ed96_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3268_c7_ed96_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3268_c7_ed96_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3268_c7_ed96_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3268_c7_ed96_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3268_c7_ed96_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3276_c7_f320] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3276_c7_f320_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3276_c7_f320_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3276_c7_f320_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3276_c7_f320_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3276_c7_f320_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3276_c7_f320_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3276_c7_f320_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3276_c7_f320_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3276_c7_f320_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3279_c7_75b1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3276_c7_f320_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3279_c7_75b1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3262_c2_4953_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3268_c7_ed96_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3271_c7_1574_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3276_c7_f320_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3276_c7_f320_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3279_c7_75b1_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l3262_c2_4953_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l3276_c7_f320] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3276_c7_f320_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3276_c7_f320_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3276_c7_f320_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3276_c7_f320_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3276_c7_f320_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3276_c7_f320_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3276_c7_f320_return_output := result_stack_value_MUX_uxn_opcodes_h_l3276_c7_f320_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3271_c7_1574] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3271_c7_1574_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3271_c7_1574_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3271_c7_1574_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3271_c7_1574_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3271_c7_1574_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3271_c7_1574_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3271_c7_1574_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3271_c7_1574_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3262_c2_4953] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3262_c2_4953_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3262_c2_4953_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3262_c2_4953_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3262_c2_4953_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3262_c2_4953_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3262_c2_4953_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3262_c2_4953_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3262_c2_4953_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3276_c7_f320] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3276_c7_f320_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3276_c7_f320_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3276_c7_f320_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3276_c7_f320_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3276_c7_f320_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3276_c7_f320_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3276_c7_f320_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3276_c7_f320_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3276_c7_f320] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3276_c7_f320_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3276_c7_f320_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3276_c7_f320_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3276_c7_f320_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3276_c7_f320_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3276_c7_f320_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3276_c7_f320_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3276_c7_f320_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3271_c7_1574_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3276_c7_f320_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3271_c7_1574_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3276_c7_f320_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3268_c7_ed96_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3271_c7_1574_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3271_c7_1574_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3276_c7_f320_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3268_c7_ed96] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3268_c7_ed96_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3268_c7_ed96_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3268_c7_ed96_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3268_c7_ed96_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3268_c7_ed96_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3268_c7_ed96_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3268_c7_ed96_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3268_c7_ed96_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3271_c7_1574] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3271_c7_1574_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3271_c7_1574_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3271_c7_1574_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3271_c7_1574_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3271_c7_1574_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3271_c7_1574_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3271_c7_1574_return_output := result_stack_value_MUX_uxn_opcodes_h_l3271_c7_1574_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3271_c7_1574] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3271_c7_1574_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3271_c7_1574_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3271_c7_1574_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3271_c7_1574_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3271_c7_1574_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3271_c7_1574_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3271_c7_1574_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3271_c7_1574_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3271_c7_1574] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3271_c7_1574_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3271_c7_1574_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3271_c7_1574_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3271_c7_1574_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3271_c7_1574_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3271_c7_1574_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3271_c7_1574_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3271_c7_1574_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3268_c7_ed96_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3271_c7_1574_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3268_c7_ed96_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3271_c7_1574_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3262_c2_4953_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3268_c7_ed96_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3268_c7_ed96_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3271_c7_1574_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l3268_c7_ed96] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3268_c7_ed96_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3268_c7_ed96_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3268_c7_ed96_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3268_c7_ed96_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3268_c7_ed96_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3268_c7_ed96_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3268_c7_ed96_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3268_c7_ed96_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3262_c2_4953] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3262_c2_4953_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3262_c2_4953_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3262_c2_4953_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3262_c2_4953_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3262_c2_4953_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3262_c2_4953_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3262_c2_4953_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3262_c2_4953_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3268_c7_ed96] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3268_c7_ed96_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3268_c7_ed96_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3268_c7_ed96_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3268_c7_ed96_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3268_c7_ed96_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3268_c7_ed96_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3268_c7_ed96_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3268_c7_ed96_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3268_c7_ed96] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3268_c7_ed96_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3268_c7_ed96_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3268_c7_ed96_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3268_c7_ed96_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3268_c7_ed96_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3268_c7_ed96_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3268_c7_ed96_return_output := result_stack_value_MUX_uxn_opcodes_h_l3268_c7_ed96_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3262_c2_4953_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3268_c7_ed96_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3262_c2_4953_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3268_c7_ed96_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3262_c2_4953_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3268_c7_ed96_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l3262_c2_4953] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3262_c2_4953_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3262_c2_4953_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3262_c2_4953_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3262_c2_4953_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3262_c2_4953_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3262_c2_4953_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3262_c2_4953_return_output := result_stack_value_MUX_uxn_opcodes_h_l3262_c2_4953_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3262_c2_4953] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3262_c2_4953_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3262_c2_4953_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3262_c2_4953_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3262_c2_4953_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3262_c2_4953_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3262_c2_4953_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3262_c2_4953_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3262_c2_4953_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3262_c2_4953] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3262_c2_4953_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3262_c2_4953_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3262_c2_4953_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3262_c2_4953_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3262_c2_4953_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3262_c2_4953_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3262_c2_4953_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3262_c2_4953_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l3258_l3308_DUPLICATE_6a0d LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l3258_l3308_DUPLICATE_6a0d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_287e(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3262_c2_4953_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3262_c2_4953_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3262_c2_4953_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3262_c2_4953_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3262_c2_4953_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3262_c2_4953_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3262_c2_4953_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l3258_l3308_DUPLICATE_6a0d_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l3258_l3308_DUPLICATE_6a0d_return_output;
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
