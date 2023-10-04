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
entity gth2_0CLK_3a9c1537 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end gth2_0CLK_3a9c1537;
architecture arch of gth2_0CLK_3a9c1537 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1516_c6_11fb]
signal BIN_OP_EQ_uxn_opcodes_h_l1516_c6_11fb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1516_c6_11fb_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1516_c6_11fb_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1516_c1_beeb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1516_c1_beeb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1516_c1_beeb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1516_c1_beeb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1516_c1_beeb_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1516_c2_ed45]
signal t16_MUX_uxn_opcodes_h_l1516_c2_ed45_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1516_c2_ed45_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1516_c2_ed45_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1516_c2_ed45_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1516_c2_ed45]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c2_ed45_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c2_ed45_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c2_ed45_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c2_ed45_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1516_c2_ed45]
signal result_stack_value_MUX_uxn_opcodes_h_l1516_c2_ed45_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1516_c2_ed45_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1516_c2_ed45_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1516_c2_ed45_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1516_c2_ed45]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c2_ed45_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c2_ed45_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c2_ed45_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c2_ed45_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1516_c2_ed45]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1516_c2_ed45_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1516_c2_ed45_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1516_c2_ed45_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1516_c2_ed45_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1516_c2_ed45]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1516_c2_ed45_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1516_c2_ed45_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1516_c2_ed45_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1516_c2_ed45_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1516_c2_ed45]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c2_ed45_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c2_ed45_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c2_ed45_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c2_ed45_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1516_c2_ed45]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1516_c2_ed45_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1516_c2_ed45_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1516_c2_ed45_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1516_c2_ed45_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1516_c2_ed45]
signal n16_MUX_uxn_opcodes_h_l1516_c2_ed45_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1516_c2_ed45_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1516_c2_ed45_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1516_c2_ed45_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1517_c3_a318[uxn_opcodes_h_l1517_c3_a318]
signal printf_uxn_opcodes_h_l1517_c3_a318_uxn_opcodes_h_l1517_c3_a318_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1522_c11_d151]
signal BIN_OP_EQ_uxn_opcodes_h_l1522_c11_d151_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1522_c11_d151_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1522_c11_d151_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1522_c7_d684]
signal t16_MUX_uxn_opcodes_h_l1522_c7_d684_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1522_c7_d684_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1522_c7_d684_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1522_c7_d684_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1522_c7_d684]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_d684_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_d684_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_d684_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_d684_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1522_c7_d684]
signal result_stack_value_MUX_uxn_opcodes_h_l1522_c7_d684_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1522_c7_d684_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1522_c7_d684_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1522_c7_d684_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1522_c7_d684]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_d684_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_d684_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_d684_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_d684_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1522_c7_d684]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1522_c7_d684_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1522_c7_d684_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1522_c7_d684_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1522_c7_d684_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1522_c7_d684]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_d684_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_d684_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_d684_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_d684_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1522_c7_d684]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_d684_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_d684_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_d684_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_d684_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1522_c7_d684]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_d684_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_d684_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_d684_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_d684_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1522_c7_d684]
signal n16_MUX_uxn_opcodes_h_l1522_c7_d684_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1522_c7_d684_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1522_c7_d684_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1522_c7_d684_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1525_c11_5442]
signal BIN_OP_EQ_uxn_opcodes_h_l1525_c11_5442_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1525_c11_5442_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1525_c11_5442_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1525_c7_b95b]
signal t16_MUX_uxn_opcodes_h_l1525_c7_b95b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1525_c7_b95b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1525_c7_b95b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1525_c7_b95b_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1525_c7_b95b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1525_c7_b95b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1525_c7_b95b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1525_c7_b95b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1525_c7_b95b_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1525_c7_b95b]
signal result_stack_value_MUX_uxn_opcodes_h_l1525_c7_b95b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1525_c7_b95b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1525_c7_b95b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1525_c7_b95b_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1525_c7_b95b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1525_c7_b95b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1525_c7_b95b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1525_c7_b95b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1525_c7_b95b_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1525_c7_b95b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1525_c7_b95b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1525_c7_b95b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1525_c7_b95b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1525_c7_b95b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1525_c7_b95b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_b95b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_b95b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_b95b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_b95b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1525_c7_b95b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_b95b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_b95b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_b95b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_b95b_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1525_c7_b95b]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1525_c7_b95b_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1525_c7_b95b_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1525_c7_b95b_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1525_c7_b95b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1525_c7_b95b]
signal n16_MUX_uxn_opcodes_h_l1525_c7_b95b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1525_c7_b95b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1525_c7_b95b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1525_c7_b95b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1530_c11_8552]
signal BIN_OP_EQ_uxn_opcodes_h_l1530_c11_8552_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1530_c11_8552_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1530_c11_8552_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1530_c7_1b1c]
signal t16_MUX_uxn_opcodes_h_l1530_c7_1b1c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1530_c7_1b1c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1530_c7_1b1c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1530_c7_1b1c_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1530_c7_1b1c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1530_c7_1b1c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1530_c7_1b1c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1530_c7_1b1c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1530_c7_1b1c_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1530_c7_1b1c]
signal result_stack_value_MUX_uxn_opcodes_h_l1530_c7_1b1c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1530_c7_1b1c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1530_c7_1b1c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1530_c7_1b1c_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1530_c7_1b1c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1530_c7_1b1c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1530_c7_1b1c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1530_c7_1b1c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1530_c7_1b1c_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1530_c7_1b1c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1530_c7_1b1c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1530_c7_1b1c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1530_c7_1b1c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1530_c7_1b1c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1530_c7_1b1c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1530_c7_1b1c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1530_c7_1b1c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1530_c7_1b1c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1530_c7_1b1c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1530_c7_1b1c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1530_c7_1b1c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1530_c7_1b1c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1530_c7_1b1c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1530_c7_1b1c_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1530_c7_1b1c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1530_c7_1b1c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1530_c7_1b1c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1530_c7_1b1c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1530_c7_1b1c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1530_c7_1b1c]
signal n16_MUX_uxn_opcodes_h_l1530_c7_1b1c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1530_c7_1b1c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1530_c7_1b1c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1530_c7_1b1c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1533_c11_8778]
signal BIN_OP_EQ_uxn_opcodes_h_l1533_c11_8778_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1533_c11_8778_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1533_c11_8778_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1533_c7_a73e]
signal t16_MUX_uxn_opcodes_h_l1533_c7_a73e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1533_c7_a73e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1533_c7_a73e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1533_c7_a73e_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1533_c7_a73e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1533_c7_a73e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1533_c7_a73e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1533_c7_a73e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1533_c7_a73e_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1533_c7_a73e]
signal result_stack_value_MUX_uxn_opcodes_h_l1533_c7_a73e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1533_c7_a73e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1533_c7_a73e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1533_c7_a73e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1533_c7_a73e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1533_c7_a73e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1533_c7_a73e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1533_c7_a73e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1533_c7_a73e_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1533_c7_a73e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1533_c7_a73e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1533_c7_a73e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1533_c7_a73e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1533_c7_a73e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1533_c7_a73e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1533_c7_a73e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1533_c7_a73e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1533_c7_a73e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1533_c7_a73e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1533_c7_a73e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1533_c7_a73e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1533_c7_a73e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1533_c7_a73e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1533_c7_a73e_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1533_c7_a73e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1533_c7_a73e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1533_c7_a73e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1533_c7_a73e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1533_c7_a73e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1533_c7_a73e]
signal n16_MUX_uxn_opcodes_h_l1533_c7_a73e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1533_c7_a73e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1533_c7_a73e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1533_c7_a73e_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1534_c3_d518]
signal BIN_OP_OR_uxn_opcodes_h_l1534_c3_d518_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1534_c3_d518_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1534_c3_d518_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1537_c11_bc5f]
signal BIN_OP_EQ_uxn_opcodes_h_l1537_c11_bc5f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1537_c11_bc5f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1537_c11_bc5f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1537_c7_2619]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1537_c7_2619_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1537_c7_2619_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1537_c7_2619_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1537_c7_2619_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1537_c7_2619]
signal result_stack_value_MUX_uxn_opcodes_h_l1537_c7_2619_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1537_c7_2619_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1537_c7_2619_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1537_c7_2619_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1537_c7_2619]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_2619_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_2619_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_2619_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_2619_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1537_c7_2619]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1537_c7_2619_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1537_c7_2619_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1537_c7_2619_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1537_c7_2619_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1537_c7_2619]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_2619_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_2619_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_2619_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_2619_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1537_c7_2619]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1537_c7_2619_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1537_c7_2619_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1537_c7_2619_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1537_c7_2619_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1537_c7_2619]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1537_c7_2619_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1537_c7_2619_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1537_c7_2619_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1537_c7_2619_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1537_c7_2619]
signal n16_MUX_uxn_opcodes_h_l1537_c7_2619_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1537_c7_2619_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1537_c7_2619_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1537_c7_2619_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1540_c11_eaaa]
signal BIN_OP_EQ_uxn_opcodes_h_l1540_c11_eaaa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1540_c11_eaaa_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1540_c11_eaaa_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1540_c7_226a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1540_c7_226a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1540_c7_226a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1540_c7_226a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1540_c7_226a_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1540_c7_226a]
signal result_stack_value_MUX_uxn_opcodes_h_l1540_c7_226a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1540_c7_226a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1540_c7_226a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1540_c7_226a_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1540_c7_226a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_226a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_226a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_226a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_226a_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1540_c7_226a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1540_c7_226a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1540_c7_226a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1540_c7_226a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1540_c7_226a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1540_c7_226a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_226a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_226a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_226a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_226a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1540_c7_226a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1540_c7_226a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1540_c7_226a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1540_c7_226a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1540_c7_226a_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1540_c7_226a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1540_c7_226a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1540_c7_226a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1540_c7_226a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1540_c7_226a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1540_c7_226a]
signal n16_MUX_uxn_opcodes_h_l1540_c7_226a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1540_c7_226a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1540_c7_226a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1540_c7_226a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1545_c11_8db6]
signal BIN_OP_EQ_uxn_opcodes_h_l1545_c11_8db6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1545_c11_8db6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1545_c11_8db6_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1545_c7_a781]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1545_c7_a781_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1545_c7_a781_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1545_c7_a781_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1545_c7_a781_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1545_c7_a781]
signal result_stack_value_MUX_uxn_opcodes_h_l1545_c7_a781_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1545_c7_a781_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1545_c7_a781_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1545_c7_a781_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1545_c7_a781]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1545_c7_a781_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1545_c7_a781_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1545_c7_a781_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1545_c7_a781_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1545_c7_a781]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1545_c7_a781_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1545_c7_a781_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1545_c7_a781_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1545_c7_a781_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1545_c7_a781]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1545_c7_a781_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1545_c7_a781_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1545_c7_a781_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1545_c7_a781_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1545_c7_a781]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1545_c7_a781_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1545_c7_a781_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1545_c7_a781_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1545_c7_a781_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1545_c7_a781]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1545_c7_a781_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1545_c7_a781_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1545_c7_a781_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1545_c7_a781_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1545_c7_a781]
signal n16_MUX_uxn_opcodes_h_l1545_c7_a781_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1545_c7_a781_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1545_c7_a781_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1545_c7_a781_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1548_c11_4509]
signal BIN_OP_EQ_uxn_opcodes_h_l1548_c11_4509_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1548_c11_4509_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1548_c11_4509_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1548_c7_c35c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1548_c7_c35c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1548_c7_c35c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1548_c7_c35c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1548_c7_c35c_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1548_c7_c35c]
signal result_stack_value_MUX_uxn_opcodes_h_l1548_c7_c35c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1548_c7_c35c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1548_c7_c35c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1548_c7_c35c_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1548_c7_c35c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1548_c7_c35c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1548_c7_c35c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1548_c7_c35c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1548_c7_c35c_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1548_c7_c35c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1548_c7_c35c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1548_c7_c35c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1548_c7_c35c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1548_c7_c35c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1548_c7_c35c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1548_c7_c35c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1548_c7_c35c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1548_c7_c35c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1548_c7_c35c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1548_c7_c35c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1548_c7_c35c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1548_c7_c35c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1548_c7_c35c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1548_c7_c35c_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1548_c7_c35c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1548_c7_c35c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1548_c7_c35c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1548_c7_c35c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1548_c7_c35c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1548_c7_c35c]
signal n16_MUX_uxn_opcodes_h_l1548_c7_c35c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1548_c7_c35c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1548_c7_c35c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1548_c7_c35c_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1549_c3_1f11]
signal BIN_OP_OR_uxn_opcodes_h_l1549_c3_1f11_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1549_c3_1f11_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1549_c3_1f11_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1552_c32_1147]
signal BIN_OP_AND_uxn_opcodes_h_l1552_c32_1147_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1552_c32_1147_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1552_c32_1147_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1552_c32_2c08]
signal BIN_OP_GT_uxn_opcodes_h_l1552_c32_2c08_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1552_c32_2c08_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1552_c32_2c08_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1552_c32_8ca0]
signal MUX_uxn_opcodes_h_l1552_c32_8ca0_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1552_c32_8ca0_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1552_c32_8ca0_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1552_c32_8ca0_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1554_c11_aa10]
signal BIN_OP_EQ_uxn_opcodes_h_l1554_c11_aa10_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1554_c11_aa10_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1554_c11_aa10_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1554_c7_6739]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1554_c7_6739_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1554_c7_6739_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1554_c7_6739_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1554_c7_6739_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1554_c7_6739]
signal result_stack_value_MUX_uxn_opcodes_h_l1554_c7_6739_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1554_c7_6739_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1554_c7_6739_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1554_c7_6739_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1554_c7_6739]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1554_c7_6739_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1554_c7_6739_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1554_c7_6739_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1554_c7_6739_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1554_c7_6739]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1554_c7_6739_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1554_c7_6739_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1554_c7_6739_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1554_c7_6739_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1554_c7_6739]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1554_c7_6739_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1554_c7_6739_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1554_c7_6739_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1554_c7_6739_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1558_c24_ca93]
signal BIN_OP_GT_uxn_opcodes_h_l1558_c24_ca93_left : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1558_c24_ca93_right : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1558_c24_ca93_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1558_c24_6c0d]
signal MUX_uxn_opcodes_h_l1558_c24_6c0d_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1558_c24_6c0d_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1558_c24_6c0d_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1558_c24_6c0d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1560_c11_54e4]
signal BIN_OP_EQ_uxn_opcodes_h_l1560_c11_54e4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1560_c11_54e4_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1560_c11_54e4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1560_c7_4eff]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_4eff_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_4eff_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_4eff_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_4eff_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1560_c7_4eff]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_4eff_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_4eff_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_4eff_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_4eff_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1542_l1527_DUPLICATE_4260
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1542_l1527_DUPLICATE_4260_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1542_l1527_DUPLICATE_4260_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_e56b( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_sp_shift := ref_toks_1;
      base.stack_value := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.is_stack_read := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1516_c6_11fb
BIN_OP_EQ_uxn_opcodes_h_l1516_c6_11fb : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1516_c6_11fb_left,
BIN_OP_EQ_uxn_opcodes_h_l1516_c6_11fb_right,
BIN_OP_EQ_uxn_opcodes_h_l1516_c6_11fb_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1516_c1_beeb
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1516_c1_beeb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1516_c1_beeb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1516_c1_beeb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1516_c1_beeb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1516_c1_beeb_return_output);

-- t16_MUX_uxn_opcodes_h_l1516_c2_ed45
t16_MUX_uxn_opcodes_h_l1516_c2_ed45 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1516_c2_ed45_cond,
t16_MUX_uxn_opcodes_h_l1516_c2_ed45_iftrue,
t16_MUX_uxn_opcodes_h_l1516_c2_ed45_iffalse,
t16_MUX_uxn_opcodes_h_l1516_c2_ed45_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c2_ed45
result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c2_ed45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c2_ed45_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c2_ed45_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c2_ed45_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c2_ed45_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1516_c2_ed45
result_stack_value_MUX_uxn_opcodes_h_l1516_c2_ed45 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1516_c2_ed45_cond,
result_stack_value_MUX_uxn_opcodes_h_l1516_c2_ed45_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1516_c2_ed45_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1516_c2_ed45_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c2_ed45
result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c2_ed45 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c2_ed45_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c2_ed45_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c2_ed45_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c2_ed45_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1516_c2_ed45
result_is_stack_write_MUX_uxn_opcodes_h_l1516_c2_ed45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1516_c2_ed45_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1516_c2_ed45_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1516_c2_ed45_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1516_c2_ed45_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1516_c2_ed45
result_is_opc_done_MUX_uxn_opcodes_h_l1516_c2_ed45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1516_c2_ed45_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1516_c2_ed45_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1516_c2_ed45_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1516_c2_ed45_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c2_ed45
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c2_ed45 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c2_ed45_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c2_ed45_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c2_ed45_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c2_ed45_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1516_c2_ed45
result_is_stack_read_MUX_uxn_opcodes_h_l1516_c2_ed45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1516_c2_ed45_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1516_c2_ed45_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1516_c2_ed45_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1516_c2_ed45_return_output);

-- n16_MUX_uxn_opcodes_h_l1516_c2_ed45
n16_MUX_uxn_opcodes_h_l1516_c2_ed45 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1516_c2_ed45_cond,
n16_MUX_uxn_opcodes_h_l1516_c2_ed45_iftrue,
n16_MUX_uxn_opcodes_h_l1516_c2_ed45_iffalse,
n16_MUX_uxn_opcodes_h_l1516_c2_ed45_return_output);

-- printf_uxn_opcodes_h_l1517_c3_a318_uxn_opcodes_h_l1517_c3_a318
printf_uxn_opcodes_h_l1517_c3_a318_uxn_opcodes_h_l1517_c3_a318 : entity work.printf_uxn_opcodes_h_l1517_c3_a318_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1517_c3_a318_uxn_opcodes_h_l1517_c3_a318_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1522_c11_d151
BIN_OP_EQ_uxn_opcodes_h_l1522_c11_d151 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1522_c11_d151_left,
BIN_OP_EQ_uxn_opcodes_h_l1522_c11_d151_right,
BIN_OP_EQ_uxn_opcodes_h_l1522_c11_d151_return_output);

-- t16_MUX_uxn_opcodes_h_l1522_c7_d684
t16_MUX_uxn_opcodes_h_l1522_c7_d684 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1522_c7_d684_cond,
t16_MUX_uxn_opcodes_h_l1522_c7_d684_iftrue,
t16_MUX_uxn_opcodes_h_l1522_c7_d684_iffalse,
t16_MUX_uxn_opcodes_h_l1522_c7_d684_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_d684
result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_d684 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_d684_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_d684_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_d684_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_d684_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1522_c7_d684
result_stack_value_MUX_uxn_opcodes_h_l1522_c7_d684 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1522_c7_d684_cond,
result_stack_value_MUX_uxn_opcodes_h_l1522_c7_d684_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1522_c7_d684_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1522_c7_d684_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_d684
result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_d684 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_d684_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_d684_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_d684_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_d684_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1522_c7_d684
result_is_stack_write_MUX_uxn_opcodes_h_l1522_c7_d684 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1522_c7_d684_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1522_c7_d684_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1522_c7_d684_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1522_c7_d684_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_d684
result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_d684 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_d684_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_d684_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_d684_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_d684_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_d684
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_d684 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_d684_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_d684_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_d684_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_d684_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_d684
result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_d684 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_d684_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_d684_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_d684_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_d684_return_output);

-- n16_MUX_uxn_opcodes_h_l1522_c7_d684
n16_MUX_uxn_opcodes_h_l1522_c7_d684 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1522_c7_d684_cond,
n16_MUX_uxn_opcodes_h_l1522_c7_d684_iftrue,
n16_MUX_uxn_opcodes_h_l1522_c7_d684_iffalse,
n16_MUX_uxn_opcodes_h_l1522_c7_d684_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1525_c11_5442
BIN_OP_EQ_uxn_opcodes_h_l1525_c11_5442 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1525_c11_5442_left,
BIN_OP_EQ_uxn_opcodes_h_l1525_c11_5442_right,
BIN_OP_EQ_uxn_opcodes_h_l1525_c11_5442_return_output);

-- t16_MUX_uxn_opcodes_h_l1525_c7_b95b
t16_MUX_uxn_opcodes_h_l1525_c7_b95b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1525_c7_b95b_cond,
t16_MUX_uxn_opcodes_h_l1525_c7_b95b_iftrue,
t16_MUX_uxn_opcodes_h_l1525_c7_b95b_iffalse,
t16_MUX_uxn_opcodes_h_l1525_c7_b95b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1525_c7_b95b
result_is_sp_shift_MUX_uxn_opcodes_h_l1525_c7_b95b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1525_c7_b95b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1525_c7_b95b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1525_c7_b95b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1525_c7_b95b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1525_c7_b95b
result_stack_value_MUX_uxn_opcodes_h_l1525_c7_b95b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1525_c7_b95b_cond,
result_stack_value_MUX_uxn_opcodes_h_l1525_c7_b95b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1525_c7_b95b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1525_c7_b95b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1525_c7_b95b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1525_c7_b95b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1525_c7_b95b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1525_c7_b95b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1525_c7_b95b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1525_c7_b95b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1525_c7_b95b
result_is_stack_write_MUX_uxn_opcodes_h_l1525_c7_b95b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1525_c7_b95b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1525_c7_b95b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1525_c7_b95b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1525_c7_b95b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_b95b
result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_b95b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_b95b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_b95b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_b95b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_b95b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_b95b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_b95b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_b95b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_b95b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_b95b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_b95b_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1525_c7_b95b
result_is_stack_read_MUX_uxn_opcodes_h_l1525_c7_b95b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1525_c7_b95b_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1525_c7_b95b_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1525_c7_b95b_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1525_c7_b95b_return_output);

-- n16_MUX_uxn_opcodes_h_l1525_c7_b95b
n16_MUX_uxn_opcodes_h_l1525_c7_b95b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1525_c7_b95b_cond,
n16_MUX_uxn_opcodes_h_l1525_c7_b95b_iftrue,
n16_MUX_uxn_opcodes_h_l1525_c7_b95b_iffalse,
n16_MUX_uxn_opcodes_h_l1525_c7_b95b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1530_c11_8552
BIN_OP_EQ_uxn_opcodes_h_l1530_c11_8552 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1530_c11_8552_left,
BIN_OP_EQ_uxn_opcodes_h_l1530_c11_8552_right,
BIN_OP_EQ_uxn_opcodes_h_l1530_c11_8552_return_output);

-- t16_MUX_uxn_opcodes_h_l1530_c7_1b1c
t16_MUX_uxn_opcodes_h_l1530_c7_1b1c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1530_c7_1b1c_cond,
t16_MUX_uxn_opcodes_h_l1530_c7_1b1c_iftrue,
t16_MUX_uxn_opcodes_h_l1530_c7_1b1c_iffalse,
t16_MUX_uxn_opcodes_h_l1530_c7_1b1c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1530_c7_1b1c
result_is_sp_shift_MUX_uxn_opcodes_h_l1530_c7_1b1c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1530_c7_1b1c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1530_c7_1b1c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1530_c7_1b1c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1530_c7_1b1c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1530_c7_1b1c
result_stack_value_MUX_uxn_opcodes_h_l1530_c7_1b1c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1530_c7_1b1c_cond,
result_stack_value_MUX_uxn_opcodes_h_l1530_c7_1b1c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1530_c7_1b1c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1530_c7_1b1c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1530_c7_1b1c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1530_c7_1b1c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1530_c7_1b1c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1530_c7_1b1c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1530_c7_1b1c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1530_c7_1b1c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1530_c7_1b1c
result_is_stack_write_MUX_uxn_opcodes_h_l1530_c7_1b1c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1530_c7_1b1c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1530_c7_1b1c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1530_c7_1b1c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1530_c7_1b1c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1530_c7_1b1c
result_is_opc_done_MUX_uxn_opcodes_h_l1530_c7_1b1c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1530_c7_1b1c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1530_c7_1b1c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1530_c7_1b1c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1530_c7_1b1c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1530_c7_1b1c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1530_c7_1b1c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1530_c7_1b1c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1530_c7_1b1c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1530_c7_1b1c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1530_c7_1b1c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1530_c7_1b1c
result_is_stack_read_MUX_uxn_opcodes_h_l1530_c7_1b1c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1530_c7_1b1c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1530_c7_1b1c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1530_c7_1b1c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1530_c7_1b1c_return_output);

-- n16_MUX_uxn_opcodes_h_l1530_c7_1b1c
n16_MUX_uxn_opcodes_h_l1530_c7_1b1c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1530_c7_1b1c_cond,
n16_MUX_uxn_opcodes_h_l1530_c7_1b1c_iftrue,
n16_MUX_uxn_opcodes_h_l1530_c7_1b1c_iffalse,
n16_MUX_uxn_opcodes_h_l1530_c7_1b1c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1533_c11_8778
BIN_OP_EQ_uxn_opcodes_h_l1533_c11_8778 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1533_c11_8778_left,
BIN_OP_EQ_uxn_opcodes_h_l1533_c11_8778_right,
BIN_OP_EQ_uxn_opcodes_h_l1533_c11_8778_return_output);

-- t16_MUX_uxn_opcodes_h_l1533_c7_a73e
t16_MUX_uxn_opcodes_h_l1533_c7_a73e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1533_c7_a73e_cond,
t16_MUX_uxn_opcodes_h_l1533_c7_a73e_iftrue,
t16_MUX_uxn_opcodes_h_l1533_c7_a73e_iffalse,
t16_MUX_uxn_opcodes_h_l1533_c7_a73e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1533_c7_a73e
result_is_sp_shift_MUX_uxn_opcodes_h_l1533_c7_a73e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1533_c7_a73e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1533_c7_a73e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1533_c7_a73e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1533_c7_a73e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1533_c7_a73e
result_stack_value_MUX_uxn_opcodes_h_l1533_c7_a73e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1533_c7_a73e_cond,
result_stack_value_MUX_uxn_opcodes_h_l1533_c7_a73e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1533_c7_a73e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1533_c7_a73e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1533_c7_a73e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1533_c7_a73e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1533_c7_a73e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1533_c7_a73e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1533_c7_a73e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1533_c7_a73e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1533_c7_a73e
result_is_stack_write_MUX_uxn_opcodes_h_l1533_c7_a73e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1533_c7_a73e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1533_c7_a73e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1533_c7_a73e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1533_c7_a73e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1533_c7_a73e
result_is_opc_done_MUX_uxn_opcodes_h_l1533_c7_a73e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1533_c7_a73e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1533_c7_a73e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1533_c7_a73e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1533_c7_a73e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1533_c7_a73e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1533_c7_a73e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1533_c7_a73e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1533_c7_a73e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1533_c7_a73e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1533_c7_a73e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1533_c7_a73e
result_is_stack_read_MUX_uxn_opcodes_h_l1533_c7_a73e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1533_c7_a73e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1533_c7_a73e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1533_c7_a73e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1533_c7_a73e_return_output);

-- n16_MUX_uxn_opcodes_h_l1533_c7_a73e
n16_MUX_uxn_opcodes_h_l1533_c7_a73e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1533_c7_a73e_cond,
n16_MUX_uxn_opcodes_h_l1533_c7_a73e_iftrue,
n16_MUX_uxn_opcodes_h_l1533_c7_a73e_iffalse,
n16_MUX_uxn_opcodes_h_l1533_c7_a73e_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1534_c3_d518
BIN_OP_OR_uxn_opcodes_h_l1534_c3_d518 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1534_c3_d518_left,
BIN_OP_OR_uxn_opcodes_h_l1534_c3_d518_right,
BIN_OP_OR_uxn_opcodes_h_l1534_c3_d518_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1537_c11_bc5f
BIN_OP_EQ_uxn_opcodes_h_l1537_c11_bc5f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1537_c11_bc5f_left,
BIN_OP_EQ_uxn_opcodes_h_l1537_c11_bc5f_right,
BIN_OP_EQ_uxn_opcodes_h_l1537_c11_bc5f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1537_c7_2619
result_is_sp_shift_MUX_uxn_opcodes_h_l1537_c7_2619 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1537_c7_2619_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1537_c7_2619_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1537_c7_2619_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1537_c7_2619_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1537_c7_2619
result_stack_value_MUX_uxn_opcodes_h_l1537_c7_2619 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1537_c7_2619_cond,
result_stack_value_MUX_uxn_opcodes_h_l1537_c7_2619_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1537_c7_2619_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1537_c7_2619_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_2619
result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_2619 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_2619_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_2619_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_2619_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_2619_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1537_c7_2619
result_is_stack_write_MUX_uxn_opcodes_h_l1537_c7_2619 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1537_c7_2619_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1537_c7_2619_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1537_c7_2619_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1537_c7_2619_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_2619
result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_2619 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_2619_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_2619_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_2619_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_2619_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1537_c7_2619
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1537_c7_2619 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1537_c7_2619_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1537_c7_2619_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1537_c7_2619_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1537_c7_2619_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1537_c7_2619
result_is_stack_read_MUX_uxn_opcodes_h_l1537_c7_2619 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1537_c7_2619_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1537_c7_2619_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1537_c7_2619_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1537_c7_2619_return_output);

-- n16_MUX_uxn_opcodes_h_l1537_c7_2619
n16_MUX_uxn_opcodes_h_l1537_c7_2619 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1537_c7_2619_cond,
n16_MUX_uxn_opcodes_h_l1537_c7_2619_iftrue,
n16_MUX_uxn_opcodes_h_l1537_c7_2619_iffalse,
n16_MUX_uxn_opcodes_h_l1537_c7_2619_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1540_c11_eaaa
BIN_OP_EQ_uxn_opcodes_h_l1540_c11_eaaa : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1540_c11_eaaa_left,
BIN_OP_EQ_uxn_opcodes_h_l1540_c11_eaaa_right,
BIN_OP_EQ_uxn_opcodes_h_l1540_c11_eaaa_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1540_c7_226a
result_is_sp_shift_MUX_uxn_opcodes_h_l1540_c7_226a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1540_c7_226a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1540_c7_226a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1540_c7_226a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1540_c7_226a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1540_c7_226a
result_stack_value_MUX_uxn_opcodes_h_l1540_c7_226a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1540_c7_226a_cond,
result_stack_value_MUX_uxn_opcodes_h_l1540_c7_226a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1540_c7_226a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1540_c7_226a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_226a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_226a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_226a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_226a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_226a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_226a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1540_c7_226a
result_is_stack_write_MUX_uxn_opcodes_h_l1540_c7_226a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1540_c7_226a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1540_c7_226a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1540_c7_226a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1540_c7_226a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_226a
result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_226a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_226a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_226a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_226a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_226a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1540_c7_226a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1540_c7_226a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1540_c7_226a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1540_c7_226a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1540_c7_226a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1540_c7_226a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1540_c7_226a
result_is_stack_read_MUX_uxn_opcodes_h_l1540_c7_226a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1540_c7_226a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1540_c7_226a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1540_c7_226a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1540_c7_226a_return_output);

-- n16_MUX_uxn_opcodes_h_l1540_c7_226a
n16_MUX_uxn_opcodes_h_l1540_c7_226a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1540_c7_226a_cond,
n16_MUX_uxn_opcodes_h_l1540_c7_226a_iftrue,
n16_MUX_uxn_opcodes_h_l1540_c7_226a_iffalse,
n16_MUX_uxn_opcodes_h_l1540_c7_226a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1545_c11_8db6
BIN_OP_EQ_uxn_opcodes_h_l1545_c11_8db6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1545_c11_8db6_left,
BIN_OP_EQ_uxn_opcodes_h_l1545_c11_8db6_right,
BIN_OP_EQ_uxn_opcodes_h_l1545_c11_8db6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1545_c7_a781
result_is_sp_shift_MUX_uxn_opcodes_h_l1545_c7_a781 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1545_c7_a781_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1545_c7_a781_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1545_c7_a781_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1545_c7_a781_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1545_c7_a781
result_stack_value_MUX_uxn_opcodes_h_l1545_c7_a781 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1545_c7_a781_cond,
result_stack_value_MUX_uxn_opcodes_h_l1545_c7_a781_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1545_c7_a781_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1545_c7_a781_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1545_c7_a781
result_sp_relative_shift_MUX_uxn_opcodes_h_l1545_c7_a781 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1545_c7_a781_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1545_c7_a781_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1545_c7_a781_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1545_c7_a781_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1545_c7_a781
result_is_stack_write_MUX_uxn_opcodes_h_l1545_c7_a781 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1545_c7_a781_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1545_c7_a781_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1545_c7_a781_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1545_c7_a781_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1545_c7_a781
result_is_opc_done_MUX_uxn_opcodes_h_l1545_c7_a781 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1545_c7_a781_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1545_c7_a781_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1545_c7_a781_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1545_c7_a781_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1545_c7_a781
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1545_c7_a781 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1545_c7_a781_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1545_c7_a781_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1545_c7_a781_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1545_c7_a781_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1545_c7_a781
result_is_stack_read_MUX_uxn_opcodes_h_l1545_c7_a781 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1545_c7_a781_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1545_c7_a781_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1545_c7_a781_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1545_c7_a781_return_output);

-- n16_MUX_uxn_opcodes_h_l1545_c7_a781
n16_MUX_uxn_opcodes_h_l1545_c7_a781 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1545_c7_a781_cond,
n16_MUX_uxn_opcodes_h_l1545_c7_a781_iftrue,
n16_MUX_uxn_opcodes_h_l1545_c7_a781_iffalse,
n16_MUX_uxn_opcodes_h_l1545_c7_a781_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1548_c11_4509
BIN_OP_EQ_uxn_opcodes_h_l1548_c11_4509 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1548_c11_4509_left,
BIN_OP_EQ_uxn_opcodes_h_l1548_c11_4509_right,
BIN_OP_EQ_uxn_opcodes_h_l1548_c11_4509_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1548_c7_c35c
result_is_sp_shift_MUX_uxn_opcodes_h_l1548_c7_c35c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1548_c7_c35c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1548_c7_c35c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1548_c7_c35c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1548_c7_c35c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1548_c7_c35c
result_stack_value_MUX_uxn_opcodes_h_l1548_c7_c35c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1548_c7_c35c_cond,
result_stack_value_MUX_uxn_opcodes_h_l1548_c7_c35c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1548_c7_c35c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1548_c7_c35c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1548_c7_c35c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1548_c7_c35c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1548_c7_c35c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1548_c7_c35c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1548_c7_c35c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1548_c7_c35c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1548_c7_c35c
result_is_stack_write_MUX_uxn_opcodes_h_l1548_c7_c35c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1548_c7_c35c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1548_c7_c35c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1548_c7_c35c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1548_c7_c35c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1548_c7_c35c
result_is_opc_done_MUX_uxn_opcodes_h_l1548_c7_c35c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1548_c7_c35c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1548_c7_c35c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1548_c7_c35c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1548_c7_c35c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1548_c7_c35c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1548_c7_c35c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1548_c7_c35c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1548_c7_c35c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1548_c7_c35c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1548_c7_c35c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1548_c7_c35c
result_is_stack_read_MUX_uxn_opcodes_h_l1548_c7_c35c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1548_c7_c35c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1548_c7_c35c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1548_c7_c35c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1548_c7_c35c_return_output);

-- n16_MUX_uxn_opcodes_h_l1548_c7_c35c
n16_MUX_uxn_opcodes_h_l1548_c7_c35c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1548_c7_c35c_cond,
n16_MUX_uxn_opcodes_h_l1548_c7_c35c_iftrue,
n16_MUX_uxn_opcodes_h_l1548_c7_c35c_iffalse,
n16_MUX_uxn_opcodes_h_l1548_c7_c35c_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1549_c3_1f11
BIN_OP_OR_uxn_opcodes_h_l1549_c3_1f11 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1549_c3_1f11_left,
BIN_OP_OR_uxn_opcodes_h_l1549_c3_1f11_right,
BIN_OP_OR_uxn_opcodes_h_l1549_c3_1f11_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1552_c32_1147
BIN_OP_AND_uxn_opcodes_h_l1552_c32_1147 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1552_c32_1147_left,
BIN_OP_AND_uxn_opcodes_h_l1552_c32_1147_right,
BIN_OP_AND_uxn_opcodes_h_l1552_c32_1147_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1552_c32_2c08
BIN_OP_GT_uxn_opcodes_h_l1552_c32_2c08 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1552_c32_2c08_left,
BIN_OP_GT_uxn_opcodes_h_l1552_c32_2c08_right,
BIN_OP_GT_uxn_opcodes_h_l1552_c32_2c08_return_output);

-- MUX_uxn_opcodes_h_l1552_c32_8ca0
MUX_uxn_opcodes_h_l1552_c32_8ca0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1552_c32_8ca0_cond,
MUX_uxn_opcodes_h_l1552_c32_8ca0_iftrue,
MUX_uxn_opcodes_h_l1552_c32_8ca0_iffalse,
MUX_uxn_opcodes_h_l1552_c32_8ca0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1554_c11_aa10
BIN_OP_EQ_uxn_opcodes_h_l1554_c11_aa10 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1554_c11_aa10_left,
BIN_OP_EQ_uxn_opcodes_h_l1554_c11_aa10_right,
BIN_OP_EQ_uxn_opcodes_h_l1554_c11_aa10_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1554_c7_6739
result_is_sp_shift_MUX_uxn_opcodes_h_l1554_c7_6739 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1554_c7_6739_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1554_c7_6739_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1554_c7_6739_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1554_c7_6739_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1554_c7_6739
result_stack_value_MUX_uxn_opcodes_h_l1554_c7_6739 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1554_c7_6739_cond,
result_stack_value_MUX_uxn_opcodes_h_l1554_c7_6739_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1554_c7_6739_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1554_c7_6739_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1554_c7_6739
result_is_opc_done_MUX_uxn_opcodes_h_l1554_c7_6739 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1554_c7_6739_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1554_c7_6739_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1554_c7_6739_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1554_c7_6739_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1554_c7_6739
result_is_stack_write_MUX_uxn_opcodes_h_l1554_c7_6739 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1554_c7_6739_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1554_c7_6739_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1554_c7_6739_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1554_c7_6739_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1554_c7_6739
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1554_c7_6739 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1554_c7_6739_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1554_c7_6739_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1554_c7_6739_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1554_c7_6739_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1558_c24_ca93
BIN_OP_GT_uxn_opcodes_h_l1558_c24_ca93 : entity work.BIN_OP_GT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1558_c24_ca93_left,
BIN_OP_GT_uxn_opcodes_h_l1558_c24_ca93_right,
BIN_OP_GT_uxn_opcodes_h_l1558_c24_ca93_return_output);

-- MUX_uxn_opcodes_h_l1558_c24_6c0d
MUX_uxn_opcodes_h_l1558_c24_6c0d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1558_c24_6c0d_cond,
MUX_uxn_opcodes_h_l1558_c24_6c0d_iftrue,
MUX_uxn_opcodes_h_l1558_c24_6c0d_iffalse,
MUX_uxn_opcodes_h_l1558_c24_6c0d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1560_c11_54e4
BIN_OP_EQ_uxn_opcodes_h_l1560_c11_54e4 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1560_c11_54e4_left,
BIN_OP_EQ_uxn_opcodes_h_l1560_c11_54e4_right,
BIN_OP_EQ_uxn_opcodes_h_l1560_c11_54e4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_4eff
result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_4eff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_4eff_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_4eff_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_4eff_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_4eff_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_4eff
result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_4eff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_4eff_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_4eff_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_4eff_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_4eff_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1542_l1527_DUPLICATE_4260
CONST_SL_8_uint16_t_uxn_opcodes_h_l1542_l1527_DUPLICATE_4260 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1542_l1527_DUPLICATE_4260_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1542_l1527_DUPLICATE_4260_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1516_c6_11fb_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1516_c1_beeb_return_output,
 t16_MUX_uxn_opcodes_h_l1516_c2_ed45_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c2_ed45_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1516_c2_ed45_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c2_ed45_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1516_c2_ed45_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1516_c2_ed45_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c2_ed45_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1516_c2_ed45_return_output,
 n16_MUX_uxn_opcodes_h_l1516_c2_ed45_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1522_c11_d151_return_output,
 t16_MUX_uxn_opcodes_h_l1522_c7_d684_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_d684_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1522_c7_d684_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_d684_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1522_c7_d684_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_d684_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_d684_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_d684_return_output,
 n16_MUX_uxn_opcodes_h_l1522_c7_d684_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1525_c11_5442_return_output,
 t16_MUX_uxn_opcodes_h_l1525_c7_b95b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1525_c7_b95b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1525_c7_b95b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1525_c7_b95b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1525_c7_b95b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_b95b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_b95b_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1525_c7_b95b_return_output,
 n16_MUX_uxn_opcodes_h_l1525_c7_b95b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1530_c11_8552_return_output,
 t16_MUX_uxn_opcodes_h_l1530_c7_1b1c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1530_c7_1b1c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1530_c7_1b1c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1530_c7_1b1c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1530_c7_1b1c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1530_c7_1b1c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1530_c7_1b1c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1530_c7_1b1c_return_output,
 n16_MUX_uxn_opcodes_h_l1530_c7_1b1c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1533_c11_8778_return_output,
 t16_MUX_uxn_opcodes_h_l1533_c7_a73e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1533_c7_a73e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1533_c7_a73e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1533_c7_a73e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1533_c7_a73e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1533_c7_a73e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1533_c7_a73e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1533_c7_a73e_return_output,
 n16_MUX_uxn_opcodes_h_l1533_c7_a73e_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1534_c3_d518_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1537_c11_bc5f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1537_c7_2619_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1537_c7_2619_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_2619_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1537_c7_2619_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_2619_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1537_c7_2619_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1537_c7_2619_return_output,
 n16_MUX_uxn_opcodes_h_l1537_c7_2619_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1540_c11_eaaa_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1540_c7_226a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1540_c7_226a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_226a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1540_c7_226a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_226a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1540_c7_226a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1540_c7_226a_return_output,
 n16_MUX_uxn_opcodes_h_l1540_c7_226a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1545_c11_8db6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1545_c7_a781_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1545_c7_a781_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1545_c7_a781_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1545_c7_a781_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1545_c7_a781_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1545_c7_a781_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1545_c7_a781_return_output,
 n16_MUX_uxn_opcodes_h_l1545_c7_a781_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1548_c11_4509_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1548_c7_c35c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1548_c7_c35c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1548_c7_c35c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1548_c7_c35c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1548_c7_c35c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1548_c7_c35c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1548_c7_c35c_return_output,
 n16_MUX_uxn_opcodes_h_l1548_c7_c35c_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1549_c3_1f11_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1552_c32_1147_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1552_c32_2c08_return_output,
 MUX_uxn_opcodes_h_l1552_c32_8ca0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1554_c11_aa10_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1554_c7_6739_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1554_c7_6739_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1554_c7_6739_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1554_c7_6739_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1554_c7_6739_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1558_c24_ca93_return_output,
 MUX_uxn_opcodes_h_l1558_c24_6c0d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1560_c11_54e4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_4eff_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_4eff_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1542_l1527_DUPLICATE_4260_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1516_c6_11fb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1516_c6_11fb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1516_c6_11fb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1516_c1_beeb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1516_c1_beeb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1516_c1_beeb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1516_c1_beeb_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1516_c2_ed45_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1516_c2_ed45_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1522_c7_d684_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1516_c2_ed45_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1516_c2_ed45_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c2_ed45_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c2_ed45_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_d684_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c2_ed45_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c2_ed45_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1516_c2_ed45_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1516_c2_ed45_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1522_c7_d684_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1516_c2_ed45_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1516_c2_ed45_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c2_ed45_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c2_ed45_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_d684_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c2_ed45_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c2_ed45_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1516_c2_ed45_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1516_c2_ed45_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1522_c7_d684_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1516_c2_ed45_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1516_c2_ed45_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1516_c2_ed45_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1516_c2_ed45_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_d684_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1516_c2_ed45_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1516_c2_ed45_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c2_ed45_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1519_c3_fd3f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c2_ed45_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_d684_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c2_ed45_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c2_ed45_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1516_c2_ed45_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1516_c2_ed45_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_d684_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1516_c2_ed45_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1516_c2_ed45_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1516_c2_ed45_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1516_c2_ed45_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1522_c7_d684_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1516_c2_ed45_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1516_c2_ed45_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1517_c3_a318_uxn_opcodes_h_l1517_c3_a318_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_d151_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_d151_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_d151_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1522_c7_d684_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1522_c7_d684_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1525_c7_b95b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1522_c7_d684_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_d684_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_d684_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1525_c7_b95b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_d684_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1522_c7_d684_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1522_c7_d684_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1525_c7_b95b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1522_c7_d684_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_d684_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_d684_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1525_c7_b95b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_d684_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1522_c7_d684_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1522_c7_d684_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1525_c7_b95b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1522_c7_d684_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_d684_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_d684_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_b95b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_d684_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_d684_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1523_c3_d170 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_d684_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_b95b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_d684_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_d684_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_d684_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1525_c7_b95b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_d684_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1522_c7_d684_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1522_c7_d684_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1525_c7_b95b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1522_c7_d684_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1525_c11_5442_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1525_c11_5442_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1525_c11_5442_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1525_c7_b95b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1525_c7_b95b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1530_c7_1b1c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1525_c7_b95b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1525_c7_b95b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1525_c7_b95b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1530_c7_1b1c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1525_c7_b95b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1525_c7_b95b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1525_c7_b95b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1530_c7_1b1c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1525_c7_b95b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1525_c7_b95b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1525_c7_b95b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1530_c7_1b1c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1525_c7_b95b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1525_c7_b95b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1525_c7_b95b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1530_c7_1b1c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1525_c7_b95b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_b95b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_b95b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1530_c7_1b1c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_b95b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_b95b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1528_c3_289d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_b95b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1530_c7_1b1c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_b95b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1525_c7_b95b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1525_c7_b95b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1530_c7_1b1c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1525_c7_b95b_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1525_c7_b95b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1525_c7_b95b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1530_c7_1b1c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1525_c7_b95b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1530_c11_8552_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1530_c11_8552_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1530_c11_8552_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1530_c7_1b1c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1530_c7_1b1c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1533_c7_a73e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1530_c7_1b1c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1530_c7_1b1c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1530_c7_1b1c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1533_c7_a73e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1530_c7_1b1c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1530_c7_1b1c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1530_c7_1b1c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1533_c7_a73e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1530_c7_1b1c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1530_c7_1b1c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1530_c7_1b1c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1533_c7_a73e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1530_c7_1b1c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1530_c7_1b1c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1530_c7_1b1c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1533_c7_a73e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1530_c7_1b1c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1530_c7_1b1c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1530_c7_1b1c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1533_c7_a73e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1530_c7_1b1c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1530_c7_1b1c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1531_c3_842d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1530_c7_1b1c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1533_c7_a73e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1530_c7_1b1c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1530_c7_1b1c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1530_c7_1b1c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1533_c7_a73e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1530_c7_1b1c_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1530_c7_1b1c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1530_c7_1b1c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1533_c7_a73e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1530_c7_1b1c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1533_c11_8778_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1533_c11_8778_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1533_c11_8778_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1533_c7_a73e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1533_c7_a73e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1533_c7_a73e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1533_c7_a73e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1533_c7_a73e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1537_c7_2619_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1533_c7_a73e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1533_c7_a73e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1533_c7_a73e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1537_c7_2619_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1533_c7_a73e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1533_c7_a73e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1533_c7_a73e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_2619_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1533_c7_a73e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1533_c7_a73e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1533_c7_a73e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1537_c7_2619_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1533_c7_a73e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1533_c7_a73e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1533_c7_a73e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_2619_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1533_c7_a73e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1533_c7_a73e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1535_c3_6fd9 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1533_c7_a73e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1537_c7_2619_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1533_c7_a73e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1533_c7_a73e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1533_c7_a73e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1537_c7_2619_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1533_c7_a73e_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1533_c7_a73e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1533_c7_a73e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1537_c7_2619_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1533_c7_a73e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1534_c3_d518_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1534_c3_d518_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1534_c3_d518_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1537_c11_bc5f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1537_c11_bc5f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1537_c11_bc5f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1537_c7_2619_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1537_c7_2619_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1540_c7_226a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1537_c7_2619_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1537_c7_2619_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1537_c7_2619_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1540_c7_226a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1537_c7_2619_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_2619_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_2619_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_226a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_2619_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1537_c7_2619_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1537_c7_2619_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1540_c7_226a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1537_c7_2619_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_2619_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_2619_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_226a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_2619_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1537_c7_2619_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1538_c3_5868 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1537_c7_2619_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1540_c7_226a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1537_c7_2619_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1537_c7_2619_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1537_c7_2619_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1540_c7_226a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1537_c7_2619_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1537_c7_2619_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1537_c7_2619_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1540_c7_226a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1537_c7_2619_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1540_c11_eaaa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1540_c11_eaaa_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1540_c11_eaaa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1540_c7_226a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1540_c7_226a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1545_c7_a781_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1540_c7_226a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1540_c7_226a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1540_c7_226a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1545_c7_a781_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1540_c7_226a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_226a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_226a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1545_c7_a781_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_226a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1540_c7_226a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1540_c7_226a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1545_c7_a781_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1540_c7_226a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_226a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_226a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1545_c7_a781_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_226a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1540_c7_226a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1543_c3_6394 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1540_c7_226a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1545_c7_a781_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1540_c7_226a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1540_c7_226a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1540_c7_226a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1545_c7_a781_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1540_c7_226a_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1540_c7_226a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1540_c7_226a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1545_c7_a781_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1540_c7_226a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1545_c11_8db6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1545_c11_8db6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1545_c11_8db6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1545_c7_a781_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1545_c7_a781_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1548_c7_c35c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1545_c7_a781_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1545_c7_a781_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1545_c7_a781_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1548_c7_c35c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1545_c7_a781_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1545_c7_a781_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1545_c7_a781_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1548_c7_c35c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1545_c7_a781_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1545_c7_a781_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1545_c7_a781_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1548_c7_c35c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1545_c7_a781_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1545_c7_a781_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1545_c7_a781_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1548_c7_c35c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1545_c7_a781_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1545_c7_a781_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1546_c3_4a03 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1545_c7_a781_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1548_c7_c35c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1545_c7_a781_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1545_c7_a781_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1545_c7_a781_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1548_c7_c35c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1545_c7_a781_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1545_c7_a781_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1545_c7_a781_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1548_c7_c35c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1545_c7_a781_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1548_c11_4509_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1548_c11_4509_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1548_c11_4509_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1548_c7_c35c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1548_c7_c35c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1554_c7_6739_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1548_c7_c35c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1548_c7_c35c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1548_c7_c35c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1554_c7_6739_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1548_c7_c35c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1548_c7_c35c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1548_c7_c35c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1548_c7_c35c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1548_c7_c35c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1548_c7_c35c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1554_c7_6739_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1548_c7_c35c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1548_c7_c35c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1548_c7_c35c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1554_c7_6739_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1548_c7_c35c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1548_c7_c35c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1548_c7_c35c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1554_c7_6739_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1548_c7_c35c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1548_c7_c35c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1548_c7_c35c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1548_c7_c35c_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1548_c7_c35c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1548_c7_c35c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1548_c7_c35c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1549_c3_1f11_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1549_c3_1f11_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1549_c3_1f11_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1552_c32_8ca0_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1552_c32_8ca0_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1552_c32_8ca0_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1552_c32_1147_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1552_c32_1147_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1552_c32_1147_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1552_c32_2c08_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1552_c32_2c08_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1552_c32_2c08_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1552_c32_8ca0_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1554_c11_aa10_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1554_c11_aa10_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1554_c11_aa10_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1554_c7_6739_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1554_c7_6739_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1554_c7_6739_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1554_c7_6739_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1554_c7_6739_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1554_c7_6739_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1554_c7_6739_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1554_c7_6739_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_4eff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1554_c7_6739_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1554_c7_6739_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1554_c7_6739_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_4eff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1554_c7_6739_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1554_c7_6739_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1557_c3_fb6f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1554_c7_6739_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1554_c7_6739_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1558_c24_6c0d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1558_c24_6c0d_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1558_c24_6c0d_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1558_c24_ca93_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1558_c24_ca93_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1558_c24_ca93_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1558_c24_6c0d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c11_54e4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c11_54e4_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c11_54e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_4eff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_4eff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_4eff_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_4eff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_4eff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_4eff_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1537_l1533_l1530_l1554_l1525_l1522_l1545_l1516_l1540_DUPLICATE_24cb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1537_l1533_l1530_l1554_l1525_l1548_l1522_l1545_l1516_l1540_DUPLICATE_9812_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1537_l1533_l1530_l1525_l1548_l1522_l1545_l1516_l1540_DUPLICATE_5434_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1537_l1533_l1560_l1530_l1525_l1548_l1522_l1545_l1516_l1540_DUPLICATE_570f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1537_l1533_l1560_l1530_l1554_l1525_l1548_l1522_l1545_l1540_DUPLICATE_58e9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1537_l1533_l1530_l1525_l1548_l1522_l1545_l1540_DUPLICATE_1943_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1526_l1534_l1541_l1549_DUPLICATE_46e4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1542_l1527_DUPLICATE_4260_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1542_l1527_DUPLICATE_4260_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1548_l1554_DUPLICATE_48b7_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l1512_l1565_DUPLICATE_fa66_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1537_c11_bc5f_right := to_unsigned(5, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1516_c2_ed45_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1558_c24_6c0d_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1523_c3_d170 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_d684_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1523_c3_d170;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1530_c11_8552_right := to_unsigned(3, 2);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1552_c32_1147_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1516_c6_11fb_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1543_c3_6394 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1540_c7_226a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1543_c3_6394;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1540_c11_eaaa_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c11_54e4_right := to_unsigned(10, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1531_c3_842d := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1530_c7_1b1c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1531_c3_842d;
     VAR_MUX_uxn_opcodes_h_l1558_c24_6c0d_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1525_c11_5442_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1538_c3_5868 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1537_c7_2619_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1538_c3_5868;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1528_c3_289d := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_b95b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1528_c3_289d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1545_c11_8db6_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1557_c3_fb6f := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1554_c7_6739_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1557_c3_fb6f;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1519_c3_fd3f := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c2_ed45_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1519_c3_fd3f;
     VAR_MUX_uxn_opcodes_h_l1552_c32_8ca0_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1535_c3_6fd9 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1533_c7_a73e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1535_c3_6fd9;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1554_c7_6739_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1548_c7_c35c_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1546_c3_4a03 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1545_c7_a781_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1546_c3_4a03;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_d151_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_4eff_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1548_c11_4509_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1533_c11_8778_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_4eff_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1516_c2_ed45_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1548_c7_c35c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1552_c32_2c08_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1552_c32_8ca0_iffalse := resize(to_signed(-3, 3), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1554_c11_aa10_right := to_unsigned(9, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1516_c1_beeb_iffalse := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1554_c7_6739_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1516_c1_beeb_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1552_c32_1147_left := VAR_ins;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1558_c24_ca93_left := n16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1549_c3_1f11_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1516_c2_ed45_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1522_c7_d684_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1525_c7_b95b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1530_c7_1b1c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1533_c7_a73e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1537_c7_2619_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1545_c7_a781_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1548_c7_c35c_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1516_c6_11fb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_d151_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1525_c11_5442_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1530_c11_8552_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1533_c11_8778_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1537_c11_bc5f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1540_c11_eaaa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1545_c11_8db6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1548_c11_4509_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1554_c11_aa10_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c11_54e4_left := VAR_phase;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1558_c24_ca93_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1534_c3_d518_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1516_c2_ed45_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1522_c7_d684_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1530_c7_1b1c_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1533_c7_a73e_iffalse := t16;
     -- BIN_OP_GT[uxn_opcodes_h_l1558_c24_ca93] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1558_c24_ca93_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1558_c24_ca93_left;
     BIN_OP_GT_uxn_opcodes_h_l1558_c24_ca93_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1558_c24_ca93_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1558_c24_ca93_return_output := BIN_OP_GT_uxn_opcodes_h_l1558_c24_ca93_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1533_c11_8778] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1533_c11_8778_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1533_c11_8778_left;
     BIN_OP_EQ_uxn_opcodes_h_l1533_c11_8778_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1533_c11_8778_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1533_c11_8778_return_output := BIN_OP_EQ_uxn_opcodes_h_l1533_c11_8778_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1530_c11_8552] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1530_c11_8552_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1530_c11_8552_left;
     BIN_OP_EQ_uxn_opcodes_h_l1530_c11_8552_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1530_c11_8552_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1530_c11_8552_return_output := BIN_OP_EQ_uxn_opcodes_h_l1530_c11_8552_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1545_c11_8db6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1545_c11_8db6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1545_c11_8db6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1545_c11_8db6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1545_c11_8db6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1545_c11_8db6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1545_c11_8db6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1548_c11_4509] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1548_c11_4509_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1548_c11_4509_left;
     BIN_OP_EQ_uxn_opcodes_h_l1548_c11_4509_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1548_c11_4509_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1548_c11_4509_return_output := BIN_OP_EQ_uxn_opcodes_h_l1548_c11_4509_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1537_l1533_l1530_l1525_l1548_l1522_l1545_l1516_l1540_DUPLICATE_5434 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1537_l1533_l1530_l1525_l1548_l1522_l1545_l1516_l1540_DUPLICATE_5434_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1525_c11_5442] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1525_c11_5442_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1525_c11_5442_left;
     BIN_OP_EQ_uxn_opcodes_h_l1525_c11_5442_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1525_c11_5442_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1525_c11_5442_return_output := BIN_OP_EQ_uxn_opcodes_h_l1525_c11_5442_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1537_l1533_l1530_l1554_l1525_l1548_l1522_l1545_l1516_l1540_DUPLICATE_9812 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1537_l1533_l1530_l1554_l1525_l1548_l1522_l1545_l1516_l1540_DUPLICATE_9812_return_output := result.stack_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1537_l1533_l1530_l1525_l1548_l1522_l1545_l1540_DUPLICATE_1943 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1537_l1533_l1530_l1525_l1548_l1522_l1545_l1540_DUPLICATE_1943_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1522_c11_d151] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1522_c11_d151_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_d151_left;
     BIN_OP_EQ_uxn_opcodes_h_l1522_c11_d151_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_d151_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_d151_return_output := BIN_OP_EQ_uxn_opcodes_h_l1522_c11_d151_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1552_c32_1147] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1552_c32_1147_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1552_c32_1147_left;
     BIN_OP_AND_uxn_opcodes_h_l1552_c32_1147_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1552_c32_1147_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1552_c32_1147_return_output := BIN_OP_AND_uxn_opcodes_h_l1552_c32_1147_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1554_c11_aa10] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1554_c11_aa10_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1554_c11_aa10_left;
     BIN_OP_EQ_uxn_opcodes_h_l1554_c11_aa10_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1554_c11_aa10_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1554_c11_aa10_return_output := BIN_OP_EQ_uxn_opcodes_h_l1554_c11_aa10_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1540_c11_eaaa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1540_c11_eaaa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1540_c11_eaaa_left;
     BIN_OP_EQ_uxn_opcodes_h_l1540_c11_eaaa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1540_c11_eaaa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1540_c11_eaaa_return_output := BIN_OP_EQ_uxn_opcodes_h_l1540_c11_eaaa_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1560_c11_54e4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1560_c11_54e4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c11_54e4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1560_c11_54e4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c11_54e4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c11_54e4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1560_c11_54e4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1537_c11_bc5f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1537_c11_bc5f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1537_c11_bc5f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1537_c11_bc5f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1537_c11_bc5f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1537_c11_bc5f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1537_c11_bc5f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1537_l1533_l1560_l1530_l1525_l1548_l1522_l1545_l1516_l1540_DUPLICATE_570f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1537_l1533_l1560_l1530_l1525_l1548_l1522_l1545_l1516_l1540_DUPLICATE_570f_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1516_c6_11fb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1516_c6_11fb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1516_c6_11fb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1516_c6_11fb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1516_c6_11fb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1516_c6_11fb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1516_c6_11fb_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1537_l1533_l1560_l1530_l1554_l1525_l1548_l1522_l1545_l1540_DUPLICATE_58e9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1537_l1533_l1560_l1530_l1554_l1525_l1548_l1522_l1545_l1540_DUPLICATE_58e9_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1537_l1533_l1530_l1554_l1525_l1522_l1545_l1516_l1540_DUPLICATE_24cb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1537_l1533_l1530_l1554_l1525_l1522_l1545_l1516_l1540_DUPLICATE_24cb_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1548_l1554_DUPLICATE_48b7 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1548_l1554_DUPLICATE_48b7_return_output := result.stack_address_sp_offset;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1526_l1534_l1541_l1549_DUPLICATE_46e4 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1526_l1534_l1541_l1549_DUPLICATE_46e4_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1552_c32_2c08_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1552_c32_1147_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1516_c1_beeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1516_c6_11fb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1516_c2_ed45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1516_c6_11fb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1516_c2_ed45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1516_c6_11fb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c2_ed45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1516_c6_11fb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1516_c2_ed45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1516_c6_11fb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1516_c2_ed45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1516_c6_11fb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c2_ed45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1516_c6_11fb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c2_ed45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1516_c6_11fb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1516_c2_ed45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1516_c6_11fb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1516_c2_ed45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1516_c6_11fb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1522_c7_d684_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_d151_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_d684_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_d151_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_d684_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_d151_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_d684_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_d151_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1522_c7_d684_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_d151_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_d684_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_d151_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_d684_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_d151_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1522_c7_d684_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_d151_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1522_c7_d684_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_d151_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1525_c7_b95b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1525_c11_5442_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_b95b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1525_c11_5442_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1525_c7_b95b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1525_c11_5442_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1525_c7_b95b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1525_c11_5442_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1525_c7_b95b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1525_c11_5442_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1525_c7_b95b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1525_c11_5442_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_b95b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1525_c11_5442_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1525_c7_b95b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1525_c11_5442_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1525_c7_b95b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1525_c11_5442_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1530_c7_1b1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1530_c11_8552_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1530_c7_1b1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1530_c11_8552_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1530_c7_1b1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1530_c11_8552_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1530_c7_1b1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1530_c11_8552_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1530_c7_1b1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1530_c11_8552_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1530_c7_1b1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1530_c11_8552_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1530_c7_1b1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1530_c11_8552_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1530_c7_1b1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1530_c11_8552_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1530_c7_1b1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1530_c11_8552_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1533_c7_a73e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1533_c11_8778_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1533_c7_a73e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1533_c11_8778_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1533_c7_a73e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1533_c11_8778_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1533_c7_a73e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1533_c11_8778_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1533_c7_a73e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1533_c11_8778_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1533_c7_a73e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1533_c11_8778_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1533_c7_a73e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1533_c11_8778_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1533_c7_a73e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1533_c11_8778_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1533_c7_a73e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1533_c11_8778_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1537_c7_2619_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1537_c11_bc5f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_2619_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1537_c11_bc5f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1537_c7_2619_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1537_c11_bc5f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1537_c7_2619_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1537_c11_bc5f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1537_c7_2619_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1537_c11_bc5f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_2619_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1537_c11_bc5f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1537_c7_2619_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1537_c11_bc5f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1537_c7_2619_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1537_c11_bc5f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1540_c7_226a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1540_c11_eaaa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_226a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1540_c11_eaaa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1540_c7_226a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1540_c11_eaaa_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1540_c7_226a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1540_c11_eaaa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1540_c7_226a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1540_c11_eaaa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_226a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1540_c11_eaaa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1540_c7_226a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1540_c11_eaaa_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1540_c7_226a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1540_c11_eaaa_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1545_c7_a781_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1545_c11_8db6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1545_c7_a781_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1545_c11_8db6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1545_c7_a781_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1545_c11_8db6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1545_c7_a781_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1545_c11_8db6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1545_c7_a781_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1545_c11_8db6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1545_c7_a781_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1545_c11_8db6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1545_c7_a781_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1545_c11_8db6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1545_c7_a781_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1545_c11_8db6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1548_c7_c35c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1548_c11_4509_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1548_c7_c35c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1548_c11_4509_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1548_c7_c35c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1548_c11_4509_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1548_c7_c35c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1548_c11_4509_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1548_c7_c35c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1548_c11_4509_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1548_c7_c35c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1548_c11_4509_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1548_c7_c35c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1548_c11_4509_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1548_c7_c35c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1548_c11_4509_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1554_c7_6739_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1554_c11_aa10_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1554_c7_6739_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1554_c11_aa10_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1554_c7_6739_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1554_c11_aa10_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1554_c7_6739_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1554_c11_aa10_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1554_c7_6739_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1554_c11_aa10_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_4eff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c11_54e4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_4eff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c11_54e4_return_output;
     VAR_MUX_uxn_opcodes_h_l1558_c24_6c0d_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1558_c24_ca93_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1534_c3_d518_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1526_l1534_l1541_l1549_DUPLICATE_46e4_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1549_c3_1f11_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1526_l1534_l1541_l1549_DUPLICATE_46e4_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1542_l1527_DUPLICATE_4260_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1526_l1534_l1541_l1549_DUPLICATE_46e4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c2_ed45_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1537_l1533_l1530_l1525_l1548_l1522_l1545_l1516_l1540_DUPLICATE_5434_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_d684_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1537_l1533_l1530_l1525_l1548_l1522_l1545_l1516_l1540_DUPLICATE_5434_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1525_c7_b95b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1537_l1533_l1530_l1525_l1548_l1522_l1545_l1516_l1540_DUPLICATE_5434_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1530_c7_1b1c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1537_l1533_l1530_l1525_l1548_l1522_l1545_l1516_l1540_DUPLICATE_5434_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1533_c7_a73e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1537_l1533_l1530_l1525_l1548_l1522_l1545_l1516_l1540_DUPLICATE_5434_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_2619_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1537_l1533_l1530_l1525_l1548_l1522_l1545_l1516_l1540_DUPLICATE_5434_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_226a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1537_l1533_l1530_l1525_l1548_l1522_l1545_l1516_l1540_DUPLICATE_5434_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1545_c7_a781_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1537_l1533_l1530_l1525_l1548_l1522_l1545_l1516_l1540_DUPLICATE_5434_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1548_c7_c35c_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1537_l1533_l1530_l1525_l1548_l1522_l1545_l1516_l1540_DUPLICATE_5434_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_d684_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1537_l1533_l1560_l1530_l1554_l1525_l1548_l1522_l1545_l1540_DUPLICATE_58e9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_b95b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1537_l1533_l1560_l1530_l1554_l1525_l1548_l1522_l1545_l1540_DUPLICATE_58e9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1530_c7_1b1c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1537_l1533_l1560_l1530_l1554_l1525_l1548_l1522_l1545_l1540_DUPLICATE_58e9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1533_c7_a73e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1537_l1533_l1560_l1530_l1554_l1525_l1548_l1522_l1545_l1540_DUPLICATE_58e9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_2619_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1537_l1533_l1560_l1530_l1554_l1525_l1548_l1522_l1545_l1540_DUPLICATE_58e9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_226a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1537_l1533_l1560_l1530_l1554_l1525_l1548_l1522_l1545_l1540_DUPLICATE_58e9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1545_c7_a781_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1537_l1533_l1560_l1530_l1554_l1525_l1548_l1522_l1545_l1540_DUPLICATE_58e9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1548_c7_c35c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1537_l1533_l1560_l1530_l1554_l1525_l1548_l1522_l1545_l1540_DUPLICATE_58e9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1554_c7_6739_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1537_l1533_l1560_l1530_l1554_l1525_l1548_l1522_l1545_l1540_DUPLICATE_58e9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_4eff_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1537_l1533_l1560_l1530_l1554_l1525_l1548_l1522_l1545_l1540_DUPLICATE_58e9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c2_ed45_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1537_l1533_l1530_l1554_l1525_l1522_l1545_l1516_l1540_DUPLICATE_24cb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_d684_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1537_l1533_l1530_l1554_l1525_l1522_l1545_l1516_l1540_DUPLICATE_24cb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1525_c7_b95b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1537_l1533_l1530_l1554_l1525_l1522_l1545_l1516_l1540_DUPLICATE_24cb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1530_c7_1b1c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1537_l1533_l1530_l1554_l1525_l1522_l1545_l1516_l1540_DUPLICATE_24cb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1533_c7_a73e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1537_l1533_l1530_l1554_l1525_l1522_l1545_l1516_l1540_DUPLICATE_24cb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1537_c7_2619_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1537_l1533_l1530_l1554_l1525_l1522_l1545_l1516_l1540_DUPLICATE_24cb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1540_c7_226a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1537_l1533_l1530_l1554_l1525_l1522_l1545_l1516_l1540_DUPLICATE_24cb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1545_c7_a781_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1537_l1533_l1530_l1554_l1525_l1522_l1545_l1516_l1540_DUPLICATE_24cb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1554_c7_6739_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1537_l1533_l1530_l1554_l1525_l1522_l1545_l1516_l1540_DUPLICATE_24cb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_d684_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1537_l1533_l1530_l1525_l1548_l1522_l1545_l1540_DUPLICATE_1943_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1525_c7_b95b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1537_l1533_l1530_l1525_l1548_l1522_l1545_l1540_DUPLICATE_1943_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1530_c7_1b1c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1537_l1533_l1530_l1525_l1548_l1522_l1545_l1540_DUPLICATE_1943_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1533_c7_a73e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1537_l1533_l1530_l1525_l1548_l1522_l1545_l1540_DUPLICATE_1943_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1537_c7_2619_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1537_l1533_l1530_l1525_l1548_l1522_l1545_l1540_DUPLICATE_1943_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1540_c7_226a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1537_l1533_l1530_l1525_l1548_l1522_l1545_l1540_DUPLICATE_1943_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1545_c7_a781_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1537_l1533_l1530_l1525_l1548_l1522_l1545_l1540_DUPLICATE_1943_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1548_c7_c35c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1537_l1533_l1530_l1525_l1548_l1522_l1545_l1540_DUPLICATE_1943_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1516_c2_ed45_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1537_l1533_l1560_l1530_l1525_l1548_l1522_l1545_l1516_l1540_DUPLICATE_570f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1522_c7_d684_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1537_l1533_l1560_l1530_l1525_l1548_l1522_l1545_l1516_l1540_DUPLICATE_570f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1525_c7_b95b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1537_l1533_l1560_l1530_l1525_l1548_l1522_l1545_l1516_l1540_DUPLICATE_570f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1530_c7_1b1c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1537_l1533_l1560_l1530_l1525_l1548_l1522_l1545_l1516_l1540_DUPLICATE_570f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1533_c7_a73e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1537_l1533_l1560_l1530_l1525_l1548_l1522_l1545_l1516_l1540_DUPLICATE_570f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1537_c7_2619_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1537_l1533_l1560_l1530_l1525_l1548_l1522_l1545_l1516_l1540_DUPLICATE_570f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1540_c7_226a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1537_l1533_l1560_l1530_l1525_l1548_l1522_l1545_l1516_l1540_DUPLICATE_570f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1545_c7_a781_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1537_l1533_l1560_l1530_l1525_l1548_l1522_l1545_l1516_l1540_DUPLICATE_570f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1548_c7_c35c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1537_l1533_l1560_l1530_l1525_l1548_l1522_l1545_l1516_l1540_DUPLICATE_570f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_4eff_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1537_l1533_l1560_l1530_l1525_l1548_l1522_l1545_l1516_l1540_DUPLICATE_570f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1548_c7_c35c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1548_l1554_DUPLICATE_48b7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1554_c7_6739_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1548_l1554_DUPLICATE_48b7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1516_c2_ed45_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1537_l1533_l1530_l1554_l1525_l1548_l1522_l1545_l1516_l1540_DUPLICATE_9812_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1522_c7_d684_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1537_l1533_l1530_l1554_l1525_l1548_l1522_l1545_l1516_l1540_DUPLICATE_9812_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1525_c7_b95b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1537_l1533_l1530_l1554_l1525_l1548_l1522_l1545_l1516_l1540_DUPLICATE_9812_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1530_c7_1b1c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1537_l1533_l1530_l1554_l1525_l1548_l1522_l1545_l1516_l1540_DUPLICATE_9812_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1533_c7_a73e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1537_l1533_l1530_l1554_l1525_l1548_l1522_l1545_l1516_l1540_DUPLICATE_9812_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1537_c7_2619_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1537_l1533_l1530_l1554_l1525_l1548_l1522_l1545_l1516_l1540_DUPLICATE_9812_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1540_c7_226a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1537_l1533_l1530_l1554_l1525_l1548_l1522_l1545_l1516_l1540_DUPLICATE_9812_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1545_c7_a781_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1537_l1533_l1530_l1554_l1525_l1548_l1522_l1545_l1516_l1540_DUPLICATE_9812_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1548_c7_c35c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1537_l1533_l1530_l1554_l1525_l1548_l1522_l1545_l1516_l1540_DUPLICATE_9812_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1554_c7_6739_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1537_l1533_l1530_l1554_l1525_l1548_l1522_l1545_l1516_l1540_DUPLICATE_9812_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l1534_c3_d518] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1534_c3_d518_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1534_c3_d518_left;
     BIN_OP_OR_uxn_opcodes_h_l1534_c3_d518_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1534_c3_d518_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1534_c3_d518_return_output := BIN_OP_OR_uxn_opcodes_h_l1534_c3_d518_return_output;

     -- MUX[uxn_opcodes_h_l1558_c24_6c0d] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1558_c24_6c0d_cond <= VAR_MUX_uxn_opcodes_h_l1558_c24_6c0d_cond;
     MUX_uxn_opcodes_h_l1558_c24_6c0d_iftrue <= VAR_MUX_uxn_opcodes_h_l1558_c24_6c0d_iftrue;
     MUX_uxn_opcodes_h_l1558_c24_6c0d_iffalse <= VAR_MUX_uxn_opcodes_h_l1558_c24_6c0d_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1558_c24_6c0d_return_output := MUX_uxn_opcodes_h_l1558_c24_6c0d_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1549_c3_1f11] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1549_c3_1f11_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1549_c3_1f11_left;
     BIN_OP_OR_uxn_opcodes_h_l1549_c3_1f11_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1549_c3_1f11_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1549_c3_1f11_return_output := BIN_OP_OR_uxn_opcodes_h_l1549_c3_1f11_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1560_c7_4eff] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_4eff_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_4eff_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_4eff_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_4eff_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_4eff_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_4eff_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_4eff_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_4eff_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1554_c7_6739] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1554_c7_6739_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1554_c7_6739_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1554_c7_6739_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1554_c7_6739_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1554_c7_6739_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1554_c7_6739_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1554_c7_6739_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1554_c7_6739_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1552_c32_2c08] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1552_c32_2c08_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1552_c32_2c08_left;
     BIN_OP_GT_uxn_opcodes_h_l1552_c32_2c08_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1552_c32_2c08_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1552_c32_2c08_return_output := BIN_OP_GT_uxn_opcodes_h_l1552_c32_2c08_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1560_c7_4eff] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_4eff_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_4eff_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_4eff_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_4eff_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_4eff_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_4eff_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_4eff_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_4eff_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1554_c7_6739] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1554_c7_6739_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1554_c7_6739_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1554_c7_6739_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1554_c7_6739_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1554_c7_6739_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1554_c7_6739_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1554_c7_6739_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1554_c7_6739_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1516_c1_beeb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1516_c1_beeb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1516_c1_beeb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1516_c1_beeb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1516_c1_beeb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1516_c1_beeb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1516_c1_beeb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1516_c1_beeb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1516_c1_beeb_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1542_l1527_DUPLICATE_4260 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1542_l1527_DUPLICATE_4260_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1542_l1527_DUPLICATE_4260_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1542_l1527_DUPLICATE_4260_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1542_l1527_DUPLICATE_4260_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1548_c7_c35c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1548_c7_c35c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1548_c7_c35c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1548_c7_c35c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1548_c7_c35c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1548_c7_c35c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1548_c7_c35c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1548_c7_c35c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1548_c7_c35c_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1552_c32_8ca0_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1552_c32_2c08_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1533_c7_a73e_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1534_c3_d518_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1548_c7_c35c_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1549_c3_1f11_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1540_c7_226a_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1542_l1527_DUPLICATE_4260_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1525_c7_b95b_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1542_l1527_DUPLICATE_4260_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1554_c7_6739_iftrue := VAR_MUX_uxn_opcodes_h_l1558_c24_6c0d_return_output;
     VAR_printf_uxn_opcodes_h_l1517_c3_a318_uxn_opcodes_h_l1517_c3_a318_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1516_c1_beeb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1554_c7_6739_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_4eff_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1548_c7_c35c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1554_c7_6739_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1545_c7_a781_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1548_c7_c35c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1554_c7_6739_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_4eff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1548_c7_c35c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1554_c7_6739_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1554_c7_6739] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1554_c7_6739_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1554_c7_6739_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1554_c7_6739_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1554_c7_6739_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1554_c7_6739_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1554_c7_6739_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1554_c7_6739_return_output := result_stack_value_MUX_uxn_opcodes_h_l1554_c7_6739_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1545_c7_a781] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1545_c7_a781_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1545_c7_a781_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1545_c7_a781_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1545_c7_a781_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1545_c7_a781_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1545_c7_a781_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1545_c7_a781_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1545_c7_a781_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1554_c7_6739] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1554_c7_6739_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1554_c7_6739_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1554_c7_6739_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1554_c7_6739_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1554_c7_6739_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1554_c7_6739_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1554_c7_6739_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1554_c7_6739_return_output;

     -- MUX[uxn_opcodes_h_l1552_c32_8ca0] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1552_c32_8ca0_cond <= VAR_MUX_uxn_opcodes_h_l1552_c32_8ca0_cond;
     MUX_uxn_opcodes_h_l1552_c32_8ca0_iftrue <= VAR_MUX_uxn_opcodes_h_l1552_c32_8ca0_iftrue;
     MUX_uxn_opcodes_h_l1552_c32_8ca0_iffalse <= VAR_MUX_uxn_opcodes_h_l1552_c32_8ca0_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1552_c32_8ca0_return_output := MUX_uxn_opcodes_h_l1552_c32_8ca0_return_output;

     -- n16_MUX[uxn_opcodes_h_l1548_c7_c35c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1548_c7_c35c_cond <= VAR_n16_MUX_uxn_opcodes_h_l1548_c7_c35c_cond;
     n16_MUX_uxn_opcodes_h_l1548_c7_c35c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1548_c7_c35c_iftrue;
     n16_MUX_uxn_opcodes_h_l1548_c7_c35c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1548_c7_c35c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1548_c7_c35c_return_output := n16_MUX_uxn_opcodes_h_l1548_c7_c35c_return_output;

     -- printf_uxn_opcodes_h_l1517_c3_a318[uxn_opcodes_h_l1517_c3_a318] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1517_c3_a318_uxn_opcodes_h_l1517_c3_a318_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1517_c3_a318_uxn_opcodes_h_l1517_c3_a318_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1548_c7_c35c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1548_c7_c35c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1548_c7_c35c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1548_c7_c35c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1548_c7_c35c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1548_c7_c35c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1548_c7_c35c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1548_c7_c35c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1548_c7_c35c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1554_c7_6739] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1554_c7_6739_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1554_c7_6739_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1554_c7_6739_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1554_c7_6739_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1554_c7_6739_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1554_c7_6739_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1554_c7_6739_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1554_c7_6739_return_output;

     -- t16_MUX[uxn_opcodes_h_l1533_c7_a73e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1533_c7_a73e_cond <= VAR_t16_MUX_uxn_opcodes_h_l1533_c7_a73e_cond;
     t16_MUX_uxn_opcodes_h_l1533_c7_a73e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1533_c7_a73e_iftrue;
     t16_MUX_uxn_opcodes_h_l1533_c7_a73e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1533_c7_a73e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1533_c7_a73e_return_output := t16_MUX_uxn_opcodes_h_l1533_c7_a73e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1548_c7_c35c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1548_c7_c35c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1548_c7_c35c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1548_c7_c35c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1548_c7_c35c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1548_c7_c35c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1548_c7_c35c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1548_c7_c35c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1548_c7_c35c_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1548_c7_c35c_iftrue := VAR_MUX_uxn_opcodes_h_l1552_c32_8ca0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1545_c7_a781_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1548_c7_c35c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1548_c7_c35c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1554_c7_6739_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1545_c7_a781_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1548_c7_c35c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1540_c7_226a_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1545_c7_a781_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1548_c7_c35c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1554_c7_6739_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1545_c7_a781_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1548_c7_c35c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1548_c7_c35c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1554_c7_6739_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1530_c7_1b1c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1533_c7_a73e_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1548_c7_c35c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1548_c7_c35c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1548_c7_c35c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1548_c7_c35c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1548_c7_c35c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1548_c7_c35c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1548_c7_c35c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1548_c7_c35c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1548_c7_c35c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1548_c7_c35c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1548_c7_c35c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1548_c7_c35c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1548_c7_c35c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1548_c7_c35c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1548_c7_c35c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1548_c7_c35c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1548_c7_c35c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1548_c7_c35c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1540_c7_226a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1540_c7_226a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1540_c7_226a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1540_c7_226a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1540_c7_226a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1540_c7_226a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1540_c7_226a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1540_c7_226a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1540_c7_226a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1545_c7_a781] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1545_c7_a781_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1545_c7_a781_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1545_c7_a781_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1545_c7_a781_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1545_c7_a781_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1545_c7_a781_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1545_c7_a781_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1545_c7_a781_return_output;

     -- n16_MUX[uxn_opcodes_h_l1545_c7_a781] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1545_c7_a781_cond <= VAR_n16_MUX_uxn_opcodes_h_l1545_c7_a781_cond;
     n16_MUX_uxn_opcodes_h_l1545_c7_a781_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1545_c7_a781_iftrue;
     n16_MUX_uxn_opcodes_h_l1545_c7_a781_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1545_c7_a781_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1545_c7_a781_return_output := n16_MUX_uxn_opcodes_h_l1545_c7_a781_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1548_c7_c35c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1548_c7_c35c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1548_c7_c35c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1548_c7_c35c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1548_c7_c35c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1548_c7_c35c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1548_c7_c35c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1548_c7_c35c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1548_c7_c35c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1548_c7_c35c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1548_c7_c35c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1548_c7_c35c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1548_c7_c35c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1548_c7_c35c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1548_c7_c35c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1548_c7_c35c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1548_c7_c35c_return_output := result_stack_value_MUX_uxn_opcodes_h_l1548_c7_c35c_return_output;

     -- t16_MUX[uxn_opcodes_h_l1530_c7_1b1c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1530_c7_1b1c_cond <= VAR_t16_MUX_uxn_opcodes_h_l1530_c7_1b1c_cond;
     t16_MUX_uxn_opcodes_h_l1530_c7_1b1c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1530_c7_1b1c_iftrue;
     t16_MUX_uxn_opcodes_h_l1530_c7_1b1c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1530_c7_1b1c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1530_c7_1b1c_return_output := t16_MUX_uxn_opcodes_h_l1530_c7_1b1c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1545_c7_a781] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1545_c7_a781_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1545_c7_a781_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1545_c7_a781_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1545_c7_a781_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1545_c7_a781_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1545_c7_a781_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1545_c7_a781_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1545_c7_a781_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l1540_c7_226a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1545_c7_a781_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1545_c7_a781_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1548_c7_c35c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1540_c7_226a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1545_c7_a781_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1537_c7_2619_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1540_c7_226a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1545_c7_a781_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1548_c7_c35c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1545_c7_a781_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1548_c7_c35c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1540_c7_226a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1545_c7_a781_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1545_c7_a781_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1548_c7_c35c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1525_c7_b95b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1530_c7_1b1c_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1537_c7_2619] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1537_c7_2619_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1537_c7_2619_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1537_c7_2619_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1537_c7_2619_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1537_c7_2619_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1537_c7_2619_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1537_c7_2619_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1537_c7_2619_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1540_c7_226a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1540_c7_226a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1540_c7_226a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1540_c7_226a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1540_c7_226a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1540_c7_226a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1540_c7_226a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1540_c7_226a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1540_c7_226a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1545_c7_a781] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1545_c7_a781_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1545_c7_a781_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1545_c7_a781_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1545_c7_a781_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1545_c7_a781_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1545_c7_a781_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1545_c7_a781_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1545_c7_a781_return_output;

     -- n16_MUX[uxn_opcodes_h_l1540_c7_226a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1540_c7_226a_cond <= VAR_n16_MUX_uxn_opcodes_h_l1540_c7_226a_cond;
     n16_MUX_uxn_opcodes_h_l1540_c7_226a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1540_c7_226a_iftrue;
     n16_MUX_uxn_opcodes_h_l1540_c7_226a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1540_c7_226a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1540_c7_226a_return_output := n16_MUX_uxn_opcodes_h_l1540_c7_226a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1545_c7_a781] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1545_c7_a781_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1545_c7_a781_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1545_c7_a781_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1545_c7_a781_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1545_c7_a781_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1545_c7_a781_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1545_c7_a781_return_output := result_stack_value_MUX_uxn_opcodes_h_l1545_c7_a781_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1545_c7_a781] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1545_c7_a781_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1545_c7_a781_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1545_c7_a781_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1545_c7_a781_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1545_c7_a781_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1545_c7_a781_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1545_c7_a781_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1545_c7_a781_return_output;

     -- t16_MUX[uxn_opcodes_h_l1525_c7_b95b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1525_c7_b95b_cond <= VAR_t16_MUX_uxn_opcodes_h_l1525_c7_b95b_cond;
     t16_MUX_uxn_opcodes_h_l1525_c7_b95b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1525_c7_b95b_iftrue;
     t16_MUX_uxn_opcodes_h_l1525_c7_b95b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1525_c7_b95b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1525_c7_b95b_return_output := t16_MUX_uxn_opcodes_h_l1525_c7_b95b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1545_c7_a781] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1545_c7_a781_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1545_c7_a781_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1545_c7_a781_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1545_c7_a781_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1545_c7_a781_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1545_c7_a781_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1545_c7_a781_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1545_c7_a781_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1540_c7_226a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1540_c7_226a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1540_c7_226a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1540_c7_226a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1540_c7_226a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1540_c7_226a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1540_c7_226a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1540_c7_226a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1540_c7_226a_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1537_c7_2619_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1540_c7_226a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_226a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1545_c7_a781_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1537_c7_2619_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1540_c7_226a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1533_c7_a73e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1537_c7_2619_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1540_c7_226a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1545_c7_a781_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_226a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1545_c7_a781_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1537_c7_2619_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1540_c7_226a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1540_c7_226a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1545_c7_a781_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1522_c7_d684_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1525_c7_b95b_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1540_c7_226a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1540_c7_226a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1540_c7_226a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1540_c7_226a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1540_c7_226a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1540_c7_226a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1540_c7_226a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1540_c7_226a_return_output := result_stack_value_MUX_uxn_opcodes_h_l1540_c7_226a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1540_c7_226a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_226a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_226a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_226a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_226a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_226a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_226a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_226a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_226a_return_output;

     -- n16_MUX[uxn_opcodes_h_l1537_c7_2619] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1537_c7_2619_cond <= VAR_n16_MUX_uxn_opcodes_h_l1537_c7_2619_cond;
     n16_MUX_uxn_opcodes_h_l1537_c7_2619_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1537_c7_2619_iftrue;
     n16_MUX_uxn_opcodes_h_l1537_c7_2619_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1537_c7_2619_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1537_c7_2619_return_output := n16_MUX_uxn_opcodes_h_l1537_c7_2619_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1537_c7_2619] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1537_c7_2619_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1537_c7_2619_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1537_c7_2619_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1537_c7_2619_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1537_c7_2619_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1537_c7_2619_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1537_c7_2619_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1537_c7_2619_return_output;

     -- t16_MUX[uxn_opcodes_h_l1522_c7_d684] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1522_c7_d684_cond <= VAR_t16_MUX_uxn_opcodes_h_l1522_c7_d684_cond;
     t16_MUX_uxn_opcodes_h_l1522_c7_d684_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1522_c7_d684_iftrue;
     t16_MUX_uxn_opcodes_h_l1522_c7_d684_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1522_c7_d684_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1522_c7_d684_return_output := t16_MUX_uxn_opcodes_h_l1522_c7_d684_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1537_c7_2619] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1537_c7_2619_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1537_c7_2619_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1537_c7_2619_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1537_c7_2619_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1537_c7_2619_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1537_c7_2619_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1537_c7_2619_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1537_c7_2619_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1540_c7_226a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1540_c7_226a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1540_c7_226a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1540_c7_226a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1540_c7_226a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1540_c7_226a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1540_c7_226a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1540_c7_226a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1540_c7_226a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1533_c7_a73e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1533_c7_a73e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1533_c7_a73e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1533_c7_a73e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1533_c7_a73e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1533_c7_a73e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1533_c7_a73e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1533_c7_a73e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1533_c7_a73e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1540_c7_226a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_226a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_226a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_226a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_226a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_226a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_226a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_226a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_226a_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1533_c7_a73e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1537_c7_2619_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_2619_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_226a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1533_c7_a73e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1537_c7_2619_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1530_c7_1b1c_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1533_c7_a73e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1537_c7_2619_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1540_c7_226a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_2619_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_226a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1533_c7_a73e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1537_c7_2619_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1537_c7_2619_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1540_c7_226a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1516_c2_ed45_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1522_c7_d684_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1537_c7_2619] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_2619_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_2619_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_2619_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_2619_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_2619_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_2619_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_2619_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_2619_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1530_c7_1b1c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1530_c7_1b1c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1530_c7_1b1c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1530_c7_1b1c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1530_c7_1b1c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1530_c7_1b1c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1530_c7_1b1c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1530_c7_1b1c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1530_c7_1b1c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1533_c7_a73e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1533_c7_a73e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1533_c7_a73e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1533_c7_a73e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1533_c7_a73e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1533_c7_a73e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1533_c7_a73e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1533_c7_a73e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1533_c7_a73e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1537_c7_2619] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_2619_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_2619_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_2619_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_2619_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_2619_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_2619_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_2619_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_2619_return_output;

     -- t16_MUX[uxn_opcodes_h_l1516_c2_ed45] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1516_c2_ed45_cond <= VAR_t16_MUX_uxn_opcodes_h_l1516_c2_ed45_cond;
     t16_MUX_uxn_opcodes_h_l1516_c2_ed45_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1516_c2_ed45_iftrue;
     t16_MUX_uxn_opcodes_h_l1516_c2_ed45_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1516_c2_ed45_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1516_c2_ed45_return_output := t16_MUX_uxn_opcodes_h_l1516_c2_ed45_return_output;

     -- n16_MUX[uxn_opcodes_h_l1533_c7_a73e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1533_c7_a73e_cond <= VAR_n16_MUX_uxn_opcodes_h_l1533_c7_a73e_cond;
     n16_MUX_uxn_opcodes_h_l1533_c7_a73e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1533_c7_a73e_iftrue;
     n16_MUX_uxn_opcodes_h_l1533_c7_a73e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1533_c7_a73e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1533_c7_a73e_return_output := n16_MUX_uxn_opcodes_h_l1533_c7_a73e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1537_c7_2619] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1537_c7_2619_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1537_c7_2619_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1537_c7_2619_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1537_c7_2619_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1537_c7_2619_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1537_c7_2619_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1537_c7_2619_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1537_c7_2619_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1533_c7_a73e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1533_c7_a73e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1533_c7_a73e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1533_c7_a73e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1533_c7_a73e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1533_c7_a73e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1533_c7_a73e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1533_c7_a73e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1533_c7_a73e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1537_c7_2619] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1537_c7_2619_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1537_c7_2619_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1537_c7_2619_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1537_c7_2619_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1537_c7_2619_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1537_c7_2619_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1537_c7_2619_return_output := result_stack_value_MUX_uxn_opcodes_h_l1537_c7_2619_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1530_c7_1b1c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1533_c7_a73e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1533_c7_a73e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_2619_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1530_c7_1b1c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1533_c7_a73e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1525_c7_b95b_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1530_c7_1b1c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1533_c7_a73e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1537_c7_2619_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1533_c7_a73e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_2619_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1530_c7_1b1c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1533_c7_a73e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1533_c7_a73e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1537_c7_2619_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1516_c2_ed45_return_output;
     -- n16_MUX[uxn_opcodes_h_l1530_c7_1b1c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1530_c7_1b1c_cond <= VAR_n16_MUX_uxn_opcodes_h_l1530_c7_1b1c_cond;
     n16_MUX_uxn_opcodes_h_l1530_c7_1b1c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1530_c7_1b1c_iftrue;
     n16_MUX_uxn_opcodes_h_l1530_c7_1b1c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1530_c7_1b1c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1530_c7_1b1c_return_output := n16_MUX_uxn_opcodes_h_l1530_c7_1b1c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1530_c7_1b1c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1530_c7_1b1c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1530_c7_1b1c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1530_c7_1b1c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1530_c7_1b1c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1530_c7_1b1c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1530_c7_1b1c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1530_c7_1b1c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1530_c7_1b1c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1525_c7_b95b] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1525_c7_b95b_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1525_c7_b95b_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1525_c7_b95b_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1525_c7_b95b_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1525_c7_b95b_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1525_c7_b95b_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1525_c7_b95b_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1525_c7_b95b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1533_c7_a73e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1533_c7_a73e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1533_c7_a73e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1533_c7_a73e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1533_c7_a73e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1533_c7_a73e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1533_c7_a73e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1533_c7_a73e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1533_c7_a73e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1530_c7_1b1c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1530_c7_1b1c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1530_c7_1b1c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1530_c7_1b1c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1530_c7_1b1c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1530_c7_1b1c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1530_c7_1b1c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1530_c7_1b1c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1530_c7_1b1c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1533_c7_a73e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1533_c7_a73e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1533_c7_a73e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1533_c7_a73e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1533_c7_a73e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1533_c7_a73e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1533_c7_a73e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1533_c7_a73e_return_output := result_stack_value_MUX_uxn_opcodes_h_l1533_c7_a73e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1533_c7_a73e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1533_c7_a73e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1533_c7_a73e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1533_c7_a73e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1533_c7_a73e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1533_c7_a73e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1533_c7_a73e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1533_c7_a73e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1533_c7_a73e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1533_c7_a73e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1533_c7_a73e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1533_c7_a73e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1533_c7_a73e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1533_c7_a73e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1533_c7_a73e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1533_c7_a73e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1533_c7_a73e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1533_c7_a73e_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1525_c7_b95b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1530_c7_1b1c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1530_c7_1b1c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1533_c7_a73e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1525_c7_b95b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1530_c7_1b1c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_d684_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1525_c7_b95b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1530_c7_1b1c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1533_c7_a73e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1530_c7_1b1c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1533_c7_a73e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_b95b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1530_c7_1b1c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1530_c7_1b1c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1533_c7_a73e_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1530_c7_1b1c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1530_c7_1b1c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1530_c7_1b1c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1530_c7_1b1c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1530_c7_1b1c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1530_c7_1b1c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1530_c7_1b1c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1530_c7_1b1c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1530_c7_1b1c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1525_c7_b95b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_b95b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_b95b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_b95b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_b95b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_b95b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_b95b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_b95b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_b95b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1530_c7_1b1c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1530_c7_1b1c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1530_c7_1b1c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1530_c7_1b1c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1530_c7_1b1c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1530_c7_1b1c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1530_c7_1b1c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1530_c7_1b1c_return_output := result_stack_value_MUX_uxn_opcodes_h_l1530_c7_1b1c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1530_c7_1b1c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1530_c7_1b1c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1530_c7_1b1c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1530_c7_1b1c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1530_c7_1b1c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1530_c7_1b1c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1530_c7_1b1c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1530_c7_1b1c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1530_c7_1b1c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1530_c7_1b1c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1530_c7_1b1c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1530_c7_1b1c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1530_c7_1b1c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1530_c7_1b1c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1530_c7_1b1c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1530_c7_1b1c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1530_c7_1b1c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1530_c7_1b1c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1525_c7_b95b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1525_c7_b95b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1525_c7_b95b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1525_c7_b95b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1525_c7_b95b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1525_c7_b95b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1525_c7_b95b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1525_c7_b95b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1525_c7_b95b_return_output;

     -- n16_MUX[uxn_opcodes_h_l1525_c7_b95b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1525_c7_b95b_cond <= VAR_n16_MUX_uxn_opcodes_h_l1525_c7_b95b_cond;
     n16_MUX_uxn_opcodes_h_l1525_c7_b95b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1525_c7_b95b_iftrue;
     n16_MUX_uxn_opcodes_h_l1525_c7_b95b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1525_c7_b95b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1525_c7_b95b_return_output := n16_MUX_uxn_opcodes_h_l1525_c7_b95b_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1522_c7_d684] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_d684_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_d684_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_d684_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_d684_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_d684_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_d684_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_d684_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_d684_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1522_c7_d684_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1525_c7_b95b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_b95b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1530_c7_1b1c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_d684_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1525_c7_b95b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1516_c2_ed45_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1522_c7_d684_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1525_c7_b95b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1530_c7_1b1c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1525_c7_b95b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1530_c7_1b1c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_d684_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_b95b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1525_c7_b95b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1530_c7_1b1c_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1516_c2_ed45] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1516_c2_ed45_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1516_c2_ed45_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1516_c2_ed45_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1516_c2_ed45_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1516_c2_ed45_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1516_c2_ed45_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1516_c2_ed45_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1516_c2_ed45_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1522_c7_d684] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_d684_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_d684_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_d684_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_d684_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_d684_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_d684_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_d684_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_d684_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1525_c7_b95b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1525_c7_b95b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1525_c7_b95b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1525_c7_b95b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1525_c7_b95b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1525_c7_b95b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1525_c7_b95b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1525_c7_b95b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1525_c7_b95b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1522_c7_d684] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_d684_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_d684_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_d684_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_d684_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_d684_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_d684_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_d684_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_d684_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1525_c7_b95b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1525_c7_b95b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1525_c7_b95b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1525_c7_b95b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1525_c7_b95b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1525_c7_b95b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1525_c7_b95b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1525_c7_b95b_return_output := result_stack_value_MUX_uxn_opcodes_h_l1525_c7_b95b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1525_c7_b95b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1525_c7_b95b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1525_c7_b95b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1525_c7_b95b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1525_c7_b95b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1525_c7_b95b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1525_c7_b95b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1525_c7_b95b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1525_c7_b95b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1525_c7_b95b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_b95b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_b95b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_b95b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_b95b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_b95b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_b95b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_b95b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_b95b_return_output;

     -- n16_MUX[uxn_opcodes_h_l1522_c7_d684] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1522_c7_d684_cond <= VAR_n16_MUX_uxn_opcodes_h_l1522_c7_d684_cond;
     n16_MUX_uxn_opcodes_h_l1522_c7_d684_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1522_c7_d684_iftrue;
     n16_MUX_uxn_opcodes_h_l1522_c7_d684_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1522_c7_d684_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1522_c7_d684_return_output := n16_MUX_uxn_opcodes_h_l1522_c7_d684_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1516_c2_ed45_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1522_c7_d684_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_d684_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_b95b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c2_ed45_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_d684_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1522_c7_d684_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1525_c7_b95b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_d684_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1525_c7_b95b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c2_ed45_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_d684_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1522_c7_d684_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1525_c7_b95b_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1516_c2_ed45] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c2_ed45_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c2_ed45_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c2_ed45_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c2_ed45_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c2_ed45_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c2_ed45_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c2_ed45_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c2_ed45_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1522_c7_d684] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_d684_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_d684_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_d684_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_d684_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_d684_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_d684_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_d684_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_d684_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1522_c7_d684] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1522_c7_d684_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1522_c7_d684_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1522_c7_d684_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1522_c7_d684_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1522_c7_d684_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1522_c7_d684_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1522_c7_d684_return_output := result_stack_value_MUX_uxn_opcodes_h_l1522_c7_d684_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1522_c7_d684] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1522_c7_d684_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1522_c7_d684_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1522_c7_d684_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1522_c7_d684_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1522_c7_d684_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1522_c7_d684_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1522_c7_d684_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1522_c7_d684_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1522_c7_d684] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_d684_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_d684_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_d684_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_d684_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_d684_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_d684_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_d684_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_d684_return_output;

     -- n16_MUX[uxn_opcodes_h_l1516_c2_ed45] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1516_c2_ed45_cond <= VAR_n16_MUX_uxn_opcodes_h_l1516_c2_ed45_cond;
     n16_MUX_uxn_opcodes_h_l1516_c2_ed45_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1516_c2_ed45_iftrue;
     n16_MUX_uxn_opcodes_h_l1516_c2_ed45_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1516_c2_ed45_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1516_c2_ed45_return_output := n16_MUX_uxn_opcodes_h_l1516_c2_ed45_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1516_c2_ed45] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c2_ed45_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c2_ed45_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c2_ed45_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c2_ed45_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c2_ed45_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c2_ed45_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c2_ed45_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c2_ed45_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1516_c2_ed45_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1516_c2_ed45_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_d684_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1516_c2_ed45_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1522_c7_d684_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c2_ed45_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_d684_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1516_c2_ed45_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1522_c7_d684_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1516_c2_ed45] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c2_ed45_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c2_ed45_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c2_ed45_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c2_ed45_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c2_ed45_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c2_ed45_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c2_ed45_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c2_ed45_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1516_c2_ed45] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1516_c2_ed45_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1516_c2_ed45_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1516_c2_ed45_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1516_c2_ed45_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1516_c2_ed45_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1516_c2_ed45_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1516_c2_ed45_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1516_c2_ed45_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1516_c2_ed45] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1516_c2_ed45_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1516_c2_ed45_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1516_c2_ed45_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1516_c2_ed45_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1516_c2_ed45_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1516_c2_ed45_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1516_c2_ed45_return_output := result_stack_value_MUX_uxn_opcodes_h_l1516_c2_ed45_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1516_c2_ed45] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1516_c2_ed45_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1516_c2_ed45_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1516_c2_ed45_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1516_c2_ed45_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1516_c2_ed45_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1516_c2_ed45_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1516_c2_ed45_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1516_c2_ed45_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l1512_l1565_DUPLICATE_fa66 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l1512_l1565_DUPLICATE_fa66_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e56b(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1516_c2_ed45_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1516_c2_ed45_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1516_c2_ed45_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1516_c2_ed45_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1516_c2_ed45_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1516_c2_ed45_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1516_c2_ed45_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l1512_l1565_DUPLICATE_fa66_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l1512_l1565_DUPLICATE_fa66_return_output;
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
