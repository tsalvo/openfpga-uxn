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
-- Submodules: 68
entity ovr_0CLK_67fe881f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ovr_0CLK_67fe881f;
architecture arch of ovr_0CLK_67fe881f is
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
-- BIN_OP_EQ[uxn_opcodes_h_l302_c6_56c1]
signal BIN_OP_EQ_uxn_opcodes_h_l302_c6_56c1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l302_c6_56c1_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l302_c6_56c1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l302_c1_bb37]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l302_c1_bb37_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l302_c1_bb37_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l302_c1_bb37_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l302_c1_bb37_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l302_c2_4d2f]
signal n8_MUX_uxn_opcodes_h_l302_c2_4d2f_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l302_c2_4d2f_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l302_c2_4d2f_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l302_c2_4d2f_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l302_c2_4d2f]
signal t8_MUX_uxn_opcodes_h_l302_c2_4d2f_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l302_c2_4d2f_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l302_c2_4d2f_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l302_c2_4d2f_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l302_c2_4d2f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l302_c2_4d2f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l302_c2_4d2f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l302_c2_4d2f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l302_c2_4d2f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l302_c2_4d2f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l302_c2_4d2f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l302_c2_4d2f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l302_c2_4d2f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l302_c2_4d2f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l302_c2_4d2f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c2_4d2f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c2_4d2f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c2_4d2f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c2_4d2f_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l302_c2_4d2f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l302_c2_4d2f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l302_c2_4d2f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l302_c2_4d2f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l302_c2_4d2f_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l302_c2_4d2f]
signal result_stack_value_MUX_uxn_opcodes_h_l302_c2_4d2f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l302_c2_4d2f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l302_c2_4d2f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l302_c2_4d2f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l302_c2_4d2f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l302_c2_4d2f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l302_c2_4d2f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l302_c2_4d2f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l302_c2_4d2f_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l303_c3_1937[uxn_opcodes_h_l303_c3_1937]
signal printf_uxn_opcodes_h_l303_c3_1937_uxn_opcodes_h_l303_c3_1937_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l307_c11_5d2e]
signal BIN_OP_EQ_uxn_opcodes_h_l307_c11_5d2e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l307_c11_5d2e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l307_c11_5d2e_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l307_c7_1487]
signal n8_MUX_uxn_opcodes_h_l307_c7_1487_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l307_c7_1487_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l307_c7_1487_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l307_c7_1487_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l307_c7_1487]
signal t8_MUX_uxn_opcodes_h_l307_c7_1487_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l307_c7_1487_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l307_c7_1487_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l307_c7_1487_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l307_c7_1487]
signal result_is_stack_write_MUX_uxn_opcodes_h_l307_c7_1487_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l307_c7_1487_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l307_c7_1487_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l307_c7_1487_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l307_c7_1487]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l307_c7_1487_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l307_c7_1487_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l307_c7_1487_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l307_c7_1487_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l307_c7_1487]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l307_c7_1487_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l307_c7_1487_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l307_c7_1487_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l307_c7_1487_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l307_c7_1487]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l307_c7_1487_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l307_c7_1487_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l307_c7_1487_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l307_c7_1487_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l307_c7_1487]
signal result_stack_value_MUX_uxn_opcodes_h_l307_c7_1487_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l307_c7_1487_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l307_c7_1487_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l307_c7_1487_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l307_c7_1487]
signal result_is_opc_done_MUX_uxn_opcodes_h_l307_c7_1487_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l307_c7_1487_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l307_c7_1487_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l307_c7_1487_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l310_c11_64bf]
signal BIN_OP_EQ_uxn_opcodes_h_l310_c11_64bf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l310_c11_64bf_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l310_c11_64bf_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l310_c7_c0e0]
signal n8_MUX_uxn_opcodes_h_l310_c7_c0e0_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l310_c7_c0e0_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l310_c7_c0e0_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l310_c7_c0e0_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l310_c7_c0e0]
signal t8_MUX_uxn_opcodes_h_l310_c7_c0e0_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l310_c7_c0e0_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l310_c7_c0e0_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l310_c7_c0e0_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l310_c7_c0e0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l310_c7_c0e0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l310_c7_c0e0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l310_c7_c0e0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l310_c7_c0e0_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l310_c7_c0e0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l310_c7_c0e0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l310_c7_c0e0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l310_c7_c0e0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l310_c7_c0e0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l310_c7_c0e0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l310_c7_c0e0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l310_c7_c0e0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l310_c7_c0e0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l310_c7_c0e0_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l310_c7_c0e0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l310_c7_c0e0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l310_c7_c0e0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l310_c7_c0e0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l310_c7_c0e0_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l310_c7_c0e0]
signal result_stack_value_MUX_uxn_opcodes_h_l310_c7_c0e0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l310_c7_c0e0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l310_c7_c0e0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l310_c7_c0e0_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l310_c7_c0e0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l310_c7_c0e0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l310_c7_c0e0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l310_c7_c0e0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l310_c7_c0e0_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l314_c11_8914]
signal BIN_OP_EQ_uxn_opcodes_h_l314_c11_8914_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l314_c11_8914_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l314_c11_8914_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l314_c7_beb8]
signal n8_MUX_uxn_opcodes_h_l314_c7_beb8_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l314_c7_beb8_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l314_c7_beb8_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l314_c7_beb8_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l314_c7_beb8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_beb8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_beb8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_beb8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_beb8_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l314_c7_beb8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l314_c7_beb8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l314_c7_beb8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l314_c7_beb8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l314_c7_beb8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l314_c7_beb8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_beb8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_beb8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_beb8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_beb8_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l314_c7_beb8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l314_c7_beb8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l314_c7_beb8_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l314_c7_beb8_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l314_c7_beb8_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l314_c7_beb8]
signal result_stack_value_MUX_uxn_opcodes_h_l314_c7_beb8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l314_c7_beb8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l314_c7_beb8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l314_c7_beb8_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l314_c7_beb8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_beb8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_beb8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_beb8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_beb8_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l317_c11_2a7d]
signal BIN_OP_EQ_uxn_opcodes_h_l317_c11_2a7d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l317_c11_2a7d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l317_c11_2a7d_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l317_c7_6e03]
signal n8_MUX_uxn_opcodes_h_l317_c7_6e03_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l317_c7_6e03_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l317_c7_6e03_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l317_c7_6e03_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l317_c7_6e03]
signal result_is_stack_write_MUX_uxn_opcodes_h_l317_c7_6e03_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l317_c7_6e03_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l317_c7_6e03_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l317_c7_6e03_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l317_c7_6e03]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l317_c7_6e03_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l317_c7_6e03_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l317_c7_6e03_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l317_c7_6e03_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l317_c7_6e03]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l317_c7_6e03_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l317_c7_6e03_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l317_c7_6e03_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l317_c7_6e03_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l317_c7_6e03]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l317_c7_6e03_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l317_c7_6e03_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l317_c7_6e03_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l317_c7_6e03_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l317_c7_6e03]
signal result_stack_value_MUX_uxn_opcodes_h_l317_c7_6e03_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l317_c7_6e03_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l317_c7_6e03_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l317_c7_6e03_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l317_c7_6e03]
signal result_is_opc_done_MUX_uxn_opcodes_h_l317_c7_6e03_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l317_c7_6e03_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l317_c7_6e03_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l317_c7_6e03_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l320_c32_007c]
signal BIN_OP_AND_uxn_opcodes_h_l320_c32_007c_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l320_c32_007c_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l320_c32_007c_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l320_c32_6074]
signal BIN_OP_GT_uxn_opcodes_h_l320_c32_6074_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l320_c32_6074_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l320_c32_6074_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l320_c32_2ce3]
signal MUX_uxn_opcodes_h_l320_c32_2ce3_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l320_c32_2ce3_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l320_c32_2ce3_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l320_c32_2ce3_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l322_c11_63a6]
signal BIN_OP_EQ_uxn_opcodes_h_l322_c11_63a6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l322_c11_63a6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l322_c11_63a6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l322_c7_6434]
signal result_is_stack_write_MUX_uxn_opcodes_h_l322_c7_6434_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l322_c7_6434_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l322_c7_6434_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l322_c7_6434_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l322_c7_6434]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l322_c7_6434_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l322_c7_6434_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l322_c7_6434_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l322_c7_6434_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l322_c7_6434]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l322_c7_6434_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l322_c7_6434_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l322_c7_6434_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l322_c7_6434_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l322_c7_6434]
signal result_stack_value_MUX_uxn_opcodes_h_l322_c7_6434_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l322_c7_6434_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l322_c7_6434_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l322_c7_6434_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l322_c7_6434]
signal result_is_opc_done_MUX_uxn_opcodes_h_l322_c7_6434_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l322_c7_6434_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l322_c7_6434_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l322_c7_6434_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l328_c11_5873]
signal BIN_OP_EQ_uxn_opcodes_h_l328_c11_5873_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l328_c11_5873_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l328_c11_5873_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l328_c7_436a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c7_436a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c7_436a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c7_436a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c7_436a_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l328_c7_436a]
signal result_stack_value_MUX_uxn_opcodes_h_l328_c7_436a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l328_c7_436a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l328_c7_436a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l328_c7_436a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l328_c7_436a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l328_c7_436a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l328_c7_436a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l328_c7_436a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l328_c7_436a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l328_c7_436a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l328_c7_436a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l328_c7_436a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l328_c7_436a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l328_c7_436a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l332_c11_0f1f]
signal BIN_OP_EQ_uxn_opcodes_h_l332_c11_0f1f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l332_c11_0f1f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l332_c11_0f1f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l332_c7_0ef2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_0ef2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_0ef2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_0ef2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_0ef2_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l332_c7_0ef2]
signal result_stack_value_MUX_uxn_opcodes_h_l332_c7_0ef2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l332_c7_0ef2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l332_c7_0ef2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l332_c7_0ef2_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l332_c7_0ef2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_0ef2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_0ef2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_0ef2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_0ef2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l332_c7_0ef2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_0ef2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_0ef2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_0ef2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_0ef2_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l336_c11_8bab]
signal BIN_OP_EQ_uxn_opcodes_h_l336_c11_8bab_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l336_c11_8bab_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l336_c11_8bab_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l336_c7_7331]
signal result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_7331_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_7331_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_7331_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_7331_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l336_c7_7331]
signal result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_7331_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_7331_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_7331_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_7331_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_09c5( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.stack_value := ref_toks_5;
      base.is_opc_done := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l302_c6_56c1
BIN_OP_EQ_uxn_opcodes_h_l302_c6_56c1 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l302_c6_56c1_left,
BIN_OP_EQ_uxn_opcodes_h_l302_c6_56c1_right,
BIN_OP_EQ_uxn_opcodes_h_l302_c6_56c1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l302_c1_bb37
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l302_c1_bb37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l302_c1_bb37_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l302_c1_bb37_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l302_c1_bb37_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l302_c1_bb37_return_output);

-- n8_MUX_uxn_opcodes_h_l302_c2_4d2f
n8_MUX_uxn_opcodes_h_l302_c2_4d2f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l302_c2_4d2f_cond,
n8_MUX_uxn_opcodes_h_l302_c2_4d2f_iftrue,
n8_MUX_uxn_opcodes_h_l302_c2_4d2f_iffalse,
n8_MUX_uxn_opcodes_h_l302_c2_4d2f_return_output);

-- t8_MUX_uxn_opcodes_h_l302_c2_4d2f
t8_MUX_uxn_opcodes_h_l302_c2_4d2f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l302_c2_4d2f_cond,
t8_MUX_uxn_opcodes_h_l302_c2_4d2f_iftrue,
t8_MUX_uxn_opcodes_h_l302_c2_4d2f_iffalse,
t8_MUX_uxn_opcodes_h_l302_c2_4d2f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l302_c2_4d2f
result_is_stack_write_MUX_uxn_opcodes_h_l302_c2_4d2f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l302_c2_4d2f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l302_c2_4d2f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l302_c2_4d2f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l302_c2_4d2f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l302_c2_4d2f
result_is_sp_shift_MUX_uxn_opcodes_h_l302_c2_4d2f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l302_c2_4d2f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l302_c2_4d2f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l302_c2_4d2f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l302_c2_4d2f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c2_4d2f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c2_4d2f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c2_4d2f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c2_4d2f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c2_4d2f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c2_4d2f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l302_c2_4d2f
result_sp_relative_shift_MUX_uxn_opcodes_h_l302_c2_4d2f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l302_c2_4d2f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l302_c2_4d2f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l302_c2_4d2f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l302_c2_4d2f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l302_c2_4d2f
result_stack_value_MUX_uxn_opcodes_h_l302_c2_4d2f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l302_c2_4d2f_cond,
result_stack_value_MUX_uxn_opcodes_h_l302_c2_4d2f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l302_c2_4d2f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l302_c2_4d2f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l302_c2_4d2f
result_is_opc_done_MUX_uxn_opcodes_h_l302_c2_4d2f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l302_c2_4d2f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l302_c2_4d2f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l302_c2_4d2f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l302_c2_4d2f_return_output);

-- printf_uxn_opcodes_h_l303_c3_1937_uxn_opcodes_h_l303_c3_1937
printf_uxn_opcodes_h_l303_c3_1937_uxn_opcodes_h_l303_c3_1937 : entity work.printf_uxn_opcodes_h_l303_c3_1937_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l303_c3_1937_uxn_opcodes_h_l303_c3_1937_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l307_c11_5d2e
BIN_OP_EQ_uxn_opcodes_h_l307_c11_5d2e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l307_c11_5d2e_left,
BIN_OP_EQ_uxn_opcodes_h_l307_c11_5d2e_right,
BIN_OP_EQ_uxn_opcodes_h_l307_c11_5d2e_return_output);

-- n8_MUX_uxn_opcodes_h_l307_c7_1487
n8_MUX_uxn_opcodes_h_l307_c7_1487 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l307_c7_1487_cond,
n8_MUX_uxn_opcodes_h_l307_c7_1487_iftrue,
n8_MUX_uxn_opcodes_h_l307_c7_1487_iffalse,
n8_MUX_uxn_opcodes_h_l307_c7_1487_return_output);

-- t8_MUX_uxn_opcodes_h_l307_c7_1487
t8_MUX_uxn_opcodes_h_l307_c7_1487 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l307_c7_1487_cond,
t8_MUX_uxn_opcodes_h_l307_c7_1487_iftrue,
t8_MUX_uxn_opcodes_h_l307_c7_1487_iffalse,
t8_MUX_uxn_opcodes_h_l307_c7_1487_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l307_c7_1487
result_is_stack_write_MUX_uxn_opcodes_h_l307_c7_1487 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l307_c7_1487_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l307_c7_1487_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l307_c7_1487_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l307_c7_1487_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l307_c7_1487
result_is_sp_shift_MUX_uxn_opcodes_h_l307_c7_1487 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l307_c7_1487_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l307_c7_1487_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l307_c7_1487_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l307_c7_1487_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l307_c7_1487
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l307_c7_1487 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l307_c7_1487_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l307_c7_1487_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l307_c7_1487_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l307_c7_1487_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l307_c7_1487
result_sp_relative_shift_MUX_uxn_opcodes_h_l307_c7_1487 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l307_c7_1487_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l307_c7_1487_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l307_c7_1487_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l307_c7_1487_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l307_c7_1487
result_stack_value_MUX_uxn_opcodes_h_l307_c7_1487 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l307_c7_1487_cond,
result_stack_value_MUX_uxn_opcodes_h_l307_c7_1487_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l307_c7_1487_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l307_c7_1487_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l307_c7_1487
result_is_opc_done_MUX_uxn_opcodes_h_l307_c7_1487 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l307_c7_1487_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l307_c7_1487_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l307_c7_1487_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l307_c7_1487_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l310_c11_64bf
BIN_OP_EQ_uxn_opcodes_h_l310_c11_64bf : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l310_c11_64bf_left,
BIN_OP_EQ_uxn_opcodes_h_l310_c11_64bf_right,
BIN_OP_EQ_uxn_opcodes_h_l310_c11_64bf_return_output);

-- n8_MUX_uxn_opcodes_h_l310_c7_c0e0
n8_MUX_uxn_opcodes_h_l310_c7_c0e0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l310_c7_c0e0_cond,
n8_MUX_uxn_opcodes_h_l310_c7_c0e0_iftrue,
n8_MUX_uxn_opcodes_h_l310_c7_c0e0_iffalse,
n8_MUX_uxn_opcodes_h_l310_c7_c0e0_return_output);

-- t8_MUX_uxn_opcodes_h_l310_c7_c0e0
t8_MUX_uxn_opcodes_h_l310_c7_c0e0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l310_c7_c0e0_cond,
t8_MUX_uxn_opcodes_h_l310_c7_c0e0_iftrue,
t8_MUX_uxn_opcodes_h_l310_c7_c0e0_iffalse,
t8_MUX_uxn_opcodes_h_l310_c7_c0e0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l310_c7_c0e0
result_is_stack_write_MUX_uxn_opcodes_h_l310_c7_c0e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l310_c7_c0e0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l310_c7_c0e0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l310_c7_c0e0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l310_c7_c0e0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l310_c7_c0e0
result_is_sp_shift_MUX_uxn_opcodes_h_l310_c7_c0e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l310_c7_c0e0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l310_c7_c0e0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l310_c7_c0e0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l310_c7_c0e0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l310_c7_c0e0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l310_c7_c0e0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l310_c7_c0e0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l310_c7_c0e0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l310_c7_c0e0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l310_c7_c0e0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l310_c7_c0e0
result_sp_relative_shift_MUX_uxn_opcodes_h_l310_c7_c0e0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l310_c7_c0e0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l310_c7_c0e0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l310_c7_c0e0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l310_c7_c0e0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l310_c7_c0e0
result_stack_value_MUX_uxn_opcodes_h_l310_c7_c0e0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l310_c7_c0e0_cond,
result_stack_value_MUX_uxn_opcodes_h_l310_c7_c0e0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l310_c7_c0e0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l310_c7_c0e0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l310_c7_c0e0
result_is_opc_done_MUX_uxn_opcodes_h_l310_c7_c0e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l310_c7_c0e0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l310_c7_c0e0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l310_c7_c0e0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l310_c7_c0e0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l314_c11_8914
BIN_OP_EQ_uxn_opcodes_h_l314_c11_8914 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l314_c11_8914_left,
BIN_OP_EQ_uxn_opcodes_h_l314_c11_8914_right,
BIN_OP_EQ_uxn_opcodes_h_l314_c11_8914_return_output);

-- n8_MUX_uxn_opcodes_h_l314_c7_beb8
n8_MUX_uxn_opcodes_h_l314_c7_beb8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l314_c7_beb8_cond,
n8_MUX_uxn_opcodes_h_l314_c7_beb8_iftrue,
n8_MUX_uxn_opcodes_h_l314_c7_beb8_iffalse,
n8_MUX_uxn_opcodes_h_l314_c7_beb8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_beb8
result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_beb8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_beb8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_beb8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_beb8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_beb8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l314_c7_beb8
result_is_sp_shift_MUX_uxn_opcodes_h_l314_c7_beb8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l314_c7_beb8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l314_c7_beb8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l314_c7_beb8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l314_c7_beb8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_beb8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_beb8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_beb8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_beb8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_beb8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_beb8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l314_c7_beb8
result_sp_relative_shift_MUX_uxn_opcodes_h_l314_c7_beb8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l314_c7_beb8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l314_c7_beb8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l314_c7_beb8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l314_c7_beb8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l314_c7_beb8
result_stack_value_MUX_uxn_opcodes_h_l314_c7_beb8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l314_c7_beb8_cond,
result_stack_value_MUX_uxn_opcodes_h_l314_c7_beb8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l314_c7_beb8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l314_c7_beb8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_beb8
result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_beb8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_beb8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_beb8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_beb8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_beb8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l317_c11_2a7d
BIN_OP_EQ_uxn_opcodes_h_l317_c11_2a7d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l317_c11_2a7d_left,
BIN_OP_EQ_uxn_opcodes_h_l317_c11_2a7d_right,
BIN_OP_EQ_uxn_opcodes_h_l317_c11_2a7d_return_output);

-- n8_MUX_uxn_opcodes_h_l317_c7_6e03
n8_MUX_uxn_opcodes_h_l317_c7_6e03 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l317_c7_6e03_cond,
n8_MUX_uxn_opcodes_h_l317_c7_6e03_iftrue,
n8_MUX_uxn_opcodes_h_l317_c7_6e03_iffalse,
n8_MUX_uxn_opcodes_h_l317_c7_6e03_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l317_c7_6e03
result_is_stack_write_MUX_uxn_opcodes_h_l317_c7_6e03 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l317_c7_6e03_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l317_c7_6e03_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l317_c7_6e03_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l317_c7_6e03_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l317_c7_6e03
result_is_sp_shift_MUX_uxn_opcodes_h_l317_c7_6e03 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l317_c7_6e03_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l317_c7_6e03_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l317_c7_6e03_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l317_c7_6e03_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l317_c7_6e03
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l317_c7_6e03 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l317_c7_6e03_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l317_c7_6e03_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l317_c7_6e03_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l317_c7_6e03_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l317_c7_6e03
result_sp_relative_shift_MUX_uxn_opcodes_h_l317_c7_6e03 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l317_c7_6e03_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l317_c7_6e03_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l317_c7_6e03_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l317_c7_6e03_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l317_c7_6e03
result_stack_value_MUX_uxn_opcodes_h_l317_c7_6e03 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l317_c7_6e03_cond,
result_stack_value_MUX_uxn_opcodes_h_l317_c7_6e03_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l317_c7_6e03_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l317_c7_6e03_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l317_c7_6e03
result_is_opc_done_MUX_uxn_opcodes_h_l317_c7_6e03 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l317_c7_6e03_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l317_c7_6e03_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l317_c7_6e03_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l317_c7_6e03_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l320_c32_007c
BIN_OP_AND_uxn_opcodes_h_l320_c32_007c : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l320_c32_007c_left,
BIN_OP_AND_uxn_opcodes_h_l320_c32_007c_right,
BIN_OP_AND_uxn_opcodes_h_l320_c32_007c_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l320_c32_6074
BIN_OP_GT_uxn_opcodes_h_l320_c32_6074 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l320_c32_6074_left,
BIN_OP_GT_uxn_opcodes_h_l320_c32_6074_right,
BIN_OP_GT_uxn_opcodes_h_l320_c32_6074_return_output);

-- MUX_uxn_opcodes_h_l320_c32_2ce3
MUX_uxn_opcodes_h_l320_c32_2ce3 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l320_c32_2ce3_cond,
MUX_uxn_opcodes_h_l320_c32_2ce3_iftrue,
MUX_uxn_opcodes_h_l320_c32_2ce3_iffalse,
MUX_uxn_opcodes_h_l320_c32_2ce3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l322_c11_63a6
BIN_OP_EQ_uxn_opcodes_h_l322_c11_63a6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l322_c11_63a6_left,
BIN_OP_EQ_uxn_opcodes_h_l322_c11_63a6_right,
BIN_OP_EQ_uxn_opcodes_h_l322_c11_63a6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l322_c7_6434
result_is_stack_write_MUX_uxn_opcodes_h_l322_c7_6434 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l322_c7_6434_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l322_c7_6434_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l322_c7_6434_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l322_c7_6434_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l322_c7_6434
result_is_sp_shift_MUX_uxn_opcodes_h_l322_c7_6434 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l322_c7_6434_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l322_c7_6434_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l322_c7_6434_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l322_c7_6434_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l322_c7_6434
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l322_c7_6434 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l322_c7_6434_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l322_c7_6434_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l322_c7_6434_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l322_c7_6434_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l322_c7_6434
result_stack_value_MUX_uxn_opcodes_h_l322_c7_6434 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l322_c7_6434_cond,
result_stack_value_MUX_uxn_opcodes_h_l322_c7_6434_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l322_c7_6434_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l322_c7_6434_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l322_c7_6434
result_is_opc_done_MUX_uxn_opcodes_h_l322_c7_6434 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l322_c7_6434_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l322_c7_6434_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l322_c7_6434_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l322_c7_6434_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l328_c11_5873
BIN_OP_EQ_uxn_opcodes_h_l328_c11_5873 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l328_c11_5873_left,
BIN_OP_EQ_uxn_opcodes_h_l328_c11_5873_right,
BIN_OP_EQ_uxn_opcodes_h_l328_c11_5873_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c7_436a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c7_436a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c7_436a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c7_436a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c7_436a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c7_436a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l328_c7_436a
result_stack_value_MUX_uxn_opcodes_h_l328_c7_436a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l328_c7_436a_cond,
result_stack_value_MUX_uxn_opcodes_h_l328_c7_436a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l328_c7_436a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l328_c7_436a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l328_c7_436a
result_is_opc_done_MUX_uxn_opcodes_h_l328_c7_436a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l328_c7_436a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l328_c7_436a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l328_c7_436a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l328_c7_436a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l328_c7_436a
result_is_stack_write_MUX_uxn_opcodes_h_l328_c7_436a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l328_c7_436a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l328_c7_436a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l328_c7_436a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l328_c7_436a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l332_c11_0f1f
BIN_OP_EQ_uxn_opcodes_h_l332_c11_0f1f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l332_c11_0f1f_left,
BIN_OP_EQ_uxn_opcodes_h_l332_c11_0f1f_right,
BIN_OP_EQ_uxn_opcodes_h_l332_c11_0f1f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_0ef2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_0ef2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_0ef2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_0ef2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_0ef2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_0ef2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l332_c7_0ef2
result_stack_value_MUX_uxn_opcodes_h_l332_c7_0ef2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l332_c7_0ef2_cond,
result_stack_value_MUX_uxn_opcodes_h_l332_c7_0ef2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l332_c7_0ef2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l332_c7_0ef2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_0ef2
result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_0ef2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_0ef2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_0ef2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_0ef2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_0ef2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_0ef2
result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_0ef2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_0ef2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_0ef2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_0ef2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_0ef2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l336_c11_8bab
BIN_OP_EQ_uxn_opcodes_h_l336_c11_8bab : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l336_c11_8bab_left,
BIN_OP_EQ_uxn_opcodes_h_l336_c11_8bab_right,
BIN_OP_EQ_uxn_opcodes_h_l336_c11_8bab_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_7331
result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_7331 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_7331_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_7331_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_7331_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_7331_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_7331
result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_7331 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_7331_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_7331_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_7331_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_7331_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l302_c6_56c1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l302_c1_bb37_return_output,
 n8_MUX_uxn_opcodes_h_l302_c2_4d2f_return_output,
 t8_MUX_uxn_opcodes_h_l302_c2_4d2f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l302_c2_4d2f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l302_c2_4d2f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c2_4d2f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l302_c2_4d2f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l302_c2_4d2f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l302_c2_4d2f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l307_c11_5d2e_return_output,
 n8_MUX_uxn_opcodes_h_l307_c7_1487_return_output,
 t8_MUX_uxn_opcodes_h_l307_c7_1487_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l307_c7_1487_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l307_c7_1487_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l307_c7_1487_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l307_c7_1487_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l307_c7_1487_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l307_c7_1487_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l310_c11_64bf_return_output,
 n8_MUX_uxn_opcodes_h_l310_c7_c0e0_return_output,
 t8_MUX_uxn_opcodes_h_l310_c7_c0e0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l310_c7_c0e0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l310_c7_c0e0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l310_c7_c0e0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l310_c7_c0e0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l310_c7_c0e0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l310_c7_c0e0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l314_c11_8914_return_output,
 n8_MUX_uxn_opcodes_h_l314_c7_beb8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_beb8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l314_c7_beb8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_beb8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l314_c7_beb8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l314_c7_beb8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_beb8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l317_c11_2a7d_return_output,
 n8_MUX_uxn_opcodes_h_l317_c7_6e03_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l317_c7_6e03_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l317_c7_6e03_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l317_c7_6e03_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l317_c7_6e03_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l317_c7_6e03_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l317_c7_6e03_return_output,
 BIN_OP_AND_uxn_opcodes_h_l320_c32_007c_return_output,
 BIN_OP_GT_uxn_opcodes_h_l320_c32_6074_return_output,
 MUX_uxn_opcodes_h_l320_c32_2ce3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l322_c11_63a6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l322_c7_6434_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l322_c7_6434_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l322_c7_6434_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l322_c7_6434_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l322_c7_6434_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l328_c11_5873_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c7_436a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l328_c7_436a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l328_c7_436a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l328_c7_436a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l332_c11_0f1f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_0ef2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l332_c7_0ef2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_0ef2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_0ef2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l336_c11_8bab_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_7331_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_7331_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c6_56c1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c6_56c1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c6_56c1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l302_c1_bb37_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l302_c1_bb37_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l302_c1_bb37_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l302_c1_bb37_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l302_c2_4d2f_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l302_c2_4d2f_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l307_c7_1487_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l302_c2_4d2f_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l302_c2_4d2f_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l302_c2_4d2f_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l302_c2_4d2f_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l307_c7_1487_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l302_c2_4d2f_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l302_c2_4d2f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l302_c2_4d2f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l302_c2_4d2f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l307_c7_1487_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l302_c2_4d2f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l302_c2_4d2f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l302_c2_4d2f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l302_c2_4d2f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l307_c7_1487_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l302_c2_4d2f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l302_c2_4d2f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c2_4d2f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l304_c3_4c39 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c2_4d2f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l307_c7_1487_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c2_4d2f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c2_4d2f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l302_c2_4d2f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l302_c2_4d2f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l307_c7_1487_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l302_c2_4d2f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l302_c2_4d2f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l302_c2_4d2f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l302_c2_4d2f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l307_c7_1487_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l302_c2_4d2f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l302_c2_4d2f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l302_c2_4d2f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l302_c2_4d2f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l307_c7_1487_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l302_c2_4d2f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l302_c2_4d2f_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l303_c3_1937_uxn_opcodes_h_l303_c3_1937_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l307_c11_5d2e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l307_c11_5d2e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l307_c11_5d2e_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l307_c7_1487_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l307_c7_1487_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l310_c7_c0e0_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l307_c7_1487_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l307_c7_1487_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l307_c7_1487_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l310_c7_c0e0_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l307_c7_1487_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l307_c7_1487_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l307_c7_1487_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l310_c7_c0e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l307_c7_1487_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l307_c7_1487_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l307_c7_1487_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l310_c7_c0e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l307_c7_1487_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l307_c7_1487_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l308_c3_b6f5 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l307_c7_1487_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l310_c7_c0e0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l307_c7_1487_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l307_c7_1487_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l307_c7_1487_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l310_c7_c0e0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l307_c7_1487_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l307_c7_1487_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l307_c7_1487_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l310_c7_c0e0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l307_c7_1487_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l307_c7_1487_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l307_c7_1487_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l310_c7_c0e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l307_c7_1487_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l310_c11_64bf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l310_c11_64bf_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l310_c11_64bf_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l310_c7_c0e0_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l310_c7_c0e0_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l314_c7_beb8_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l310_c7_c0e0_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l310_c7_c0e0_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l310_c7_c0e0_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l310_c7_c0e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l310_c7_c0e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l310_c7_c0e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_beb8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l310_c7_c0e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l310_c7_c0e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l310_c7_c0e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l314_c7_beb8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l310_c7_c0e0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l310_c7_c0e0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l312_c3_8974 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l310_c7_c0e0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_beb8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l310_c7_c0e0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l310_c7_c0e0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l310_c7_c0e0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l314_c7_beb8_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l310_c7_c0e0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l310_c7_c0e0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l310_c7_c0e0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l314_c7_beb8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l310_c7_c0e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l310_c7_c0e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l310_c7_c0e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_beb8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l310_c7_c0e0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_8914_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_8914_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_8914_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l314_c7_beb8_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l314_c7_beb8_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l317_c7_6e03_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l314_c7_beb8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_beb8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_beb8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l317_c7_6e03_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_beb8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l314_c7_beb8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l314_c7_beb8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l317_c7_6e03_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l314_c7_beb8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_beb8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l315_c3_6066 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_beb8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l317_c7_6e03_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_beb8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l314_c7_beb8_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l314_c7_beb8_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l317_c7_6e03_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l314_c7_beb8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l314_c7_beb8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l314_c7_beb8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l317_c7_6e03_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l314_c7_beb8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_beb8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_beb8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l317_c7_6e03_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_beb8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l317_c11_2a7d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l317_c11_2a7d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l317_c11_2a7d_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l317_c7_6e03_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l317_c7_6e03_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l317_c7_6e03_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l317_c7_6e03_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l317_c7_6e03_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l322_c7_6434_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l317_c7_6e03_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l317_c7_6e03_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l317_c7_6e03_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l322_c7_6434_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l317_c7_6e03_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l317_c7_6e03_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l317_c7_6e03_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l322_c7_6434_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l317_c7_6e03_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l317_c7_6e03_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l317_c7_6e03_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l317_c7_6e03_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l317_c7_6e03_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l317_c7_6e03_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l322_c7_6434_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l317_c7_6e03_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l317_c7_6e03_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l317_c7_6e03_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l322_c7_6434_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l317_c7_6e03_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l320_c32_2ce3_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l320_c32_2ce3_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l320_c32_2ce3_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l320_c32_007c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l320_c32_007c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l320_c32_007c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l320_c32_6074_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l320_c32_6074_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l320_c32_6074_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l320_c32_2ce3_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l322_c11_63a6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l322_c11_63a6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l322_c11_63a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l322_c7_6434_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l322_c7_6434_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l328_c7_436a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l322_c7_6434_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l322_c7_6434_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l322_c7_6434_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l322_c7_6434_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l322_c7_6434_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l325_c3_9b2e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l322_c7_6434_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c7_436a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l322_c7_6434_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l322_c7_6434_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l322_c7_6434_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l328_c7_436a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l322_c7_6434_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l322_c7_6434_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l322_c7_6434_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l328_c7_436a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l322_c7_6434_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c11_5873_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c11_5873_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c11_5873_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c7_436a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l329_c3_2932 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c7_436a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_0ef2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c7_436a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l328_c7_436a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l328_c7_436a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l332_c7_0ef2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l328_c7_436a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l328_c7_436a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l328_c7_436a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_0ef2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l328_c7_436a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l328_c7_436a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l328_c7_436a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_0ef2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l328_c7_436a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_0f1f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_0f1f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_0f1f_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_0ef2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l333_c3_337e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_0ef2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_0ef2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l332_c7_0ef2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l332_c7_0ef2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l332_c7_0ef2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_0ef2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_0ef2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_7331_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_0ef2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_0ef2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_0ef2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_7331_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_0ef2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_8bab_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_8bab_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_8bab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_7331_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_7331_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_7331_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_7331_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_7331_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_7331_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l332_l302_l328_l317_l314_l310_l336_l307_DUPLICATE_0eda_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l302_l322_l314_l310_l307_DUPLICATE_f08d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l302_l317_l314_l310_l307_DUPLICATE_0c9f_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l332_l302_l317_l314_l310_l307_DUPLICATE_4b56_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l332_l328_l322_l317_l314_l310_l336_l307_DUPLICATE_34fe_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l332_l317_DUPLICATE_7602_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l298_l341_DUPLICATE_f722_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_7331_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l320_c32_2ce3_iffalse := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_MUX_uxn_opcodes_h_l320_c32_2ce3_iftrue := signed(std_logic_vector(resize(to_unsigned(3, 2), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l317_c11_2a7d_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c11_5873_right := to_unsigned(6, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l302_c1_bb37_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c6_56c1_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l325_c3_9b2e := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l322_c7_6434_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l325_c3_9b2e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_8914_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l333_c3_337e := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_0ef2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l333_c3_337e;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l315_c3_6066 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_beb8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l315_c3_6066;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l302_c2_4d2f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_0f1f_right := to_unsigned(7, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l317_c7_6e03_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l320_c32_6074_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l322_c7_6434_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l307_c11_5d2e_right := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l320_c32_007c_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l312_c3_8974 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l310_c7_c0e0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l312_c3_8974;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l310_c11_64bf_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_7331_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l322_c11_63a6_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l329_c3_2932 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c7_436a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l329_c3_2932;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l304_c3_4c39 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c2_4d2f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l304_c3_4c39;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l322_c7_6434_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_8bab_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l308_c3_b6f5 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l307_c7_1487_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l308_c3_b6f5;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l302_c1_bb37_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l320_c32_007c_left := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l302_c2_4d2f_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l307_c7_1487_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l310_c7_c0e0_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l314_c7_beb8_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l317_c7_6e03_iffalse := n8;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l322_c7_6434_iftrue := n8;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l332_c7_0ef2_iftrue := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c6_56c1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l307_c11_5d2e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l310_c11_64bf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_8914_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l317_c11_2a7d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l322_c11_63a6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c11_5873_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_0f1f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_8bab_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l317_c7_6e03_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l310_c7_c0e0_iftrue := VAR_previous_stack_read;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l328_c7_436a_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l302_c2_4d2f_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l307_c7_1487_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l310_c7_c0e0_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l332_l302_l328_l317_l314_l310_l336_l307_DUPLICATE_0eda LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l332_l302_l328_l317_l314_l310_l336_l307_DUPLICATE_0eda_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l310_c11_64bf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l310_c11_64bf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l310_c11_64bf_left;
     BIN_OP_EQ_uxn_opcodes_h_l310_c11_64bf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l310_c11_64bf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l310_c11_64bf_return_output := BIN_OP_EQ_uxn_opcodes_h_l310_c11_64bf_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l302_l317_l314_l310_l307_DUPLICATE_0c9f LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l302_l317_l314_l310_l307_DUPLICATE_0c9f_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l332_l328_l322_l317_l314_l310_l336_l307_DUPLICATE_34fe LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l332_l328_l322_l317_l314_l310_l336_l307_DUPLICATE_34fe_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l317_c11_2a7d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l317_c11_2a7d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l317_c11_2a7d_left;
     BIN_OP_EQ_uxn_opcodes_h_l317_c11_2a7d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l317_c11_2a7d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l317_c11_2a7d_return_output := BIN_OP_EQ_uxn_opcodes_h_l317_c11_2a7d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l314_c11_8914] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l314_c11_8914_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_8914_left;
     BIN_OP_EQ_uxn_opcodes_h_l314_c11_8914_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_8914_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_8914_return_output := BIN_OP_EQ_uxn_opcodes_h_l314_c11_8914_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l332_c11_0f1f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l332_c11_0f1f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_0f1f_left;
     BIN_OP_EQ_uxn_opcodes_h_l332_c11_0f1f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_0f1f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_0f1f_return_output := BIN_OP_EQ_uxn_opcodes_h_l332_c11_0f1f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l328_c11_5873] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l328_c11_5873_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c11_5873_left;
     BIN_OP_EQ_uxn_opcodes_h_l328_c11_5873_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c11_5873_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c11_5873_return_output := BIN_OP_EQ_uxn_opcodes_h_l328_c11_5873_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l322_c11_63a6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l322_c11_63a6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l322_c11_63a6_left;
     BIN_OP_EQ_uxn_opcodes_h_l322_c11_63a6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l322_c11_63a6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l322_c11_63a6_return_output := BIN_OP_EQ_uxn_opcodes_h_l322_c11_63a6_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l332_l302_l317_l314_l310_l307_DUPLICATE_4b56 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l332_l302_l317_l314_l310_l307_DUPLICATE_4b56_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l336_c11_8bab] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l336_c11_8bab_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_8bab_left;
     BIN_OP_EQ_uxn_opcodes_h_l336_c11_8bab_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_8bab_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_8bab_return_output := BIN_OP_EQ_uxn_opcodes_h_l336_c11_8bab_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l302_l322_l314_l310_l307_DUPLICATE_f08d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l302_l322_l314_l310_l307_DUPLICATE_f08d_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l302_c6_56c1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l302_c6_56c1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c6_56c1_left;
     BIN_OP_EQ_uxn_opcodes_h_l302_c6_56c1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c6_56c1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c6_56c1_return_output := BIN_OP_EQ_uxn_opcodes_h_l302_c6_56c1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l307_c11_5d2e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l307_c11_5d2e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l307_c11_5d2e_left;
     BIN_OP_EQ_uxn_opcodes_h_l307_c11_5d2e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l307_c11_5d2e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l307_c11_5d2e_return_output := BIN_OP_EQ_uxn_opcodes_h_l307_c11_5d2e_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l332_l317_DUPLICATE_7602 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l332_l317_DUPLICATE_7602_return_output := result.stack_address_sp_offset;

     -- BIN_OP_AND[uxn_opcodes_h_l320_c32_007c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l320_c32_007c_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l320_c32_007c_left;
     BIN_OP_AND_uxn_opcodes_h_l320_c32_007c_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l320_c32_007c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l320_c32_007c_return_output := BIN_OP_AND_uxn_opcodes_h_l320_c32_007c_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l320_c32_6074_left := VAR_BIN_OP_AND_uxn_opcodes_h_l320_c32_007c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l302_c1_bb37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c6_56c1_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l302_c2_4d2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c6_56c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l302_c2_4d2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c6_56c1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l302_c2_4d2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c6_56c1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l302_c2_4d2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c6_56c1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l302_c2_4d2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c6_56c1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c2_4d2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c6_56c1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l302_c2_4d2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c6_56c1_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l302_c2_4d2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c6_56c1_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l307_c7_1487_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l307_c11_5d2e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l307_c7_1487_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l307_c11_5d2e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l307_c7_1487_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l307_c11_5d2e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l307_c7_1487_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l307_c11_5d2e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l307_c7_1487_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l307_c11_5d2e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l307_c7_1487_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l307_c11_5d2e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l307_c7_1487_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l307_c11_5d2e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l307_c7_1487_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l307_c11_5d2e_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l310_c7_c0e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l310_c11_64bf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l310_c7_c0e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l310_c11_64bf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l310_c7_c0e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l310_c11_64bf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l310_c7_c0e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l310_c11_64bf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l310_c7_c0e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l310_c11_64bf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l310_c7_c0e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l310_c11_64bf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l310_c7_c0e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l310_c11_64bf_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l310_c7_c0e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l310_c11_64bf_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l314_c7_beb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_8914_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_beb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_8914_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l314_c7_beb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_8914_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_beb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_8914_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l314_c7_beb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_8914_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_beb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_8914_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l314_c7_beb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_8914_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l317_c7_6e03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l317_c11_2a7d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l317_c7_6e03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l317_c11_2a7d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l317_c7_6e03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l317_c11_2a7d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l317_c7_6e03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l317_c11_2a7d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l317_c7_6e03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l317_c11_2a7d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l317_c7_6e03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l317_c11_2a7d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l317_c7_6e03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l317_c11_2a7d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l322_c7_6434_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l322_c11_63a6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l322_c7_6434_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l322_c11_63a6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l322_c7_6434_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l322_c11_63a6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l322_c7_6434_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l322_c11_63a6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l322_c7_6434_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l322_c11_63a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l328_c7_436a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c11_5873_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l328_c7_436a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c11_5873_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c7_436a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c11_5873_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l328_c7_436a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c11_5873_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_0ef2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_0f1f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_0ef2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_0f1f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_0ef2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_0f1f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l332_c7_0ef2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_0f1f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_7331_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_8bab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_7331_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_8bab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l302_c2_4d2f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l302_l317_l314_l310_l307_DUPLICATE_0c9f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l307_c7_1487_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l302_l317_l314_l310_l307_DUPLICATE_0c9f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l310_c7_c0e0_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l302_l317_l314_l310_l307_DUPLICATE_0c9f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l314_c7_beb8_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l302_l317_l314_l310_l307_DUPLICATE_0c9f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l317_c7_6e03_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l302_l317_l314_l310_l307_DUPLICATE_0c9f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l307_c7_1487_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l332_l328_l322_l317_l314_l310_l336_l307_DUPLICATE_34fe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l310_c7_c0e0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l332_l328_l322_l317_l314_l310_l336_l307_DUPLICATE_34fe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_beb8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l332_l328_l322_l317_l314_l310_l336_l307_DUPLICATE_34fe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l317_c7_6e03_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l332_l328_l322_l317_l314_l310_l336_l307_DUPLICATE_34fe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l322_c7_6434_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l332_l328_l322_l317_l314_l310_l336_l307_DUPLICATE_34fe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l328_c7_436a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l332_l328_l322_l317_l314_l310_l336_l307_DUPLICATE_34fe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_0ef2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l332_l328_l322_l317_l314_l310_l336_l307_DUPLICATE_34fe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_7331_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l332_l328_l322_l317_l314_l310_l336_l307_DUPLICATE_34fe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l302_c2_4d2f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l302_l322_l314_l310_l307_DUPLICATE_f08d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l307_c7_1487_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l302_l322_l314_l310_l307_DUPLICATE_f08d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l310_c7_c0e0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l302_l322_l314_l310_l307_DUPLICATE_f08d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l314_c7_beb8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l302_l322_l314_l310_l307_DUPLICATE_f08d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l322_c7_6434_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l302_l322_l314_l310_l307_DUPLICATE_f08d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l302_c2_4d2f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l332_l302_l328_l317_l314_l310_l336_l307_DUPLICATE_0eda_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l307_c7_1487_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l332_l302_l328_l317_l314_l310_l336_l307_DUPLICATE_0eda_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l310_c7_c0e0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l332_l302_l328_l317_l314_l310_l336_l307_DUPLICATE_0eda_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_beb8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l332_l302_l328_l317_l314_l310_l336_l307_DUPLICATE_0eda_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l317_c7_6e03_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l332_l302_l328_l317_l314_l310_l336_l307_DUPLICATE_0eda_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l328_c7_436a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l332_l302_l328_l317_l314_l310_l336_l307_DUPLICATE_0eda_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_0ef2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l332_l302_l328_l317_l314_l310_l336_l307_DUPLICATE_0eda_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_7331_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l332_l302_l328_l317_l314_l310_l336_l307_DUPLICATE_0eda_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l317_c7_6e03_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l332_l317_DUPLICATE_7602_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_0ef2_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l332_l317_DUPLICATE_7602_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l302_c2_4d2f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l332_l302_l317_l314_l310_l307_DUPLICATE_4b56_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l307_c7_1487_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l332_l302_l317_l314_l310_l307_DUPLICATE_4b56_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l310_c7_c0e0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l332_l302_l317_l314_l310_l307_DUPLICATE_4b56_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l314_c7_beb8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l332_l302_l317_l314_l310_l307_DUPLICATE_4b56_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l317_c7_6e03_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l332_l302_l317_l314_l310_l307_DUPLICATE_4b56_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l332_c7_0ef2_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l332_l302_l317_l314_l310_l307_DUPLICATE_4b56_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l322_c7_6434] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l322_c7_6434_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l322_c7_6434_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l322_c7_6434_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l322_c7_6434_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l322_c7_6434_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l322_c7_6434_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l322_c7_6434_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l322_c7_6434_return_output;

     -- n8_MUX[uxn_opcodes_h_l317_c7_6e03] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l317_c7_6e03_cond <= VAR_n8_MUX_uxn_opcodes_h_l317_c7_6e03_cond;
     n8_MUX_uxn_opcodes_h_l317_c7_6e03_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l317_c7_6e03_iftrue;
     n8_MUX_uxn_opcodes_h_l317_c7_6e03_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l317_c7_6e03_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l317_c7_6e03_return_output := n8_MUX_uxn_opcodes_h_l317_c7_6e03_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l332_c7_0ef2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_0ef2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_0ef2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_0ef2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_0ef2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_0ef2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_0ef2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_0ef2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_0ef2_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l332_c7_0ef2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l332_c7_0ef2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l332_c7_0ef2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l332_c7_0ef2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l332_c7_0ef2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l332_c7_0ef2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l332_c7_0ef2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l332_c7_0ef2_return_output := result_stack_value_MUX_uxn_opcodes_h_l332_c7_0ef2_return_output;

     -- t8_MUX[uxn_opcodes_h_l310_c7_c0e0] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l310_c7_c0e0_cond <= VAR_t8_MUX_uxn_opcodes_h_l310_c7_c0e0_cond;
     t8_MUX_uxn_opcodes_h_l310_c7_c0e0_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l310_c7_c0e0_iftrue;
     t8_MUX_uxn_opcodes_h_l310_c7_c0e0_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l310_c7_c0e0_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l310_c7_c0e0_return_output := t8_MUX_uxn_opcodes_h_l310_c7_c0e0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l302_c1_bb37] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l302_c1_bb37_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l302_c1_bb37_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l302_c1_bb37_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l302_c1_bb37_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l302_c1_bb37_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l302_c1_bb37_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l302_c1_bb37_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l302_c1_bb37_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l320_c32_6074] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l320_c32_6074_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l320_c32_6074_left;
     BIN_OP_GT_uxn_opcodes_h_l320_c32_6074_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l320_c32_6074_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l320_c32_6074_return_output := BIN_OP_GT_uxn_opcodes_h_l320_c32_6074_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l336_c7_7331] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_7331_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_7331_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_7331_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_7331_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_7331_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_7331_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_7331_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_7331_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l336_c7_7331] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_7331_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_7331_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_7331_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_7331_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_7331_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_7331_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_7331_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_7331_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l320_c32_2ce3_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l320_c32_6074_return_output;
     VAR_printf_uxn_opcodes_h_l303_c3_1937_uxn_opcodes_h_l303_c3_1937_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l302_c1_bb37_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l314_c7_beb8_iffalse := VAR_n8_MUX_uxn_opcodes_h_l317_c7_6e03_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_0ef2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_7331_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l317_c7_6e03_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l322_c7_6434_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_0ef2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_7331_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c7_436a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_0ef2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l328_c7_436a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l332_c7_0ef2_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l307_c7_1487_iffalse := VAR_t8_MUX_uxn_opcodes_h_l310_c7_c0e0_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l328_c7_436a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c7_436a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c7_436a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c7_436a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c7_436a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c7_436a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c7_436a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c7_436a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c7_436a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l332_c7_0ef2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_0ef2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_0ef2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_0ef2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_0ef2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_0ef2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_0ef2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_0ef2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_0ef2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l317_c7_6e03] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l317_c7_6e03_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l317_c7_6e03_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l317_c7_6e03_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l317_c7_6e03_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l317_c7_6e03_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l317_c7_6e03_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l317_c7_6e03_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l317_c7_6e03_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l332_c7_0ef2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_0ef2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_0ef2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_0ef2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_0ef2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_0ef2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_0ef2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_0ef2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_0ef2_return_output;

     -- t8_MUX[uxn_opcodes_h_l307_c7_1487] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l307_c7_1487_cond <= VAR_t8_MUX_uxn_opcodes_h_l307_c7_1487_cond;
     t8_MUX_uxn_opcodes_h_l307_c7_1487_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l307_c7_1487_iftrue;
     t8_MUX_uxn_opcodes_h_l307_c7_1487_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l307_c7_1487_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l307_c7_1487_return_output := t8_MUX_uxn_opcodes_h_l307_c7_1487_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l328_c7_436a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l328_c7_436a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l328_c7_436a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l328_c7_436a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l328_c7_436a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l328_c7_436a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l328_c7_436a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l328_c7_436a_return_output := result_stack_value_MUX_uxn_opcodes_h_l328_c7_436a_return_output;

     -- printf_uxn_opcodes_h_l303_c3_1937[uxn_opcodes_h_l303_c3_1937] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l303_c3_1937_uxn_opcodes_h_l303_c3_1937_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l303_c3_1937_uxn_opcodes_h_l303_c3_1937_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- MUX[uxn_opcodes_h_l320_c32_2ce3] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l320_c32_2ce3_cond <= VAR_MUX_uxn_opcodes_h_l320_c32_2ce3_cond;
     MUX_uxn_opcodes_h_l320_c32_2ce3_iftrue <= VAR_MUX_uxn_opcodes_h_l320_c32_2ce3_iftrue;
     MUX_uxn_opcodes_h_l320_c32_2ce3_iffalse <= VAR_MUX_uxn_opcodes_h_l320_c32_2ce3_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l320_c32_2ce3_return_output := MUX_uxn_opcodes_h_l320_c32_2ce3_return_output;

     -- n8_MUX[uxn_opcodes_h_l314_c7_beb8] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l314_c7_beb8_cond <= VAR_n8_MUX_uxn_opcodes_h_l314_c7_beb8_cond;
     n8_MUX_uxn_opcodes_h_l314_c7_beb8_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l314_c7_beb8_iftrue;
     n8_MUX_uxn_opcodes_h_l314_c7_beb8_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l314_c7_beb8_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l314_c7_beb8_return_output := n8_MUX_uxn_opcodes_h_l314_c7_beb8_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l317_c7_6e03_iftrue := VAR_MUX_uxn_opcodes_h_l320_c32_2ce3_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l310_c7_c0e0_iffalse := VAR_n8_MUX_uxn_opcodes_h_l314_c7_beb8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l328_c7_436a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_0ef2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l314_c7_beb8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l317_c7_6e03_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l328_c7_436a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_0ef2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l322_c7_6434_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c7_436a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l322_c7_6434_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l328_c7_436a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l302_c2_4d2f_iffalse := VAR_t8_MUX_uxn_opcodes_h_l307_c7_1487_return_output;
     -- t8_MUX[uxn_opcodes_h_l302_c2_4d2f] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l302_c2_4d2f_cond <= VAR_t8_MUX_uxn_opcodes_h_l302_c2_4d2f_cond;
     t8_MUX_uxn_opcodes_h_l302_c2_4d2f_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l302_c2_4d2f_iftrue;
     t8_MUX_uxn_opcodes_h_l302_c2_4d2f_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l302_c2_4d2f_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l302_c2_4d2f_return_output := t8_MUX_uxn_opcodes_h_l302_c2_4d2f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l317_c7_6e03] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l317_c7_6e03_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l317_c7_6e03_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l317_c7_6e03_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l317_c7_6e03_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l317_c7_6e03_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l317_c7_6e03_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l317_c7_6e03_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l317_c7_6e03_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l328_c7_436a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l328_c7_436a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l328_c7_436a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l328_c7_436a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l328_c7_436a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l328_c7_436a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l328_c7_436a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l328_c7_436a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l328_c7_436a_return_output;

     -- n8_MUX[uxn_opcodes_h_l310_c7_c0e0] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l310_c7_c0e0_cond <= VAR_n8_MUX_uxn_opcodes_h_l310_c7_c0e0_cond;
     n8_MUX_uxn_opcodes_h_l310_c7_c0e0_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l310_c7_c0e0_iftrue;
     n8_MUX_uxn_opcodes_h_l310_c7_c0e0_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l310_c7_c0e0_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l310_c7_c0e0_return_output := n8_MUX_uxn_opcodes_h_l310_c7_c0e0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l314_c7_beb8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l314_c7_beb8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l314_c7_beb8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l314_c7_beb8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l314_c7_beb8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l314_c7_beb8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l314_c7_beb8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l314_c7_beb8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l314_c7_beb8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l322_c7_6434] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l322_c7_6434_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l322_c7_6434_cond;
     result_stack_value_MUX_uxn_opcodes_h_l322_c7_6434_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l322_c7_6434_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l322_c7_6434_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l322_c7_6434_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l322_c7_6434_return_output := result_stack_value_MUX_uxn_opcodes_h_l322_c7_6434_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l322_c7_6434] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l322_c7_6434_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l322_c7_6434_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l322_c7_6434_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l322_c7_6434_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l322_c7_6434_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l322_c7_6434_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l322_c7_6434_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l322_c7_6434_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l328_c7_436a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l328_c7_436a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l328_c7_436a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l328_c7_436a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l328_c7_436a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l328_c7_436a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l328_c7_436a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l328_c7_436a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l328_c7_436a_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l307_c7_1487_iffalse := VAR_n8_MUX_uxn_opcodes_h_l310_c7_c0e0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l322_c7_6434_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l328_c7_436a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l310_c7_c0e0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l314_c7_beb8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l322_c7_6434_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l328_c7_436a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l314_c7_beb8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l317_c7_6e03_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l317_c7_6e03_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l322_c7_6434_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l317_c7_6e03_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l322_c7_6434_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l302_c2_4d2f_return_output;
     -- n8_MUX[uxn_opcodes_h_l307_c7_1487] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l307_c7_1487_cond <= VAR_n8_MUX_uxn_opcodes_h_l307_c7_1487_cond;
     n8_MUX_uxn_opcodes_h_l307_c7_1487_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l307_c7_1487_iftrue;
     n8_MUX_uxn_opcodes_h_l307_c7_1487_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l307_c7_1487_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l307_c7_1487_return_output := n8_MUX_uxn_opcodes_h_l307_c7_1487_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l322_c7_6434] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l322_c7_6434_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l322_c7_6434_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l322_c7_6434_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l322_c7_6434_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l322_c7_6434_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l322_c7_6434_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l322_c7_6434_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l322_c7_6434_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l314_c7_beb8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l314_c7_beb8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l314_c7_beb8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l314_c7_beb8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l314_c7_beb8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l314_c7_beb8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l314_c7_beb8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l314_c7_beb8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l314_c7_beb8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l310_c7_c0e0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l310_c7_c0e0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l310_c7_c0e0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l310_c7_c0e0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l310_c7_c0e0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l310_c7_c0e0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l310_c7_c0e0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l310_c7_c0e0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l310_c7_c0e0_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l317_c7_6e03] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l317_c7_6e03_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l317_c7_6e03_cond;
     result_stack_value_MUX_uxn_opcodes_h_l317_c7_6e03_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l317_c7_6e03_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l317_c7_6e03_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l317_c7_6e03_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l317_c7_6e03_return_output := result_stack_value_MUX_uxn_opcodes_h_l317_c7_6e03_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l322_c7_6434] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l322_c7_6434_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l322_c7_6434_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l322_c7_6434_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l322_c7_6434_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l322_c7_6434_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l322_c7_6434_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l322_c7_6434_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l322_c7_6434_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l317_c7_6e03] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l317_c7_6e03_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l317_c7_6e03_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l317_c7_6e03_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l317_c7_6e03_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l317_c7_6e03_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l317_c7_6e03_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l317_c7_6e03_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l317_c7_6e03_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l302_c2_4d2f_iffalse := VAR_n8_MUX_uxn_opcodes_h_l307_c7_1487_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l317_c7_6e03_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l322_c7_6434_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l307_c7_1487_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l310_c7_c0e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l317_c7_6e03_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l322_c7_6434_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l310_c7_c0e0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l314_c7_beb8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_beb8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l317_c7_6e03_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l314_c7_beb8_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l317_c7_6e03_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l317_c7_6e03] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l317_c7_6e03_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l317_c7_6e03_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l317_c7_6e03_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l317_c7_6e03_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l317_c7_6e03_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l317_c7_6e03_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l317_c7_6e03_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l317_c7_6e03_return_output;

     -- n8_MUX[uxn_opcodes_h_l302_c2_4d2f] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l302_c2_4d2f_cond <= VAR_n8_MUX_uxn_opcodes_h_l302_c2_4d2f_cond;
     n8_MUX_uxn_opcodes_h_l302_c2_4d2f_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l302_c2_4d2f_iftrue;
     n8_MUX_uxn_opcodes_h_l302_c2_4d2f_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l302_c2_4d2f_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l302_c2_4d2f_return_output := n8_MUX_uxn_opcodes_h_l302_c2_4d2f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l317_c7_6e03] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l317_c7_6e03_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l317_c7_6e03_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l317_c7_6e03_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l317_c7_6e03_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l317_c7_6e03_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l317_c7_6e03_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l317_c7_6e03_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l317_c7_6e03_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l310_c7_c0e0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l310_c7_c0e0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l310_c7_c0e0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l310_c7_c0e0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l310_c7_c0e0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l310_c7_c0e0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l310_c7_c0e0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l310_c7_c0e0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l310_c7_c0e0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l307_c7_1487] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l307_c7_1487_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l307_c7_1487_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l307_c7_1487_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l307_c7_1487_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l307_c7_1487_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l307_c7_1487_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l307_c7_1487_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l307_c7_1487_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l314_c7_beb8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_beb8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_beb8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_beb8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_beb8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_beb8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_beb8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_beb8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_beb8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l314_c7_beb8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l314_c7_beb8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l314_c7_beb8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l314_c7_beb8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l314_c7_beb8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l314_c7_beb8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l314_c7_beb8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l314_c7_beb8_return_output := result_stack_value_MUX_uxn_opcodes_h_l314_c7_beb8_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l302_c2_4d2f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_beb8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l317_c7_6e03_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l302_c2_4d2f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l307_c7_1487_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_beb8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l317_c7_6e03_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l307_c7_1487_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l310_c7_c0e0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l310_c7_c0e0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_beb8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l310_c7_c0e0_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l314_c7_beb8_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l302_c2_4d2f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l302_c2_4d2f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l302_c2_4d2f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l302_c2_4d2f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l302_c2_4d2f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l302_c2_4d2f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l302_c2_4d2f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l302_c2_4d2f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l302_c2_4d2f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l310_c7_c0e0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l310_c7_c0e0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l310_c7_c0e0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l310_c7_c0e0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l310_c7_c0e0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l310_c7_c0e0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l310_c7_c0e0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l310_c7_c0e0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l310_c7_c0e0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l307_c7_1487] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l307_c7_1487_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l307_c7_1487_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l307_c7_1487_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l307_c7_1487_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l307_c7_1487_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l307_c7_1487_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l307_c7_1487_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l307_c7_1487_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l314_c7_beb8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_beb8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_beb8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_beb8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_beb8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_beb8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_beb8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_beb8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_beb8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l314_c7_beb8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_beb8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_beb8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_beb8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_beb8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_beb8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_beb8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_beb8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_beb8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l310_c7_c0e0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l310_c7_c0e0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l310_c7_c0e0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l310_c7_c0e0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l310_c7_c0e0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l310_c7_c0e0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l310_c7_c0e0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l310_c7_c0e0_return_output := result_stack_value_MUX_uxn_opcodes_h_l310_c7_c0e0_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l310_c7_c0e0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_beb8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l310_c7_c0e0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_beb8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l302_c2_4d2f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l307_c7_1487_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l307_c7_1487_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l310_c7_c0e0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l307_c7_1487_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l310_c7_c0e0_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l307_c7_1487] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l307_c7_1487_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l307_c7_1487_cond;
     result_stack_value_MUX_uxn_opcodes_h_l307_c7_1487_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l307_c7_1487_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l307_c7_1487_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l307_c7_1487_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l307_c7_1487_return_output := result_stack_value_MUX_uxn_opcodes_h_l307_c7_1487_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l310_c7_c0e0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l310_c7_c0e0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l310_c7_c0e0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l310_c7_c0e0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l310_c7_c0e0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l310_c7_c0e0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l310_c7_c0e0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l310_c7_c0e0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l310_c7_c0e0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l310_c7_c0e0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l310_c7_c0e0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l310_c7_c0e0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l310_c7_c0e0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l310_c7_c0e0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l310_c7_c0e0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l310_c7_c0e0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l310_c7_c0e0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l310_c7_c0e0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l302_c2_4d2f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l302_c2_4d2f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l302_c2_4d2f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l302_c2_4d2f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l302_c2_4d2f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l302_c2_4d2f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l302_c2_4d2f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l302_c2_4d2f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l302_c2_4d2f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l307_c7_1487] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l307_c7_1487_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l307_c7_1487_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l307_c7_1487_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l307_c7_1487_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l307_c7_1487_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l307_c7_1487_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l307_c7_1487_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l307_c7_1487_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l307_c7_1487_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l310_c7_c0e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l307_c7_1487_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l310_c7_c0e0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c2_4d2f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l307_c7_1487_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l302_c2_4d2f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l307_c7_1487_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l302_c2_4d2f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l302_c2_4d2f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l302_c2_4d2f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l302_c2_4d2f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l302_c2_4d2f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l302_c2_4d2f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l302_c2_4d2f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l302_c2_4d2f_return_output := result_stack_value_MUX_uxn_opcodes_h_l302_c2_4d2f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l302_c2_4d2f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c2_4d2f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c2_4d2f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c2_4d2f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c2_4d2f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c2_4d2f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c2_4d2f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c2_4d2f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c2_4d2f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l307_c7_1487] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l307_c7_1487_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l307_c7_1487_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l307_c7_1487_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l307_c7_1487_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l307_c7_1487_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l307_c7_1487_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l307_c7_1487_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l307_c7_1487_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l307_c7_1487] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l307_c7_1487_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l307_c7_1487_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l307_c7_1487_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l307_c7_1487_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l307_c7_1487_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l307_c7_1487_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l307_c7_1487_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l307_c7_1487_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l302_c2_4d2f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l307_c7_1487_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l302_c2_4d2f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l307_c7_1487_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l302_c2_4d2f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l302_c2_4d2f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l302_c2_4d2f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l302_c2_4d2f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l302_c2_4d2f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l302_c2_4d2f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l302_c2_4d2f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l302_c2_4d2f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l302_c2_4d2f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l302_c2_4d2f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l302_c2_4d2f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l302_c2_4d2f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l302_c2_4d2f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l302_c2_4d2f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l302_c2_4d2f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l302_c2_4d2f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l302_c2_4d2f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l302_c2_4d2f_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l298_l341_DUPLICATE_f722 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l298_l341_DUPLICATE_f722_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_09c5(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l302_c2_4d2f_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l302_c2_4d2f_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c2_4d2f_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l302_c2_4d2f_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l302_c2_4d2f_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l302_c2_4d2f_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l298_l341_DUPLICATE_f722_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l298_l341_DUPLICATE_f722_return_output;
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
