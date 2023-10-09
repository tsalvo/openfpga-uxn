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
-- Submodules: 107
entity neq2_0CLK_3a9c1537 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end neq2_0CLK_3a9c1537;
architecture arch of neq2_0CLK_3a9c1537 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1445_c6_e438]
signal BIN_OP_EQ_uxn_opcodes_h_l1445_c6_e438_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1445_c6_e438_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1445_c6_e438_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1445_c1_0b66]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1445_c1_0b66_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1445_c1_0b66_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1445_c1_0b66_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1445_c1_0b66_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1445_c2_26ec]
signal t16_MUX_uxn_opcodes_h_l1445_c2_26ec_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1445_c2_26ec_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1445_c2_26ec_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1445_c2_26ec_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1445_c2_26ec]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1445_c2_26ec_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1445_c2_26ec_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1445_c2_26ec_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1445_c2_26ec_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1445_c2_26ec]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1445_c2_26ec_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1445_c2_26ec_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1445_c2_26ec_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1445_c2_26ec_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1445_c2_26ec]
signal result_stack_value_MUX_uxn_opcodes_h_l1445_c2_26ec_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1445_c2_26ec_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1445_c2_26ec_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1445_c2_26ec_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1445_c2_26ec]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1445_c2_26ec_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1445_c2_26ec_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1445_c2_26ec_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1445_c2_26ec_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1445_c2_26ec]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1445_c2_26ec_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1445_c2_26ec_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1445_c2_26ec_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1445_c2_26ec_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1445_c2_26ec]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1445_c2_26ec_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1445_c2_26ec_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1445_c2_26ec_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1445_c2_26ec_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1445_c2_26ec]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1445_c2_26ec_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1445_c2_26ec_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1445_c2_26ec_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1445_c2_26ec_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1445_c2_26ec]
signal n16_MUX_uxn_opcodes_h_l1445_c2_26ec_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1445_c2_26ec_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1445_c2_26ec_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1445_c2_26ec_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1446_c3_8706[uxn_opcodes_h_l1446_c3_8706]
signal printf_uxn_opcodes_h_l1446_c3_8706_uxn_opcodes_h_l1446_c3_8706_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1451_c11_3969]
signal BIN_OP_EQ_uxn_opcodes_h_l1451_c11_3969_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1451_c11_3969_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1451_c11_3969_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1451_c7_927c]
signal t16_MUX_uxn_opcodes_h_l1451_c7_927c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1451_c7_927c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1451_c7_927c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1451_c7_927c_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1451_c7_927c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1451_c7_927c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1451_c7_927c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1451_c7_927c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1451_c7_927c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1451_c7_927c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1451_c7_927c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1451_c7_927c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1451_c7_927c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1451_c7_927c_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1451_c7_927c]
signal result_stack_value_MUX_uxn_opcodes_h_l1451_c7_927c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1451_c7_927c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1451_c7_927c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1451_c7_927c_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1451_c7_927c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1451_c7_927c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1451_c7_927c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1451_c7_927c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1451_c7_927c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1451_c7_927c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1451_c7_927c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1451_c7_927c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1451_c7_927c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1451_c7_927c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1451_c7_927c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1451_c7_927c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1451_c7_927c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1451_c7_927c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1451_c7_927c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1451_c7_927c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1451_c7_927c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1451_c7_927c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1451_c7_927c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1451_c7_927c_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1451_c7_927c]
signal n16_MUX_uxn_opcodes_h_l1451_c7_927c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1451_c7_927c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1451_c7_927c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1451_c7_927c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1454_c11_6545]
signal BIN_OP_EQ_uxn_opcodes_h_l1454_c11_6545_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1454_c11_6545_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1454_c11_6545_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1454_c7_6d5b]
signal t16_MUX_uxn_opcodes_h_l1454_c7_6d5b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1454_c7_6d5b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1454_c7_6d5b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1454_c7_6d5b_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1454_c7_6d5b]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_6d5b_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_6d5b_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_6d5b_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_6d5b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1454_c7_6d5b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_6d5b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_6d5b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_6d5b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_6d5b_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1454_c7_6d5b]
signal result_stack_value_MUX_uxn_opcodes_h_l1454_c7_6d5b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1454_c7_6d5b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1454_c7_6d5b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1454_c7_6d5b_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1454_c7_6d5b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_6d5b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_6d5b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_6d5b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_6d5b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1454_c7_6d5b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_6d5b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_6d5b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_6d5b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_6d5b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1454_c7_6d5b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_6d5b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_6d5b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_6d5b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_6d5b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1454_c7_6d5b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_6d5b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_6d5b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_6d5b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_6d5b_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1454_c7_6d5b]
signal n16_MUX_uxn_opcodes_h_l1454_c7_6d5b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1454_c7_6d5b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1454_c7_6d5b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1454_c7_6d5b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1459_c11_5a24]
signal BIN_OP_EQ_uxn_opcodes_h_l1459_c11_5a24_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1459_c11_5a24_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1459_c11_5a24_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1459_c7_fdac]
signal t16_MUX_uxn_opcodes_h_l1459_c7_fdac_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1459_c7_fdac_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1459_c7_fdac_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1459_c7_fdac_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1459_c7_fdac]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1459_c7_fdac_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1459_c7_fdac_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1459_c7_fdac_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1459_c7_fdac_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1459_c7_fdac]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1459_c7_fdac_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1459_c7_fdac_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1459_c7_fdac_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1459_c7_fdac_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1459_c7_fdac]
signal result_stack_value_MUX_uxn_opcodes_h_l1459_c7_fdac_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1459_c7_fdac_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1459_c7_fdac_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1459_c7_fdac_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1459_c7_fdac]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1459_c7_fdac_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1459_c7_fdac_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1459_c7_fdac_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1459_c7_fdac_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1459_c7_fdac]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1459_c7_fdac_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1459_c7_fdac_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1459_c7_fdac_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1459_c7_fdac_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1459_c7_fdac]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1459_c7_fdac_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1459_c7_fdac_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1459_c7_fdac_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1459_c7_fdac_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1459_c7_fdac]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1459_c7_fdac_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1459_c7_fdac_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1459_c7_fdac_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1459_c7_fdac_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1459_c7_fdac]
signal n16_MUX_uxn_opcodes_h_l1459_c7_fdac_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1459_c7_fdac_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1459_c7_fdac_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1459_c7_fdac_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1462_c11_cf40]
signal BIN_OP_EQ_uxn_opcodes_h_l1462_c11_cf40_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1462_c11_cf40_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1462_c11_cf40_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1462_c7_abce]
signal t16_MUX_uxn_opcodes_h_l1462_c7_abce_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1462_c7_abce_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1462_c7_abce_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1462_c7_abce_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1462_c7_abce]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1462_c7_abce_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1462_c7_abce_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1462_c7_abce_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1462_c7_abce_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1462_c7_abce]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1462_c7_abce_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1462_c7_abce_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1462_c7_abce_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1462_c7_abce_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1462_c7_abce]
signal result_stack_value_MUX_uxn_opcodes_h_l1462_c7_abce_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1462_c7_abce_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1462_c7_abce_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1462_c7_abce_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1462_c7_abce]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1462_c7_abce_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1462_c7_abce_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1462_c7_abce_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1462_c7_abce_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1462_c7_abce]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1462_c7_abce_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1462_c7_abce_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1462_c7_abce_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1462_c7_abce_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1462_c7_abce]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1462_c7_abce_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1462_c7_abce_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1462_c7_abce_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1462_c7_abce_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1462_c7_abce]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1462_c7_abce_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1462_c7_abce_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1462_c7_abce_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1462_c7_abce_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1462_c7_abce]
signal n16_MUX_uxn_opcodes_h_l1462_c7_abce_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1462_c7_abce_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1462_c7_abce_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1462_c7_abce_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1463_c3_f698]
signal BIN_OP_OR_uxn_opcodes_h_l1463_c3_f698_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1463_c3_f698_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1463_c3_f698_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1466_c11_ebb9]
signal BIN_OP_EQ_uxn_opcodes_h_l1466_c11_ebb9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1466_c11_ebb9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1466_c11_ebb9_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1466_c7_2ec6]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1466_c7_2ec6_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1466_c7_2ec6_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1466_c7_2ec6_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1466_c7_2ec6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1466_c7_2ec6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1466_c7_2ec6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1466_c7_2ec6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1466_c7_2ec6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1466_c7_2ec6_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1466_c7_2ec6]
signal result_stack_value_MUX_uxn_opcodes_h_l1466_c7_2ec6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1466_c7_2ec6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1466_c7_2ec6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1466_c7_2ec6_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1466_c7_2ec6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1466_c7_2ec6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1466_c7_2ec6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1466_c7_2ec6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1466_c7_2ec6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1466_c7_2ec6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1466_c7_2ec6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1466_c7_2ec6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1466_c7_2ec6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1466_c7_2ec6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1466_c7_2ec6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1466_c7_2ec6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1466_c7_2ec6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1466_c7_2ec6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1466_c7_2ec6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1466_c7_2ec6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1466_c7_2ec6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1466_c7_2ec6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1466_c7_2ec6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1466_c7_2ec6_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1466_c7_2ec6]
signal n16_MUX_uxn_opcodes_h_l1466_c7_2ec6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1466_c7_2ec6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1466_c7_2ec6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1466_c7_2ec6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1469_c11_b093]
signal BIN_OP_EQ_uxn_opcodes_h_l1469_c11_b093_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1469_c11_b093_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1469_c11_b093_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1469_c7_fc5c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1469_c7_fc5c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1469_c7_fc5c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1469_c7_fc5c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1469_c7_fc5c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1469_c7_fc5c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1469_c7_fc5c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1469_c7_fc5c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1469_c7_fc5c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1469_c7_fc5c_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1469_c7_fc5c]
signal result_stack_value_MUX_uxn_opcodes_h_l1469_c7_fc5c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1469_c7_fc5c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1469_c7_fc5c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1469_c7_fc5c_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1469_c7_fc5c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1469_c7_fc5c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1469_c7_fc5c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1469_c7_fc5c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1469_c7_fc5c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1469_c7_fc5c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1469_c7_fc5c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1469_c7_fc5c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1469_c7_fc5c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1469_c7_fc5c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1469_c7_fc5c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1469_c7_fc5c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1469_c7_fc5c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1469_c7_fc5c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1469_c7_fc5c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1469_c7_fc5c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1469_c7_fc5c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1469_c7_fc5c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1469_c7_fc5c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1469_c7_fc5c_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1469_c7_fc5c]
signal n16_MUX_uxn_opcodes_h_l1469_c7_fc5c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1469_c7_fc5c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1469_c7_fc5c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1469_c7_fc5c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1474_c11_5792]
signal BIN_OP_EQ_uxn_opcodes_h_l1474_c11_5792_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1474_c11_5792_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1474_c11_5792_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1474_c7_bd86]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1474_c7_bd86_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1474_c7_bd86_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1474_c7_bd86_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1474_c7_bd86_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1474_c7_bd86]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1474_c7_bd86_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1474_c7_bd86_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1474_c7_bd86_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1474_c7_bd86_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1474_c7_bd86]
signal result_stack_value_MUX_uxn_opcodes_h_l1474_c7_bd86_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1474_c7_bd86_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1474_c7_bd86_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1474_c7_bd86_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1474_c7_bd86]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1474_c7_bd86_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1474_c7_bd86_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1474_c7_bd86_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1474_c7_bd86_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1474_c7_bd86]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1474_c7_bd86_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1474_c7_bd86_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1474_c7_bd86_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1474_c7_bd86_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1474_c7_bd86]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1474_c7_bd86_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1474_c7_bd86_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1474_c7_bd86_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1474_c7_bd86_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1474_c7_bd86]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c7_bd86_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c7_bd86_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c7_bd86_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c7_bd86_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1474_c7_bd86]
signal n16_MUX_uxn_opcodes_h_l1474_c7_bd86_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1474_c7_bd86_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1474_c7_bd86_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1474_c7_bd86_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1477_c11_ef68]
signal BIN_OP_EQ_uxn_opcodes_h_l1477_c11_ef68_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1477_c11_ef68_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1477_c11_ef68_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1477_c7_f54e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1477_c7_f54e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1477_c7_f54e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1477_c7_f54e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1477_c7_f54e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1477_c7_f54e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c7_f54e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c7_f54e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c7_f54e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c7_f54e_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1477_c7_f54e]
signal result_stack_value_MUX_uxn_opcodes_h_l1477_c7_f54e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1477_c7_f54e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1477_c7_f54e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1477_c7_f54e_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1477_c7_f54e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_f54e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_f54e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_f54e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_f54e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1477_c7_f54e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_f54e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_f54e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_f54e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_f54e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1477_c7_f54e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_f54e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_f54e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_f54e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_f54e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1477_c7_f54e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_f54e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_f54e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_f54e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_f54e_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1477_c7_f54e]
signal n16_MUX_uxn_opcodes_h_l1477_c7_f54e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1477_c7_f54e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1477_c7_f54e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1477_c7_f54e_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1478_c3_426e]
signal BIN_OP_OR_uxn_opcodes_h_l1478_c3_426e_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1478_c3_426e_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1478_c3_426e_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1481_c32_bc96]
signal BIN_OP_AND_uxn_opcodes_h_l1481_c32_bc96_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1481_c32_bc96_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1481_c32_bc96_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1481_c32_ca5e]
signal BIN_OP_GT_uxn_opcodes_h_l1481_c32_ca5e_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1481_c32_ca5e_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1481_c32_ca5e_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1481_c32_ddc8]
signal MUX_uxn_opcodes_h_l1481_c32_ddc8_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1481_c32_ddc8_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1481_c32_ddc8_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1481_c32_ddc8_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1483_c11_464d]
signal BIN_OP_EQ_uxn_opcodes_h_l1483_c11_464d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1483_c11_464d_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1483_c11_464d_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1483_c7_8386]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c7_8386_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c7_8386_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c7_8386_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c7_8386_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1483_c7_8386]
signal result_stack_value_MUX_uxn_opcodes_h_l1483_c7_8386_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1483_c7_8386_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1483_c7_8386_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1483_c7_8386_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1483_c7_8386]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1483_c7_8386_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1483_c7_8386_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1483_c7_8386_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1483_c7_8386_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1483_c7_8386]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1483_c7_8386_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1483_c7_8386_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1483_c7_8386_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1483_c7_8386_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1483_c7_8386]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c7_8386_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c7_8386_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c7_8386_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c7_8386_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1487_c24_0e70]
signal BIN_OP_EQ_uxn_opcodes_h_l1487_c24_0e70_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1487_c24_0e70_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1487_c24_0e70_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1487_c24_b9d8]
signal MUX_uxn_opcodes_h_l1487_c24_b9d8_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1487_c24_b9d8_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1487_c24_b9d8_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1487_c24_b9d8_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1489_c11_326f]
signal BIN_OP_EQ_uxn_opcodes_h_l1489_c11_326f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1489_c11_326f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1489_c11_326f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1489_c7_b8e0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_b8e0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_b8e0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_b8e0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_b8e0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1489_c7_b8e0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_b8e0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_b8e0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_b8e0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_b8e0_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1471_l1456_DUPLICATE_bfef
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1471_l1456_DUPLICATE_bfef_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1471_l1456_DUPLICATE_bfef_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

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
-- BIN_OP_EQ_uxn_opcodes_h_l1445_c6_e438
BIN_OP_EQ_uxn_opcodes_h_l1445_c6_e438 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1445_c6_e438_left,
BIN_OP_EQ_uxn_opcodes_h_l1445_c6_e438_right,
BIN_OP_EQ_uxn_opcodes_h_l1445_c6_e438_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1445_c1_0b66
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1445_c1_0b66 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1445_c1_0b66_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1445_c1_0b66_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1445_c1_0b66_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1445_c1_0b66_return_output);

-- t16_MUX_uxn_opcodes_h_l1445_c2_26ec
t16_MUX_uxn_opcodes_h_l1445_c2_26ec : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1445_c2_26ec_cond,
t16_MUX_uxn_opcodes_h_l1445_c2_26ec_iftrue,
t16_MUX_uxn_opcodes_h_l1445_c2_26ec_iffalse,
t16_MUX_uxn_opcodes_h_l1445_c2_26ec_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1445_c2_26ec
result_is_stack_read_MUX_uxn_opcodes_h_l1445_c2_26ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1445_c2_26ec_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1445_c2_26ec_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1445_c2_26ec_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1445_c2_26ec_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1445_c2_26ec
result_sp_relative_shift_MUX_uxn_opcodes_h_l1445_c2_26ec : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1445_c2_26ec_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1445_c2_26ec_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1445_c2_26ec_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1445_c2_26ec_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1445_c2_26ec
result_stack_value_MUX_uxn_opcodes_h_l1445_c2_26ec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1445_c2_26ec_cond,
result_stack_value_MUX_uxn_opcodes_h_l1445_c2_26ec_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1445_c2_26ec_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1445_c2_26ec_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1445_c2_26ec
result_is_sp_shift_MUX_uxn_opcodes_h_l1445_c2_26ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1445_c2_26ec_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1445_c2_26ec_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1445_c2_26ec_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1445_c2_26ec_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1445_c2_26ec
result_is_stack_write_MUX_uxn_opcodes_h_l1445_c2_26ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1445_c2_26ec_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1445_c2_26ec_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1445_c2_26ec_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1445_c2_26ec_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1445_c2_26ec
result_is_opc_done_MUX_uxn_opcodes_h_l1445_c2_26ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1445_c2_26ec_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1445_c2_26ec_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1445_c2_26ec_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1445_c2_26ec_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1445_c2_26ec
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1445_c2_26ec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1445_c2_26ec_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1445_c2_26ec_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1445_c2_26ec_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1445_c2_26ec_return_output);

-- n16_MUX_uxn_opcodes_h_l1445_c2_26ec
n16_MUX_uxn_opcodes_h_l1445_c2_26ec : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1445_c2_26ec_cond,
n16_MUX_uxn_opcodes_h_l1445_c2_26ec_iftrue,
n16_MUX_uxn_opcodes_h_l1445_c2_26ec_iffalse,
n16_MUX_uxn_opcodes_h_l1445_c2_26ec_return_output);

-- printf_uxn_opcodes_h_l1446_c3_8706_uxn_opcodes_h_l1446_c3_8706
printf_uxn_opcodes_h_l1446_c3_8706_uxn_opcodes_h_l1446_c3_8706 : entity work.printf_uxn_opcodes_h_l1446_c3_8706_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1446_c3_8706_uxn_opcodes_h_l1446_c3_8706_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1451_c11_3969
BIN_OP_EQ_uxn_opcodes_h_l1451_c11_3969 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1451_c11_3969_left,
BIN_OP_EQ_uxn_opcodes_h_l1451_c11_3969_right,
BIN_OP_EQ_uxn_opcodes_h_l1451_c11_3969_return_output);

-- t16_MUX_uxn_opcodes_h_l1451_c7_927c
t16_MUX_uxn_opcodes_h_l1451_c7_927c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1451_c7_927c_cond,
t16_MUX_uxn_opcodes_h_l1451_c7_927c_iftrue,
t16_MUX_uxn_opcodes_h_l1451_c7_927c_iffalse,
t16_MUX_uxn_opcodes_h_l1451_c7_927c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1451_c7_927c
result_is_stack_read_MUX_uxn_opcodes_h_l1451_c7_927c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1451_c7_927c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1451_c7_927c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1451_c7_927c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1451_c7_927c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1451_c7_927c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1451_c7_927c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1451_c7_927c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1451_c7_927c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1451_c7_927c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1451_c7_927c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1451_c7_927c
result_stack_value_MUX_uxn_opcodes_h_l1451_c7_927c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1451_c7_927c_cond,
result_stack_value_MUX_uxn_opcodes_h_l1451_c7_927c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1451_c7_927c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1451_c7_927c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1451_c7_927c
result_is_sp_shift_MUX_uxn_opcodes_h_l1451_c7_927c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1451_c7_927c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1451_c7_927c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1451_c7_927c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1451_c7_927c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1451_c7_927c
result_is_stack_write_MUX_uxn_opcodes_h_l1451_c7_927c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1451_c7_927c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1451_c7_927c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1451_c7_927c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1451_c7_927c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1451_c7_927c
result_is_opc_done_MUX_uxn_opcodes_h_l1451_c7_927c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1451_c7_927c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1451_c7_927c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1451_c7_927c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1451_c7_927c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1451_c7_927c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1451_c7_927c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1451_c7_927c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1451_c7_927c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1451_c7_927c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1451_c7_927c_return_output);

-- n16_MUX_uxn_opcodes_h_l1451_c7_927c
n16_MUX_uxn_opcodes_h_l1451_c7_927c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1451_c7_927c_cond,
n16_MUX_uxn_opcodes_h_l1451_c7_927c_iftrue,
n16_MUX_uxn_opcodes_h_l1451_c7_927c_iffalse,
n16_MUX_uxn_opcodes_h_l1451_c7_927c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1454_c11_6545
BIN_OP_EQ_uxn_opcodes_h_l1454_c11_6545 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1454_c11_6545_left,
BIN_OP_EQ_uxn_opcodes_h_l1454_c11_6545_right,
BIN_OP_EQ_uxn_opcodes_h_l1454_c11_6545_return_output);

-- t16_MUX_uxn_opcodes_h_l1454_c7_6d5b
t16_MUX_uxn_opcodes_h_l1454_c7_6d5b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1454_c7_6d5b_cond,
t16_MUX_uxn_opcodes_h_l1454_c7_6d5b_iftrue,
t16_MUX_uxn_opcodes_h_l1454_c7_6d5b_iffalse,
t16_MUX_uxn_opcodes_h_l1454_c7_6d5b_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_6d5b
result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_6d5b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_6d5b_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_6d5b_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_6d5b_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_6d5b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_6d5b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_6d5b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_6d5b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_6d5b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_6d5b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_6d5b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1454_c7_6d5b
result_stack_value_MUX_uxn_opcodes_h_l1454_c7_6d5b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1454_c7_6d5b_cond,
result_stack_value_MUX_uxn_opcodes_h_l1454_c7_6d5b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1454_c7_6d5b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1454_c7_6d5b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_6d5b
result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_6d5b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_6d5b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_6d5b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_6d5b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_6d5b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_6d5b
result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_6d5b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_6d5b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_6d5b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_6d5b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_6d5b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_6d5b
result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_6d5b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_6d5b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_6d5b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_6d5b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_6d5b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_6d5b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_6d5b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_6d5b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_6d5b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_6d5b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_6d5b_return_output);

-- n16_MUX_uxn_opcodes_h_l1454_c7_6d5b
n16_MUX_uxn_opcodes_h_l1454_c7_6d5b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1454_c7_6d5b_cond,
n16_MUX_uxn_opcodes_h_l1454_c7_6d5b_iftrue,
n16_MUX_uxn_opcodes_h_l1454_c7_6d5b_iffalse,
n16_MUX_uxn_opcodes_h_l1454_c7_6d5b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1459_c11_5a24
BIN_OP_EQ_uxn_opcodes_h_l1459_c11_5a24 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1459_c11_5a24_left,
BIN_OP_EQ_uxn_opcodes_h_l1459_c11_5a24_right,
BIN_OP_EQ_uxn_opcodes_h_l1459_c11_5a24_return_output);

-- t16_MUX_uxn_opcodes_h_l1459_c7_fdac
t16_MUX_uxn_opcodes_h_l1459_c7_fdac : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1459_c7_fdac_cond,
t16_MUX_uxn_opcodes_h_l1459_c7_fdac_iftrue,
t16_MUX_uxn_opcodes_h_l1459_c7_fdac_iffalse,
t16_MUX_uxn_opcodes_h_l1459_c7_fdac_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1459_c7_fdac
result_is_stack_read_MUX_uxn_opcodes_h_l1459_c7_fdac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1459_c7_fdac_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1459_c7_fdac_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1459_c7_fdac_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1459_c7_fdac_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1459_c7_fdac
result_sp_relative_shift_MUX_uxn_opcodes_h_l1459_c7_fdac : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1459_c7_fdac_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1459_c7_fdac_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1459_c7_fdac_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1459_c7_fdac_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1459_c7_fdac
result_stack_value_MUX_uxn_opcodes_h_l1459_c7_fdac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1459_c7_fdac_cond,
result_stack_value_MUX_uxn_opcodes_h_l1459_c7_fdac_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1459_c7_fdac_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1459_c7_fdac_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1459_c7_fdac
result_is_sp_shift_MUX_uxn_opcodes_h_l1459_c7_fdac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1459_c7_fdac_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1459_c7_fdac_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1459_c7_fdac_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1459_c7_fdac_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1459_c7_fdac
result_is_stack_write_MUX_uxn_opcodes_h_l1459_c7_fdac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1459_c7_fdac_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1459_c7_fdac_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1459_c7_fdac_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1459_c7_fdac_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1459_c7_fdac
result_is_opc_done_MUX_uxn_opcodes_h_l1459_c7_fdac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1459_c7_fdac_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1459_c7_fdac_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1459_c7_fdac_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1459_c7_fdac_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1459_c7_fdac
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1459_c7_fdac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1459_c7_fdac_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1459_c7_fdac_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1459_c7_fdac_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1459_c7_fdac_return_output);

-- n16_MUX_uxn_opcodes_h_l1459_c7_fdac
n16_MUX_uxn_opcodes_h_l1459_c7_fdac : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1459_c7_fdac_cond,
n16_MUX_uxn_opcodes_h_l1459_c7_fdac_iftrue,
n16_MUX_uxn_opcodes_h_l1459_c7_fdac_iffalse,
n16_MUX_uxn_opcodes_h_l1459_c7_fdac_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1462_c11_cf40
BIN_OP_EQ_uxn_opcodes_h_l1462_c11_cf40 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1462_c11_cf40_left,
BIN_OP_EQ_uxn_opcodes_h_l1462_c11_cf40_right,
BIN_OP_EQ_uxn_opcodes_h_l1462_c11_cf40_return_output);

-- t16_MUX_uxn_opcodes_h_l1462_c7_abce
t16_MUX_uxn_opcodes_h_l1462_c7_abce : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1462_c7_abce_cond,
t16_MUX_uxn_opcodes_h_l1462_c7_abce_iftrue,
t16_MUX_uxn_opcodes_h_l1462_c7_abce_iffalse,
t16_MUX_uxn_opcodes_h_l1462_c7_abce_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1462_c7_abce
result_is_stack_read_MUX_uxn_opcodes_h_l1462_c7_abce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1462_c7_abce_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1462_c7_abce_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1462_c7_abce_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1462_c7_abce_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1462_c7_abce
result_sp_relative_shift_MUX_uxn_opcodes_h_l1462_c7_abce : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1462_c7_abce_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1462_c7_abce_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1462_c7_abce_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1462_c7_abce_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1462_c7_abce
result_stack_value_MUX_uxn_opcodes_h_l1462_c7_abce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1462_c7_abce_cond,
result_stack_value_MUX_uxn_opcodes_h_l1462_c7_abce_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1462_c7_abce_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1462_c7_abce_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1462_c7_abce
result_is_sp_shift_MUX_uxn_opcodes_h_l1462_c7_abce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1462_c7_abce_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1462_c7_abce_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1462_c7_abce_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1462_c7_abce_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1462_c7_abce
result_is_stack_write_MUX_uxn_opcodes_h_l1462_c7_abce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1462_c7_abce_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1462_c7_abce_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1462_c7_abce_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1462_c7_abce_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1462_c7_abce
result_is_opc_done_MUX_uxn_opcodes_h_l1462_c7_abce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1462_c7_abce_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1462_c7_abce_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1462_c7_abce_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1462_c7_abce_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1462_c7_abce
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1462_c7_abce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1462_c7_abce_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1462_c7_abce_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1462_c7_abce_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1462_c7_abce_return_output);

-- n16_MUX_uxn_opcodes_h_l1462_c7_abce
n16_MUX_uxn_opcodes_h_l1462_c7_abce : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1462_c7_abce_cond,
n16_MUX_uxn_opcodes_h_l1462_c7_abce_iftrue,
n16_MUX_uxn_opcodes_h_l1462_c7_abce_iffalse,
n16_MUX_uxn_opcodes_h_l1462_c7_abce_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1463_c3_f698
BIN_OP_OR_uxn_opcodes_h_l1463_c3_f698 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1463_c3_f698_left,
BIN_OP_OR_uxn_opcodes_h_l1463_c3_f698_right,
BIN_OP_OR_uxn_opcodes_h_l1463_c3_f698_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1466_c11_ebb9
BIN_OP_EQ_uxn_opcodes_h_l1466_c11_ebb9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1466_c11_ebb9_left,
BIN_OP_EQ_uxn_opcodes_h_l1466_c11_ebb9_right,
BIN_OP_EQ_uxn_opcodes_h_l1466_c11_ebb9_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1466_c7_2ec6
result_is_stack_read_MUX_uxn_opcodes_h_l1466_c7_2ec6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1466_c7_2ec6_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1466_c7_2ec6_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1466_c7_2ec6_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1466_c7_2ec6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1466_c7_2ec6
result_sp_relative_shift_MUX_uxn_opcodes_h_l1466_c7_2ec6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1466_c7_2ec6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1466_c7_2ec6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1466_c7_2ec6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1466_c7_2ec6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1466_c7_2ec6
result_stack_value_MUX_uxn_opcodes_h_l1466_c7_2ec6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1466_c7_2ec6_cond,
result_stack_value_MUX_uxn_opcodes_h_l1466_c7_2ec6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1466_c7_2ec6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1466_c7_2ec6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1466_c7_2ec6
result_is_sp_shift_MUX_uxn_opcodes_h_l1466_c7_2ec6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1466_c7_2ec6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1466_c7_2ec6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1466_c7_2ec6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1466_c7_2ec6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1466_c7_2ec6
result_is_stack_write_MUX_uxn_opcodes_h_l1466_c7_2ec6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1466_c7_2ec6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1466_c7_2ec6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1466_c7_2ec6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1466_c7_2ec6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1466_c7_2ec6
result_is_opc_done_MUX_uxn_opcodes_h_l1466_c7_2ec6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1466_c7_2ec6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1466_c7_2ec6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1466_c7_2ec6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1466_c7_2ec6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1466_c7_2ec6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1466_c7_2ec6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1466_c7_2ec6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1466_c7_2ec6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1466_c7_2ec6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1466_c7_2ec6_return_output);

-- n16_MUX_uxn_opcodes_h_l1466_c7_2ec6
n16_MUX_uxn_opcodes_h_l1466_c7_2ec6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1466_c7_2ec6_cond,
n16_MUX_uxn_opcodes_h_l1466_c7_2ec6_iftrue,
n16_MUX_uxn_opcodes_h_l1466_c7_2ec6_iffalse,
n16_MUX_uxn_opcodes_h_l1466_c7_2ec6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1469_c11_b093
BIN_OP_EQ_uxn_opcodes_h_l1469_c11_b093 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1469_c11_b093_left,
BIN_OP_EQ_uxn_opcodes_h_l1469_c11_b093_right,
BIN_OP_EQ_uxn_opcodes_h_l1469_c11_b093_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1469_c7_fc5c
result_is_stack_read_MUX_uxn_opcodes_h_l1469_c7_fc5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1469_c7_fc5c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1469_c7_fc5c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1469_c7_fc5c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1469_c7_fc5c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1469_c7_fc5c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1469_c7_fc5c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1469_c7_fc5c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1469_c7_fc5c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1469_c7_fc5c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1469_c7_fc5c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1469_c7_fc5c
result_stack_value_MUX_uxn_opcodes_h_l1469_c7_fc5c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1469_c7_fc5c_cond,
result_stack_value_MUX_uxn_opcodes_h_l1469_c7_fc5c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1469_c7_fc5c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1469_c7_fc5c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1469_c7_fc5c
result_is_sp_shift_MUX_uxn_opcodes_h_l1469_c7_fc5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1469_c7_fc5c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1469_c7_fc5c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1469_c7_fc5c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1469_c7_fc5c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1469_c7_fc5c
result_is_stack_write_MUX_uxn_opcodes_h_l1469_c7_fc5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1469_c7_fc5c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1469_c7_fc5c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1469_c7_fc5c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1469_c7_fc5c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1469_c7_fc5c
result_is_opc_done_MUX_uxn_opcodes_h_l1469_c7_fc5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1469_c7_fc5c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1469_c7_fc5c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1469_c7_fc5c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1469_c7_fc5c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1469_c7_fc5c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1469_c7_fc5c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1469_c7_fc5c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1469_c7_fc5c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1469_c7_fc5c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1469_c7_fc5c_return_output);

-- n16_MUX_uxn_opcodes_h_l1469_c7_fc5c
n16_MUX_uxn_opcodes_h_l1469_c7_fc5c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1469_c7_fc5c_cond,
n16_MUX_uxn_opcodes_h_l1469_c7_fc5c_iftrue,
n16_MUX_uxn_opcodes_h_l1469_c7_fc5c_iffalse,
n16_MUX_uxn_opcodes_h_l1469_c7_fc5c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1474_c11_5792
BIN_OP_EQ_uxn_opcodes_h_l1474_c11_5792 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1474_c11_5792_left,
BIN_OP_EQ_uxn_opcodes_h_l1474_c11_5792_right,
BIN_OP_EQ_uxn_opcodes_h_l1474_c11_5792_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1474_c7_bd86
result_is_stack_read_MUX_uxn_opcodes_h_l1474_c7_bd86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1474_c7_bd86_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1474_c7_bd86_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1474_c7_bd86_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1474_c7_bd86_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1474_c7_bd86
result_sp_relative_shift_MUX_uxn_opcodes_h_l1474_c7_bd86 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1474_c7_bd86_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1474_c7_bd86_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1474_c7_bd86_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1474_c7_bd86_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1474_c7_bd86
result_stack_value_MUX_uxn_opcodes_h_l1474_c7_bd86 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1474_c7_bd86_cond,
result_stack_value_MUX_uxn_opcodes_h_l1474_c7_bd86_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1474_c7_bd86_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1474_c7_bd86_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1474_c7_bd86
result_is_sp_shift_MUX_uxn_opcodes_h_l1474_c7_bd86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1474_c7_bd86_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1474_c7_bd86_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1474_c7_bd86_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1474_c7_bd86_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1474_c7_bd86
result_is_stack_write_MUX_uxn_opcodes_h_l1474_c7_bd86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1474_c7_bd86_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1474_c7_bd86_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1474_c7_bd86_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1474_c7_bd86_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1474_c7_bd86
result_is_opc_done_MUX_uxn_opcodes_h_l1474_c7_bd86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1474_c7_bd86_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1474_c7_bd86_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1474_c7_bd86_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1474_c7_bd86_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c7_bd86
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c7_bd86 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c7_bd86_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c7_bd86_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c7_bd86_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c7_bd86_return_output);

-- n16_MUX_uxn_opcodes_h_l1474_c7_bd86
n16_MUX_uxn_opcodes_h_l1474_c7_bd86 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1474_c7_bd86_cond,
n16_MUX_uxn_opcodes_h_l1474_c7_bd86_iftrue,
n16_MUX_uxn_opcodes_h_l1474_c7_bd86_iffalse,
n16_MUX_uxn_opcodes_h_l1474_c7_bd86_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1477_c11_ef68
BIN_OP_EQ_uxn_opcodes_h_l1477_c11_ef68 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1477_c11_ef68_left,
BIN_OP_EQ_uxn_opcodes_h_l1477_c11_ef68_right,
BIN_OP_EQ_uxn_opcodes_h_l1477_c11_ef68_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1477_c7_f54e
result_is_stack_read_MUX_uxn_opcodes_h_l1477_c7_f54e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1477_c7_f54e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1477_c7_f54e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1477_c7_f54e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1477_c7_f54e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c7_f54e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c7_f54e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c7_f54e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c7_f54e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c7_f54e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c7_f54e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1477_c7_f54e
result_stack_value_MUX_uxn_opcodes_h_l1477_c7_f54e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1477_c7_f54e_cond,
result_stack_value_MUX_uxn_opcodes_h_l1477_c7_f54e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1477_c7_f54e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1477_c7_f54e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_f54e
result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_f54e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_f54e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_f54e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_f54e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_f54e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_f54e
result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_f54e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_f54e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_f54e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_f54e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_f54e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_f54e
result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_f54e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_f54e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_f54e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_f54e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_f54e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_f54e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_f54e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_f54e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_f54e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_f54e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_f54e_return_output);

-- n16_MUX_uxn_opcodes_h_l1477_c7_f54e
n16_MUX_uxn_opcodes_h_l1477_c7_f54e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1477_c7_f54e_cond,
n16_MUX_uxn_opcodes_h_l1477_c7_f54e_iftrue,
n16_MUX_uxn_opcodes_h_l1477_c7_f54e_iffalse,
n16_MUX_uxn_opcodes_h_l1477_c7_f54e_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1478_c3_426e
BIN_OP_OR_uxn_opcodes_h_l1478_c3_426e : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1478_c3_426e_left,
BIN_OP_OR_uxn_opcodes_h_l1478_c3_426e_right,
BIN_OP_OR_uxn_opcodes_h_l1478_c3_426e_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1481_c32_bc96
BIN_OP_AND_uxn_opcodes_h_l1481_c32_bc96 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1481_c32_bc96_left,
BIN_OP_AND_uxn_opcodes_h_l1481_c32_bc96_right,
BIN_OP_AND_uxn_opcodes_h_l1481_c32_bc96_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1481_c32_ca5e
BIN_OP_GT_uxn_opcodes_h_l1481_c32_ca5e : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1481_c32_ca5e_left,
BIN_OP_GT_uxn_opcodes_h_l1481_c32_ca5e_right,
BIN_OP_GT_uxn_opcodes_h_l1481_c32_ca5e_return_output);

-- MUX_uxn_opcodes_h_l1481_c32_ddc8
MUX_uxn_opcodes_h_l1481_c32_ddc8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1481_c32_ddc8_cond,
MUX_uxn_opcodes_h_l1481_c32_ddc8_iftrue,
MUX_uxn_opcodes_h_l1481_c32_ddc8_iffalse,
MUX_uxn_opcodes_h_l1481_c32_ddc8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1483_c11_464d
BIN_OP_EQ_uxn_opcodes_h_l1483_c11_464d : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1483_c11_464d_left,
BIN_OP_EQ_uxn_opcodes_h_l1483_c11_464d_right,
BIN_OP_EQ_uxn_opcodes_h_l1483_c11_464d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c7_8386
result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c7_8386 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c7_8386_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c7_8386_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c7_8386_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c7_8386_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1483_c7_8386
result_stack_value_MUX_uxn_opcodes_h_l1483_c7_8386 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1483_c7_8386_cond,
result_stack_value_MUX_uxn_opcodes_h_l1483_c7_8386_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1483_c7_8386_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1483_c7_8386_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1483_c7_8386
result_is_stack_write_MUX_uxn_opcodes_h_l1483_c7_8386 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1483_c7_8386_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1483_c7_8386_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1483_c7_8386_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1483_c7_8386_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1483_c7_8386
result_is_opc_done_MUX_uxn_opcodes_h_l1483_c7_8386 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1483_c7_8386_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1483_c7_8386_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1483_c7_8386_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1483_c7_8386_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c7_8386
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c7_8386 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c7_8386_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c7_8386_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c7_8386_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c7_8386_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1487_c24_0e70
BIN_OP_EQ_uxn_opcodes_h_l1487_c24_0e70 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1487_c24_0e70_left,
BIN_OP_EQ_uxn_opcodes_h_l1487_c24_0e70_right,
BIN_OP_EQ_uxn_opcodes_h_l1487_c24_0e70_return_output);

-- MUX_uxn_opcodes_h_l1487_c24_b9d8
MUX_uxn_opcodes_h_l1487_c24_b9d8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1487_c24_b9d8_cond,
MUX_uxn_opcodes_h_l1487_c24_b9d8_iftrue,
MUX_uxn_opcodes_h_l1487_c24_b9d8_iffalse,
MUX_uxn_opcodes_h_l1487_c24_b9d8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1489_c11_326f
BIN_OP_EQ_uxn_opcodes_h_l1489_c11_326f : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1489_c11_326f_left,
BIN_OP_EQ_uxn_opcodes_h_l1489_c11_326f_right,
BIN_OP_EQ_uxn_opcodes_h_l1489_c11_326f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_b8e0
result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_b8e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_b8e0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_b8e0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_b8e0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_b8e0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_b8e0
result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_b8e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_b8e0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_b8e0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_b8e0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_b8e0_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1471_l1456_DUPLICATE_bfef
CONST_SL_8_uint16_t_uxn_opcodes_h_l1471_l1456_DUPLICATE_bfef : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1471_l1456_DUPLICATE_bfef_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1471_l1456_DUPLICATE_bfef_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1445_c6_e438_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1445_c1_0b66_return_output,
 t16_MUX_uxn_opcodes_h_l1445_c2_26ec_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1445_c2_26ec_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1445_c2_26ec_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1445_c2_26ec_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1445_c2_26ec_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1445_c2_26ec_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1445_c2_26ec_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1445_c2_26ec_return_output,
 n16_MUX_uxn_opcodes_h_l1445_c2_26ec_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1451_c11_3969_return_output,
 t16_MUX_uxn_opcodes_h_l1451_c7_927c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1451_c7_927c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1451_c7_927c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1451_c7_927c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1451_c7_927c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1451_c7_927c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1451_c7_927c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1451_c7_927c_return_output,
 n16_MUX_uxn_opcodes_h_l1451_c7_927c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1454_c11_6545_return_output,
 t16_MUX_uxn_opcodes_h_l1454_c7_6d5b_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_6d5b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_6d5b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1454_c7_6d5b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_6d5b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_6d5b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_6d5b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_6d5b_return_output,
 n16_MUX_uxn_opcodes_h_l1454_c7_6d5b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1459_c11_5a24_return_output,
 t16_MUX_uxn_opcodes_h_l1459_c7_fdac_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1459_c7_fdac_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1459_c7_fdac_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1459_c7_fdac_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1459_c7_fdac_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1459_c7_fdac_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1459_c7_fdac_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1459_c7_fdac_return_output,
 n16_MUX_uxn_opcodes_h_l1459_c7_fdac_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1462_c11_cf40_return_output,
 t16_MUX_uxn_opcodes_h_l1462_c7_abce_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1462_c7_abce_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1462_c7_abce_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1462_c7_abce_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1462_c7_abce_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1462_c7_abce_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1462_c7_abce_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1462_c7_abce_return_output,
 n16_MUX_uxn_opcodes_h_l1462_c7_abce_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1463_c3_f698_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1466_c11_ebb9_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1466_c7_2ec6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1466_c7_2ec6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1466_c7_2ec6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1466_c7_2ec6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1466_c7_2ec6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1466_c7_2ec6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1466_c7_2ec6_return_output,
 n16_MUX_uxn_opcodes_h_l1466_c7_2ec6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1469_c11_b093_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1469_c7_fc5c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1469_c7_fc5c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1469_c7_fc5c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1469_c7_fc5c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1469_c7_fc5c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1469_c7_fc5c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1469_c7_fc5c_return_output,
 n16_MUX_uxn_opcodes_h_l1469_c7_fc5c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1474_c11_5792_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1474_c7_bd86_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1474_c7_bd86_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1474_c7_bd86_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1474_c7_bd86_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1474_c7_bd86_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1474_c7_bd86_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c7_bd86_return_output,
 n16_MUX_uxn_opcodes_h_l1474_c7_bd86_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1477_c11_ef68_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1477_c7_f54e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c7_f54e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1477_c7_f54e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_f54e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_f54e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_f54e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_f54e_return_output,
 n16_MUX_uxn_opcodes_h_l1477_c7_f54e_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1478_c3_426e_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1481_c32_bc96_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1481_c32_ca5e_return_output,
 MUX_uxn_opcodes_h_l1481_c32_ddc8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1483_c11_464d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c7_8386_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1483_c7_8386_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1483_c7_8386_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1483_c7_8386_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c7_8386_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1487_c24_0e70_return_output,
 MUX_uxn_opcodes_h_l1487_c24_b9d8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1489_c11_326f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_b8e0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_b8e0_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1471_l1456_DUPLICATE_bfef_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1445_c6_e438_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1445_c6_e438_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1445_c6_e438_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1445_c1_0b66_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1445_c1_0b66_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1445_c1_0b66_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1445_c1_0b66_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1445_c2_26ec_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1445_c2_26ec_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1451_c7_927c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1445_c2_26ec_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1445_c2_26ec_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1445_c2_26ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1445_c2_26ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1451_c7_927c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1445_c2_26ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1445_c2_26ec_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1445_c2_26ec_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1445_c2_26ec_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1451_c7_927c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1445_c2_26ec_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1445_c2_26ec_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1445_c2_26ec_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1445_c2_26ec_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1451_c7_927c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1445_c2_26ec_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1445_c2_26ec_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1445_c2_26ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1445_c2_26ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1451_c7_927c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1445_c2_26ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1445_c2_26ec_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1445_c2_26ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1445_c2_26ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1451_c7_927c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1445_c2_26ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1445_c2_26ec_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1445_c2_26ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1445_c2_26ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1451_c7_927c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1445_c2_26ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1445_c2_26ec_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1445_c2_26ec_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1448_c3_5aad : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1445_c2_26ec_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1451_c7_927c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1445_c2_26ec_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1445_c2_26ec_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1445_c2_26ec_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1445_c2_26ec_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1451_c7_927c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1445_c2_26ec_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1445_c2_26ec_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1446_c3_8706_uxn_opcodes_h_l1446_c3_8706_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1451_c11_3969_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1451_c11_3969_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1451_c11_3969_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1451_c7_927c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1451_c7_927c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1454_c7_6d5b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1451_c7_927c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1451_c7_927c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1451_c7_927c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_6d5b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1451_c7_927c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1451_c7_927c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1451_c7_927c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_6d5b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1451_c7_927c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1451_c7_927c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1451_c7_927c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1454_c7_6d5b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1451_c7_927c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1451_c7_927c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1451_c7_927c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_6d5b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1451_c7_927c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1451_c7_927c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1451_c7_927c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_6d5b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1451_c7_927c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1451_c7_927c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1451_c7_927c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_6d5b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1451_c7_927c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1451_c7_927c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1452_c3_dca1 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1451_c7_927c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_6d5b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1451_c7_927c_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1451_c7_927c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1451_c7_927c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1454_c7_6d5b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1451_c7_927c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_6545_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_6545_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_6545_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1454_c7_6d5b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1454_c7_6d5b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1459_c7_fdac_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1454_c7_6d5b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_6d5b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_6d5b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1459_c7_fdac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_6d5b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_6d5b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_6d5b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1459_c7_fdac_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_6d5b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1454_c7_6d5b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1454_c7_6d5b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1459_c7_fdac_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1454_c7_6d5b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_6d5b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_6d5b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1459_c7_fdac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_6d5b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_6d5b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_6d5b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1459_c7_fdac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_6d5b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_6d5b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_6d5b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1459_c7_fdac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_6d5b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_6d5b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1457_c3_be81 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_6d5b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1459_c7_fdac_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_6d5b_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1454_c7_6d5b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1454_c7_6d5b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1459_c7_fdac_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1454_c7_6d5b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1459_c11_5a24_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1459_c11_5a24_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1459_c11_5a24_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1459_c7_fdac_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1459_c7_fdac_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1462_c7_abce_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1459_c7_fdac_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1459_c7_fdac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1459_c7_fdac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1462_c7_abce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1459_c7_fdac_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1459_c7_fdac_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1459_c7_fdac_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1462_c7_abce_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1459_c7_fdac_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1459_c7_fdac_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1459_c7_fdac_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1462_c7_abce_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1459_c7_fdac_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1459_c7_fdac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1459_c7_fdac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1462_c7_abce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1459_c7_fdac_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1459_c7_fdac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1459_c7_fdac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1462_c7_abce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1459_c7_fdac_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1459_c7_fdac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1459_c7_fdac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1462_c7_abce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1459_c7_fdac_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1459_c7_fdac_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1460_c3_95c9 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1459_c7_fdac_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1462_c7_abce_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1459_c7_fdac_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1459_c7_fdac_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1459_c7_fdac_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1462_c7_abce_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1459_c7_fdac_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1462_c11_cf40_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1462_c11_cf40_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1462_c11_cf40_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1462_c7_abce_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1462_c7_abce_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1462_c7_abce_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1462_c7_abce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1462_c7_abce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1466_c7_2ec6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1462_c7_abce_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1462_c7_abce_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1462_c7_abce_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1466_c7_2ec6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1462_c7_abce_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1462_c7_abce_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1462_c7_abce_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1466_c7_2ec6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1462_c7_abce_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1462_c7_abce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1462_c7_abce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1466_c7_2ec6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1462_c7_abce_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1462_c7_abce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1462_c7_abce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1466_c7_2ec6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1462_c7_abce_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1462_c7_abce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1462_c7_abce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1466_c7_2ec6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1462_c7_abce_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1462_c7_abce_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1464_c3_2835 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1462_c7_abce_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1466_c7_2ec6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1462_c7_abce_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1462_c7_abce_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1462_c7_abce_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1466_c7_2ec6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1462_c7_abce_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1463_c3_f698_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1463_c3_f698_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1463_c3_f698_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1466_c11_ebb9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1466_c11_ebb9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1466_c11_ebb9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1466_c7_2ec6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1466_c7_2ec6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1469_c7_fc5c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1466_c7_2ec6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1466_c7_2ec6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1466_c7_2ec6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1469_c7_fc5c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1466_c7_2ec6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1466_c7_2ec6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1466_c7_2ec6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1469_c7_fc5c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1466_c7_2ec6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1466_c7_2ec6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1466_c7_2ec6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1469_c7_fc5c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1466_c7_2ec6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1466_c7_2ec6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1466_c7_2ec6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1469_c7_fc5c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1466_c7_2ec6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1466_c7_2ec6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1466_c7_2ec6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1469_c7_fc5c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1466_c7_2ec6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1466_c7_2ec6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1467_c3_5bf8 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1466_c7_2ec6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1469_c7_fc5c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1466_c7_2ec6_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1466_c7_2ec6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1466_c7_2ec6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1469_c7_fc5c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1466_c7_2ec6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1469_c11_b093_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1469_c11_b093_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1469_c11_b093_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1469_c7_fc5c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1469_c7_fc5c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1474_c7_bd86_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1469_c7_fc5c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1469_c7_fc5c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1469_c7_fc5c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1474_c7_bd86_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1469_c7_fc5c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1469_c7_fc5c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1469_c7_fc5c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1474_c7_bd86_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1469_c7_fc5c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1469_c7_fc5c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1469_c7_fc5c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1474_c7_bd86_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1469_c7_fc5c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1469_c7_fc5c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1469_c7_fc5c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1474_c7_bd86_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1469_c7_fc5c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1469_c7_fc5c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1469_c7_fc5c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1474_c7_bd86_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1469_c7_fc5c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1469_c7_fc5c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1472_c3_b982 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1469_c7_fc5c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c7_bd86_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1469_c7_fc5c_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1469_c7_fc5c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1469_c7_fc5c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1474_c7_bd86_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1469_c7_fc5c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1474_c11_5792_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1474_c11_5792_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1474_c11_5792_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1474_c7_bd86_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1474_c7_bd86_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1477_c7_f54e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1474_c7_bd86_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1474_c7_bd86_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1474_c7_bd86_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c7_f54e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1474_c7_bd86_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1474_c7_bd86_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1474_c7_bd86_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1477_c7_f54e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1474_c7_bd86_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1474_c7_bd86_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1474_c7_bd86_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_f54e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1474_c7_bd86_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1474_c7_bd86_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1474_c7_bd86_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_f54e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1474_c7_bd86_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1474_c7_bd86_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1474_c7_bd86_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_f54e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1474_c7_bd86_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c7_bd86_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1475_c3_7fff : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c7_bd86_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_f54e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c7_bd86_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1474_c7_bd86_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1474_c7_bd86_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1477_c7_f54e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1474_c7_bd86_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_ef68_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_ef68_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_ef68_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1477_c7_f54e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1477_c7_f54e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1477_c7_f54e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c7_f54e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c7_f54e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c7_f54e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1477_c7_f54e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1477_c7_f54e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1483_c7_8386_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1477_c7_f54e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_f54e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_f54e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c7_8386_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_f54e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_f54e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_f54e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1483_c7_8386_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_f54e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_f54e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_f54e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1483_c7_8386_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_f54e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_f54e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_f54e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c7_8386_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_f54e_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1477_c7_f54e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1477_c7_f54e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1477_c7_f54e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1478_c3_426e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1478_c3_426e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1478_c3_426e_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1481_c32_ddc8_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1481_c32_ddc8_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1481_c32_ddc8_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1481_c32_bc96_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1481_c32_bc96_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1481_c32_bc96_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1481_c32_ca5e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1481_c32_ca5e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1481_c32_ca5e_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1481_c32_ddc8_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c11_464d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c11_464d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c11_464d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c7_8386_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c7_8386_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c7_8386_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1483_c7_8386_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1483_c7_8386_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1483_c7_8386_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1483_c7_8386_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1483_c7_8386_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_b8e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1483_c7_8386_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1483_c7_8386_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1483_c7_8386_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_b8e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1483_c7_8386_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c7_8386_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1486_c3_e048 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c7_8386_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c7_8386_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1487_c24_b9d8_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1487_c24_b9d8_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1487_c24_b9d8_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1487_c24_0e70_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1487_c24_0e70_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1487_c24_0e70_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1487_c24_b9d8_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_326f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_326f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_326f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_b8e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_b8e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_b8e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_b8e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_b8e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_b8e0_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1459_l1454_l1477_l1451_l1474_l1445_l1469_l1466_l1462_DUPLICATE_1740_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1459_l1483_l1454_l1477_l1451_l1474_l1445_l1469_l1466_l1462_DUPLICATE_75d6_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1459_l1483_l1454_l1451_l1474_l1445_l1469_l1466_l1462_DUPLICATE_ede1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1489_l1459_l1454_l1477_l1451_l1474_l1445_l1469_l1466_l1462_DUPLICATE_38cb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1459_l1454_l1477_l1451_l1474_l1469_l1466_l1462_DUPLICATE_de63_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1489_l1459_l1483_l1454_l1477_l1451_l1474_l1469_l1466_l1462_DUPLICATE_babd_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1463_l1470_l1455_l1478_DUPLICATE_f8bc_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1471_l1456_DUPLICATE_bfef_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1471_l1456_DUPLICATE_bfef_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1477_l1483_DUPLICATE_b2e8_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l1494_l1441_DUPLICATE_9a9b_return_output : opcode_result_t;
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
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1477_c7_f54e_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1483_c7_8386_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1487_c24_b9d8_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_326f_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1466_c11_ebb9_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_6545_right := to_unsigned(2, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1445_c1_0b66_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1487_c24_b9d8_iffalse := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1472_c3_b982 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1469_c7_fc5c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1472_c3_b982;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1481_c32_bc96_right := to_unsigned(128, 8);
     VAR_MUX_uxn_opcodes_h_l1481_c32_ddc8_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1486_c3_e048 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c7_8386_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1486_c3_e048;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_f54e_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_b8e0_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1481_c32_ddc8_iffalse := resize(to_signed(-3, 3), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1474_c11_5792_right := to_unsigned(7, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_b8e0_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1469_c11_b093_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1448_c3_5aad := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1445_c2_26ec_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1448_c3_5aad;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1457_c3_be81 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_6d5b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1457_c3_be81;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_ef68_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1445_c6_e438_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1445_c2_26ec_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1451_c11_3969_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1459_c11_5a24_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1464_c3_2835 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1462_c7_abce_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1464_c3_2835;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1467_c3_5bf8 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1466_c7_2ec6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1467_c3_5bf8;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1481_c32_ca5e_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1475_c3_7fff := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c7_bd86_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1475_c3_7fff;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1462_c11_cf40_right := to_unsigned(4, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1445_c2_26ec_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c11_464d_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1460_c3_95c9 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1459_c7_fdac_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1460_c3_95c9;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1452_c3_dca1 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1451_c7_927c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1452_c3_dca1;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c7_8386_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1445_c1_0b66_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1481_c32_bc96_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1487_c24_0e70_left := n16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1478_c3_426e_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1445_c2_26ec_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1451_c7_927c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1454_c7_6d5b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1459_c7_fdac_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1462_c7_abce_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1466_c7_2ec6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1474_c7_bd86_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1477_c7_f54e_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1445_c6_e438_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1451_c11_3969_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_6545_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1459_c11_5a24_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1462_c11_cf40_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1466_c11_ebb9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1469_c11_b093_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1474_c11_5792_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_ef68_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c11_464d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_326f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1487_c24_0e70_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1463_c3_f698_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1445_c2_26ec_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1451_c7_927c_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1459_c7_fdac_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1462_c7_abce_iffalse := t16;
     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1459_l1483_l1454_l1477_l1451_l1474_l1445_l1469_l1466_l1462_DUPLICATE_75d6 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1459_l1483_l1454_l1477_l1451_l1474_l1445_l1469_l1466_l1462_DUPLICATE_75d6_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1487_c24_0e70] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1487_c24_0e70_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1487_c24_0e70_left;
     BIN_OP_EQ_uxn_opcodes_h_l1487_c24_0e70_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1487_c24_0e70_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1487_c24_0e70_return_output := BIN_OP_EQ_uxn_opcodes_h_l1487_c24_0e70_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1489_l1459_l1483_l1454_l1477_l1451_l1474_l1469_l1466_l1462_DUPLICATE_babd LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1489_l1459_l1483_l1454_l1477_l1451_l1474_l1469_l1466_l1462_DUPLICATE_babd_return_output := result.is_opc_done;

     -- BIN_OP_AND[uxn_opcodes_h_l1481_c32_bc96] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1481_c32_bc96_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1481_c32_bc96_left;
     BIN_OP_AND_uxn_opcodes_h_l1481_c32_bc96_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1481_c32_bc96_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1481_c32_bc96_return_output := BIN_OP_AND_uxn_opcodes_h_l1481_c32_bc96_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1489_l1459_l1454_l1477_l1451_l1474_l1445_l1469_l1466_l1462_DUPLICATE_38cb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1489_l1459_l1454_l1477_l1451_l1474_l1445_l1469_l1466_l1462_DUPLICATE_38cb_return_output := result.is_stack_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1463_l1470_l1455_l1478_DUPLICATE_f8bc LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1463_l1470_l1455_l1478_DUPLICATE_f8bc_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1459_l1454_l1477_l1451_l1474_l1469_l1466_l1462_DUPLICATE_de63 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1459_l1454_l1477_l1451_l1474_l1469_l1466_l1462_DUPLICATE_de63_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1459_l1483_l1454_l1451_l1474_l1445_l1469_l1466_l1462_DUPLICATE_ede1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1459_l1483_l1454_l1451_l1474_l1445_l1469_l1466_l1462_DUPLICATE_ede1_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1454_c11_6545] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1454_c11_6545_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_6545_left;
     BIN_OP_EQ_uxn_opcodes_h_l1454_c11_6545_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_6545_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_6545_return_output := BIN_OP_EQ_uxn_opcodes_h_l1454_c11_6545_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1477_c11_ef68] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1477_c11_ef68_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_ef68_left;
     BIN_OP_EQ_uxn_opcodes_h_l1477_c11_ef68_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_ef68_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_ef68_return_output := BIN_OP_EQ_uxn_opcodes_h_l1477_c11_ef68_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1451_c11_3969] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1451_c11_3969_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1451_c11_3969_left;
     BIN_OP_EQ_uxn_opcodes_h_l1451_c11_3969_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1451_c11_3969_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1451_c11_3969_return_output := BIN_OP_EQ_uxn_opcodes_h_l1451_c11_3969_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1466_c11_ebb9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1466_c11_ebb9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1466_c11_ebb9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1466_c11_ebb9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1466_c11_ebb9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1466_c11_ebb9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1466_c11_ebb9_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1459_l1454_l1477_l1451_l1474_l1445_l1469_l1466_l1462_DUPLICATE_1740 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1459_l1454_l1477_l1451_l1474_l1445_l1469_l1466_l1462_DUPLICATE_1740_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1474_c11_5792] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1474_c11_5792_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1474_c11_5792_left;
     BIN_OP_EQ_uxn_opcodes_h_l1474_c11_5792_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1474_c11_5792_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1474_c11_5792_return_output := BIN_OP_EQ_uxn_opcodes_h_l1474_c11_5792_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1459_c11_5a24] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1459_c11_5a24_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1459_c11_5a24_left;
     BIN_OP_EQ_uxn_opcodes_h_l1459_c11_5a24_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1459_c11_5a24_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1459_c11_5a24_return_output := BIN_OP_EQ_uxn_opcodes_h_l1459_c11_5a24_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1445_c6_e438] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1445_c6_e438_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1445_c6_e438_left;
     BIN_OP_EQ_uxn_opcodes_h_l1445_c6_e438_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1445_c6_e438_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1445_c6_e438_return_output := BIN_OP_EQ_uxn_opcodes_h_l1445_c6_e438_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1477_l1483_DUPLICATE_b2e8 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1477_l1483_DUPLICATE_b2e8_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1469_c11_b093] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1469_c11_b093_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1469_c11_b093_left;
     BIN_OP_EQ_uxn_opcodes_h_l1469_c11_b093_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1469_c11_b093_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1469_c11_b093_return_output := BIN_OP_EQ_uxn_opcodes_h_l1469_c11_b093_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1489_c11_326f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1489_c11_326f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_326f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1489_c11_326f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_326f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_326f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1489_c11_326f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1462_c11_cf40] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1462_c11_cf40_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1462_c11_cf40_left;
     BIN_OP_EQ_uxn_opcodes_h_l1462_c11_cf40_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1462_c11_cf40_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1462_c11_cf40_return_output := BIN_OP_EQ_uxn_opcodes_h_l1462_c11_cf40_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1483_c11_464d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1483_c11_464d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c11_464d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1483_c11_464d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c11_464d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c11_464d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1483_c11_464d_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1481_c32_ca5e_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1481_c32_bc96_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1445_c1_0b66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1445_c6_e438_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1445_c2_26ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1445_c6_e438_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1445_c2_26ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1445_c6_e438_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1445_c2_26ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1445_c6_e438_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1445_c2_26ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1445_c6_e438_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1445_c2_26ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1445_c6_e438_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1445_c2_26ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1445_c6_e438_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1445_c2_26ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1445_c6_e438_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1445_c2_26ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1445_c6_e438_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1445_c2_26ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1445_c6_e438_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1451_c7_927c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1451_c11_3969_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1451_c7_927c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1451_c11_3969_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1451_c7_927c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1451_c11_3969_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1451_c7_927c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1451_c11_3969_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1451_c7_927c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1451_c11_3969_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1451_c7_927c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1451_c11_3969_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1451_c7_927c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1451_c11_3969_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1451_c7_927c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1451_c11_3969_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1451_c7_927c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1451_c11_3969_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1454_c7_6d5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_6545_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_6d5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_6545_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_6d5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_6545_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_6d5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_6545_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_6d5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_6545_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_6d5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_6545_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_6d5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_6545_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1454_c7_6d5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_6545_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1454_c7_6d5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_6545_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1459_c7_fdac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1459_c11_5a24_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1459_c7_fdac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1459_c11_5a24_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1459_c7_fdac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1459_c11_5a24_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1459_c7_fdac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1459_c11_5a24_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1459_c7_fdac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1459_c11_5a24_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1459_c7_fdac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1459_c11_5a24_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1459_c7_fdac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1459_c11_5a24_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1459_c7_fdac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1459_c11_5a24_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1459_c7_fdac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1459_c11_5a24_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1462_c7_abce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1462_c11_cf40_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1462_c7_abce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1462_c11_cf40_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1462_c7_abce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1462_c11_cf40_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1462_c7_abce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1462_c11_cf40_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1462_c7_abce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1462_c11_cf40_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1462_c7_abce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1462_c11_cf40_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1462_c7_abce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1462_c11_cf40_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1462_c7_abce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1462_c11_cf40_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1462_c7_abce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1462_c11_cf40_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1466_c7_2ec6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1466_c11_ebb9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1466_c7_2ec6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1466_c11_ebb9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1466_c7_2ec6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1466_c11_ebb9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1466_c7_2ec6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1466_c11_ebb9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1466_c7_2ec6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1466_c11_ebb9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1466_c7_2ec6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1466_c11_ebb9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1466_c7_2ec6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1466_c11_ebb9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1466_c7_2ec6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1466_c11_ebb9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1469_c7_fc5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1469_c11_b093_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1469_c7_fc5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1469_c11_b093_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1469_c7_fc5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1469_c11_b093_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1469_c7_fc5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1469_c11_b093_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1469_c7_fc5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1469_c11_b093_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1469_c7_fc5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1469_c11_b093_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1469_c7_fc5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1469_c11_b093_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1469_c7_fc5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1469_c11_b093_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1474_c7_bd86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1474_c11_5792_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1474_c7_bd86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1474_c11_5792_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1474_c7_bd86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1474_c11_5792_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1474_c7_bd86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1474_c11_5792_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1474_c7_bd86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1474_c11_5792_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1474_c7_bd86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1474_c11_5792_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c7_bd86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1474_c11_5792_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1474_c7_bd86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1474_c11_5792_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1477_c7_f54e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_ef68_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_f54e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_ef68_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_f54e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_ef68_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1477_c7_f54e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_ef68_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_f54e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_ef68_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c7_f54e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_ef68_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_f54e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_ef68_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1477_c7_f54e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_ef68_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1483_c7_8386_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c11_464d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c7_8386_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c11_464d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1483_c7_8386_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c11_464d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c7_8386_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c11_464d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1483_c7_8386_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c11_464d_return_output;
     VAR_MUX_uxn_opcodes_h_l1487_c24_b9d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1487_c24_0e70_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_b8e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_326f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_b8e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_326f_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1463_c3_f698_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1463_l1470_l1455_l1478_DUPLICATE_f8bc_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1478_c3_426e_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1463_l1470_l1455_l1478_DUPLICATE_f8bc_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1471_l1456_DUPLICATE_bfef_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1463_l1470_l1455_l1478_DUPLICATE_f8bc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1445_c2_26ec_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1459_l1454_l1477_l1451_l1474_l1445_l1469_l1466_l1462_DUPLICATE_1740_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1451_c7_927c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1459_l1454_l1477_l1451_l1474_l1445_l1469_l1466_l1462_DUPLICATE_1740_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_6d5b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1459_l1454_l1477_l1451_l1474_l1445_l1469_l1466_l1462_DUPLICATE_1740_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1459_c7_fdac_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1459_l1454_l1477_l1451_l1474_l1445_l1469_l1466_l1462_DUPLICATE_1740_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1462_c7_abce_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1459_l1454_l1477_l1451_l1474_l1445_l1469_l1466_l1462_DUPLICATE_1740_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1466_c7_2ec6_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1459_l1454_l1477_l1451_l1474_l1445_l1469_l1466_l1462_DUPLICATE_1740_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1469_c7_fc5c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1459_l1454_l1477_l1451_l1474_l1445_l1469_l1466_l1462_DUPLICATE_1740_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1474_c7_bd86_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1459_l1454_l1477_l1451_l1474_l1445_l1469_l1466_l1462_DUPLICATE_1740_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c7_f54e_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1459_l1454_l1477_l1451_l1474_l1445_l1469_l1466_l1462_DUPLICATE_1740_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1451_c7_927c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1489_l1459_l1483_l1454_l1477_l1451_l1474_l1469_l1466_l1462_DUPLICATE_babd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_6d5b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1489_l1459_l1483_l1454_l1477_l1451_l1474_l1469_l1466_l1462_DUPLICATE_babd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1459_c7_fdac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1489_l1459_l1483_l1454_l1477_l1451_l1474_l1469_l1466_l1462_DUPLICATE_babd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1462_c7_abce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1489_l1459_l1483_l1454_l1477_l1451_l1474_l1469_l1466_l1462_DUPLICATE_babd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1466_c7_2ec6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1489_l1459_l1483_l1454_l1477_l1451_l1474_l1469_l1466_l1462_DUPLICATE_babd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1469_c7_fc5c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1489_l1459_l1483_l1454_l1477_l1451_l1474_l1469_l1466_l1462_DUPLICATE_babd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1474_c7_bd86_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1489_l1459_l1483_l1454_l1477_l1451_l1474_l1469_l1466_l1462_DUPLICATE_babd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_f54e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1489_l1459_l1483_l1454_l1477_l1451_l1474_l1469_l1466_l1462_DUPLICATE_babd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1483_c7_8386_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1489_l1459_l1483_l1454_l1477_l1451_l1474_l1469_l1466_l1462_DUPLICATE_babd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_b8e0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1489_l1459_l1483_l1454_l1477_l1451_l1474_l1469_l1466_l1462_DUPLICATE_babd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1445_c2_26ec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1459_l1483_l1454_l1451_l1474_l1445_l1469_l1466_l1462_DUPLICATE_ede1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1451_c7_927c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1459_l1483_l1454_l1451_l1474_l1445_l1469_l1466_l1462_DUPLICATE_ede1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_6d5b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1459_l1483_l1454_l1451_l1474_l1445_l1469_l1466_l1462_DUPLICATE_ede1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1459_c7_fdac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1459_l1483_l1454_l1451_l1474_l1445_l1469_l1466_l1462_DUPLICATE_ede1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1462_c7_abce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1459_l1483_l1454_l1451_l1474_l1445_l1469_l1466_l1462_DUPLICATE_ede1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1466_c7_2ec6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1459_l1483_l1454_l1451_l1474_l1445_l1469_l1466_l1462_DUPLICATE_ede1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1469_c7_fc5c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1459_l1483_l1454_l1451_l1474_l1445_l1469_l1466_l1462_DUPLICATE_ede1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1474_c7_bd86_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1459_l1483_l1454_l1451_l1474_l1445_l1469_l1466_l1462_DUPLICATE_ede1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c7_8386_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1459_l1483_l1454_l1451_l1474_l1445_l1469_l1466_l1462_DUPLICATE_ede1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1451_c7_927c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1459_l1454_l1477_l1451_l1474_l1469_l1466_l1462_DUPLICATE_de63_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_6d5b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1459_l1454_l1477_l1451_l1474_l1469_l1466_l1462_DUPLICATE_de63_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1459_c7_fdac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1459_l1454_l1477_l1451_l1474_l1469_l1466_l1462_DUPLICATE_de63_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1462_c7_abce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1459_l1454_l1477_l1451_l1474_l1469_l1466_l1462_DUPLICATE_de63_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1466_c7_2ec6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1459_l1454_l1477_l1451_l1474_l1469_l1466_l1462_DUPLICATE_de63_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1469_c7_fc5c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1459_l1454_l1477_l1451_l1474_l1469_l1466_l1462_DUPLICATE_de63_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1474_c7_bd86_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1459_l1454_l1477_l1451_l1474_l1469_l1466_l1462_DUPLICATE_de63_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1477_c7_f54e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1459_l1454_l1477_l1451_l1474_l1469_l1466_l1462_DUPLICATE_de63_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1445_c2_26ec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1489_l1459_l1454_l1477_l1451_l1474_l1445_l1469_l1466_l1462_DUPLICATE_38cb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1451_c7_927c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1489_l1459_l1454_l1477_l1451_l1474_l1445_l1469_l1466_l1462_DUPLICATE_38cb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_6d5b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1489_l1459_l1454_l1477_l1451_l1474_l1445_l1469_l1466_l1462_DUPLICATE_38cb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1459_c7_fdac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1489_l1459_l1454_l1477_l1451_l1474_l1445_l1469_l1466_l1462_DUPLICATE_38cb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1462_c7_abce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1489_l1459_l1454_l1477_l1451_l1474_l1445_l1469_l1466_l1462_DUPLICATE_38cb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1466_c7_2ec6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1489_l1459_l1454_l1477_l1451_l1474_l1445_l1469_l1466_l1462_DUPLICATE_38cb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1469_c7_fc5c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1489_l1459_l1454_l1477_l1451_l1474_l1445_l1469_l1466_l1462_DUPLICATE_38cb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1474_c7_bd86_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1489_l1459_l1454_l1477_l1451_l1474_l1445_l1469_l1466_l1462_DUPLICATE_38cb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_f54e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1489_l1459_l1454_l1477_l1451_l1474_l1445_l1469_l1466_l1462_DUPLICATE_38cb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_b8e0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1489_l1459_l1454_l1477_l1451_l1474_l1445_l1469_l1466_l1462_DUPLICATE_38cb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_f54e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1477_l1483_DUPLICATE_b2e8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c7_8386_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1477_l1483_DUPLICATE_b2e8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1445_c2_26ec_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1459_l1483_l1454_l1477_l1451_l1474_l1445_l1469_l1466_l1462_DUPLICATE_75d6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1451_c7_927c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1459_l1483_l1454_l1477_l1451_l1474_l1445_l1469_l1466_l1462_DUPLICATE_75d6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1454_c7_6d5b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1459_l1483_l1454_l1477_l1451_l1474_l1445_l1469_l1466_l1462_DUPLICATE_75d6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1459_c7_fdac_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1459_l1483_l1454_l1477_l1451_l1474_l1445_l1469_l1466_l1462_DUPLICATE_75d6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1462_c7_abce_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1459_l1483_l1454_l1477_l1451_l1474_l1445_l1469_l1466_l1462_DUPLICATE_75d6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1466_c7_2ec6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1459_l1483_l1454_l1477_l1451_l1474_l1445_l1469_l1466_l1462_DUPLICATE_75d6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1469_c7_fc5c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1459_l1483_l1454_l1477_l1451_l1474_l1445_l1469_l1466_l1462_DUPLICATE_75d6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1474_c7_bd86_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1459_l1483_l1454_l1477_l1451_l1474_l1445_l1469_l1466_l1462_DUPLICATE_75d6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1477_c7_f54e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1459_l1483_l1454_l1477_l1451_l1474_l1445_l1469_l1466_l1462_DUPLICATE_75d6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1483_c7_8386_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1459_l1483_l1454_l1477_l1451_l1474_l1445_l1469_l1466_l1462_DUPLICATE_75d6_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1489_c7_b8e0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_b8e0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_b8e0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_b8e0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_b8e0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_b8e0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_b8e0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_b8e0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_b8e0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1489_c7_b8e0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_b8e0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_b8e0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_b8e0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_b8e0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_b8e0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_b8e0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_b8e0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_b8e0_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1481_c32_ca5e] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1481_c32_ca5e_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1481_c32_ca5e_left;
     BIN_OP_GT_uxn_opcodes_h_l1481_c32_ca5e_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1481_c32_ca5e_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1481_c32_ca5e_return_output := BIN_OP_GT_uxn_opcodes_h_l1481_c32_ca5e_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1471_l1456_DUPLICATE_bfef LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1471_l1456_DUPLICATE_bfef_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1471_l1456_DUPLICATE_bfef_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1471_l1456_DUPLICATE_bfef_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1471_l1456_DUPLICATE_bfef_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1483_c7_8386] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c7_8386_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c7_8386_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c7_8386_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c7_8386_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c7_8386_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c7_8386_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c7_8386_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c7_8386_return_output;

     -- MUX[uxn_opcodes_h_l1487_c24_b9d8] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1487_c24_b9d8_cond <= VAR_MUX_uxn_opcodes_h_l1487_c24_b9d8_cond;
     MUX_uxn_opcodes_h_l1487_c24_b9d8_iftrue <= VAR_MUX_uxn_opcodes_h_l1487_c24_b9d8_iftrue;
     MUX_uxn_opcodes_h_l1487_c24_b9d8_iffalse <= VAR_MUX_uxn_opcodes_h_l1487_c24_b9d8_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1487_c24_b9d8_return_output := MUX_uxn_opcodes_h_l1487_c24_b9d8_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1463_c3_f698] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1463_c3_f698_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1463_c3_f698_left;
     BIN_OP_OR_uxn_opcodes_h_l1463_c3_f698_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1463_c3_f698_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1463_c3_f698_return_output := BIN_OP_OR_uxn_opcodes_h_l1463_c3_f698_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1478_c3_426e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1478_c3_426e_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1478_c3_426e_left;
     BIN_OP_OR_uxn_opcodes_h_l1478_c3_426e_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1478_c3_426e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1478_c3_426e_return_output := BIN_OP_OR_uxn_opcodes_h_l1478_c3_426e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1483_c7_8386] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c7_8386_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c7_8386_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c7_8386_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c7_8386_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c7_8386_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c7_8386_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c7_8386_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c7_8386_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1445_c1_0b66] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1445_c1_0b66_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1445_c1_0b66_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1445_c1_0b66_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1445_c1_0b66_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1445_c1_0b66_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1445_c1_0b66_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1445_c1_0b66_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1445_c1_0b66_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1477_c7_f54e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1477_c7_f54e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1477_c7_f54e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1477_c7_f54e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1477_c7_f54e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1477_c7_f54e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1477_c7_f54e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1477_c7_f54e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1477_c7_f54e_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1481_c32_ddc8_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1481_c32_ca5e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1462_c7_abce_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1463_c3_f698_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1477_c7_f54e_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1478_c3_426e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1469_c7_fc5c_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1471_l1456_DUPLICATE_bfef_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1454_c7_6d5b_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1471_l1456_DUPLICATE_bfef_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1483_c7_8386_iftrue := VAR_MUX_uxn_opcodes_h_l1487_c24_b9d8_return_output;
     VAR_printf_uxn_opcodes_h_l1446_c3_8706_uxn_opcodes_h_l1446_c3_8706_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1445_c1_0b66_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1483_c7_8386_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_b8e0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_f54e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c7_8386_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1474_c7_bd86_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1477_c7_f54e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1483_c7_8386_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_b8e0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_f54e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c7_8386_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1483_c7_8386] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1483_c7_8386_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1483_c7_8386_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1483_c7_8386_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1483_c7_8386_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1483_c7_8386_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1483_c7_8386_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1483_c7_8386_return_output := result_stack_value_MUX_uxn_opcodes_h_l1483_c7_8386_return_output;

     -- n16_MUX[uxn_opcodes_h_l1477_c7_f54e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1477_c7_f54e_cond <= VAR_n16_MUX_uxn_opcodes_h_l1477_c7_f54e_cond;
     n16_MUX_uxn_opcodes_h_l1477_c7_f54e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1477_c7_f54e_iftrue;
     n16_MUX_uxn_opcodes_h_l1477_c7_f54e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1477_c7_f54e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1477_c7_f54e_return_output := n16_MUX_uxn_opcodes_h_l1477_c7_f54e_return_output;

     -- printf_uxn_opcodes_h_l1446_c3_8706[uxn_opcodes_h_l1446_c3_8706] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1446_c3_8706_uxn_opcodes_h_l1446_c3_8706_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1446_c3_8706_uxn_opcodes_h_l1446_c3_8706_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1483_c7_8386] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1483_c7_8386_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1483_c7_8386_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1483_c7_8386_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1483_c7_8386_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1483_c7_8386_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1483_c7_8386_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1483_c7_8386_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1483_c7_8386_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1474_c7_bd86] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1474_c7_bd86_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1474_c7_bd86_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1474_c7_bd86_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1474_c7_bd86_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1474_c7_bd86_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1474_c7_bd86_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1474_c7_bd86_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1474_c7_bd86_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1477_c7_f54e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_f54e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_f54e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_f54e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_f54e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_f54e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_f54e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_f54e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_f54e_return_output;

     -- MUX[uxn_opcodes_h_l1481_c32_ddc8] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1481_c32_ddc8_cond <= VAR_MUX_uxn_opcodes_h_l1481_c32_ddc8_cond;
     MUX_uxn_opcodes_h_l1481_c32_ddc8_iftrue <= VAR_MUX_uxn_opcodes_h_l1481_c32_ddc8_iftrue;
     MUX_uxn_opcodes_h_l1481_c32_ddc8_iffalse <= VAR_MUX_uxn_opcodes_h_l1481_c32_ddc8_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1481_c32_ddc8_return_output := MUX_uxn_opcodes_h_l1481_c32_ddc8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1477_c7_f54e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_f54e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_f54e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_f54e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_f54e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_f54e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_f54e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_f54e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_f54e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1483_c7_8386] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1483_c7_8386_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1483_c7_8386_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1483_c7_8386_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1483_c7_8386_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1483_c7_8386_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1483_c7_8386_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1483_c7_8386_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1483_c7_8386_return_output;

     -- t16_MUX[uxn_opcodes_h_l1462_c7_abce] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1462_c7_abce_cond <= VAR_t16_MUX_uxn_opcodes_h_l1462_c7_abce_cond;
     t16_MUX_uxn_opcodes_h_l1462_c7_abce_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1462_c7_abce_iftrue;
     t16_MUX_uxn_opcodes_h_l1462_c7_abce_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1462_c7_abce_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1462_c7_abce_return_output := t16_MUX_uxn_opcodes_h_l1462_c7_abce_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c7_f54e_iftrue := VAR_MUX_uxn_opcodes_h_l1481_c32_ddc8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1474_c7_bd86_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1477_c7_f54e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_f54e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1483_c7_8386_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1474_c7_bd86_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_f54e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1469_c7_fc5c_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1474_c7_bd86_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_f54e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1483_c7_8386_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c7_bd86_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_f54e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1477_c7_f54e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1483_c7_8386_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1459_c7_fdac_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1462_c7_abce_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1477_c7_f54e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c7_f54e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c7_f54e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c7_f54e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c7_f54e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c7_f54e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c7_f54e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c7_f54e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c7_f54e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1477_c7_f54e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_f54e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_f54e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_f54e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_f54e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_f54e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_f54e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_f54e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_f54e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1474_c7_bd86] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1474_c7_bd86_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1474_c7_bd86_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1474_c7_bd86_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1474_c7_bd86_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1474_c7_bd86_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1474_c7_bd86_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1474_c7_bd86_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1474_c7_bd86_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1477_c7_f54e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1477_c7_f54e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1477_c7_f54e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1477_c7_f54e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1477_c7_f54e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1477_c7_f54e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1477_c7_f54e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1477_c7_f54e_return_output := result_stack_value_MUX_uxn_opcodes_h_l1477_c7_f54e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1474_c7_bd86] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c7_bd86_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c7_bd86_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c7_bd86_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c7_bd86_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c7_bd86_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c7_bd86_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c7_bd86_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c7_bd86_return_output;

     -- n16_MUX[uxn_opcodes_h_l1474_c7_bd86] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1474_c7_bd86_cond <= VAR_n16_MUX_uxn_opcodes_h_l1474_c7_bd86_cond;
     n16_MUX_uxn_opcodes_h_l1474_c7_bd86_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1474_c7_bd86_iftrue;
     n16_MUX_uxn_opcodes_h_l1474_c7_bd86_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1474_c7_bd86_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1474_c7_bd86_return_output := n16_MUX_uxn_opcodes_h_l1474_c7_bd86_return_output;

     -- t16_MUX[uxn_opcodes_h_l1459_c7_fdac] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1459_c7_fdac_cond <= VAR_t16_MUX_uxn_opcodes_h_l1459_c7_fdac_cond;
     t16_MUX_uxn_opcodes_h_l1459_c7_fdac_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1459_c7_fdac_iftrue;
     t16_MUX_uxn_opcodes_h_l1459_c7_fdac_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1459_c7_fdac_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1459_c7_fdac_return_output := t16_MUX_uxn_opcodes_h_l1459_c7_fdac_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1477_c7_f54e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_f54e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_f54e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_f54e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_f54e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_f54e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_f54e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_f54e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_f54e_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1469_c7_fc5c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1469_c7_fc5c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1469_c7_fc5c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1469_c7_fc5c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1469_c7_fc5c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1469_c7_fc5c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1469_c7_fc5c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1469_c7_fc5c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1469_c7_fc5c_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l1469_c7_fc5c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1474_c7_bd86_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1474_c7_bd86_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_f54e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1469_c7_fc5c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1474_c7_bd86_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1466_c7_2ec6_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1469_c7_fc5c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1474_c7_bd86_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_f54e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1474_c7_bd86_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c7_f54e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1469_c7_fc5c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c7_bd86_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1474_c7_bd86_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1477_c7_f54e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1454_c7_6d5b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1459_c7_fdac_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1474_c7_bd86] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1474_c7_bd86_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1474_c7_bd86_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1474_c7_bd86_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1474_c7_bd86_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1474_c7_bd86_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1474_c7_bd86_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1474_c7_bd86_return_output := result_stack_value_MUX_uxn_opcodes_h_l1474_c7_bd86_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1469_c7_fc5c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1469_c7_fc5c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1469_c7_fc5c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1469_c7_fc5c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1469_c7_fc5c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1469_c7_fc5c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1469_c7_fc5c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1469_c7_fc5c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1469_c7_fc5c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1474_c7_bd86] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1474_c7_bd86_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1474_c7_bd86_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1474_c7_bd86_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1474_c7_bd86_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1474_c7_bd86_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1474_c7_bd86_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1474_c7_bd86_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1474_c7_bd86_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1474_c7_bd86] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1474_c7_bd86_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1474_c7_bd86_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1474_c7_bd86_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1474_c7_bd86_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1474_c7_bd86_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1474_c7_bd86_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1474_c7_bd86_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1474_c7_bd86_return_output;

     -- n16_MUX[uxn_opcodes_h_l1469_c7_fc5c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1469_c7_fc5c_cond <= VAR_n16_MUX_uxn_opcodes_h_l1469_c7_fc5c_cond;
     n16_MUX_uxn_opcodes_h_l1469_c7_fc5c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1469_c7_fc5c_iftrue;
     n16_MUX_uxn_opcodes_h_l1469_c7_fc5c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1469_c7_fc5c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1469_c7_fc5c_return_output := n16_MUX_uxn_opcodes_h_l1469_c7_fc5c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1466_c7_2ec6] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1466_c7_2ec6_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1466_c7_2ec6_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1466_c7_2ec6_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1466_c7_2ec6_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1466_c7_2ec6_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1466_c7_2ec6_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1466_c7_2ec6_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1466_c7_2ec6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1474_c7_bd86] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1474_c7_bd86_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1474_c7_bd86_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1474_c7_bd86_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1474_c7_bd86_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1474_c7_bd86_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1474_c7_bd86_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1474_c7_bd86_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1474_c7_bd86_return_output;

     -- t16_MUX[uxn_opcodes_h_l1454_c7_6d5b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1454_c7_6d5b_cond <= VAR_t16_MUX_uxn_opcodes_h_l1454_c7_6d5b_cond;
     t16_MUX_uxn_opcodes_h_l1454_c7_6d5b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1454_c7_6d5b_iftrue;
     t16_MUX_uxn_opcodes_h_l1454_c7_6d5b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1454_c7_6d5b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1454_c7_6d5b_return_output := t16_MUX_uxn_opcodes_h_l1454_c7_6d5b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1469_c7_fc5c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1469_c7_fc5c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1469_c7_fc5c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1469_c7_fc5c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1469_c7_fc5c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1469_c7_fc5c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1469_c7_fc5c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1469_c7_fc5c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1469_c7_fc5c_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1466_c7_2ec6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1469_c7_fc5c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1469_c7_fc5c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1474_c7_bd86_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1466_c7_2ec6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1469_c7_fc5c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1462_c7_abce_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1466_c7_2ec6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1469_c7_fc5c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1474_c7_bd86_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1469_c7_fc5c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1474_c7_bd86_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1466_c7_2ec6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1469_c7_fc5c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1469_c7_fc5c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1474_c7_bd86_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1451_c7_927c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1454_c7_6d5b_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1462_c7_abce] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1462_c7_abce_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1462_c7_abce_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1462_c7_abce_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1462_c7_abce_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1462_c7_abce_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1462_c7_abce_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1462_c7_abce_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1462_c7_abce_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1469_c7_fc5c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1469_c7_fc5c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1469_c7_fc5c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1469_c7_fc5c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1469_c7_fc5c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1469_c7_fc5c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1469_c7_fc5c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1469_c7_fc5c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1469_c7_fc5c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1469_c7_fc5c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1469_c7_fc5c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1469_c7_fc5c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1469_c7_fc5c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1469_c7_fc5c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1469_c7_fc5c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1469_c7_fc5c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1469_c7_fc5c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1469_c7_fc5c_return_output;

     -- t16_MUX[uxn_opcodes_h_l1451_c7_927c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1451_c7_927c_cond <= VAR_t16_MUX_uxn_opcodes_h_l1451_c7_927c_cond;
     t16_MUX_uxn_opcodes_h_l1451_c7_927c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1451_c7_927c_iftrue;
     t16_MUX_uxn_opcodes_h_l1451_c7_927c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1451_c7_927c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1451_c7_927c_return_output := t16_MUX_uxn_opcodes_h_l1451_c7_927c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1466_c7_2ec6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1466_c7_2ec6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1466_c7_2ec6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1466_c7_2ec6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1466_c7_2ec6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1466_c7_2ec6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1466_c7_2ec6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1466_c7_2ec6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1466_c7_2ec6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1466_c7_2ec6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1466_c7_2ec6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1466_c7_2ec6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1466_c7_2ec6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1466_c7_2ec6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1466_c7_2ec6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1466_c7_2ec6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1466_c7_2ec6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1466_c7_2ec6_return_output;

     -- n16_MUX[uxn_opcodes_h_l1466_c7_2ec6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1466_c7_2ec6_cond <= VAR_n16_MUX_uxn_opcodes_h_l1466_c7_2ec6_cond;
     n16_MUX_uxn_opcodes_h_l1466_c7_2ec6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1466_c7_2ec6_iftrue;
     n16_MUX_uxn_opcodes_h_l1466_c7_2ec6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1466_c7_2ec6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1466_c7_2ec6_return_output := n16_MUX_uxn_opcodes_h_l1466_c7_2ec6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1469_c7_fc5c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1469_c7_fc5c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1469_c7_fc5c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1469_c7_fc5c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1469_c7_fc5c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1469_c7_fc5c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1469_c7_fc5c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1469_c7_fc5c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1469_c7_fc5c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1469_c7_fc5c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1469_c7_fc5c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1469_c7_fc5c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1469_c7_fc5c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1469_c7_fc5c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1469_c7_fc5c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1469_c7_fc5c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1469_c7_fc5c_return_output := result_stack_value_MUX_uxn_opcodes_h_l1469_c7_fc5c_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1462_c7_abce_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1466_c7_2ec6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1466_c7_2ec6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1469_c7_fc5c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1462_c7_abce_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1466_c7_2ec6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1459_c7_fdac_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1462_c7_abce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1466_c7_2ec6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1469_c7_fc5c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1466_c7_2ec6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1469_c7_fc5c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1462_c7_abce_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1466_c7_2ec6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1466_c7_2ec6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1469_c7_fc5c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1445_c2_26ec_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1451_c7_927c_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1466_c7_2ec6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1466_c7_2ec6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1466_c7_2ec6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1466_c7_2ec6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1466_c7_2ec6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1466_c7_2ec6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1466_c7_2ec6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1466_c7_2ec6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1466_c7_2ec6_return_output;

     -- n16_MUX[uxn_opcodes_h_l1462_c7_abce] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1462_c7_abce_cond <= VAR_n16_MUX_uxn_opcodes_h_l1462_c7_abce_cond;
     n16_MUX_uxn_opcodes_h_l1462_c7_abce_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1462_c7_abce_iftrue;
     n16_MUX_uxn_opcodes_h_l1462_c7_abce_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1462_c7_abce_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1462_c7_abce_return_output := n16_MUX_uxn_opcodes_h_l1462_c7_abce_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1459_c7_fdac] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1459_c7_fdac_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1459_c7_fdac_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1459_c7_fdac_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1459_c7_fdac_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1459_c7_fdac_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1459_c7_fdac_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1459_c7_fdac_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1459_c7_fdac_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1466_c7_2ec6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1466_c7_2ec6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1466_c7_2ec6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1466_c7_2ec6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1466_c7_2ec6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1466_c7_2ec6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1466_c7_2ec6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1466_c7_2ec6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1466_c7_2ec6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1462_c7_abce] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1462_c7_abce_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1462_c7_abce_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1462_c7_abce_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1462_c7_abce_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1462_c7_abce_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1462_c7_abce_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1462_c7_abce_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1462_c7_abce_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1466_c7_2ec6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1466_c7_2ec6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1466_c7_2ec6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1466_c7_2ec6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1466_c7_2ec6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1466_c7_2ec6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1466_c7_2ec6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1466_c7_2ec6_return_output := result_stack_value_MUX_uxn_opcodes_h_l1466_c7_2ec6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1466_c7_2ec6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1466_c7_2ec6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1466_c7_2ec6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1466_c7_2ec6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1466_c7_2ec6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1466_c7_2ec6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1466_c7_2ec6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1466_c7_2ec6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1466_c7_2ec6_return_output;

     -- t16_MUX[uxn_opcodes_h_l1445_c2_26ec] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1445_c2_26ec_cond <= VAR_t16_MUX_uxn_opcodes_h_l1445_c2_26ec_cond;
     t16_MUX_uxn_opcodes_h_l1445_c2_26ec_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1445_c2_26ec_iftrue;
     t16_MUX_uxn_opcodes_h_l1445_c2_26ec_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1445_c2_26ec_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1445_c2_26ec_return_output := t16_MUX_uxn_opcodes_h_l1445_c2_26ec_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1462_c7_abce] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1462_c7_abce_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1462_c7_abce_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1462_c7_abce_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1462_c7_abce_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1462_c7_abce_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1462_c7_abce_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1462_c7_abce_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1462_c7_abce_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1459_c7_fdac_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1462_c7_abce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1462_c7_abce_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1466_c7_2ec6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1459_c7_fdac_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1462_c7_abce_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_6d5b_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1459_c7_fdac_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1462_c7_abce_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1466_c7_2ec6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1462_c7_abce_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1466_c7_2ec6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1459_c7_fdac_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1462_c7_abce_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1462_c7_abce_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1466_c7_2ec6_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1445_c2_26ec_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1462_c7_abce] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1462_c7_abce_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1462_c7_abce_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1462_c7_abce_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1462_c7_abce_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1462_c7_abce_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1462_c7_abce_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1462_c7_abce_return_output := result_stack_value_MUX_uxn_opcodes_h_l1462_c7_abce_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1462_c7_abce] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1462_c7_abce_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1462_c7_abce_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1462_c7_abce_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1462_c7_abce_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1462_c7_abce_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1462_c7_abce_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1462_c7_abce_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1462_c7_abce_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1462_c7_abce] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1462_c7_abce_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1462_c7_abce_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1462_c7_abce_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1462_c7_abce_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1462_c7_abce_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1462_c7_abce_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1462_c7_abce_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1462_c7_abce_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1459_c7_fdac] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1459_c7_fdac_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1459_c7_fdac_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1459_c7_fdac_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1459_c7_fdac_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1459_c7_fdac_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1459_c7_fdac_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1459_c7_fdac_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1459_c7_fdac_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1462_c7_abce] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1462_c7_abce_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1462_c7_abce_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1462_c7_abce_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1462_c7_abce_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1462_c7_abce_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1462_c7_abce_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1462_c7_abce_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1462_c7_abce_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1459_c7_fdac] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1459_c7_fdac_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1459_c7_fdac_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1459_c7_fdac_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1459_c7_fdac_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1459_c7_fdac_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1459_c7_fdac_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1459_c7_fdac_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1459_c7_fdac_return_output;

     -- n16_MUX[uxn_opcodes_h_l1459_c7_fdac] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1459_c7_fdac_cond <= VAR_n16_MUX_uxn_opcodes_h_l1459_c7_fdac_cond;
     n16_MUX_uxn_opcodes_h_l1459_c7_fdac_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1459_c7_fdac_iftrue;
     n16_MUX_uxn_opcodes_h_l1459_c7_fdac_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1459_c7_fdac_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1459_c7_fdac_return_output := n16_MUX_uxn_opcodes_h_l1459_c7_fdac_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1454_c7_6d5b] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_6d5b_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_6d5b_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_6d5b_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_6d5b_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_6d5b_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_6d5b_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_6d5b_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_6d5b_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1454_c7_6d5b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1459_c7_fdac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1459_c7_fdac_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1462_c7_abce_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_6d5b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1459_c7_fdac_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1451_c7_927c_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_6d5b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1459_c7_fdac_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1462_c7_abce_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1459_c7_fdac_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1462_c7_abce_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_6d5b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1459_c7_fdac_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1459_c7_fdac_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1462_c7_abce_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1459_c7_fdac] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1459_c7_fdac_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1459_c7_fdac_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1459_c7_fdac_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1459_c7_fdac_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1459_c7_fdac_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1459_c7_fdac_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1459_c7_fdac_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1459_c7_fdac_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1459_c7_fdac] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1459_c7_fdac_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1459_c7_fdac_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1459_c7_fdac_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1459_c7_fdac_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1459_c7_fdac_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1459_c7_fdac_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1459_c7_fdac_return_output := result_stack_value_MUX_uxn_opcodes_h_l1459_c7_fdac_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1459_c7_fdac] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1459_c7_fdac_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1459_c7_fdac_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1459_c7_fdac_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1459_c7_fdac_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1459_c7_fdac_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1459_c7_fdac_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1459_c7_fdac_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1459_c7_fdac_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1451_c7_927c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1451_c7_927c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1451_c7_927c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1451_c7_927c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1451_c7_927c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1451_c7_927c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1451_c7_927c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1451_c7_927c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1451_c7_927c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1454_c7_6d5b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_6d5b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_6d5b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_6d5b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_6d5b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_6d5b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_6d5b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_6d5b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_6d5b_return_output;

     -- n16_MUX[uxn_opcodes_h_l1454_c7_6d5b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1454_c7_6d5b_cond <= VAR_n16_MUX_uxn_opcodes_h_l1454_c7_6d5b_cond;
     n16_MUX_uxn_opcodes_h_l1454_c7_6d5b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1454_c7_6d5b_iftrue;
     n16_MUX_uxn_opcodes_h_l1454_c7_6d5b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1454_c7_6d5b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1454_c7_6d5b_return_output := n16_MUX_uxn_opcodes_h_l1454_c7_6d5b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1459_c7_fdac] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1459_c7_fdac_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1459_c7_fdac_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1459_c7_fdac_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1459_c7_fdac_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1459_c7_fdac_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1459_c7_fdac_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1459_c7_fdac_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1459_c7_fdac_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1454_c7_6d5b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_6d5b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_6d5b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_6d5b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_6d5b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_6d5b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_6d5b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_6d5b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_6d5b_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1451_c7_927c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1454_c7_6d5b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_6d5b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1459_c7_fdac_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1451_c7_927c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_6d5b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1445_c2_26ec_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1451_c7_927c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_6d5b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1459_c7_fdac_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_6d5b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1459_c7_fdac_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1451_c7_927c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_6d5b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1454_c7_6d5b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1459_c7_fdac_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1445_c2_26ec] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1445_c2_26ec_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1445_c2_26ec_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1445_c2_26ec_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1445_c2_26ec_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1445_c2_26ec_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1445_c2_26ec_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1445_c2_26ec_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1445_c2_26ec_return_output;

     -- n16_MUX[uxn_opcodes_h_l1451_c7_927c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1451_c7_927c_cond <= VAR_n16_MUX_uxn_opcodes_h_l1451_c7_927c_cond;
     n16_MUX_uxn_opcodes_h_l1451_c7_927c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1451_c7_927c_iftrue;
     n16_MUX_uxn_opcodes_h_l1451_c7_927c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1451_c7_927c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1451_c7_927c_return_output := n16_MUX_uxn_opcodes_h_l1451_c7_927c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1451_c7_927c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1451_c7_927c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1451_c7_927c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1451_c7_927c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1451_c7_927c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1451_c7_927c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1451_c7_927c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1451_c7_927c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1451_c7_927c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1451_c7_927c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1451_c7_927c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1451_c7_927c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1451_c7_927c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1451_c7_927c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1451_c7_927c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1451_c7_927c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1451_c7_927c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1451_c7_927c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1454_c7_6d5b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_6d5b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_6d5b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_6d5b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_6d5b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_6d5b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_6d5b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_6d5b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_6d5b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1454_c7_6d5b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_6d5b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_6d5b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_6d5b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_6d5b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_6d5b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_6d5b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_6d5b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_6d5b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1454_c7_6d5b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1454_c7_6d5b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1454_c7_6d5b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1454_c7_6d5b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1454_c7_6d5b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1454_c7_6d5b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1454_c7_6d5b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1454_c7_6d5b_return_output := result_stack_value_MUX_uxn_opcodes_h_l1454_c7_6d5b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1454_c7_6d5b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_6d5b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_6d5b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_6d5b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_6d5b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_6d5b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_6d5b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_6d5b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_6d5b_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1445_c2_26ec_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1451_c7_927c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1451_c7_927c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_6d5b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1445_c2_26ec_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1451_c7_927c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1451_c7_927c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_6d5b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1451_c7_927c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_6d5b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1445_c2_26ec_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1451_c7_927c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1451_c7_927c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1454_c7_6d5b_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1451_c7_927c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1451_c7_927c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1451_c7_927c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1451_c7_927c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1451_c7_927c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1451_c7_927c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1451_c7_927c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1451_c7_927c_return_output := result_stack_value_MUX_uxn_opcodes_h_l1451_c7_927c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1445_c2_26ec] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1445_c2_26ec_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1445_c2_26ec_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1445_c2_26ec_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1445_c2_26ec_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1445_c2_26ec_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1445_c2_26ec_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1445_c2_26ec_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1445_c2_26ec_return_output;

     -- n16_MUX[uxn_opcodes_h_l1445_c2_26ec] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1445_c2_26ec_cond <= VAR_n16_MUX_uxn_opcodes_h_l1445_c2_26ec_cond;
     n16_MUX_uxn_opcodes_h_l1445_c2_26ec_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1445_c2_26ec_iftrue;
     n16_MUX_uxn_opcodes_h_l1445_c2_26ec_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1445_c2_26ec_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1445_c2_26ec_return_output := n16_MUX_uxn_opcodes_h_l1445_c2_26ec_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1451_c7_927c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1451_c7_927c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1451_c7_927c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1451_c7_927c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1451_c7_927c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1451_c7_927c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1451_c7_927c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1451_c7_927c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1451_c7_927c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1451_c7_927c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1451_c7_927c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1451_c7_927c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1451_c7_927c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1451_c7_927c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1451_c7_927c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1451_c7_927c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1451_c7_927c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1451_c7_927c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1451_c7_927c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1451_c7_927c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1451_c7_927c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1451_c7_927c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1451_c7_927c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1451_c7_927c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1451_c7_927c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1451_c7_927c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1451_c7_927c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1445_c2_26ec] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1445_c2_26ec_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1445_c2_26ec_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1445_c2_26ec_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1445_c2_26ec_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1445_c2_26ec_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1445_c2_26ec_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1445_c2_26ec_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1445_c2_26ec_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1445_c2_26ec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1445_c2_26ec_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1451_c7_927c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1445_c2_26ec_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1451_c7_927c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1445_c2_26ec_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1451_c7_927c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1445_c2_26ec_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1451_c7_927c_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1445_c2_26ec] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1445_c2_26ec_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1445_c2_26ec_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1445_c2_26ec_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1445_c2_26ec_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1445_c2_26ec_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1445_c2_26ec_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1445_c2_26ec_return_output := result_stack_value_MUX_uxn_opcodes_h_l1445_c2_26ec_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1445_c2_26ec] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1445_c2_26ec_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1445_c2_26ec_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1445_c2_26ec_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1445_c2_26ec_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1445_c2_26ec_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1445_c2_26ec_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1445_c2_26ec_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1445_c2_26ec_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1445_c2_26ec] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1445_c2_26ec_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1445_c2_26ec_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1445_c2_26ec_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1445_c2_26ec_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1445_c2_26ec_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1445_c2_26ec_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1445_c2_26ec_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1445_c2_26ec_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1445_c2_26ec] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1445_c2_26ec_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1445_c2_26ec_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1445_c2_26ec_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1445_c2_26ec_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1445_c2_26ec_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1445_c2_26ec_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1445_c2_26ec_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1445_c2_26ec_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l1494_l1441_DUPLICATE_9a9b LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l1494_l1441_DUPLICATE_9a9b_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1445_c2_26ec_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1445_c2_26ec_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1445_c2_26ec_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1445_c2_26ec_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1445_c2_26ec_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1445_c2_26ec_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1445_c2_26ec_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l1494_l1441_DUPLICATE_9a9b_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l1494_l1441_DUPLICATE_9a9b_return_output;
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
