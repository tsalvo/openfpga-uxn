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
-- Submodules: 123
entity and2_0CLK_201aeef3 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end and2_0CLK_201aeef3;
architecture arch of and2_0CLK_201aeef3 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l615_c6_39c1]
signal BIN_OP_EQ_uxn_opcodes_h_l615_c6_39c1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l615_c6_39c1_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l615_c6_39c1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l615_c1_db0b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l615_c1_db0b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l615_c1_db0b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l615_c1_db0b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l615_c1_db0b_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l615_c2_5499]
signal tmp16_MUX_uxn_opcodes_h_l615_c2_5499_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l615_c2_5499_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l615_c2_5499_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l615_c2_5499_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l615_c2_5499]
signal result_is_stack_read_MUX_uxn_opcodes_h_l615_c2_5499_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l615_c2_5499_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l615_c2_5499_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l615_c2_5499_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l615_c2_5499]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l615_c2_5499_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l615_c2_5499_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l615_c2_5499_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l615_c2_5499_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l615_c2_5499]
signal result_is_opc_done_MUX_uxn_opcodes_h_l615_c2_5499_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l615_c2_5499_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l615_c2_5499_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l615_c2_5499_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l615_c2_5499]
signal result_is_stack_write_MUX_uxn_opcodes_h_l615_c2_5499_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l615_c2_5499_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l615_c2_5499_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l615_c2_5499_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l615_c2_5499]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l615_c2_5499_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l615_c2_5499_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l615_c2_5499_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l615_c2_5499_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l615_c2_5499]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l615_c2_5499_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l615_c2_5499_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l615_c2_5499_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l615_c2_5499_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l615_c2_5499]
signal result_stack_value_MUX_uxn_opcodes_h_l615_c2_5499_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l615_c2_5499_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l615_c2_5499_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l615_c2_5499_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l615_c2_5499]
signal t16_MUX_uxn_opcodes_h_l615_c2_5499_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l615_c2_5499_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l615_c2_5499_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l615_c2_5499_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l615_c2_5499]
signal n16_MUX_uxn_opcodes_h_l615_c2_5499_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l615_c2_5499_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l615_c2_5499_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l615_c2_5499_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l616_c3_8235[uxn_opcodes_h_l616_c3_8235]
signal printf_uxn_opcodes_h_l616_c3_8235_uxn_opcodes_h_l616_c3_8235_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l621_c11_38d1]
signal BIN_OP_EQ_uxn_opcodes_h_l621_c11_38d1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l621_c11_38d1_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l621_c11_38d1_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l621_c7_4478]
signal tmp16_MUX_uxn_opcodes_h_l621_c7_4478_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l621_c7_4478_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l621_c7_4478_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l621_c7_4478_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l621_c7_4478]
signal result_is_stack_read_MUX_uxn_opcodes_h_l621_c7_4478_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l621_c7_4478_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l621_c7_4478_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l621_c7_4478_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l621_c7_4478]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c7_4478_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c7_4478_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c7_4478_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c7_4478_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l621_c7_4478]
signal result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_4478_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_4478_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_4478_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_4478_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l621_c7_4478]
signal result_is_stack_write_MUX_uxn_opcodes_h_l621_c7_4478_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l621_c7_4478_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l621_c7_4478_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l621_c7_4478_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l621_c7_4478]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l621_c7_4478_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l621_c7_4478_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l621_c7_4478_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l621_c7_4478_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l621_c7_4478]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c7_4478_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c7_4478_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c7_4478_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c7_4478_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l621_c7_4478]
signal result_stack_value_MUX_uxn_opcodes_h_l621_c7_4478_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l621_c7_4478_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l621_c7_4478_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l621_c7_4478_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l621_c7_4478]
signal t16_MUX_uxn_opcodes_h_l621_c7_4478_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l621_c7_4478_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l621_c7_4478_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l621_c7_4478_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l621_c7_4478]
signal n16_MUX_uxn_opcodes_h_l621_c7_4478_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l621_c7_4478_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l621_c7_4478_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l621_c7_4478_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l624_c11_53ef]
signal BIN_OP_EQ_uxn_opcodes_h_l624_c11_53ef_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l624_c11_53ef_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l624_c11_53ef_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l624_c7_245f]
signal tmp16_MUX_uxn_opcodes_h_l624_c7_245f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l624_c7_245f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l624_c7_245f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l624_c7_245f_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l624_c7_245f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l624_c7_245f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l624_c7_245f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l624_c7_245f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l624_c7_245f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l624_c7_245f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_245f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_245f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_245f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_245f_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l624_c7_245f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_245f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_245f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_245f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_245f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l624_c7_245f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l624_c7_245f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l624_c7_245f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l624_c7_245f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l624_c7_245f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l624_c7_245f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_245f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_245f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_245f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_245f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l624_c7_245f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c7_245f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c7_245f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c7_245f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c7_245f_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l624_c7_245f]
signal result_stack_value_MUX_uxn_opcodes_h_l624_c7_245f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l624_c7_245f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l624_c7_245f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l624_c7_245f_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l624_c7_245f]
signal t16_MUX_uxn_opcodes_h_l624_c7_245f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l624_c7_245f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l624_c7_245f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l624_c7_245f_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l624_c7_245f]
signal n16_MUX_uxn_opcodes_h_l624_c7_245f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l624_c7_245f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l624_c7_245f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l624_c7_245f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l629_c11_129f]
signal BIN_OP_EQ_uxn_opcodes_h_l629_c11_129f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l629_c11_129f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l629_c11_129f_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l629_c7_a2af]
signal tmp16_MUX_uxn_opcodes_h_l629_c7_a2af_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l629_c7_a2af_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l629_c7_a2af_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l629_c7_a2af_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l629_c7_a2af]
signal result_is_stack_read_MUX_uxn_opcodes_h_l629_c7_a2af_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l629_c7_a2af_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l629_c7_a2af_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l629_c7_a2af_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l629_c7_a2af]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_a2af_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_a2af_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_a2af_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_a2af_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l629_c7_a2af]
signal result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_a2af_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_a2af_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_a2af_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_a2af_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l629_c7_a2af]
signal result_is_stack_write_MUX_uxn_opcodes_h_l629_c7_a2af_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l629_c7_a2af_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l629_c7_a2af_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l629_c7_a2af_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l629_c7_a2af]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_a2af_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_a2af_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_a2af_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_a2af_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l629_c7_a2af]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l629_c7_a2af_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l629_c7_a2af_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l629_c7_a2af_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l629_c7_a2af_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l629_c7_a2af]
signal result_stack_value_MUX_uxn_opcodes_h_l629_c7_a2af_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l629_c7_a2af_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l629_c7_a2af_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l629_c7_a2af_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l629_c7_a2af]
signal t16_MUX_uxn_opcodes_h_l629_c7_a2af_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l629_c7_a2af_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l629_c7_a2af_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l629_c7_a2af_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l629_c7_a2af]
signal n16_MUX_uxn_opcodes_h_l629_c7_a2af_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l629_c7_a2af_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l629_c7_a2af_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l629_c7_a2af_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l632_c11_4ebf]
signal BIN_OP_EQ_uxn_opcodes_h_l632_c11_4ebf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l632_c11_4ebf_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l632_c11_4ebf_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l632_c7_b578]
signal tmp16_MUX_uxn_opcodes_h_l632_c7_b578_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l632_c7_b578_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l632_c7_b578_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l632_c7_b578_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l632_c7_b578]
signal result_is_stack_read_MUX_uxn_opcodes_h_l632_c7_b578_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l632_c7_b578_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l632_c7_b578_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l632_c7_b578_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l632_c7_b578]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_b578_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_b578_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_b578_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_b578_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l632_c7_b578]
signal result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_b578_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_b578_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_b578_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_b578_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l632_c7_b578]
signal result_is_stack_write_MUX_uxn_opcodes_h_l632_c7_b578_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l632_c7_b578_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l632_c7_b578_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l632_c7_b578_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l632_c7_b578]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_b578_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_b578_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_b578_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_b578_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l632_c7_b578]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l632_c7_b578_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l632_c7_b578_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l632_c7_b578_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l632_c7_b578_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l632_c7_b578]
signal result_stack_value_MUX_uxn_opcodes_h_l632_c7_b578_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l632_c7_b578_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l632_c7_b578_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l632_c7_b578_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l632_c7_b578]
signal t16_MUX_uxn_opcodes_h_l632_c7_b578_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l632_c7_b578_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l632_c7_b578_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l632_c7_b578_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l632_c7_b578]
signal n16_MUX_uxn_opcodes_h_l632_c7_b578_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l632_c7_b578_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l632_c7_b578_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l632_c7_b578_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l633_c3_59d8]
signal BIN_OP_OR_uxn_opcodes_h_l633_c3_59d8_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l633_c3_59d8_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l633_c3_59d8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l636_c11_9bbc]
signal BIN_OP_EQ_uxn_opcodes_h_l636_c11_9bbc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l636_c11_9bbc_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l636_c11_9bbc_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l636_c7_8d3f]
signal tmp16_MUX_uxn_opcodes_h_l636_c7_8d3f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l636_c7_8d3f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l636_c7_8d3f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l636_c7_8d3f_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l636_c7_8d3f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l636_c7_8d3f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l636_c7_8d3f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l636_c7_8d3f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l636_c7_8d3f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l636_c7_8d3f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_8d3f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_8d3f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_8d3f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_8d3f_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l636_c7_8d3f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_8d3f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_8d3f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_8d3f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_8d3f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l636_c7_8d3f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l636_c7_8d3f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l636_c7_8d3f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l636_c7_8d3f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l636_c7_8d3f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l636_c7_8d3f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_8d3f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_8d3f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_8d3f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_8d3f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l636_c7_8d3f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l636_c7_8d3f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l636_c7_8d3f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l636_c7_8d3f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l636_c7_8d3f_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l636_c7_8d3f]
signal result_stack_value_MUX_uxn_opcodes_h_l636_c7_8d3f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l636_c7_8d3f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l636_c7_8d3f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l636_c7_8d3f_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l636_c7_8d3f]
signal n16_MUX_uxn_opcodes_h_l636_c7_8d3f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l636_c7_8d3f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l636_c7_8d3f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l636_c7_8d3f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l639_c11_798a]
signal BIN_OP_EQ_uxn_opcodes_h_l639_c11_798a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l639_c11_798a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l639_c11_798a_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l639_c7_520f]
signal tmp16_MUX_uxn_opcodes_h_l639_c7_520f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l639_c7_520f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l639_c7_520f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l639_c7_520f_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l639_c7_520f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l639_c7_520f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l639_c7_520f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l639_c7_520f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l639_c7_520f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l639_c7_520f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_520f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_520f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_520f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_520f_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l639_c7_520f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_520f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_520f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_520f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_520f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l639_c7_520f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l639_c7_520f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l639_c7_520f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l639_c7_520f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l639_c7_520f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l639_c7_520f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_520f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_520f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_520f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_520f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l639_c7_520f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l639_c7_520f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l639_c7_520f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l639_c7_520f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l639_c7_520f_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l639_c7_520f]
signal result_stack_value_MUX_uxn_opcodes_h_l639_c7_520f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l639_c7_520f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l639_c7_520f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l639_c7_520f_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l639_c7_520f]
signal n16_MUX_uxn_opcodes_h_l639_c7_520f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l639_c7_520f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l639_c7_520f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l639_c7_520f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l644_c11_3689]
signal BIN_OP_EQ_uxn_opcodes_h_l644_c11_3689_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l644_c11_3689_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l644_c11_3689_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l644_c7_ba21]
signal tmp16_MUX_uxn_opcodes_h_l644_c7_ba21_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l644_c7_ba21_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l644_c7_ba21_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l644_c7_ba21_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l644_c7_ba21]
signal result_is_stack_read_MUX_uxn_opcodes_h_l644_c7_ba21_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l644_c7_ba21_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l644_c7_ba21_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l644_c7_ba21_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l644_c7_ba21]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c7_ba21_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c7_ba21_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c7_ba21_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c7_ba21_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l644_c7_ba21]
signal result_is_opc_done_MUX_uxn_opcodes_h_l644_c7_ba21_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l644_c7_ba21_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l644_c7_ba21_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l644_c7_ba21_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l644_c7_ba21]
signal result_is_stack_write_MUX_uxn_opcodes_h_l644_c7_ba21_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l644_c7_ba21_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l644_c7_ba21_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l644_c7_ba21_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l644_c7_ba21]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l644_c7_ba21_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l644_c7_ba21_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l644_c7_ba21_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l644_c7_ba21_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l644_c7_ba21]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c7_ba21_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c7_ba21_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c7_ba21_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c7_ba21_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l644_c7_ba21]
signal result_stack_value_MUX_uxn_opcodes_h_l644_c7_ba21_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l644_c7_ba21_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l644_c7_ba21_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l644_c7_ba21_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l644_c7_ba21]
signal n16_MUX_uxn_opcodes_h_l644_c7_ba21_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l644_c7_ba21_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l644_c7_ba21_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l644_c7_ba21_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l647_c11_7d51]
signal BIN_OP_EQ_uxn_opcodes_h_l647_c11_7d51_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l647_c11_7d51_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l647_c11_7d51_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l647_c7_761f]
signal tmp16_MUX_uxn_opcodes_h_l647_c7_761f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l647_c7_761f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l647_c7_761f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l647_c7_761f_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l647_c7_761f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l647_c7_761f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l647_c7_761f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l647_c7_761f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l647_c7_761f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l647_c7_761f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c7_761f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c7_761f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c7_761f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c7_761f_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l647_c7_761f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l647_c7_761f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l647_c7_761f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l647_c7_761f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l647_c7_761f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l647_c7_761f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l647_c7_761f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l647_c7_761f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l647_c7_761f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l647_c7_761f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l647_c7_761f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l647_c7_761f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l647_c7_761f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l647_c7_761f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l647_c7_761f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l647_c7_761f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c7_761f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c7_761f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c7_761f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c7_761f_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l647_c7_761f]
signal result_stack_value_MUX_uxn_opcodes_h_l647_c7_761f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l647_c7_761f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l647_c7_761f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l647_c7_761f_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l647_c7_761f]
signal n16_MUX_uxn_opcodes_h_l647_c7_761f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l647_c7_761f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l647_c7_761f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l647_c7_761f_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l648_c3_a1a1]
signal BIN_OP_OR_uxn_opcodes_h_l648_c3_a1a1_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l648_c3_a1a1_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l648_c3_a1a1_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l649_c11_415f]
signal BIN_OP_AND_uxn_opcodes_h_l649_c11_415f_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l649_c11_415f_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l649_c11_415f_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l652_c32_081b]
signal BIN_OP_AND_uxn_opcodes_h_l652_c32_081b_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l652_c32_081b_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l652_c32_081b_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l652_c32_bffb]
signal BIN_OP_GT_uxn_opcodes_h_l652_c32_bffb_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l652_c32_bffb_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l652_c32_bffb_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l652_c32_a709]
signal MUX_uxn_opcodes_h_l652_c32_a709_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l652_c32_a709_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l652_c32_a709_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l652_c32_a709_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l654_c11_dc88]
signal BIN_OP_EQ_uxn_opcodes_h_l654_c11_dc88_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l654_c11_dc88_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l654_c11_dc88_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l654_c7_c4f6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l654_c7_c4f6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l654_c7_c4f6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l654_c7_c4f6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l654_c7_c4f6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l654_c7_c4f6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l654_c7_c4f6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l654_c7_c4f6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l654_c7_c4f6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l654_c7_c4f6_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l654_c7_c4f6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l654_c7_c4f6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l654_c7_c4f6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l654_c7_c4f6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l654_c7_c4f6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l654_c7_c4f6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l654_c7_c4f6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l654_c7_c4f6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l654_c7_c4f6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l654_c7_c4f6_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l654_c7_c4f6]
signal result_stack_value_MUX_uxn_opcodes_h_l654_c7_c4f6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l654_c7_c4f6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l654_c7_c4f6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l654_c7_c4f6_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l660_c11_df20]
signal BIN_OP_EQ_uxn_opcodes_h_l660_c11_df20_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l660_c11_df20_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l660_c11_df20_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l660_c7_5ffb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l660_c7_5ffb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l660_c7_5ffb_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l660_c7_5ffb_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l660_c7_5ffb_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l660_c7_5ffb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l660_c7_5ffb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l660_c7_5ffb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l660_c7_5ffb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l660_c7_5ffb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l660_c7_5ffb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_5ffb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_5ffb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_5ffb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_5ffb_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l660_c7_5ffb]
signal result_stack_value_MUX_uxn_opcodes_h_l660_c7_5ffb_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l660_c7_5ffb_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l660_c7_5ffb_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l660_c7_5ffb_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l662_c34_4c09]
signal CONST_SR_8_uxn_opcodes_h_l662_c34_4c09_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l662_c34_4c09_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l664_c11_2249]
signal BIN_OP_EQ_uxn_opcodes_h_l664_c11_2249_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l664_c11_2249_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l664_c11_2249_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l664_c7_baa8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l664_c7_baa8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l664_c7_baa8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l664_c7_baa8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l664_c7_baa8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l664_c7_baa8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l664_c7_baa8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l664_c7_baa8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l664_c7_baa8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l664_c7_baa8_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l626_l641_DUPLICATE_3c49
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l626_l641_DUPLICATE_3c49_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l626_l641_DUPLICATE_3c49_return_output : unsigned(15 downto 0);

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_28d7( ref_toks_0 : opcode_result_t;
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
      base.is_opc_done := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.stack_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l615_c6_39c1
BIN_OP_EQ_uxn_opcodes_h_l615_c6_39c1 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l615_c6_39c1_left,
BIN_OP_EQ_uxn_opcodes_h_l615_c6_39c1_right,
BIN_OP_EQ_uxn_opcodes_h_l615_c6_39c1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l615_c1_db0b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l615_c1_db0b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l615_c1_db0b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l615_c1_db0b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l615_c1_db0b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l615_c1_db0b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l615_c2_5499
tmp16_MUX_uxn_opcodes_h_l615_c2_5499 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l615_c2_5499_cond,
tmp16_MUX_uxn_opcodes_h_l615_c2_5499_iftrue,
tmp16_MUX_uxn_opcodes_h_l615_c2_5499_iffalse,
tmp16_MUX_uxn_opcodes_h_l615_c2_5499_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l615_c2_5499
result_is_stack_read_MUX_uxn_opcodes_h_l615_c2_5499 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l615_c2_5499_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l615_c2_5499_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l615_c2_5499_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l615_c2_5499_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l615_c2_5499
result_sp_relative_shift_MUX_uxn_opcodes_h_l615_c2_5499 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l615_c2_5499_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l615_c2_5499_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l615_c2_5499_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l615_c2_5499_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l615_c2_5499
result_is_opc_done_MUX_uxn_opcodes_h_l615_c2_5499 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l615_c2_5499_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l615_c2_5499_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l615_c2_5499_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l615_c2_5499_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l615_c2_5499
result_is_stack_write_MUX_uxn_opcodes_h_l615_c2_5499 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l615_c2_5499_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l615_c2_5499_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l615_c2_5499_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l615_c2_5499_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l615_c2_5499
result_is_sp_shift_MUX_uxn_opcodes_h_l615_c2_5499 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l615_c2_5499_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l615_c2_5499_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l615_c2_5499_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l615_c2_5499_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l615_c2_5499
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l615_c2_5499 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l615_c2_5499_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l615_c2_5499_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l615_c2_5499_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l615_c2_5499_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l615_c2_5499
result_stack_value_MUX_uxn_opcodes_h_l615_c2_5499 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l615_c2_5499_cond,
result_stack_value_MUX_uxn_opcodes_h_l615_c2_5499_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l615_c2_5499_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l615_c2_5499_return_output);

-- t16_MUX_uxn_opcodes_h_l615_c2_5499
t16_MUX_uxn_opcodes_h_l615_c2_5499 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l615_c2_5499_cond,
t16_MUX_uxn_opcodes_h_l615_c2_5499_iftrue,
t16_MUX_uxn_opcodes_h_l615_c2_5499_iffalse,
t16_MUX_uxn_opcodes_h_l615_c2_5499_return_output);

-- n16_MUX_uxn_opcodes_h_l615_c2_5499
n16_MUX_uxn_opcodes_h_l615_c2_5499 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l615_c2_5499_cond,
n16_MUX_uxn_opcodes_h_l615_c2_5499_iftrue,
n16_MUX_uxn_opcodes_h_l615_c2_5499_iffalse,
n16_MUX_uxn_opcodes_h_l615_c2_5499_return_output);

-- printf_uxn_opcodes_h_l616_c3_8235_uxn_opcodes_h_l616_c3_8235
printf_uxn_opcodes_h_l616_c3_8235_uxn_opcodes_h_l616_c3_8235 : entity work.printf_uxn_opcodes_h_l616_c3_8235_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l616_c3_8235_uxn_opcodes_h_l616_c3_8235_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l621_c11_38d1
BIN_OP_EQ_uxn_opcodes_h_l621_c11_38d1 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l621_c11_38d1_left,
BIN_OP_EQ_uxn_opcodes_h_l621_c11_38d1_right,
BIN_OP_EQ_uxn_opcodes_h_l621_c11_38d1_return_output);

-- tmp16_MUX_uxn_opcodes_h_l621_c7_4478
tmp16_MUX_uxn_opcodes_h_l621_c7_4478 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l621_c7_4478_cond,
tmp16_MUX_uxn_opcodes_h_l621_c7_4478_iftrue,
tmp16_MUX_uxn_opcodes_h_l621_c7_4478_iffalse,
tmp16_MUX_uxn_opcodes_h_l621_c7_4478_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l621_c7_4478
result_is_stack_read_MUX_uxn_opcodes_h_l621_c7_4478 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l621_c7_4478_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l621_c7_4478_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l621_c7_4478_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l621_c7_4478_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c7_4478
result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c7_4478 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c7_4478_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c7_4478_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c7_4478_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c7_4478_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_4478
result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_4478 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_4478_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_4478_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_4478_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_4478_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l621_c7_4478
result_is_stack_write_MUX_uxn_opcodes_h_l621_c7_4478 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l621_c7_4478_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l621_c7_4478_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l621_c7_4478_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l621_c7_4478_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l621_c7_4478
result_is_sp_shift_MUX_uxn_opcodes_h_l621_c7_4478 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l621_c7_4478_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l621_c7_4478_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l621_c7_4478_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l621_c7_4478_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c7_4478
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c7_4478 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c7_4478_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c7_4478_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c7_4478_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c7_4478_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l621_c7_4478
result_stack_value_MUX_uxn_opcodes_h_l621_c7_4478 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l621_c7_4478_cond,
result_stack_value_MUX_uxn_opcodes_h_l621_c7_4478_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l621_c7_4478_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l621_c7_4478_return_output);

-- t16_MUX_uxn_opcodes_h_l621_c7_4478
t16_MUX_uxn_opcodes_h_l621_c7_4478 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l621_c7_4478_cond,
t16_MUX_uxn_opcodes_h_l621_c7_4478_iftrue,
t16_MUX_uxn_opcodes_h_l621_c7_4478_iffalse,
t16_MUX_uxn_opcodes_h_l621_c7_4478_return_output);

-- n16_MUX_uxn_opcodes_h_l621_c7_4478
n16_MUX_uxn_opcodes_h_l621_c7_4478 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l621_c7_4478_cond,
n16_MUX_uxn_opcodes_h_l621_c7_4478_iftrue,
n16_MUX_uxn_opcodes_h_l621_c7_4478_iffalse,
n16_MUX_uxn_opcodes_h_l621_c7_4478_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l624_c11_53ef
BIN_OP_EQ_uxn_opcodes_h_l624_c11_53ef : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l624_c11_53ef_left,
BIN_OP_EQ_uxn_opcodes_h_l624_c11_53ef_right,
BIN_OP_EQ_uxn_opcodes_h_l624_c11_53ef_return_output);

-- tmp16_MUX_uxn_opcodes_h_l624_c7_245f
tmp16_MUX_uxn_opcodes_h_l624_c7_245f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l624_c7_245f_cond,
tmp16_MUX_uxn_opcodes_h_l624_c7_245f_iftrue,
tmp16_MUX_uxn_opcodes_h_l624_c7_245f_iffalse,
tmp16_MUX_uxn_opcodes_h_l624_c7_245f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l624_c7_245f
result_is_stack_read_MUX_uxn_opcodes_h_l624_c7_245f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l624_c7_245f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l624_c7_245f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l624_c7_245f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l624_c7_245f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_245f
result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_245f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_245f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_245f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_245f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_245f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_245f
result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_245f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_245f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_245f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_245f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_245f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l624_c7_245f
result_is_stack_write_MUX_uxn_opcodes_h_l624_c7_245f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l624_c7_245f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l624_c7_245f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l624_c7_245f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l624_c7_245f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_245f
result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_245f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_245f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_245f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_245f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_245f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c7_245f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c7_245f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c7_245f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c7_245f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c7_245f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c7_245f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l624_c7_245f
result_stack_value_MUX_uxn_opcodes_h_l624_c7_245f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l624_c7_245f_cond,
result_stack_value_MUX_uxn_opcodes_h_l624_c7_245f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l624_c7_245f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l624_c7_245f_return_output);

-- t16_MUX_uxn_opcodes_h_l624_c7_245f
t16_MUX_uxn_opcodes_h_l624_c7_245f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l624_c7_245f_cond,
t16_MUX_uxn_opcodes_h_l624_c7_245f_iftrue,
t16_MUX_uxn_opcodes_h_l624_c7_245f_iffalse,
t16_MUX_uxn_opcodes_h_l624_c7_245f_return_output);

-- n16_MUX_uxn_opcodes_h_l624_c7_245f
n16_MUX_uxn_opcodes_h_l624_c7_245f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l624_c7_245f_cond,
n16_MUX_uxn_opcodes_h_l624_c7_245f_iftrue,
n16_MUX_uxn_opcodes_h_l624_c7_245f_iffalse,
n16_MUX_uxn_opcodes_h_l624_c7_245f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l629_c11_129f
BIN_OP_EQ_uxn_opcodes_h_l629_c11_129f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l629_c11_129f_left,
BIN_OP_EQ_uxn_opcodes_h_l629_c11_129f_right,
BIN_OP_EQ_uxn_opcodes_h_l629_c11_129f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l629_c7_a2af
tmp16_MUX_uxn_opcodes_h_l629_c7_a2af : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l629_c7_a2af_cond,
tmp16_MUX_uxn_opcodes_h_l629_c7_a2af_iftrue,
tmp16_MUX_uxn_opcodes_h_l629_c7_a2af_iffalse,
tmp16_MUX_uxn_opcodes_h_l629_c7_a2af_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l629_c7_a2af
result_is_stack_read_MUX_uxn_opcodes_h_l629_c7_a2af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l629_c7_a2af_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l629_c7_a2af_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l629_c7_a2af_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l629_c7_a2af_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_a2af
result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_a2af : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_a2af_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_a2af_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_a2af_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_a2af_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_a2af
result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_a2af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_a2af_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_a2af_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_a2af_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_a2af_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l629_c7_a2af
result_is_stack_write_MUX_uxn_opcodes_h_l629_c7_a2af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l629_c7_a2af_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l629_c7_a2af_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l629_c7_a2af_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l629_c7_a2af_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_a2af
result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_a2af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_a2af_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_a2af_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_a2af_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_a2af_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l629_c7_a2af
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l629_c7_a2af : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l629_c7_a2af_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l629_c7_a2af_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l629_c7_a2af_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l629_c7_a2af_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l629_c7_a2af
result_stack_value_MUX_uxn_opcodes_h_l629_c7_a2af : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l629_c7_a2af_cond,
result_stack_value_MUX_uxn_opcodes_h_l629_c7_a2af_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l629_c7_a2af_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l629_c7_a2af_return_output);

-- t16_MUX_uxn_opcodes_h_l629_c7_a2af
t16_MUX_uxn_opcodes_h_l629_c7_a2af : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l629_c7_a2af_cond,
t16_MUX_uxn_opcodes_h_l629_c7_a2af_iftrue,
t16_MUX_uxn_opcodes_h_l629_c7_a2af_iffalse,
t16_MUX_uxn_opcodes_h_l629_c7_a2af_return_output);

-- n16_MUX_uxn_opcodes_h_l629_c7_a2af
n16_MUX_uxn_opcodes_h_l629_c7_a2af : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l629_c7_a2af_cond,
n16_MUX_uxn_opcodes_h_l629_c7_a2af_iftrue,
n16_MUX_uxn_opcodes_h_l629_c7_a2af_iffalse,
n16_MUX_uxn_opcodes_h_l629_c7_a2af_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l632_c11_4ebf
BIN_OP_EQ_uxn_opcodes_h_l632_c11_4ebf : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l632_c11_4ebf_left,
BIN_OP_EQ_uxn_opcodes_h_l632_c11_4ebf_right,
BIN_OP_EQ_uxn_opcodes_h_l632_c11_4ebf_return_output);

-- tmp16_MUX_uxn_opcodes_h_l632_c7_b578
tmp16_MUX_uxn_opcodes_h_l632_c7_b578 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l632_c7_b578_cond,
tmp16_MUX_uxn_opcodes_h_l632_c7_b578_iftrue,
tmp16_MUX_uxn_opcodes_h_l632_c7_b578_iffalse,
tmp16_MUX_uxn_opcodes_h_l632_c7_b578_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l632_c7_b578
result_is_stack_read_MUX_uxn_opcodes_h_l632_c7_b578 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l632_c7_b578_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l632_c7_b578_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l632_c7_b578_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l632_c7_b578_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_b578
result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_b578 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_b578_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_b578_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_b578_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_b578_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_b578
result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_b578 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_b578_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_b578_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_b578_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_b578_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l632_c7_b578
result_is_stack_write_MUX_uxn_opcodes_h_l632_c7_b578 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l632_c7_b578_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l632_c7_b578_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l632_c7_b578_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l632_c7_b578_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_b578
result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_b578 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_b578_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_b578_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_b578_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_b578_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l632_c7_b578
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l632_c7_b578 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l632_c7_b578_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l632_c7_b578_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l632_c7_b578_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l632_c7_b578_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l632_c7_b578
result_stack_value_MUX_uxn_opcodes_h_l632_c7_b578 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l632_c7_b578_cond,
result_stack_value_MUX_uxn_opcodes_h_l632_c7_b578_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l632_c7_b578_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l632_c7_b578_return_output);

-- t16_MUX_uxn_opcodes_h_l632_c7_b578
t16_MUX_uxn_opcodes_h_l632_c7_b578 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l632_c7_b578_cond,
t16_MUX_uxn_opcodes_h_l632_c7_b578_iftrue,
t16_MUX_uxn_opcodes_h_l632_c7_b578_iffalse,
t16_MUX_uxn_opcodes_h_l632_c7_b578_return_output);

-- n16_MUX_uxn_opcodes_h_l632_c7_b578
n16_MUX_uxn_opcodes_h_l632_c7_b578 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l632_c7_b578_cond,
n16_MUX_uxn_opcodes_h_l632_c7_b578_iftrue,
n16_MUX_uxn_opcodes_h_l632_c7_b578_iffalse,
n16_MUX_uxn_opcodes_h_l632_c7_b578_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l633_c3_59d8
BIN_OP_OR_uxn_opcodes_h_l633_c3_59d8 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l633_c3_59d8_left,
BIN_OP_OR_uxn_opcodes_h_l633_c3_59d8_right,
BIN_OP_OR_uxn_opcodes_h_l633_c3_59d8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l636_c11_9bbc
BIN_OP_EQ_uxn_opcodes_h_l636_c11_9bbc : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l636_c11_9bbc_left,
BIN_OP_EQ_uxn_opcodes_h_l636_c11_9bbc_right,
BIN_OP_EQ_uxn_opcodes_h_l636_c11_9bbc_return_output);

-- tmp16_MUX_uxn_opcodes_h_l636_c7_8d3f
tmp16_MUX_uxn_opcodes_h_l636_c7_8d3f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l636_c7_8d3f_cond,
tmp16_MUX_uxn_opcodes_h_l636_c7_8d3f_iftrue,
tmp16_MUX_uxn_opcodes_h_l636_c7_8d3f_iffalse,
tmp16_MUX_uxn_opcodes_h_l636_c7_8d3f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l636_c7_8d3f
result_is_stack_read_MUX_uxn_opcodes_h_l636_c7_8d3f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l636_c7_8d3f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l636_c7_8d3f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l636_c7_8d3f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l636_c7_8d3f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_8d3f
result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_8d3f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_8d3f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_8d3f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_8d3f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_8d3f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_8d3f
result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_8d3f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_8d3f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_8d3f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_8d3f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_8d3f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l636_c7_8d3f
result_is_stack_write_MUX_uxn_opcodes_h_l636_c7_8d3f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l636_c7_8d3f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l636_c7_8d3f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l636_c7_8d3f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l636_c7_8d3f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_8d3f
result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_8d3f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_8d3f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_8d3f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_8d3f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_8d3f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l636_c7_8d3f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l636_c7_8d3f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l636_c7_8d3f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l636_c7_8d3f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l636_c7_8d3f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l636_c7_8d3f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l636_c7_8d3f
result_stack_value_MUX_uxn_opcodes_h_l636_c7_8d3f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l636_c7_8d3f_cond,
result_stack_value_MUX_uxn_opcodes_h_l636_c7_8d3f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l636_c7_8d3f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l636_c7_8d3f_return_output);

-- n16_MUX_uxn_opcodes_h_l636_c7_8d3f
n16_MUX_uxn_opcodes_h_l636_c7_8d3f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l636_c7_8d3f_cond,
n16_MUX_uxn_opcodes_h_l636_c7_8d3f_iftrue,
n16_MUX_uxn_opcodes_h_l636_c7_8d3f_iffalse,
n16_MUX_uxn_opcodes_h_l636_c7_8d3f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l639_c11_798a
BIN_OP_EQ_uxn_opcodes_h_l639_c11_798a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l639_c11_798a_left,
BIN_OP_EQ_uxn_opcodes_h_l639_c11_798a_right,
BIN_OP_EQ_uxn_opcodes_h_l639_c11_798a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l639_c7_520f
tmp16_MUX_uxn_opcodes_h_l639_c7_520f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l639_c7_520f_cond,
tmp16_MUX_uxn_opcodes_h_l639_c7_520f_iftrue,
tmp16_MUX_uxn_opcodes_h_l639_c7_520f_iffalse,
tmp16_MUX_uxn_opcodes_h_l639_c7_520f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l639_c7_520f
result_is_stack_read_MUX_uxn_opcodes_h_l639_c7_520f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l639_c7_520f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l639_c7_520f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l639_c7_520f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l639_c7_520f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_520f
result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_520f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_520f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_520f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_520f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_520f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_520f
result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_520f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_520f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_520f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_520f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_520f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l639_c7_520f
result_is_stack_write_MUX_uxn_opcodes_h_l639_c7_520f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l639_c7_520f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l639_c7_520f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l639_c7_520f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l639_c7_520f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_520f
result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_520f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_520f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_520f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_520f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_520f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l639_c7_520f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l639_c7_520f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l639_c7_520f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l639_c7_520f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l639_c7_520f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l639_c7_520f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l639_c7_520f
result_stack_value_MUX_uxn_opcodes_h_l639_c7_520f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l639_c7_520f_cond,
result_stack_value_MUX_uxn_opcodes_h_l639_c7_520f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l639_c7_520f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l639_c7_520f_return_output);

-- n16_MUX_uxn_opcodes_h_l639_c7_520f
n16_MUX_uxn_opcodes_h_l639_c7_520f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l639_c7_520f_cond,
n16_MUX_uxn_opcodes_h_l639_c7_520f_iftrue,
n16_MUX_uxn_opcodes_h_l639_c7_520f_iffalse,
n16_MUX_uxn_opcodes_h_l639_c7_520f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l644_c11_3689
BIN_OP_EQ_uxn_opcodes_h_l644_c11_3689 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l644_c11_3689_left,
BIN_OP_EQ_uxn_opcodes_h_l644_c11_3689_right,
BIN_OP_EQ_uxn_opcodes_h_l644_c11_3689_return_output);

-- tmp16_MUX_uxn_opcodes_h_l644_c7_ba21
tmp16_MUX_uxn_opcodes_h_l644_c7_ba21 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l644_c7_ba21_cond,
tmp16_MUX_uxn_opcodes_h_l644_c7_ba21_iftrue,
tmp16_MUX_uxn_opcodes_h_l644_c7_ba21_iffalse,
tmp16_MUX_uxn_opcodes_h_l644_c7_ba21_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l644_c7_ba21
result_is_stack_read_MUX_uxn_opcodes_h_l644_c7_ba21 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l644_c7_ba21_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l644_c7_ba21_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l644_c7_ba21_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l644_c7_ba21_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c7_ba21
result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c7_ba21 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c7_ba21_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c7_ba21_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c7_ba21_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c7_ba21_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l644_c7_ba21
result_is_opc_done_MUX_uxn_opcodes_h_l644_c7_ba21 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l644_c7_ba21_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l644_c7_ba21_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l644_c7_ba21_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l644_c7_ba21_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l644_c7_ba21
result_is_stack_write_MUX_uxn_opcodes_h_l644_c7_ba21 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l644_c7_ba21_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l644_c7_ba21_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l644_c7_ba21_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l644_c7_ba21_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l644_c7_ba21
result_is_sp_shift_MUX_uxn_opcodes_h_l644_c7_ba21 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l644_c7_ba21_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l644_c7_ba21_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l644_c7_ba21_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l644_c7_ba21_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c7_ba21
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c7_ba21 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c7_ba21_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c7_ba21_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c7_ba21_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c7_ba21_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l644_c7_ba21
result_stack_value_MUX_uxn_opcodes_h_l644_c7_ba21 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l644_c7_ba21_cond,
result_stack_value_MUX_uxn_opcodes_h_l644_c7_ba21_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l644_c7_ba21_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l644_c7_ba21_return_output);

-- n16_MUX_uxn_opcodes_h_l644_c7_ba21
n16_MUX_uxn_opcodes_h_l644_c7_ba21 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l644_c7_ba21_cond,
n16_MUX_uxn_opcodes_h_l644_c7_ba21_iftrue,
n16_MUX_uxn_opcodes_h_l644_c7_ba21_iffalse,
n16_MUX_uxn_opcodes_h_l644_c7_ba21_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l647_c11_7d51
BIN_OP_EQ_uxn_opcodes_h_l647_c11_7d51 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l647_c11_7d51_left,
BIN_OP_EQ_uxn_opcodes_h_l647_c11_7d51_right,
BIN_OP_EQ_uxn_opcodes_h_l647_c11_7d51_return_output);

-- tmp16_MUX_uxn_opcodes_h_l647_c7_761f
tmp16_MUX_uxn_opcodes_h_l647_c7_761f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l647_c7_761f_cond,
tmp16_MUX_uxn_opcodes_h_l647_c7_761f_iftrue,
tmp16_MUX_uxn_opcodes_h_l647_c7_761f_iffalse,
tmp16_MUX_uxn_opcodes_h_l647_c7_761f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l647_c7_761f
result_is_stack_read_MUX_uxn_opcodes_h_l647_c7_761f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l647_c7_761f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l647_c7_761f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l647_c7_761f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l647_c7_761f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c7_761f
result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c7_761f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c7_761f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c7_761f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c7_761f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c7_761f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l647_c7_761f
result_is_opc_done_MUX_uxn_opcodes_h_l647_c7_761f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l647_c7_761f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l647_c7_761f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l647_c7_761f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l647_c7_761f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l647_c7_761f
result_is_stack_write_MUX_uxn_opcodes_h_l647_c7_761f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l647_c7_761f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l647_c7_761f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l647_c7_761f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l647_c7_761f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l647_c7_761f
result_is_sp_shift_MUX_uxn_opcodes_h_l647_c7_761f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l647_c7_761f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l647_c7_761f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l647_c7_761f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l647_c7_761f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c7_761f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c7_761f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c7_761f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c7_761f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c7_761f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c7_761f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l647_c7_761f
result_stack_value_MUX_uxn_opcodes_h_l647_c7_761f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l647_c7_761f_cond,
result_stack_value_MUX_uxn_opcodes_h_l647_c7_761f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l647_c7_761f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l647_c7_761f_return_output);

-- n16_MUX_uxn_opcodes_h_l647_c7_761f
n16_MUX_uxn_opcodes_h_l647_c7_761f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l647_c7_761f_cond,
n16_MUX_uxn_opcodes_h_l647_c7_761f_iftrue,
n16_MUX_uxn_opcodes_h_l647_c7_761f_iffalse,
n16_MUX_uxn_opcodes_h_l647_c7_761f_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l648_c3_a1a1
BIN_OP_OR_uxn_opcodes_h_l648_c3_a1a1 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l648_c3_a1a1_left,
BIN_OP_OR_uxn_opcodes_h_l648_c3_a1a1_right,
BIN_OP_OR_uxn_opcodes_h_l648_c3_a1a1_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l649_c11_415f
BIN_OP_AND_uxn_opcodes_h_l649_c11_415f : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l649_c11_415f_left,
BIN_OP_AND_uxn_opcodes_h_l649_c11_415f_right,
BIN_OP_AND_uxn_opcodes_h_l649_c11_415f_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l652_c32_081b
BIN_OP_AND_uxn_opcodes_h_l652_c32_081b : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l652_c32_081b_left,
BIN_OP_AND_uxn_opcodes_h_l652_c32_081b_right,
BIN_OP_AND_uxn_opcodes_h_l652_c32_081b_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l652_c32_bffb
BIN_OP_GT_uxn_opcodes_h_l652_c32_bffb : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l652_c32_bffb_left,
BIN_OP_GT_uxn_opcodes_h_l652_c32_bffb_right,
BIN_OP_GT_uxn_opcodes_h_l652_c32_bffb_return_output);

-- MUX_uxn_opcodes_h_l652_c32_a709
MUX_uxn_opcodes_h_l652_c32_a709 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l652_c32_a709_cond,
MUX_uxn_opcodes_h_l652_c32_a709_iftrue,
MUX_uxn_opcodes_h_l652_c32_a709_iffalse,
MUX_uxn_opcodes_h_l652_c32_a709_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l654_c11_dc88
BIN_OP_EQ_uxn_opcodes_h_l654_c11_dc88 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l654_c11_dc88_left,
BIN_OP_EQ_uxn_opcodes_h_l654_c11_dc88_right,
BIN_OP_EQ_uxn_opcodes_h_l654_c11_dc88_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l654_c7_c4f6
result_is_stack_write_MUX_uxn_opcodes_h_l654_c7_c4f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l654_c7_c4f6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l654_c7_c4f6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l654_c7_c4f6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l654_c7_c4f6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l654_c7_c4f6
result_is_opc_done_MUX_uxn_opcodes_h_l654_c7_c4f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l654_c7_c4f6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l654_c7_c4f6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l654_c7_c4f6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l654_c7_c4f6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l654_c7_c4f6
result_is_sp_shift_MUX_uxn_opcodes_h_l654_c7_c4f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l654_c7_c4f6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l654_c7_c4f6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l654_c7_c4f6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l654_c7_c4f6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l654_c7_c4f6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l654_c7_c4f6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l654_c7_c4f6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l654_c7_c4f6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l654_c7_c4f6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l654_c7_c4f6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l654_c7_c4f6
result_stack_value_MUX_uxn_opcodes_h_l654_c7_c4f6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l654_c7_c4f6_cond,
result_stack_value_MUX_uxn_opcodes_h_l654_c7_c4f6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l654_c7_c4f6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l654_c7_c4f6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l660_c11_df20
BIN_OP_EQ_uxn_opcodes_h_l660_c11_df20 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l660_c11_df20_left,
BIN_OP_EQ_uxn_opcodes_h_l660_c11_df20_right,
BIN_OP_EQ_uxn_opcodes_h_l660_c11_df20_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l660_c7_5ffb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l660_c7_5ffb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l660_c7_5ffb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l660_c7_5ffb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l660_c7_5ffb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l660_c7_5ffb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l660_c7_5ffb
result_is_stack_write_MUX_uxn_opcodes_h_l660_c7_5ffb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l660_c7_5ffb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l660_c7_5ffb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l660_c7_5ffb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l660_c7_5ffb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_5ffb
result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_5ffb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_5ffb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_5ffb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_5ffb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_5ffb_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l660_c7_5ffb
result_stack_value_MUX_uxn_opcodes_h_l660_c7_5ffb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l660_c7_5ffb_cond,
result_stack_value_MUX_uxn_opcodes_h_l660_c7_5ffb_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l660_c7_5ffb_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l660_c7_5ffb_return_output);

-- CONST_SR_8_uxn_opcodes_h_l662_c34_4c09
CONST_SR_8_uxn_opcodes_h_l662_c34_4c09 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l662_c34_4c09_x,
CONST_SR_8_uxn_opcodes_h_l662_c34_4c09_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l664_c11_2249
BIN_OP_EQ_uxn_opcodes_h_l664_c11_2249 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l664_c11_2249_left,
BIN_OP_EQ_uxn_opcodes_h_l664_c11_2249_right,
BIN_OP_EQ_uxn_opcodes_h_l664_c11_2249_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l664_c7_baa8
result_is_stack_write_MUX_uxn_opcodes_h_l664_c7_baa8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l664_c7_baa8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l664_c7_baa8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l664_c7_baa8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l664_c7_baa8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l664_c7_baa8
result_is_opc_done_MUX_uxn_opcodes_h_l664_c7_baa8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l664_c7_baa8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l664_c7_baa8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l664_c7_baa8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l664_c7_baa8_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l626_l641_DUPLICATE_3c49
CONST_SL_8_uint16_t_uxn_opcodes_h_l626_l641_DUPLICATE_3c49 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l626_l641_DUPLICATE_3c49_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l626_l641_DUPLICATE_3c49_return_output);



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
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l615_c6_39c1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l615_c1_db0b_return_output,
 tmp16_MUX_uxn_opcodes_h_l615_c2_5499_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l615_c2_5499_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l615_c2_5499_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l615_c2_5499_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l615_c2_5499_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l615_c2_5499_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l615_c2_5499_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l615_c2_5499_return_output,
 t16_MUX_uxn_opcodes_h_l615_c2_5499_return_output,
 n16_MUX_uxn_opcodes_h_l615_c2_5499_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l621_c11_38d1_return_output,
 tmp16_MUX_uxn_opcodes_h_l621_c7_4478_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l621_c7_4478_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c7_4478_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_4478_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l621_c7_4478_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l621_c7_4478_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c7_4478_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l621_c7_4478_return_output,
 t16_MUX_uxn_opcodes_h_l621_c7_4478_return_output,
 n16_MUX_uxn_opcodes_h_l621_c7_4478_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l624_c11_53ef_return_output,
 tmp16_MUX_uxn_opcodes_h_l624_c7_245f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l624_c7_245f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_245f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_245f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l624_c7_245f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_245f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c7_245f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l624_c7_245f_return_output,
 t16_MUX_uxn_opcodes_h_l624_c7_245f_return_output,
 n16_MUX_uxn_opcodes_h_l624_c7_245f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l629_c11_129f_return_output,
 tmp16_MUX_uxn_opcodes_h_l629_c7_a2af_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l629_c7_a2af_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_a2af_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_a2af_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l629_c7_a2af_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_a2af_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l629_c7_a2af_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l629_c7_a2af_return_output,
 t16_MUX_uxn_opcodes_h_l629_c7_a2af_return_output,
 n16_MUX_uxn_opcodes_h_l629_c7_a2af_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l632_c11_4ebf_return_output,
 tmp16_MUX_uxn_opcodes_h_l632_c7_b578_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l632_c7_b578_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_b578_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_b578_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l632_c7_b578_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_b578_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l632_c7_b578_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l632_c7_b578_return_output,
 t16_MUX_uxn_opcodes_h_l632_c7_b578_return_output,
 n16_MUX_uxn_opcodes_h_l632_c7_b578_return_output,
 BIN_OP_OR_uxn_opcodes_h_l633_c3_59d8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l636_c11_9bbc_return_output,
 tmp16_MUX_uxn_opcodes_h_l636_c7_8d3f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l636_c7_8d3f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_8d3f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_8d3f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l636_c7_8d3f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_8d3f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l636_c7_8d3f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l636_c7_8d3f_return_output,
 n16_MUX_uxn_opcodes_h_l636_c7_8d3f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l639_c11_798a_return_output,
 tmp16_MUX_uxn_opcodes_h_l639_c7_520f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l639_c7_520f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_520f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_520f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l639_c7_520f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_520f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l639_c7_520f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l639_c7_520f_return_output,
 n16_MUX_uxn_opcodes_h_l639_c7_520f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l644_c11_3689_return_output,
 tmp16_MUX_uxn_opcodes_h_l644_c7_ba21_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l644_c7_ba21_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c7_ba21_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l644_c7_ba21_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l644_c7_ba21_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l644_c7_ba21_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c7_ba21_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l644_c7_ba21_return_output,
 n16_MUX_uxn_opcodes_h_l644_c7_ba21_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l647_c11_7d51_return_output,
 tmp16_MUX_uxn_opcodes_h_l647_c7_761f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l647_c7_761f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c7_761f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l647_c7_761f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l647_c7_761f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l647_c7_761f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c7_761f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l647_c7_761f_return_output,
 n16_MUX_uxn_opcodes_h_l647_c7_761f_return_output,
 BIN_OP_OR_uxn_opcodes_h_l648_c3_a1a1_return_output,
 BIN_OP_AND_uxn_opcodes_h_l649_c11_415f_return_output,
 BIN_OP_AND_uxn_opcodes_h_l652_c32_081b_return_output,
 BIN_OP_GT_uxn_opcodes_h_l652_c32_bffb_return_output,
 MUX_uxn_opcodes_h_l652_c32_a709_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l654_c11_dc88_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l654_c7_c4f6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l654_c7_c4f6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l654_c7_c4f6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l654_c7_c4f6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l654_c7_c4f6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l660_c11_df20_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l660_c7_5ffb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l660_c7_5ffb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_5ffb_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l660_c7_5ffb_return_output,
 CONST_SR_8_uxn_opcodes_h_l662_c34_4c09_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l664_c11_2249_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l664_c7_baa8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l664_c7_baa8_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l626_l641_DUPLICATE_3c49_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l615_c6_39c1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l615_c6_39c1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l615_c6_39c1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l615_c1_db0b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l615_c1_db0b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l615_c1_db0b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l615_c1_db0b_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l615_c2_5499_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l615_c2_5499_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l621_c7_4478_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l615_c2_5499_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l615_c2_5499_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l615_c2_5499_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l615_c2_5499_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l621_c7_4478_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l615_c2_5499_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l615_c2_5499_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l615_c2_5499_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l615_c2_5499_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c7_4478_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l615_c2_5499_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l615_c2_5499_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l615_c2_5499_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l615_c2_5499_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_4478_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l615_c2_5499_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l615_c2_5499_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l615_c2_5499_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l615_c2_5499_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l621_c7_4478_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l615_c2_5499_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l615_c2_5499_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l615_c2_5499_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l615_c2_5499_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l621_c7_4478_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l615_c2_5499_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l615_c2_5499_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l615_c2_5499_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l618_c3_c5b7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l615_c2_5499_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c7_4478_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l615_c2_5499_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l615_c2_5499_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l615_c2_5499_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l615_c2_5499_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l621_c7_4478_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l615_c2_5499_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l615_c2_5499_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l615_c2_5499_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l615_c2_5499_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l621_c7_4478_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l615_c2_5499_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l615_c2_5499_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l615_c2_5499_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l615_c2_5499_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l621_c7_4478_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l615_c2_5499_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l615_c2_5499_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l616_c3_8235_uxn_opcodes_h_l616_c3_8235_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_38d1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_38d1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_38d1_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l621_c7_4478_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l621_c7_4478_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l624_c7_245f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l621_c7_4478_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l621_c7_4478_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l621_c7_4478_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l624_c7_245f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l621_c7_4478_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c7_4478_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c7_4478_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_245f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c7_4478_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_4478_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_4478_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_245f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_4478_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l621_c7_4478_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l621_c7_4478_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l624_c7_245f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l621_c7_4478_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l621_c7_4478_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l621_c7_4478_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_245f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l621_c7_4478_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c7_4478_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l622_c3_eb77 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c7_4478_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c7_245f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c7_4478_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l621_c7_4478_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l621_c7_4478_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l624_c7_245f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l621_c7_4478_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l621_c7_4478_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l621_c7_4478_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l624_c7_245f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l621_c7_4478_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l621_c7_4478_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l621_c7_4478_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l624_c7_245f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l621_c7_4478_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c11_53ef_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c11_53ef_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c11_53ef_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l624_c7_245f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l624_c7_245f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l629_c7_a2af_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l624_c7_245f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l624_c7_245f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l624_c7_245f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l629_c7_a2af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l624_c7_245f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_245f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_245f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_a2af_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_245f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_245f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_245f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_a2af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_245f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l624_c7_245f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l624_c7_245f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l629_c7_a2af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l624_c7_245f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_245f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_245f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_a2af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_245f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c7_245f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l627_c3_e363 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c7_245f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l629_c7_a2af_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c7_245f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l624_c7_245f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l624_c7_245f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l629_c7_a2af_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l624_c7_245f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l624_c7_245f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l624_c7_245f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l629_c7_a2af_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l624_c7_245f_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l624_c7_245f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l624_c7_245f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l629_c7_a2af_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l624_c7_245f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_129f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_129f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_129f_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l629_c7_a2af_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l629_c7_a2af_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l632_c7_b578_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l629_c7_a2af_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l629_c7_a2af_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l629_c7_a2af_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l632_c7_b578_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l629_c7_a2af_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_a2af_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_a2af_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_b578_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_a2af_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_a2af_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_a2af_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_b578_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_a2af_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l629_c7_a2af_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l629_c7_a2af_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l632_c7_b578_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l629_c7_a2af_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_a2af_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_a2af_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_b578_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_a2af_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l629_c7_a2af_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l630_c3_0c7a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l629_c7_a2af_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l632_c7_b578_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l629_c7_a2af_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l629_c7_a2af_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l629_c7_a2af_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l632_c7_b578_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l629_c7_a2af_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l629_c7_a2af_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l629_c7_a2af_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l632_c7_b578_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l629_c7_a2af_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l629_c7_a2af_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l629_c7_a2af_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l632_c7_b578_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l629_c7_a2af_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c11_4ebf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c11_4ebf_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c11_4ebf_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l632_c7_b578_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l632_c7_b578_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l636_c7_8d3f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l632_c7_b578_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l632_c7_b578_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l632_c7_b578_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l636_c7_8d3f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l632_c7_b578_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_b578_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_b578_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_8d3f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_b578_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_b578_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_b578_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_8d3f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_b578_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l632_c7_b578_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l632_c7_b578_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l636_c7_8d3f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l632_c7_b578_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_b578_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_b578_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_8d3f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_b578_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l632_c7_b578_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l634_c3_6b4a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l632_c7_b578_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l636_c7_8d3f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l632_c7_b578_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l632_c7_b578_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l632_c7_b578_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l636_c7_8d3f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l632_c7_b578_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l632_c7_b578_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l632_c7_b578_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l632_c7_b578_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l632_c7_b578_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l632_c7_b578_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l636_c7_8d3f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l632_c7_b578_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l633_c3_59d8_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l633_c3_59d8_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l633_c3_59d8_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_9bbc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_9bbc_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_9bbc_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l636_c7_8d3f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l636_c7_8d3f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l639_c7_520f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l636_c7_8d3f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l636_c7_8d3f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l636_c7_8d3f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l639_c7_520f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l636_c7_8d3f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_8d3f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_8d3f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_520f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_8d3f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_8d3f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_8d3f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_520f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_8d3f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l636_c7_8d3f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l636_c7_8d3f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l639_c7_520f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l636_c7_8d3f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_8d3f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_8d3f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_520f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_8d3f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l636_c7_8d3f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l637_c3_b569 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l636_c7_8d3f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l639_c7_520f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l636_c7_8d3f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l636_c7_8d3f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l636_c7_8d3f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l639_c7_520f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l636_c7_8d3f_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l636_c7_8d3f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l636_c7_8d3f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l639_c7_520f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l636_c7_8d3f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_798a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_798a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_798a_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l639_c7_520f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l639_c7_520f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l644_c7_ba21_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l639_c7_520f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l639_c7_520f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l639_c7_520f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l644_c7_ba21_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l639_c7_520f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_520f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_520f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c7_ba21_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_520f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_520f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_520f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l644_c7_ba21_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_520f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l639_c7_520f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l639_c7_520f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l644_c7_ba21_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l639_c7_520f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_520f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_520f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l644_c7_ba21_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_520f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l639_c7_520f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l642_c3_bb6f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l639_c7_520f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c7_ba21_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l639_c7_520f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l639_c7_520f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l639_c7_520f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l644_c7_ba21_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l639_c7_520f_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l639_c7_520f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l639_c7_520f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l644_c7_ba21_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l639_c7_520f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c11_3689_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c11_3689_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c11_3689_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l644_c7_ba21_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l644_c7_ba21_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l647_c7_761f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l644_c7_ba21_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l644_c7_ba21_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l644_c7_ba21_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l647_c7_761f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l644_c7_ba21_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c7_ba21_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c7_ba21_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c7_761f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c7_ba21_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l644_c7_ba21_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l644_c7_ba21_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l647_c7_761f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l644_c7_ba21_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l644_c7_ba21_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l644_c7_ba21_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l647_c7_761f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l644_c7_ba21_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l644_c7_ba21_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l644_c7_ba21_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l647_c7_761f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l644_c7_ba21_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c7_ba21_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l645_c3_e185 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c7_ba21_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c7_761f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c7_ba21_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l644_c7_ba21_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l644_c7_ba21_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l647_c7_761f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l644_c7_ba21_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l644_c7_ba21_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l644_c7_ba21_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l647_c7_761f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l644_c7_ba21_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c11_7d51_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c11_7d51_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c11_7d51_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l647_c7_761f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l647_c7_761f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l647_c7_761f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l647_c7_761f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l647_c7_761f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l647_c7_761f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c7_761f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c7_761f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c7_761f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l647_c7_761f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l647_c7_761f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l654_c7_c4f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l647_c7_761f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l647_c7_761f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l647_c7_761f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l654_c7_c4f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l647_c7_761f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l647_c7_761f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l647_c7_761f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l654_c7_c4f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l647_c7_761f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c7_761f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c7_761f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l654_c7_c4f6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c7_761f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l647_c7_761f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l647_c7_761f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l654_c7_c4f6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l647_c7_761f_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l647_c7_761f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l647_c7_761f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l647_c7_761f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l648_c3_a1a1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l648_c3_a1a1_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l648_c3_a1a1_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l649_c11_415f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l649_c11_415f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l649_c11_415f_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l652_c32_a709_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l652_c32_a709_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l652_c32_a709_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l652_c32_081b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l652_c32_081b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l652_c32_081b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l652_c32_bffb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l652_c32_bffb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l652_c32_bffb_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l652_c32_a709_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l654_c11_dc88_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l654_c11_dc88_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l654_c11_dc88_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l654_c7_c4f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l654_c7_c4f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l660_c7_5ffb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l654_c7_c4f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l654_c7_c4f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l654_c7_c4f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_5ffb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l654_c7_c4f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l654_c7_c4f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l654_c7_c4f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l654_c7_c4f6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l654_c7_c4f6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l657_c3_5a62 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l654_c7_c4f6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l660_c7_5ffb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l654_c7_c4f6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l654_c7_c4f6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l654_c7_c4f6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l660_c7_5ffb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l654_c7_c4f6_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l658_c24_a295_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c11_df20_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c11_df20_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c11_df20_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l660_c7_5ffb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l661_c3_9250 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l660_c7_5ffb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l660_c7_5ffb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l660_c7_5ffb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l660_c7_5ffb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l664_c7_baa8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l660_c7_5ffb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_5ffb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_5ffb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l664_c7_baa8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_5ffb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l660_c7_5ffb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l660_c7_5ffb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l660_c7_5ffb_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l662_c34_4c09_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l662_c34_4c09_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l662_c24_88ac_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l664_c11_2249_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l664_c11_2249_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l664_c11_2249_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l664_c7_baa8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l664_c7_baa8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l664_c7_baa8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l664_c7_baa8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l664_c7_baa8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l664_c7_baa8_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l632_l629_l624_l647_l621_l644_l615_l639_l636_DUPLICATE_61c6_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l632_l660_l629_l624_l647_l621_l644_l615_l639_l636_l664_DUPLICATE_40a1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l632_l629_l654_l624_l621_l644_l615_l639_l636_DUPLICATE_aa8c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l632_l660_l629_l624_l647_l621_l644_l615_l639_l636_DUPLICATE_873f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l632_l629_l624_l647_l621_l644_l639_l636_DUPLICATE_20a2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l632_l660_l629_l654_l624_l647_l621_l644_l639_l636_l664_DUPLICATE_6836_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l625_l640_l648_l633_DUPLICATE_accd_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l626_l641_DUPLICATE_3c49_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l626_l641_DUPLICATE_3c49_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l660_l647_DUPLICATE_f3ad_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l611_l669_DUPLICATE_da74_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l634_c3_6b4a := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l632_c7_b578_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l634_c3_6b4a;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l657_c3_5a62 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l654_c7_c4f6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l657_c3_5a62;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_129f_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l622_c3_eb77 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c7_4478_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l622_c3_eb77;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l664_c7_baa8_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l637_c3_b569 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l636_c7_8d3f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l637_c3_b569;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l627_c3_e363 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c7_245f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l627_c3_e363;
     VAR_BIN_OP_AND_uxn_opcodes_h_l652_c32_081b_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_38d1_right := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l647_c7_761f_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l652_c32_a709_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c11_53ef_right := to_unsigned(2, 2);
     VAR_MUX_uxn_opcodes_h_l652_c32_a709_iffalse := resize(to_signed(-2, 3), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_798a_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l615_c6_39c1_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l618_c3_c5b7 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l615_c2_5499_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l618_c3_c5b7;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l647_c7_761f_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c11_4ebf_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c11_3689_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l645_c3_e185 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c7_ba21_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l645_c3_e185;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c11_df20_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c11_7d51_right := to_unsigned(8, 4);
     VAR_BIN_OP_GT_uxn_opcodes_h_l652_c32_bffb_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l664_c7_baa8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l654_c11_dc88_right := to_unsigned(9, 4);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l615_c2_5499_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l664_c11_2249_right := to_unsigned(11, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_9bbc_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l615_c2_5499_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l654_c7_c4f6_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l630_c3_0c7a := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l629_c7_a2af_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l630_c3_0c7a;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l615_c1_db0b_iffalse := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l654_c7_c4f6_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l642_c3_bb6f := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l639_c7_520f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l642_c3_bb6f;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l661_c3_9250 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l660_c7_5ffb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l661_c3_9250;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l615_c1_db0b_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l652_c32_081b_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l648_c3_a1a1_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l615_c2_5499_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l621_c7_4478_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l624_c7_245f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l629_c7_a2af_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l632_c7_b578_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l636_c7_8d3f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l644_c7_ba21_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l647_c7_761f_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l615_c6_39c1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_38d1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c11_53ef_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_129f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c11_4ebf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_9bbc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_798a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c11_3689_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c11_7d51_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l654_c11_dc88_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c11_df20_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l664_c11_2249_left := VAR_phase;
     VAR_BIN_OP_AND_uxn_opcodes_h_l649_c11_415f_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l633_c3_59d8_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l615_c2_5499_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l621_c7_4478_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l629_c7_a2af_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l632_c7_b578_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l662_c34_4c09_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l615_c2_5499_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l621_c7_4478_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l624_c7_245f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l629_c7_a2af_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l632_c7_b578_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l636_c7_8d3f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l639_c7_520f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l644_c7_ba21_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l647_c7_761f_iffalse := tmp16;
     -- CONST_SR_8[uxn_opcodes_h_l662_c34_4c09] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l662_c34_4c09_x <= VAR_CONST_SR_8_uxn_opcodes_h_l662_c34_4c09_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l662_c34_4c09_return_output := CONST_SR_8_uxn_opcodes_h_l662_c34_4c09_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l652_c32_081b] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l652_c32_081b_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l652_c32_081b_left;
     BIN_OP_AND_uxn_opcodes_h_l652_c32_081b_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l652_c32_081b_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l652_c32_081b_return_output := BIN_OP_AND_uxn_opcodes_h_l652_c32_081b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l647_c11_7d51] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l647_c11_7d51_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c11_7d51_left;
     BIN_OP_EQ_uxn_opcodes_h_l647_c11_7d51_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c11_7d51_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c11_7d51_return_output := BIN_OP_EQ_uxn_opcodes_h_l647_c11_7d51_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l621_c11_38d1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l621_c11_38d1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_38d1_left;
     BIN_OP_EQ_uxn_opcodes_h_l621_c11_38d1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_38d1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_38d1_return_output := BIN_OP_EQ_uxn_opcodes_h_l621_c11_38d1_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l632_l660_l629_l624_l647_l621_l644_l615_l639_l636_l664_DUPLICATE_40a1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l632_l660_l629_l624_l647_l621_l644_l615_l639_l636_l664_DUPLICATE_40a1_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l632_l629_l624_l647_l621_l644_l639_l636_DUPLICATE_20a2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l632_l629_l624_l647_l621_l644_l639_l636_DUPLICATE_20a2_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l624_c11_53ef] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l624_c11_53ef_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c11_53ef_left;
     BIN_OP_EQ_uxn_opcodes_h_l624_c11_53ef_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c11_53ef_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c11_53ef_return_output := BIN_OP_EQ_uxn_opcodes_h_l624_c11_53ef_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l658_c24_a295] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l658_c24_a295_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- BIN_OP_EQ[uxn_opcodes_h_l629_c11_129f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l629_c11_129f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_129f_left;
     BIN_OP_EQ_uxn_opcodes_h_l629_c11_129f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_129f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_129f_return_output := BIN_OP_EQ_uxn_opcodes_h_l629_c11_129f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l636_c11_9bbc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l636_c11_9bbc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_9bbc_left;
     BIN_OP_EQ_uxn_opcodes_h_l636_c11_9bbc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_9bbc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_9bbc_return_output := BIN_OP_EQ_uxn_opcodes_h_l636_c11_9bbc_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l660_l647_DUPLICATE_f3ad LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l660_l647_DUPLICATE_f3ad_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l632_l660_l629_l624_l647_l621_l644_l615_l639_l636_DUPLICATE_873f LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l632_l660_l629_l624_l647_l621_l644_l615_l639_l636_DUPLICATE_873f_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l632_c11_4ebf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l632_c11_4ebf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c11_4ebf_left;
     BIN_OP_EQ_uxn_opcodes_h_l632_c11_4ebf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c11_4ebf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c11_4ebf_return_output := BIN_OP_EQ_uxn_opcodes_h_l632_c11_4ebf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l615_c6_39c1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l615_c6_39c1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l615_c6_39c1_left;
     BIN_OP_EQ_uxn_opcodes_h_l615_c6_39c1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l615_c6_39c1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l615_c6_39c1_return_output := BIN_OP_EQ_uxn_opcodes_h_l615_c6_39c1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l654_c11_dc88] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l654_c11_dc88_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l654_c11_dc88_left;
     BIN_OP_EQ_uxn_opcodes_h_l654_c11_dc88_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l654_c11_dc88_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l654_c11_dc88_return_output := BIN_OP_EQ_uxn_opcodes_h_l654_c11_dc88_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l632_l660_l629_l654_l624_l647_l621_l644_l639_l636_l664_DUPLICATE_6836 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l632_l660_l629_l654_l624_l647_l621_l644_l639_l636_l664_DUPLICATE_6836_return_output := result.is_opc_done;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l632_l629_l624_l647_l621_l644_l615_l639_l636_DUPLICATE_61c6 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l632_l629_l624_l647_l621_l644_l615_l639_l636_DUPLICATE_61c6_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l639_c11_798a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l639_c11_798a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_798a_left;
     BIN_OP_EQ_uxn_opcodes_h_l639_c11_798a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_798a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_798a_return_output := BIN_OP_EQ_uxn_opcodes_h_l639_c11_798a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l664_c11_2249] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l664_c11_2249_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l664_c11_2249_left;
     BIN_OP_EQ_uxn_opcodes_h_l664_c11_2249_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l664_c11_2249_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l664_c11_2249_return_output := BIN_OP_EQ_uxn_opcodes_h_l664_c11_2249_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l632_l629_l654_l624_l621_l644_l615_l639_l636_DUPLICATE_aa8c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l632_l629_l654_l624_l621_l644_l615_l639_l636_DUPLICATE_aa8c_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l644_c11_3689] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l644_c11_3689_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c11_3689_left;
     BIN_OP_EQ_uxn_opcodes_h_l644_c11_3689_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c11_3689_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c11_3689_return_output := BIN_OP_EQ_uxn_opcodes_h_l644_c11_3689_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l660_c11_df20] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l660_c11_df20_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c11_df20_left;
     BIN_OP_EQ_uxn_opcodes_h_l660_c11_df20_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c11_df20_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c11_df20_return_output := BIN_OP_EQ_uxn_opcodes_h_l660_c11_df20_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l625_l640_l648_l633_DUPLICATE_accd LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l625_l640_l648_l633_DUPLICATE_accd_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l652_c32_bffb_left := VAR_BIN_OP_AND_uxn_opcodes_h_l652_c32_081b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l615_c1_db0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l615_c6_39c1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l615_c2_5499_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l615_c6_39c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l615_c2_5499_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l615_c6_39c1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l615_c2_5499_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l615_c6_39c1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l615_c2_5499_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l615_c6_39c1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l615_c2_5499_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l615_c6_39c1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l615_c2_5499_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l615_c6_39c1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l615_c2_5499_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l615_c6_39c1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l615_c2_5499_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l615_c6_39c1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l615_c2_5499_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l615_c6_39c1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l615_c2_5499_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l615_c6_39c1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l621_c7_4478_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_38d1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_4478_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_38d1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l621_c7_4478_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_38d1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l621_c7_4478_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_38d1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l621_c7_4478_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_38d1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c7_4478_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_38d1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c7_4478_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_38d1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l621_c7_4478_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_38d1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l621_c7_4478_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_38d1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l621_c7_4478_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_38d1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l624_c7_245f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c11_53ef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_245f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c11_53ef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_245f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c11_53ef_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l624_c7_245f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c11_53ef_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l624_c7_245f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c11_53ef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_245f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c11_53ef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c7_245f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c11_53ef_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l624_c7_245f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c11_53ef_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l624_c7_245f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c11_53ef_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l624_c7_245f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c11_53ef_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l629_c7_a2af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_129f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_a2af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_129f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_a2af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_129f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l629_c7_a2af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_129f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l629_c7_a2af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_129f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_a2af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_129f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l629_c7_a2af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_129f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l629_c7_a2af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_129f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l629_c7_a2af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_129f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l629_c7_a2af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_129f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l632_c7_b578_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c11_4ebf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_b578_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c11_4ebf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_b578_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c11_4ebf_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l632_c7_b578_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c11_4ebf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l632_c7_b578_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c11_4ebf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_b578_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c11_4ebf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l632_c7_b578_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c11_4ebf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l632_c7_b578_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c11_4ebf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l632_c7_b578_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c11_4ebf_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l632_c7_b578_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c11_4ebf_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l636_c7_8d3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_9bbc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_8d3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_9bbc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_8d3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_9bbc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l636_c7_8d3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_9bbc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l636_c7_8d3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_9bbc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_8d3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_9bbc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l636_c7_8d3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_9bbc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l636_c7_8d3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_9bbc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l636_c7_8d3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_9bbc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l639_c7_520f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_798a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_520f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_798a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_520f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_798a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l639_c7_520f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_798a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l639_c7_520f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_798a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_520f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_798a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l639_c7_520f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_798a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l639_c7_520f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_798a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l639_c7_520f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_798a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l644_c7_ba21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c11_3689_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l644_c7_ba21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c11_3689_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l644_c7_ba21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c11_3689_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l644_c7_ba21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c11_3689_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l644_c7_ba21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c11_3689_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c7_ba21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c11_3689_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c7_ba21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c11_3689_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l644_c7_ba21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c11_3689_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l644_c7_ba21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c11_3689_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l647_c7_761f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c11_7d51_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l647_c7_761f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c11_7d51_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l647_c7_761f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c11_7d51_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l647_c7_761f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c11_7d51_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l647_c7_761f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c11_7d51_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c7_761f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c11_7d51_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c7_761f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c11_7d51_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l647_c7_761f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c11_7d51_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l647_c7_761f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c11_7d51_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l654_c7_c4f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l654_c11_dc88_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l654_c7_c4f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l654_c11_dc88_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l654_c7_c4f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l654_c11_dc88_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l654_c7_c4f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l654_c11_dc88_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l654_c7_c4f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l654_c11_dc88_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_5ffb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c11_df20_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l660_c7_5ffb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c11_df20_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l660_c7_5ffb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c11_df20_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l660_c7_5ffb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c11_df20_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l664_c7_baa8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l664_c11_2249_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l664_c7_baa8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l664_c11_2249_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l633_c3_59d8_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l625_l640_l648_l633_DUPLICATE_accd_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l648_c3_a1a1_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l625_l640_l648_l633_DUPLICATE_accd_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l626_l641_DUPLICATE_3c49_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l625_l640_l648_l633_DUPLICATE_accd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l654_c7_c4f6_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l658_c24_a295_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l615_c2_5499_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l632_l629_l624_l647_l621_l644_l615_l639_l636_DUPLICATE_61c6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c7_4478_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l632_l629_l624_l647_l621_l644_l615_l639_l636_DUPLICATE_61c6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_245f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l632_l629_l624_l647_l621_l644_l615_l639_l636_DUPLICATE_61c6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_a2af_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l632_l629_l624_l647_l621_l644_l615_l639_l636_DUPLICATE_61c6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_b578_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l632_l629_l624_l647_l621_l644_l615_l639_l636_DUPLICATE_61c6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_8d3f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l632_l629_l624_l647_l621_l644_l615_l639_l636_DUPLICATE_61c6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_520f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l632_l629_l624_l647_l621_l644_l615_l639_l636_DUPLICATE_61c6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c7_ba21_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l632_l629_l624_l647_l621_l644_l615_l639_l636_DUPLICATE_61c6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c7_761f_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l632_l629_l624_l647_l621_l644_l615_l639_l636_DUPLICATE_61c6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_4478_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l632_l660_l629_l654_l624_l647_l621_l644_l639_l636_l664_DUPLICATE_6836_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_245f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l632_l660_l629_l654_l624_l647_l621_l644_l639_l636_l664_DUPLICATE_6836_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_a2af_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l632_l660_l629_l654_l624_l647_l621_l644_l639_l636_l664_DUPLICATE_6836_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_b578_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l632_l660_l629_l654_l624_l647_l621_l644_l639_l636_l664_DUPLICATE_6836_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_8d3f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l632_l660_l629_l654_l624_l647_l621_l644_l639_l636_l664_DUPLICATE_6836_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_520f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l632_l660_l629_l654_l624_l647_l621_l644_l639_l636_l664_DUPLICATE_6836_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l644_c7_ba21_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l632_l660_l629_l654_l624_l647_l621_l644_l639_l636_l664_DUPLICATE_6836_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l647_c7_761f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l632_l660_l629_l654_l624_l647_l621_l644_l639_l636_l664_DUPLICATE_6836_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l654_c7_c4f6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l632_l660_l629_l654_l624_l647_l621_l644_l639_l636_l664_DUPLICATE_6836_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_5ffb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l632_l660_l629_l654_l624_l647_l621_l644_l639_l636_l664_DUPLICATE_6836_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l664_c7_baa8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l632_l660_l629_l654_l624_l647_l621_l644_l639_l636_l664_DUPLICATE_6836_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l615_c2_5499_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l632_l629_l654_l624_l621_l644_l615_l639_l636_DUPLICATE_aa8c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l621_c7_4478_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l632_l629_l654_l624_l621_l644_l615_l639_l636_DUPLICATE_aa8c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_245f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l632_l629_l654_l624_l621_l644_l615_l639_l636_DUPLICATE_aa8c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_a2af_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l632_l629_l654_l624_l621_l644_l615_l639_l636_DUPLICATE_aa8c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_b578_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l632_l629_l654_l624_l621_l644_l615_l639_l636_DUPLICATE_aa8c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_8d3f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l632_l629_l654_l624_l621_l644_l615_l639_l636_DUPLICATE_aa8c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_520f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l632_l629_l654_l624_l621_l644_l615_l639_l636_DUPLICATE_aa8c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l644_c7_ba21_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l632_l629_l654_l624_l621_l644_l615_l639_l636_DUPLICATE_aa8c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l654_c7_c4f6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l632_l629_l654_l624_l621_l644_l615_l639_l636_DUPLICATE_aa8c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l621_c7_4478_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l632_l629_l624_l647_l621_l644_l639_l636_DUPLICATE_20a2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l624_c7_245f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l632_l629_l624_l647_l621_l644_l639_l636_DUPLICATE_20a2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l629_c7_a2af_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l632_l629_l624_l647_l621_l644_l639_l636_DUPLICATE_20a2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l632_c7_b578_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l632_l629_l624_l647_l621_l644_l639_l636_DUPLICATE_20a2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l636_c7_8d3f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l632_l629_l624_l647_l621_l644_l639_l636_DUPLICATE_20a2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l639_c7_520f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l632_l629_l624_l647_l621_l644_l639_l636_DUPLICATE_20a2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l644_c7_ba21_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l632_l629_l624_l647_l621_l644_l639_l636_DUPLICATE_20a2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l647_c7_761f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l632_l629_l624_l647_l621_l644_l639_l636_DUPLICATE_20a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l615_c2_5499_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l632_l660_l629_l624_l647_l621_l644_l615_l639_l636_l664_DUPLICATE_40a1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l621_c7_4478_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l632_l660_l629_l624_l647_l621_l644_l615_l639_l636_l664_DUPLICATE_40a1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l624_c7_245f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l632_l660_l629_l624_l647_l621_l644_l615_l639_l636_l664_DUPLICATE_40a1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l629_c7_a2af_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l632_l660_l629_l624_l647_l621_l644_l615_l639_l636_l664_DUPLICATE_40a1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l632_c7_b578_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l632_l660_l629_l624_l647_l621_l644_l615_l639_l636_l664_DUPLICATE_40a1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l636_c7_8d3f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l632_l660_l629_l624_l647_l621_l644_l615_l639_l636_l664_DUPLICATE_40a1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l639_c7_520f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l632_l660_l629_l624_l647_l621_l644_l615_l639_l636_l664_DUPLICATE_40a1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l644_c7_ba21_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l632_l660_l629_l624_l647_l621_l644_l615_l639_l636_l664_DUPLICATE_40a1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l647_c7_761f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l632_l660_l629_l624_l647_l621_l644_l615_l639_l636_l664_DUPLICATE_40a1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l660_c7_5ffb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l632_l660_l629_l624_l647_l621_l644_l615_l639_l636_l664_DUPLICATE_40a1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l664_c7_baa8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l632_l660_l629_l624_l647_l621_l644_l615_l639_l636_l664_DUPLICATE_40a1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c7_761f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l660_l647_DUPLICATE_f3ad_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l660_c7_5ffb_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l660_l647_DUPLICATE_f3ad_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l615_c2_5499_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l632_l660_l629_l624_l647_l621_l644_l615_l639_l636_DUPLICATE_873f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l621_c7_4478_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l632_l660_l629_l624_l647_l621_l644_l615_l639_l636_DUPLICATE_873f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l624_c7_245f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l632_l660_l629_l624_l647_l621_l644_l615_l639_l636_DUPLICATE_873f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l629_c7_a2af_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l632_l660_l629_l624_l647_l621_l644_l615_l639_l636_DUPLICATE_873f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l632_c7_b578_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l632_l660_l629_l624_l647_l621_l644_l615_l639_l636_DUPLICATE_873f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l636_c7_8d3f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l632_l660_l629_l624_l647_l621_l644_l615_l639_l636_DUPLICATE_873f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l639_c7_520f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l632_l660_l629_l624_l647_l621_l644_l615_l639_l636_DUPLICATE_873f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l644_c7_ba21_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l632_l660_l629_l624_l647_l621_l644_l615_l639_l636_DUPLICATE_873f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l647_c7_761f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l632_l660_l629_l624_l647_l621_l644_l615_l639_l636_DUPLICATE_873f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l660_c7_5ffb_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l632_l660_l629_l624_l647_l621_l644_l615_l639_l636_DUPLICATE_873f_return_output;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l662_c24_88ac] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l662_c24_88ac_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l662_c34_4c09_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l633_c3_59d8] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l633_c3_59d8_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l633_c3_59d8_left;
     BIN_OP_OR_uxn_opcodes_h_l633_c3_59d8_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l633_c3_59d8_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l633_c3_59d8_return_output := BIN_OP_OR_uxn_opcodes_h_l633_c3_59d8_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l647_c7_761f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l647_c7_761f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l647_c7_761f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l647_c7_761f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l647_c7_761f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l647_c7_761f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l647_c7_761f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l647_c7_761f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l647_c7_761f_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l626_l641_DUPLICATE_3c49 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l626_l641_DUPLICATE_3c49_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l626_l641_DUPLICATE_3c49_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l626_l641_DUPLICATE_3c49_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l626_l641_DUPLICATE_3c49_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l615_c1_db0b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l615_c1_db0b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l615_c1_db0b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l615_c1_db0b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l615_c1_db0b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l615_c1_db0b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l615_c1_db0b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l615_c1_db0b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l615_c1_db0b_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l652_c32_bffb] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l652_c32_bffb_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l652_c32_bffb_left;
     BIN_OP_GT_uxn_opcodes_h_l652_c32_bffb_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l652_c32_bffb_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l652_c32_bffb_return_output := BIN_OP_GT_uxn_opcodes_h_l652_c32_bffb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l664_c7_baa8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l664_c7_baa8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l664_c7_baa8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l664_c7_baa8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l664_c7_baa8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l664_c7_baa8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l664_c7_baa8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l664_c7_baa8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l664_c7_baa8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l654_c7_c4f6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l654_c7_c4f6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l654_c7_c4f6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l654_c7_c4f6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l654_c7_c4f6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l654_c7_c4f6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l654_c7_c4f6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l654_c7_c4f6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l654_c7_c4f6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l660_c7_5ffb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l660_c7_5ffb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l660_c7_5ffb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l660_c7_5ffb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l660_c7_5ffb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l660_c7_5ffb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l660_c7_5ffb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l660_c7_5ffb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l660_c7_5ffb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l664_c7_baa8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l664_c7_baa8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l664_c7_baa8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l664_c7_baa8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l664_c7_baa8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l664_c7_baa8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l664_c7_baa8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l664_c7_baa8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l664_c7_baa8_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l648_c3_a1a1] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l648_c3_a1a1_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l648_c3_a1a1_left;
     BIN_OP_OR_uxn_opcodes_h_l648_c3_a1a1_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l648_c3_a1a1_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l648_c3_a1a1_return_output := BIN_OP_OR_uxn_opcodes_h_l648_c3_a1a1_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l652_c32_a709_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l652_c32_bffb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l632_c7_b578_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l633_c3_59d8_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l649_c11_415f_right := VAR_BIN_OP_OR_uxn_opcodes_h_l648_c3_a1a1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l647_c7_761f_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l648_c3_a1a1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l660_c7_5ffb_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l662_c24_88ac_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l639_c7_520f_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l626_l641_DUPLICATE_3c49_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l624_c7_245f_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l626_l641_DUPLICATE_3c49_return_output;
     VAR_printf_uxn_opcodes_h_l616_c3_8235_uxn_opcodes_h_l616_c3_8235_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l615_c1_db0b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_5ffb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l664_c7_baa8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l647_c7_761f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l654_c7_c4f6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l644_c7_ba21_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l647_c7_761f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l660_c7_5ffb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l664_c7_baa8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l654_c7_c4f6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l660_c7_5ffb_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l647_c7_761f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l647_c7_761f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l647_c7_761f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l647_c7_761f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l647_c7_761f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l647_c7_761f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l647_c7_761f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l647_c7_761f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l647_c7_761f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l660_c7_5ffb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_5ffb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_5ffb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_5ffb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_5ffb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_5ffb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_5ffb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_5ffb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_5ffb_return_output;

     -- t16_MUX[uxn_opcodes_h_l632_c7_b578] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l632_c7_b578_cond <= VAR_t16_MUX_uxn_opcodes_h_l632_c7_b578_cond;
     t16_MUX_uxn_opcodes_h_l632_c7_b578_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l632_c7_b578_iftrue;
     t16_MUX_uxn_opcodes_h_l632_c7_b578_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l632_c7_b578_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l632_c7_b578_return_output := t16_MUX_uxn_opcodes_h_l632_c7_b578_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l660_c7_5ffb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l660_c7_5ffb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l660_c7_5ffb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l660_c7_5ffb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l660_c7_5ffb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l660_c7_5ffb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l660_c7_5ffb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l660_c7_5ffb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l660_c7_5ffb_return_output;

     -- printf_uxn_opcodes_h_l616_c3_8235[uxn_opcodes_h_l616_c3_8235] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l616_c3_8235_uxn_opcodes_h_l616_c3_8235_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l616_c3_8235_uxn_opcodes_h_l616_c3_8235_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- BIN_OP_AND[uxn_opcodes_h_l649_c11_415f] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l649_c11_415f_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l649_c11_415f_left;
     BIN_OP_AND_uxn_opcodes_h_l649_c11_415f_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l649_c11_415f_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l649_c11_415f_return_output := BIN_OP_AND_uxn_opcodes_h_l649_c11_415f_return_output;

     -- MUX[uxn_opcodes_h_l652_c32_a709] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l652_c32_a709_cond <= VAR_MUX_uxn_opcodes_h_l652_c32_a709_cond;
     MUX_uxn_opcodes_h_l652_c32_a709_iftrue <= VAR_MUX_uxn_opcodes_h_l652_c32_a709_iftrue;
     MUX_uxn_opcodes_h_l652_c32_a709_iffalse <= VAR_MUX_uxn_opcodes_h_l652_c32_a709_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l652_c32_a709_return_output := MUX_uxn_opcodes_h_l652_c32_a709_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l660_c7_5ffb] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l660_c7_5ffb_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l660_c7_5ffb_cond;
     result_stack_value_MUX_uxn_opcodes_h_l660_c7_5ffb_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l660_c7_5ffb_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l660_c7_5ffb_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l660_c7_5ffb_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l660_c7_5ffb_return_output := result_stack_value_MUX_uxn_opcodes_h_l660_c7_5ffb_return_output;

     -- n16_MUX[uxn_opcodes_h_l647_c7_761f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l647_c7_761f_cond <= VAR_n16_MUX_uxn_opcodes_h_l647_c7_761f_cond;
     n16_MUX_uxn_opcodes_h_l647_c7_761f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l647_c7_761f_iftrue;
     n16_MUX_uxn_opcodes_h_l647_c7_761f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l647_c7_761f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l647_c7_761f_return_output := n16_MUX_uxn_opcodes_h_l647_c7_761f_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l644_c7_ba21] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l644_c7_ba21_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l644_c7_ba21_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l644_c7_ba21_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l644_c7_ba21_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l644_c7_ba21_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l644_c7_ba21_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l644_c7_ba21_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l644_c7_ba21_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l654_c7_c4f6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l654_c7_c4f6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l654_c7_c4f6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l654_c7_c4f6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l654_c7_c4f6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l654_c7_c4f6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l654_c7_c4f6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l654_c7_c4f6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l654_c7_c4f6_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l647_c7_761f_iftrue := VAR_BIN_OP_AND_uxn_opcodes_h_l649_c11_415f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c7_761f_iftrue := VAR_MUX_uxn_opcodes_h_l652_c32_a709_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l644_c7_ba21_iffalse := VAR_n16_MUX_uxn_opcodes_h_l647_c7_761f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l654_c7_c4f6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_5ffb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l644_c7_ba21_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l647_c7_761f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l639_c7_520f_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l644_c7_ba21_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l654_c7_c4f6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l660_c7_5ffb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c7_761f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l654_c7_c4f6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l654_c7_c4f6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l660_c7_5ffb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l629_c7_a2af_iffalse := VAR_t16_MUX_uxn_opcodes_h_l632_c7_b578_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l647_c7_761f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c7_761f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c7_761f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c7_761f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c7_761f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c7_761f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c7_761f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c7_761f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c7_761f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l654_c7_c4f6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l654_c7_c4f6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l654_c7_c4f6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l654_c7_c4f6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l654_c7_c4f6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l654_c7_c4f6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l654_c7_c4f6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l654_c7_c4f6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l654_c7_c4f6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l647_c7_761f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c7_761f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c7_761f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c7_761f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c7_761f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c7_761f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c7_761f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c7_761f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c7_761f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l647_c7_761f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l647_c7_761f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l647_c7_761f_cond;
     tmp16_MUX_uxn_opcodes_h_l647_c7_761f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l647_c7_761f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l647_c7_761f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l647_c7_761f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l647_c7_761f_return_output := tmp16_MUX_uxn_opcodes_h_l647_c7_761f_return_output;

     -- t16_MUX[uxn_opcodes_h_l629_c7_a2af] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l629_c7_a2af_cond <= VAR_t16_MUX_uxn_opcodes_h_l629_c7_a2af_cond;
     t16_MUX_uxn_opcodes_h_l629_c7_a2af_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l629_c7_a2af_iftrue;
     t16_MUX_uxn_opcodes_h_l629_c7_a2af_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l629_c7_a2af_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l629_c7_a2af_return_output := t16_MUX_uxn_opcodes_h_l629_c7_a2af_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l654_c7_c4f6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l654_c7_c4f6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l654_c7_c4f6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l654_c7_c4f6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l654_c7_c4f6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l654_c7_c4f6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l654_c7_c4f6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l654_c7_c4f6_return_output := result_stack_value_MUX_uxn_opcodes_h_l654_c7_c4f6_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l639_c7_520f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l639_c7_520f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l639_c7_520f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l639_c7_520f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l639_c7_520f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l639_c7_520f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l639_c7_520f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l639_c7_520f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l639_c7_520f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l654_c7_c4f6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l654_c7_c4f6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l654_c7_c4f6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l654_c7_c4f6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l654_c7_c4f6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l654_c7_c4f6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l654_c7_c4f6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l654_c7_c4f6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l654_c7_c4f6_return_output;

     -- n16_MUX[uxn_opcodes_h_l644_c7_ba21] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l644_c7_ba21_cond <= VAR_n16_MUX_uxn_opcodes_h_l644_c7_ba21_cond;
     n16_MUX_uxn_opcodes_h_l644_c7_ba21_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l644_c7_ba21_iftrue;
     n16_MUX_uxn_opcodes_h_l644_c7_ba21_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l644_c7_ba21_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l644_c7_ba21_return_output := n16_MUX_uxn_opcodes_h_l644_c7_ba21_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l644_c7_ba21] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l644_c7_ba21_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l644_c7_ba21_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l644_c7_ba21_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l644_c7_ba21_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l644_c7_ba21_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l644_c7_ba21_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l644_c7_ba21_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l644_c7_ba21_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l639_c7_520f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l644_c7_ba21_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l647_c7_761f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l654_c7_c4f6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_520f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l644_c7_ba21_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l636_c7_8d3f_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l639_c7_520f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l647_c7_761f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l654_c7_c4f6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c7_ba21_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c7_761f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c7_ba21_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c7_761f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l647_c7_761f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l654_c7_c4f6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l624_c7_245f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l629_c7_a2af_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l644_c7_ba21_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l647_c7_761f_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l644_c7_ba21] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c7_ba21_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c7_ba21_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c7_ba21_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c7_ba21_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c7_ba21_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c7_ba21_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c7_ba21_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c7_ba21_return_output;

     -- t16_MUX[uxn_opcodes_h_l624_c7_245f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l624_c7_245f_cond <= VAR_t16_MUX_uxn_opcodes_h_l624_c7_245f_cond;
     t16_MUX_uxn_opcodes_h_l624_c7_245f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l624_c7_245f_iftrue;
     t16_MUX_uxn_opcodes_h_l624_c7_245f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l624_c7_245f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l624_c7_245f_return_output := t16_MUX_uxn_opcodes_h_l624_c7_245f_return_output;

     -- n16_MUX[uxn_opcodes_h_l639_c7_520f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l639_c7_520f_cond <= VAR_n16_MUX_uxn_opcodes_h_l639_c7_520f_cond;
     n16_MUX_uxn_opcodes_h_l639_c7_520f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l639_c7_520f_iftrue;
     n16_MUX_uxn_opcodes_h_l639_c7_520f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l639_c7_520f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l639_c7_520f_return_output := n16_MUX_uxn_opcodes_h_l639_c7_520f_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l636_c7_8d3f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l636_c7_8d3f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l636_c7_8d3f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l636_c7_8d3f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l636_c7_8d3f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l636_c7_8d3f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l636_c7_8d3f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l636_c7_8d3f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l636_c7_8d3f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l639_c7_520f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_520f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_520f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_520f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_520f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_520f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_520f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_520f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_520f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l644_c7_ba21] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c7_ba21_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c7_ba21_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c7_ba21_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c7_ba21_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c7_ba21_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c7_ba21_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c7_ba21_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c7_ba21_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l647_c7_761f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l647_c7_761f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l647_c7_761f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l647_c7_761f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l647_c7_761f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l647_c7_761f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l647_c7_761f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l647_c7_761f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l647_c7_761f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l644_c7_ba21] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l644_c7_ba21_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l644_c7_ba21_cond;
     tmp16_MUX_uxn_opcodes_h_l644_c7_ba21_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l644_c7_ba21_iftrue;
     tmp16_MUX_uxn_opcodes_h_l644_c7_ba21_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l644_c7_ba21_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l644_c7_ba21_return_output := tmp16_MUX_uxn_opcodes_h_l644_c7_ba21_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l647_c7_761f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l647_c7_761f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l647_c7_761f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l647_c7_761f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l647_c7_761f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l647_c7_761f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l647_c7_761f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l647_c7_761f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l647_c7_761f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l647_c7_761f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l647_c7_761f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l647_c7_761f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l647_c7_761f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l647_c7_761f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l647_c7_761f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l647_c7_761f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l647_c7_761f_return_output := result_stack_value_MUX_uxn_opcodes_h_l647_c7_761f_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l636_c7_8d3f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l639_c7_520f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l644_c7_ba21_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l647_c7_761f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_8d3f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_520f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l632_c7_b578_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l636_c7_8d3f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l644_c7_ba21_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l647_c7_761f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_520f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c7_ba21_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l639_c7_520f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c7_ba21_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l644_c7_ba21_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l647_c7_761f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l621_c7_4478_iffalse := VAR_t16_MUX_uxn_opcodes_h_l624_c7_245f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l639_c7_520f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l644_c7_ba21_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l632_c7_b578] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l632_c7_b578_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l632_c7_b578_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l632_c7_b578_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l632_c7_b578_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l632_c7_b578_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l632_c7_b578_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l632_c7_b578_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l632_c7_b578_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l639_c7_520f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l639_c7_520f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l639_c7_520f_cond;
     tmp16_MUX_uxn_opcodes_h_l639_c7_520f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l639_c7_520f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l639_c7_520f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l639_c7_520f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l639_c7_520f_return_output := tmp16_MUX_uxn_opcodes_h_l639_c7_520f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l644_c7_ba21] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l644_c7_ba21_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l644_c7_ba21_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l644_c7_ba21_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l644_c7_ba21_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l644_c7_ba21_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l644_c7_ba21_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l644_c7_ba21_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l644_c7_ba21_return_output;

     -- n16_MUX[uxn_opcodes_h_l636_c7_8d3f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l636_c7_8d3f_cond <= VAR_n16_MUX_uxn_opcodes_h_l636_c7_8d3f_cond;
     n16_MUX_uxn_opcodes_h_l636_c7_8d3f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l636_c7_8d3f_iftrue;
     n16_MUX_uxn_opcodes_h_l636_c7_8d3f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l636_c7_8d3f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l636_c7_8d3f_return_output := n16_MUX_uxn_opcodes_h_l636_c7_8d3f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l639_c7_520f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l639_c7_520f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l639_c7_520f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l639_c7_520f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l639_c7_520f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l639_c7_520f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l639_c7_520f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l639_c7_520f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l639_c7_520f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l639_c7_520f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_520f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_520f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_520f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_520f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_520f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_520f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_520f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_520f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l644_c7_ba21] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l644_c7_ba21_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l644_c7_ba21_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l644_c7_ba21_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l644_c7_ba21_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l644_c7_ba21_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l644_c7_ba21_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l644_c7_ba21_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l644_c7_ba21_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l636_c7_8d3f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_8d3f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_8d3f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_8d3f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_8d3f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_8d3f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_8d3f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_8d3f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_8d3f_return_output;

     -- t16_MUX[uxn_opcodes_h_l621_c7_4478] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l621_c7_4478_cond <= VAR_t16_MUX_uxn_opcodes_h_l621_c7_4478_cond;
     t16_MUX_uxn_opcodes_h_l621_c7_4478_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l621_c7_4478_iftrue;
     t16_MUX_uxn_opcodes_h_l621_c7_4478_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l621_c7_4478_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l621_c7_4478_return_output := t16_MUX_uxn_opcodes_h_l621_c7_4478_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l644_c7_ba21] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l644_c7_ba21_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l644_c7_ba21_cond;
     result_stack_value_MUX_uxn_opcodes_h_l644_c7_ba21_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l644_c7_ba21_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l644_c7_ba21_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l644_c7_ba21_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l644_c7_ba21_return_output := result_stack_value_MUX_uxn_opcodes_h_l644_c7_ba21_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l632_c7_b578_iffalse := VAR_n16_MUX_uxn_opcodes_h_l636_c7_8d3f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_520f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l644_c7_ba21_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_b578_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_8d3f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l629_c7_a2af_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l632_c7_b578_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l639_c7_520f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l644_c7_ba21_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_8d3f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_520f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l636_c7_8d3f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l639_c7_520f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l639_c7_520f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l644_c7_ba21_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l615_c2_5499_iffalse := VAR_t16_MUX_uxn_opcodes_h_l621_c7_4478_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l636_c7_8d3f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l639_c7_520f_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l639_c7_520f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l639_c7_520f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l639_c7_520f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l639_c7_520f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l639_c7_520f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l639_c7_520f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l639_c7_520f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l639_c7_520f_return_output := result_stack_value_MUX_uxn_opcodes_h_l639_c7_520f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l632_c7_b578] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_b578_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_b578_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_b578_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_b578_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_b578_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_b578_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_b578_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_b578_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l636_c7_8d3f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l636_c7_8d3f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l636_c7_8d3f_cond;
     tmp16_MUX_uxn_opcodes_h_l636_c7_8d3f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l636_c7_8d3f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l636_c7_8d3f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l636_c7_8d3f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l636_c7_8d3f_return_output := tmp16_MUX_uxn_opcodes_h_l636_c7_8d3f_return_output;

     -- n16_MUX[uxn_opcodes_h_l632_c7_b578] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l632_c7_b578_cond <= VAR_n16_MUX_uxn_opcodes_h_l632_c7_b578_cond;
     n16_MUX_uxn_opcodes_h_l632_c7_b578_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l632_c7_b578_iftrue;
     n16_MUX_uxn_opcodes_h_l632_c7_b578_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l632_c7_b578_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l632_c7_b578_return_output := n16_MUX_uxn_opcodes_h_l632_c7_b578_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l636_c7_8d3f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_8d3f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_8d3f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_8d3f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_8d3f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_8d3f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_8d3f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_8d3f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_8d3f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l636_c7_8d3f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l636_c7_8d3f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l636_c7_8d3f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l636_c7_8d3f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l636_c7_8d3f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l636_c7_8d3f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l636_c7_8d3f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l636_c7_8d3f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l636_c7_8d3f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l639_c7_520f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_520f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_520f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_520f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_520f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_520f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_520f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_520f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_520f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l639_c7_520f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l639_c7_520f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l639_c7_520f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l639_c7_520f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l639_c7_520f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l639_c7_520f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l639_c7_520f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l639_c7_520f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l639_c7_520f_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l629_c7_a2af] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l629_c7_a2af_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l629_c7_a2af_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l629_c7_a2af_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l629_c7_a2af_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l629_c7_a2af_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l629_c7_a2af_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l629_c7_a2af_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l629_c7_a2af_return_output;

     -- t16_MUX[uxn_opcodes_h_l615_c2_5499] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l615_c2_5499_cond <= VAR_t16_MUX_uxn_opcodes_h_l615_c2_5499_cond;
     t16_MUX_uxn_opcodes_h_l615_c2_5499_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l615_c2_5499_iftrue;
     t16_MUX_uxn_opcodes_h_l615_c2_5499_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l615_c2_5499_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l615_c2_5499_return_output := t16_MUX_uxn_opcodes_h_l615_c2_5499_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l629_c7_a2af_iffalse := VAR_n16_MUX_uxn_opcodes_h_l632_c7_b578_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_8d3f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_520f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_a2af_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_b578_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l624_c7_245f_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l629_c7_a2af_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l636_c7_8d3f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l639_c7_520f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_b578_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_8d3f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l632_c7_b578_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l636_c7_8d3f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l636_c7_8d3f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l639_c7_520f_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l615_c2_5499_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l632_c7_b578_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l636_c7_8d3f_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l636_c7_8d3f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l636_c7_8d3f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l636_c7_8d3f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l636_c7_8d3f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l636_c7_8d3f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l636_c7_8d3f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l636_c7_8d3f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l636_c7_8d3f_return_output := result_stack_value_MUX_uxn_opcodes_h_l636_c7_8d3f_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l624_c7_245f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l624_c7_245f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l624_c7_245f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l624_c7_245f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l624_c7_245f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l624_c7_245f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l624_c7_245f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l624_c7_245f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l624_c7_245f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l632_c7_b578] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l632_c7_b578_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l632_c7_b578_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l632_c7_b578_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l632_c7_b578_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l632_c7_b578_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l632_c7_b578_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l632_c7_b578_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l632_c7_b578_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l636_c7_8d3f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l636_c7_8d3f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l636_c7_8d3f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l636_c7_8d3f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l636_c7_8d3f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l636_c7_8d3f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l636_c7_8d3f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l636_c7_8d3f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l636_c7_8d3f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l636_c7_8d3f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_8d3f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_8d3f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_8d3f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_8d3f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_8d3f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_8d3f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_8d3f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_8d3f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l632_c7_b578] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_b578_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_b578_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_b578_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_b578_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_b578_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_b578_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_b578_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_b578_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l632_c7_b578] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l632_c7_b578_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l632_c7_b578_cond;
     tmp16_MUX_uxn_opcodes_h_l632_c7_b578_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l632_c7_b578_iftrue;
     tmp16_MUX_uxn_opcodes_h_l632_c7_b578_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l632_c7_b578_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l632_c7_b578_return_output := tmp16_MUX_uxn_opcodes_h_l632_c7_b578_return_output;

     -- n16_MUX[uxn_opcodes_h_l629_c7_a2af] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l629_c7_a2af_cond <= VAR_n16_MUX_uxn_opcodes_h_l629_c7_a2af_cond;
     n16_MUX_uxn_opcodes_h_l629_c7_a2af_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l629_c7_a2af_iftrue;
     n16_MUX_uxn_opcodes_h_l629_c7_a2af_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l629_c7_a2af_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l629_c7_a2af_return_output := n16_MUX_uxn_opcodes_h_l629_c7_a2af_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l629_c7_a2af] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_a2af_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_a2af_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_a2af_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_a2af_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_a2af_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_a2af_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_a2af_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_a2af_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l624_c7_245f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l629_c7_a2af_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_b578_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_8d3f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_245f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_a2af_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l621_c7_4478_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l624_c7_245f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l632_c7_b578_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l636_c7_8d3f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_a2af_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_b578_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l629_c7_a2af_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l632_c7_b578_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l632_c7_b578_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l636_c7_8d3f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l629_c7_a2af_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l632_c7_b578_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l624_c7_245f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_245f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_245f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_245f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_245f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_245f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_245f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_245f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_245f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l629_c7_a2af] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l629_c7_a2af_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l629_c7_a2af_cond;
     tmp16_MUX_uxn_opcodes_h_l629_c7_a2af_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l629_c7_a2af_iftrue;
     tmp16_MUX_uxn_opcodes_h_l629_c7_a2af_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l629_c7_a2af_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l629_c7_a2af_return_output := tmp16_MUX_uxn_opcodes_h_l629_c7_a2af_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l621_c7_4478] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l621_c7_4478_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l621_c7_4478_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l621_c7_4478_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l621_c7_4478_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l621_c7_4478_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l621_c7_4478_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l621_c7_4478_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l621_c7_4478_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l632_c7_b578] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l632_c7_b578_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l632_c7_b578_cond;
     result_stack_value_MUX_uxn_opcodes_h_l632_c7_b578_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l632_c7_b578_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l632_c7_b578_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l632_c7_b578_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l632_c7_b578_return_output := result_stack_value_MUX_uxn_opcodes_h_l632_c7_b578_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l629_c7_a2af] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l629_c7_a2af_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l629_c7_a2af_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l629_c7_a2af_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l629_c7_a2af_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l629_c7_a2af_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l629_c7_a2af_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l629_c7_a2af_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l629_c7_a2af_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l632_c7_b578] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_b578_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_b578_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_b578_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_b578_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_b578_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_b578_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_b578_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_b578_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l629_c7_a2af] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_a2af_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_a2af_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_a2af_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_a2af_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_a2af_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_a2af_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_a2af_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_a2af_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l632_c7_b578] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l632_c7_b578_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l632_c7_b578_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l632_c7_b578_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l632_c7_b578_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l632_c7_b578_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l632_c7_b578_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l632_c7_b578_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l632_c7_b578_return_output;

     -- n16_MUX[uxn_opcodes_h_l624_c7_245f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l624_c7_245f_cond <= VAR_n16_MUX_uxn_opcodes_h_l624_c7_245f_cond;
     n16_MUX_uxn_opcodes_h_l624_c7_245f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l624_c7_245f_iftrue;
     n16_MUX_uxn_opcodes_h_l624_c7_245f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l624_c7_245f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l624_c7_245f_return_output := n16_MUX_uxn_opcodes_h_l624_c7_245f_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l621_c7_4478_iffalse := VAR_n16_MUX_uxn_opcodes_h_l624_c7_245f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_a2af_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_b578_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l621_c7_4478_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_245f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l615_c2_5499_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l621_c7_4478_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l629_c7_a2af_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l632_c7_b578_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_245f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_a2af_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c7_245f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l629_c7_a2af_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l629_c7_a2af_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l632_c7_b578_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l624_c7_245f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l629_c7_a2af_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l629_c7_a2af] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_a2af_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_a2af_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_a2af_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_a2af_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_a2af_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_a2af_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_a2af_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_a2af_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l629_c7_a2af] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l629_c7_a2af_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l629_c7_a2af_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l629_c7_a2af_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l629_c7_a2af_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l629_c7_a2af_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l629_c7_a2af_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l629_c7_a2af_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l629_c7_a2af_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l624_c7_245f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c7_245f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c7_245f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c7_245f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c7_245f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c7_245f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c7_245f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c7_245f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c7_245f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l629_c7_a2af] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l629_c7_a2af_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l629_c7_a2af_cond;
     result_stack_value_MUX_uxn_opcodes_h_l629_c7_a2af_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l629_c7_a2af_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l629_c7_a2af_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l629_c7_a2af_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l629_c7_a2af_return_output := result_stack_value_MUX_uxn_opcodes_h_l629_c7_a2af_return_output;

     -- n16_MUX[uxn_opcodes_h_l621_c7_4478] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l621_c7_4478_cond <= VAR_n16_MUX_uxn_opcodes_h_l621_c7_4478_cond;
     n16_MUX_uxn_opcodes_h_l621_c7_4478_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l621_c7_4478_iftrue;
     n16_MUX_uxn_opcodes_h_l621_c7_4478_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l621_c7_4478_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l621_c7_4478_return_output := n16_MUX_uxn_opcodes_h_l621_c7_4478_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l624_c7_245f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_245f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_245f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_245f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_245f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_245f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_245f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_245f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_245f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l621_c7_4478] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l621_c7_4478_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l621_c7_4478_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l621_c7_4478_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l621_c7_4478_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l621_c7_4478_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l621_c7_4478_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l621_c7_4478_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l621_c7_4478_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l615_c2_5499] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l615_c2_5499_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l615_c2_5499_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l615_c2_5499_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l615_c2_5499_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l615_c2_5499_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l615_c2_5499_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l615_c2_5499_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l615_c2_5499_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l624_c7_245f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l624_c7_245f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l624_c7_245f_cond;
     tmp16_MUX_uxn_opcodes_h_l624_c7_245f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l624_c7_245f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l624_c7_245f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l624_c7_245f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l624_c7_245f_return_output := tmp16_MUX_uxn_opcodes_h_l624_c7_245f_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l615_c2_5499_iffalse := VAR_n16_MUX_uxn_opcodes_h_l621_c7_4478_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_245f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_a2af_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l615_c2_5499_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l621_c7_4478_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l624_c7_245f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l629_c7_a2af_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c7_4478_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_245f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c7_4478_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c7_245f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l624_c7_245f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l629_c7_a2af_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l621_c7_4478_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l624_c7_245f_return_output;
     -- n16_MUX[uxn_opcodes_h_l615_c2_5499] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l615_c2_5499_cond <= VAR_n16_MUX_uxn_opcodes_h_l615_c2_5499_cond;
     n16_MUX_uxn_opcodes_h_l615_c2_5499_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l615_c2_5499_iftrue;
     n16_MUX_uxn_opcodes_h_l615_c2_5499_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l615_c2_5499_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l615_c2_5499_return_output := n16_MUX_uxn_opcodes_h_l615_c2_5499_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l624_c7_245f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_245f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_245f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_245f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_245f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_245f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_245f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_245f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_245f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l621_c7_4478] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c7_4478_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c7_4478_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c7_4478_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c7_4478_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c7_4478_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c7_4478_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c7_4478_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c7_4478_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l621_c7_4478] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l621_c7_4478_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l621_c7_4478_cond;
     tmp16_MUX_uxn_opcodes_h_l621_c7_4478_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l621_c7_4478_iftrue;
     tmp16_MUX_uxn_opcodes_h_l621_c7_4478_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l621_c7_4478_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l621_c7_4478_return_output := tmp16_MUX_uxn_opcodes_h_l621_c7_4478_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l624_c7_245f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l624_c7_245f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l624_c7_245f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l624_c7_245f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l624_c7_245f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l624_c7_245f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l624_c7_245f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l624_c7_245f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l624_c7_245f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l615_c2_5499] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l615_c2_5499_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l615_c2_5499_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l615_c2_5499_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l615_c2_5499_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l615_c2_5499_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l615_c2_5499_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l615_c2_5499_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l615_c2_5499_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l621_c7_4478] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c7_4478_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c7_4478_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c7_4478_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c7_4478_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c7_4478_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c7_4478_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c7_4478_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c7_4478_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l624_c7_245f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l624_c7_245f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l624_c7_245f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l624_c7_245f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l624_c7_245f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l624_c7_245f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l624_c7_245f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l624_c7_245f_return_output := result_stack_value_MUX_uxn_opcodes_h_l624_c7_245f_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l615_c2_5499_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_4478_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_245f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l621_c7_4478_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l624_c7_245f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l615_c2_5499_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c7_4478_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l615_c2_5499_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c7_4478_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l621_c7_4478_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l624_c7_245f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l615_c2_5499_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l621_c7_4478_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l615_c2_5499] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l615_c2_5499_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l615_c2_5499_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l615_c2_5499_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l615_c2_5499_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l615_c2_5499_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l615_c2_5499_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l615_c2_5499_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l615_c2_5499_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l621_c7_4478] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l621_c7_4478_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l621_c7_4478_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l621_c7_4478_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l621_c7_4478_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l621_c7_4478_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l621_c7_4478_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l621_c7_4478_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l621_c7_4478_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l615_c2_5499] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l615_c2_5499_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l615_c2_5499_cond;
     tmp16_MUX_uxn_opcodes_h_l615_c2_5499_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l615_c2_5499_iftrue;
     tmp16_MUX_uxn_opcodes_h_l615_c2_5499_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l615_c2_5499_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l615_c2_5499_return_output := tmp16_MUX_uxn_opcodes_h_l615_c2_5499_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l621_c7_4478] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l621_c7_4478_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l621_c7_4478_cond;
     result_stack_value_MUX_uxn_opcodes_h_l621_c7_4478_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l621_c7_4478_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l621_c7_4478_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l621_c7_4478_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l621_c7_4478_return_output := result_stack_value_MUX_uxn_opcodes_h_l621_c7_4478_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l615_c2_5499] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l615_c2_5499_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l615_c2_5499_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l615_c2_5499_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l615_c2_5499_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l615_c2_5499_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l615_c2_5499_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l615_c2_5499_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l615_c2_5499_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l621_c7_4478] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_4478_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_4478_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_4478_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_4478_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_4478_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_4478_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_4478_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_4478_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l615_c2_5499_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_4478_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l615_c2_5499_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l621_c7_4478_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l615_c2_5499_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l621_c7_4478_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l615_c2_5499_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l615_c2_5499] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l615_c2_5499_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l615_c2_5499_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l615_c2_5499_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l615_c2_5499_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l615_c2_5499_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l615_c2_5499_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l615_c2_5499_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l615_c2_5499_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l615_c2_5499] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l615_c2_5499_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l615_c2_5499_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l615_c2_5499_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l615_c2_5499_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l615_c2_5499_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l615_c2_5499_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l615_c2_5499_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l615_c2_5499_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l615_c2_5499] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l615_c2_5499_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l615_c2_5499_cond;
     result_stack_value_MUX_uxn_opcodes_h_l615_c2_5499_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l615_c2_5499_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l615_c2_5499_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l615_c2_5499_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l615_c2_5499_return_output := result_stack_value_MUX_uxn_opcodes_h_l615_c2_5499_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l611_l669_DUPLICATE_da74 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l611_l669_DUPLICATE_da74_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_28d7(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l615_c2_5499_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l615_c2_5499_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l615_c2_5499_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l615_c2_5499_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l615_c2_5499_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l615_c2_5499_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l615_c2_5499_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l611_l669_DUPLICATE_da74_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l611_l669_DUPLICATE_da74_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
