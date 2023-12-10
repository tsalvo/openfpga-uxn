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
-- Submodules: 77
entity swp2_0CLK_c741f800 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end swp2_0CLK_c741f800;
architecture arch of swp2_0CLK_c741f800 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2546_c6_8684]
signal BIN_OP_EQ_uxn_opcodes_h_l2546_c6_8684_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2546_c6_8684_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2546_c6_8684_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2546_c2_97e4]
signal n16_MUX_uxn_opcodes_h_l2546_c2_97e4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2546_c2_97e4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2546_c2_97e4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2546_c2_97e4_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2546_c2_97e4]
signal t16_MUX_uxn_opcodes_h_l2546_c2_97e4_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2546_c2_97e4_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2546_c2_97e4_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2546_c2_97e4_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2546_c2_97e4]
signal result_u8_value_MUX_uxn_opcodes_h_l2546_c2_97e4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2546_c2_97e4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2546_c2_97e4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2546_c2_97e4_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2546_c2_97e4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2546_c2_97e4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2546_c2_97e4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2546_c2_97e4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2546_c2_97e4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2546_c2_97e4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2546_c2_97e4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2546_c2_97e4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2546_c2_97e4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2546_c2_97e4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2546_c2_97e4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c2_97e4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c2_97e4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c2_97e4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c2_97e4_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2546_c2_97e4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2546_c2_97e4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2546_c2_97e4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2546_c2_97e4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2546_c2_97e4_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2553_c11_6e4c]
signal BIN_OP_EQ_uxn_opcodes_h_l2553_c11_6e4c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2553_c11_6e4c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2553_c11_6e4c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2553_c7_93e6]
signal n16_MUX_uxn_opcodes_h_l2553_c7_93e6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2553_c7_93e6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2553_c7_93e6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2553_c7_93e6_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2553_c7_93e6]
signal t16_MUX_uxn_opcodes_h_l2553_c7_93e6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2553_c7_93e6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2553_c7_93e6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2553_c7_93e6_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2553_c7_93e6]
signal result_u8_value_MUX_uxn_opcodes_h_l2553_c7_93e6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2553_c7_93e6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2553_c7_93e6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2553_c7_93e6_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2553_c7_93e6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2553_c7_93e6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2553_c7_93e6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2553_c7_93e6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2553_c7_93e6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2553_c7_93e6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_93e6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_93e6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_93e6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_93e6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2553_c7_93e6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2553_c7_93e6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2553_c7_93e6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2553_c7_93e6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2553_c7_93e6_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2553_c7_93e6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2553_c7_93e6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2553_c7_93e6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2553_c7_93e6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2553_c7_93e6_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2556_c11_fc66]
signal BIN_OP_EQ_uxn_opcodes_h_l2556_c11_fc66_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2556_c11_fc66_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2556_c11_fc66_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2556_c7_dcd8]
signal n16_MUX_uxn_opcodes_h_l2556_c7_dcd8_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2556_c7_dcd8_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2556_c7_dcd8_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2556_c7_dcd8_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2556_c7_dcd8]
signal t16_MUX_uxn_opcodes_h_l2556_c7_dcd8_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2556_c7_dcd8_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2556_c7_dcd8_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2556_c7_dcd8_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2556_c7_dcd8]
signal result_u8_value_MUX_uxn_opcodes_h_l2556_c7_dcd8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2556_c7_dcd8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2556_c7_dcd8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2556_c7_dcd8_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2556_c7_dcd8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2556_c7_dcd8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2556_c7_dcd8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2556_c7_dcd8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2556_c7_dcd8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2556_c7_dcd8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_dcd8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_dcd8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_dcd8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_dcd8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2556_c7_dcd8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_dcd8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_dcd8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_dcd8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_dcd8_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2556_c7_dcd8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_dcd8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_dcd8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_dcd8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_dcd8_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2561_c11_1176]
signal BIN_OP_EQ_uxn_opcodes_h_l2561_c11_1176_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2561_c11_1176_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2561_c11_1176_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2561_c7_3623]
signal n16_MUX_uxn_opcodes_h_l2561_c7_3623_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2561_c7_3623_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2561_c7_3623_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2561_c7_3623_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2561_c7_3623]
signal t16_MUX_uxn_opcodes_h_l2561_c7_3623_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2561_c7_3623_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2561_c7_3623_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2561_c7_3623_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2561_c7_3623]
signal result_u8_value_MUX_uxn_opcodes_h_l2561_c7_3623_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2561_c7_3623_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2561_c7_3623_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2561_c7_3623_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2561_c7_3623]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_3623_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_3623_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_3623_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_3623_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2561_c7_3623]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_3623_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_3623_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_3623_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_3623_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2561_c7_3623]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_3623_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_3623_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_3623_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_3623_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2561_c7_3623]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_3623_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_3623_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_3623_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_3623_return_output : signed(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2562_c3_bcc5]
signal BIN_OP_OR_uxn_opcodes_h_l2562_c3_bcc5_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2562_c3_bcc5_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2562_c3_bcc5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2565_c11_a6ad]
signal BIN_OP_EQ_uxn_opcodes_h_l2565_c11_a6ad_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2565_c11_a6ad_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2565_c11_a6ad_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2565_c7_329b]
signal n16_MUX_uxn_opcodes_h_l2565_c7_329b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2565_c7_329b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2565_c7_329b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2565_c7_329b_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2565_c7_329b]
signal result_u8_value_MUX_uxn_opcodes_h_l2565_c7_329b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2565_c7_329b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2565_c7_329b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2565_c7_329b_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2565_c7_329b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2565_c7_329b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2565_c7_329b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2565_c7_329b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2565_c7_329b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2565_c7_329b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_329b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_329b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_329b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_329b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2565_c7_329b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_329b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_329b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_329b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_329b_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2565_c7_329b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_329b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_329b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_329b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_329b_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2569_c11_5296]
signal BIN_OP_EQ_uxn_opcodes_h_l2569_c11_5296_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2569_c11_5296_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2569_c11_5296_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2569_c7_5340]
signal n16_MUX_uxn_opcodes_h_l2569_c7_5340_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2569_c7_5340_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2569_c7_5340_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2569_c7_5340_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2569_c7_5340]
signal result_u8_value_MUX_uxn_opcodes_h_l2569_c7_5340_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2569_c7_5340_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2569_c7_5340_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2569_c7_5340_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2569_c7_5340]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2569_c7_5340_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2569_c7_5340_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2569_c7_5340_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2569_c7_5340_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2569_c7_5340]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_5340_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_5340_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_5340_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_5340_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2569_c7_5340]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_5340_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_5340_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_5340_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_5340_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2569_c7_5340]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_5340_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_5340_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_5340_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_5340_return_output : signed(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2570_c3_2ed7]
signal BIN_OP_OR_uxn_opcodes_h_l2570_c3_2ed7_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2570_c3_2ed7_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2570_c3_2ed7_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2572_c30_71a7]
signal sp_relative_shift_uxn_opcodes_h_l2572_c30_71a7_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2572_c30_71a7_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2572_c30_71a7_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2572_c30_71a7_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2577_c11_3b3e]
signal BIN_OP_EQ_uxn_opcodes_h_l2577_c11_3b3e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2577_c11_3b3e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2577_c11_3b3e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2577_c7_eae6]
signal result_u8_value_MUX_uxn_opcodes_h_l2577_c7_eae6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2577_c7_eae6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2577_c7_eae6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2577_c7_eae6_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2577_c7_eae6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2577_c7_eae6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2577_c7_eae6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2577_c7_eae6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2577_c7_eae6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2577_c7_eae6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2577_c7_eae6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2577_c7_eae6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2577_c7_eae6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2577_c7_eae6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2577_c7_eae6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2577_c7_eae6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2577_c7_eae6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2577_c7_eae6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2577_c7_eae6_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2577_c7_eae6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2577_c7_eae6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2577_c7_eae6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2577_c7_eae6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2577_c7_eae6_return_output : signed(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2580_c31_4a1d]
signal CONST_SR_8_uxn_opcodes_h_l2580_c31_4a1d_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2580_c31_4a1d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2582_c11_4923]
signal BIN_OP_EQ_uxn_opcodes_h_l2582_c11_4923_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2582_c11_4923_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2582_c11_4923_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2582_c7_9435]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_9435_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_9435_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_9435_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_9435_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2582_c7_9435]
signal result_u8_value_MUX_uxn_opcodes_h_l2582_c7_9435_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2582_c7_9435_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2582_c7_9435_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2582_c7_9435_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2582_c7_9435]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_9435_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_9435_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_9435_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_9435_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2582_c7_9435]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_9435_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_9435_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_9435_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_9435_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2586_c11_a2a1]
signal BIN_OP_EQ_uxn_opcodes_h_l2586_c11_a2a1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2586_c11_a2a1_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2586_c11_a2a1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2586_c7_c642]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_c642_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_c642_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_c642_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_c642_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2586_c7_c642]
signal result_u8_value_MUX_uxn_opcodes_h_l2586_c7_c642_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2586_c7_c642_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2586_c7_c642_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2586_c7_c642_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2586_c7_c642]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_c642_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_c642_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_c642_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_c642_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2586_c7_c642]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_c642_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_c642_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_c642_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_c642_return_output : unsigned(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2588_c31_c811]
signal CONST_SR_8_uxn_opcodes_h_l2588_c31_c811_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2588_c31_c811_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2590_c11_0748]
signal BIN_OP_EQ_uxn_opcodes_h_l2590_c11_0748_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2590_c11_0748_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2590_c11_0748_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2590_c7_1bea]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2590_c7_1bea_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2590_c7_1bea_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2590_c7_1bea_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2590_c7_1bea_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2590_c7_1bea]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2590_c7_1bea_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2590_c7_1bea_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2590_c7_1bea_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2590_c7_1bea_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2567_l2558_DUPLICATE_4249
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2567_l2558_DUPLICATE_4249_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2567_l2558_DUPLICATE_4249_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_eae7( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.stack_address_sp_offset := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2546_c6_8684
BIN_OP_EQ_uxn_opcodes_h_l2546_c6_8684 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2546_c6_8684_left,
BIN_OP_EQ_uxn_opcodes_h_l2546_c6_8684_right,
BIN_OP_EQ_uxn_opcodes_h_l2546_c6_8684_return_output);

-- n16_MUX_uxn_opcodes_h_l2546_c2_97e4
n16_MUX_uxn_opcodes_h_l2546_c2_97e4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2546_c2_97e4_cond,
n16_MUX_uxn_opcodes_h_l2546_c2_97e4_iftrue,
n16_MUX_uxn_opcodes_h_l2546_c2_97e4_iffalse,
n16_MUX_uxn_opcodes_h_l2546_c2_97e4_return_output);

-- t16_MUX_uxn_opcodes_h_l2546_c2_97e4
t16_MUX_uxn_opcodes_h_l2546_c2_97e4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2546_c2_97e4_cond,
t16_MUX_uxn_opcodes_h_l2546_c2_97e4_iftrue,
t16_MUX_uxn_opcodes_h_l2546_c2_97e4_iffalse,
t16_MUX_uxn_opcodes_h_l2546_c2_97e4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2546_c2_97e4
result_u8_value_MUX_uxn_opcodes_h_l2546_c2_97e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2546_c2_97e4_cond,
result_u8_value_MUX_uxn_opcodes_h_l2546_c2_97e4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2546_c2_97e4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2546_c2_97e4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2546_c2_97e4
result_is_stack_write_MUX_uxn_opcodes_h_l2546_c2_97e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2546_c2_97e4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2546_c2_97e4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2546_c2_97e4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2546_c2_97e4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2546_c2_97e4
result_is_opc_done_MUX_uxn_opcodes_h_l2546_c2_97e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2546_c2_97e4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2546_c2_97e4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2546_c2_97e4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2546_c2_97e4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c2_97e4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c2_97e4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c2_97e4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c2_97e4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c2_97e4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c2_97e4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2546_c2_97e4
result_sp_relative_shift_MUX_uxn_opcodes_h_l2546_c2_97e4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2546_c2_97e4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2546_c2_97e4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2546_c2_97e4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2546_c2_97e4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2553_c11_6e4c
BIN_OP_EQ_uxn_opcodes_h_l2553_c11_6e4c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2553_c11_6e4c_left,
BIN_OP_EQ_uxn_opcodes_h_l2553_c11_6e4c_right,
BIN_OP_EQ_uxn_opcodes_h_l2553_c11_6e4c_return_output);

-- n16_MUX_uxn_opcodes_h_l2553_c7_93e6
n16_MUX_uxn_opcodes_h_l2553_c7_93e6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2553_c7_93e6_cond,
n16_MUX_uxn_opcodes_h_l2553_c7_93e6_iftrue,
n16_MUX_uxn_opcodes_h_l2553_c7_93e6_iffalse,
n16_MUX_uxn_opcodes_h_l2553_c7_93e6_return_output);

-- t16_MUX_uxn_opcodes_h_l2553_c7_93e6
t16_MUX_uxn_opcodes_h_l2553_c7_93e6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2553_c7_93e6_cond,
t16_MUX_uxn_opcodes_h_l2553_c7_93e6_iftrue,
t16_MUX_uxn_opcodes_h_l2553_c7_93e6_iffalse,
t16_MUX_uxn_opcodes_h_l2553_c7_93e6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2553_c7_93e6
result_u8_value_MUX_uxn_opcodes_h_l2553_c7_93e6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2553_c7_93e6_cond,
result_u8_value_MUX_uxn_opcodes_h_l2553_c7_93e6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2553_c7_93e6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2553_c7_93e6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2553_c7_93e6
result_is_stack_write_MUX_uxn_opcodes_h_l2553_c7_93e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2553_c7_93e6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2553_c7_93e6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2553_c7_93e6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2553_c7_93e6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_93e6
result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_93e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_93e6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_93e6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_93e6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_93e6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2553_c7_93e6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2553_c7_93e6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2553_c7_93e6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2553_c7_93e6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2553_c7_93e6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2553_c7_93e6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2553_c7_93e6
result_sp_relative_shift_MUX_uxn_opcodes_h_l2553_c7_93e6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2553_c7_93e6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2553_c7_93e6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2553_c7_93e6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2553_c7_93e6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2556_c11_fc66
BIN_OP_EQ_uxn_opcodes_h_l2556_c11_fc66 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2556_c11_fc66_left,
BIN_OP_EQ_uxn_opcodes_h_l2556_c11_fc66_right,
BIN_OP_EQ_uxn_opcodes_h_l2556_c11_fc66_return_output);

-- n16_MUX_uxn_opcodes_h_l2556_c7_dcd8
n16_MUX_uxn_opcodes_h_l2556_c7_dcd8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2556_c7_dcd8_cond,
n16_MUX_uxn_opcodes_h_l2556_c7_dcd8_iftrue,
n16_MUX_uxn_opcodes_h_l2556_c7_dcd8_iffalse,
n16_MUX_uxn_opcodes_h_l2556_c7_dcd8_return_output);

-- t16_MUX_uxn_opcodes_h_l2556_c7_dcd8
t16_MUX_uxn_opcodes_h_l2556_c7_dcd8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2556_c7_dcd8_cond,
t16_MUX_uxn_opcodes_h_l2556_c7_dcd8_iftrue,
t16_MUX_uxn_opcodes_h_l2556_c7_dcd8_iffalse,
t16_MUX_uxn_opcodes_h_l2556_c7_dcd8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2556_c7_dcd8
result_u8_value_MUX_uxn_opcodes_h_l2556_c7_dcd8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2556_c7_dcd8_cond,
result_u8_value_MUX_uxn_opcodes_h_l2556_c7_dcd8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2556_c7_dcd8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2556_c7_dcd8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2556_c7_dcd8
result_is_stack_write_MUX_uxn_opcodes_h_l2556_c7_dcd8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2556_c7_dcd8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2556_c7_dcd8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2556_c7_dcd8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2556_c7_dcd8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_dcd8
result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_dcd8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_dcd8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_dcd8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_dcd8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_dcd8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_dcd8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_dcd8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_dcd8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_dcd8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_dcd8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_dcd8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_dcd8
result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_dcd8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_dcd8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_dcd8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_dcd8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_dcd8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2561_c11_1176
BIN_OP_EQ_uxn_opcodes_h_l2561_c11_1176 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2561_c11_1176_left,
BIN_OP_EQ_uxn_opcodes_h_l2561_c11_1176_right,
BIN_OP_EQ_uxn_opcodes_h_l2561_c11_1176_return_output);

-- n16_MUX_uxn_opcodes_h_l2561_c7_3623
n16_MUX_uxn_opcodes_h_l2561_c7_3623 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2561_c7_3623_cond,
n16_MUX_uxn_opcodes_h_l2561_c7_3623_iftrue,
n16_MUX_uxn_opcodes_h_l2561_c7_3623_iffalse,
n16_MUX_uxn_opcodes_h_l2561_c7_3623_return_output);

-- t16_MUX_uxn_opcodes_h_l2561_c7_3623
t16_MUX_uxn_opcodes_h_l2561_c7_3623 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2561_c7_3623_cond,
t16_MUX_uxn_opcodes_h_l2561_c7_3623_iftrue,
t16_MUX_uxn_opcodes_h_l2561_c7_3623_iffalse,
t16_MUX_uxn_opcodes_h_l2561_c7_3623_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2561_c7_3623
result_u8_value_MUX_uxn_opcodes_h_l2561_c7_3623 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2561_c7_3623_cond,
result_u8_value_MUX_uxn_opcodes_h_l2561_c7_3623_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2561_c7_3623_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2561_c7_3623_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_3623
result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_3623 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_3623_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_3623_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_3623_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_3623_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_3623
result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_3623 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_3623_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_3623_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_3623_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_3623_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_3623
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_3623 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_3623_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_3623_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_3623_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_3623_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_3623
result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_3623 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_3623_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_3623_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_3623_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_3623_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2562_c3_bcc5
BIN_OP_OR_uxn_opcodes_h_l2562_c3_bcc5 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2562_c3_bcc5_left,
BIN_OP_OR_uxn_opcodes_h_l2562_c3_bcc5_right,
BIN_OP_OR_uxn_opcodes_h_l2562_c3_bcc5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2565_c11_a6ad
BIN_OP_EQ_uxn_opcodes_h_l2565_c11_a6ad : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2565_c11_a6ad_left,
BIN_OP_EQ_uxn_opcodes_h_l2565_c11_a6ad_right,
BIN_OP_EQ_uxn_opcodes_h_l2565_c11_a6ad_return_output);

-- n16_MUX_uxn_opcodes_h_l2565_c7_329b
n16_MUX_uxn_opcodes_h_l2565_c7_329b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2565_c7_329b_cond,
n16_MUX_uxn_opcodes_h_l2565_c7_329b_iftrue,
n16_MUX_uxn_opcodes_h_l2565_c7_329b_iffalse,
n16_MUX_uxn_opcodes_h_l2565_c7_329b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2565_c7_329b
result_u8_value_MUX_uxn_opcodes_h_l2565_c7_329b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2565_c7_329b_cond,
result_u8_value_MUX_uxn_opcodes_h_l2565_c7_329b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2565_c7_329b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2565_c7_329b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2565_c7_329b
result_is_stack_write_MUX_uxn_opcodes_h_l2565_c7_329b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2565_c7_329b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2565_c7_329b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2565_c7_329b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2565_c7_329b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_329b
result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_329b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_329b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_329b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_329b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_329b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_329b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_329b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_329b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_329b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_329b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_329b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_329b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_329b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_329b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_329b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_329b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_329b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2569_c11_5296
BIN_OP_EQ_uxn_opcodes_h_l2569_c11_5296 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2569_c11_5296_left,
BIN_OP_EQ_uxn_opcodes_h_l2569_c11_5296_right,
BIN_OP_EQ_uxn_opcodes_h_l2569_c11_5296_return_output);

-- n16_MUX_uxn_opcodes_h_l2569_c7_5340
n16_MUX_uxn_opcodes_h_l2569_c7_5340 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2569_c7_5340_cond,
n16_MUX_uxn_opcodes_h_l2569_c7_5340_iftrue,
n16_MUX_uxn_opcodes_h_l2569_c7_5340_iffalse,
n16_MUX_uxn_opcodes_h_l2569_c7_5340_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2569_c7_5340
result_u8_value_MUX_uxn_opcodes_h_l2569_c7_5340 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2569_c7_5340_cond,
result_u8_value_MUX_uxn_opcodes_h_l2569_c7_5340_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2569_c7_5340_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2569_c7_5340_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2569_c7_5340
result_is_stack_write_MUX_uxn_opcodes_h_l2569_c7_5340 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2569_c7_5340_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2569_c7_5340_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2569_c7_5340_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2569_c7_5340_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_5340
result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_5340 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_5340_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_5340_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_5340_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_5340_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_5340
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_5340 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_5340_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_5340_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_5340_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_5340_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_5340
result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_5340 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_5340_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_5340_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_5340_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_5340_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2570_c3_2ed7
BIN_OP_OR_uxn_opcodes_h_l2570_c3_2ed7 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2570_c3_2ed7_left,
BIN_OP_OR_uxn_opcodes_h_l2570_c3_2ed7_right,
BIN_OP_OR_uxn_opcodes_h_l2570_c3_2ed7_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2572_c30_71a7
sp_relative_shift_uxn_opcodes_h_l2572_c30_71a7 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2572_c30_71a7_ins,
sp_relative_shift_uxn_opcodes_h_l2572_c30_71a7_x,
sp_relative_shift_uxn_opcodes_h_l2572_c30_71a7_y,
sp_relative_shift_uxn_opcodes_h_l2572_c30_71a7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2577_c11_3b3e
BIN_OP_EQ_uxn_opcodes_h_l2577_c11_3b3e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2577_c11_3b3e_left,
BIN_OP_EQ_uxn_opcodes_h_l2577_c11_3b3e_right,
BIN_OP_EQ_uxn_opcodes_h_l2577_c11_3b3e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2577_c7_eae6
result_u8_value_MUX_uxn_opcodes_h_l2577_c7_eae6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2577_c7_eae6_cond,
result_u8_value_MUX_uxn_opcodes_h_l2577_c7_eae6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2577_c7_eae6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2577_c7_eae6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2577_c7_eae6
result_is_stack_write_MUX_uxn_opcodes_h_l2577_c7_eae6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2577_c7_eae6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2577_c7_eae6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2577_c7_eae6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2577_c7_eae6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2577_c7_eae6
result_is_opc_done_MUX_uxn_opcodes_h_l2577_c7_eae6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2577_c7_eae6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2577_c7_eae6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2577_c7_eae6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2577_c7_eae6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2577_c7_eae6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2577_c7_eae6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2577_c7_eae6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2577_c7_eae6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2577_c7_eae6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2577_c7_eae6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2577_c7_eae6
result_sp_relative_shift_MUX_uxn_opcodes_h_l2577_c7_eae6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2577_c7_eae6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2577_c7_eae6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2577_c7_eae6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2577_c7_eae6_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2580_c31_4a1d
CONST_SR_8_uxn_opcodes_h_l2580_c31_4a1d : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2580_c31_4a1d_x,
CONST_SR_8_uxn_opcodes_h_l2580_c31_4a1d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2582_c11_4923
BIN_OP_EQ_uxn_opcodes_h_l2582_c11_4923 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2582_c11_4923_left,
BIN_OP_EQ_uxn_opcodes_h_l2582_c11_4923_right,
BIN_OP_EQ_uxn_opcodes_h_l2582_c11_4923_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_9435
result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_9435 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_9435_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_9435_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_9435_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_9435_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2582_c7_9435
result_u8_value_MUX_uxn_opcodes_h_l2582_c7_9435 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2582_c7_9435_cond,
result_u8_value_MUX_uxn_opcodes_h_l2582_c7_9435_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2582_c7_9435_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2582_c7_9435_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_9435
result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_9435 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_9435_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_9435_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_9435_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_9435_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_9435
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_9435 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_9435_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_9435_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_9435_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_9435_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2586_c11_a2a1
BIN_OP_EQ_uxn_opcodes_h_l2586_c11_a2a1 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2586_c11_a2a1_left,
BIN_OP_EQ_uxn_opcodes_h_l2586_c11_a2a1_right,
BIN_OP_EQ_uxn_opcodes_h_l2586_c11_a2a1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_c642
result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_c642 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_c642_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_c642_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_c642_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_c642_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2586_c7_c642
result_u8_value_MUX_uxn_opcodes_h_l2586_c7_c642 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2586_c7_c642_cond,
result_u8_value_MUX_uxn_opcodes_h_l2586_c7_c642_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2586_c7_c642_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2586_c7_c642_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_c642
result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_c642 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_c642_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_c642_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_c642_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_c642_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_c642
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_c642 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_c642_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_c642_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_c642_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_c642_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2588_c31_c811
CONST_SR_8_uxn_opcodes_h_l2588_c31_c811 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2588_c31_c811_x,
CONST_SR_8_uxn_opcodes_h_l2588_c31_c811_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2590_c11_0748
BIN_OP_EQ_uxn_opcodes_h_l2590_c11_0748 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2590_c11_0748_left,
BIN_OP_EQ_uxn_opcodes_h_l2590_c11_0748_right,
BIN_OP_EQ_uxn_opcodes_h_l2590_c11_0748_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2590_c7_1bea
result_is_opc_done_MUX_uxn_opcodes_h_l2590_c7_1bea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2590_c7_1bea_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2590_c7_1bea_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2590_c7_1bea_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2590_c7_1bea_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2590_c7_1bea
result_is_stack_write_MUX_uxn_opcodes_h_l2590_c7_1bea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2590_c7_1bea_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2590_c7_1bea_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2590_c7_1bea_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2590_c7_1bea_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2567_l2558_DUPLICATE_4249
CONST_SL_8_uint16_t_uxn_opcodes_h_l2567_l2558_DUPLICATE_4249 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2567_l2558_DUPLICATE_4249_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2567_l2558_DUPLICATE_4249_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2546_c6_8684_return_output,
 n16_MUX_uxn_opcodes_h_l2546_c2_97e4_return_output,
 t16_MUX_uxn_opcodes_h_l2546_c2_97e4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2546_c2_97e4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2546_c2_97e4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2546_c2_97e4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c2_97e4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2546_c2_97e4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2553_c11_6e4c_return_output,
 n16_MUX_uxn_opcodes_h_l2553_c7_93e6_return_output,
 t16_MUX_uxn_opcodes_h_l2553_c7_93e6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2553_c7_93e6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2553_c7_93e6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_93e6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2553_c7_93e6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2553_c7_93e6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2556_c11_fc66_return_output,
 n16_MUX_uxn_opcodes_h_l2556_c7_dcd8_return_output,
 t16_MUX_uxn_opcodes_h_l2556_c7_dcd8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2556_c7_dcd8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2556_c7_dcd8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_dcd8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_dcd8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_dcd8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2561_c11_1176_return_output,
 n16_MUX_uxn_opcodes_h_l2561_c7_3623_return_output,
 t16_MUX_uxn_opcodes_h_l2561_c7_3623_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2561_c7_3623_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_3623_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_3623_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_3623_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_3623_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2562_c3_bcc5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2565_c11_a6ad_return_output,
 n16_MUX_uxn_opcodes_h_l2565_c7_329b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2565_c7_329b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2565_c7_329b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_329b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_329b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_329b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2569_c11_5296_return_output,
 n16_MUX_uxn_opcodes_h_l2569_c7_5340_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2569_c7_5340_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2569_c7_5340_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_5340_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_5340_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_5340_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2570_c3_2ed7_return_output,
 sp_relative_shift_uxn_opcodes_h_l2572_c30_71a7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2577_c11_3b3e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2577_c7_eae6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2577_c7_eae6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2577_c7_eae6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2577_c7_eae6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2577_c7_eae6_return_output,
 CONST_SR_8_uxn_opcodes_h_l2580_c31_4a1d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2582_c11_4923_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_9435_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2582_c7_9435_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_9435_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_9435_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2586_c11_a2a1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_c642_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2586_c7_c642_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_c642_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_c642_return_output,
 CONST_SR_8_uxn_opcodes_h_l2588_c31_c811_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2590_c11_0748_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2590_c7_1bea_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2590_c7_1bea_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2567_l2558_DUPLICATE_4249_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2546_c6_8684_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2546_c6_8684_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2546_c6_8684_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2546_c2_97e4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2546_c2_97e4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2553_c7_93e6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2546_c2_97e4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2546_c2_97e4_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2546_c2_97e4_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2546_c2_97e4_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2553_c7_93e6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2546_c2_97e4_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2546_c2_97e4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2546_c2_97e4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2546_c2_97e4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2553_c7_93e6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2546_c2_97e4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2546_c2_97e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2546_c2_97e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2546_c2_97e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2553_c7_93e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2546_c2_97e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2546_c2_97e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2546_c2_97e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2546_c2_97e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_93e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2546_c2_97e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2546_c2_97e4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c2_97e4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2550_c3_ae7d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c2_97e4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2553_c7_93e6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c2_97e4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c2_97e4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2546_c2_97e4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2546_c2_97e4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2553_c7_93e6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2546_c2_97e4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2546_c2_97e4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2553_c11_6e4c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2553_c11_6e4c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2553_c11_6e4c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2553_c7_93e6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2553_c7_93e6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2556_c7_dcd8_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2553_c7_93e6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2553_c7_93e6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2553_c7_93e6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2556_c7_dcd8_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2553_c7_93e6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2553_c7_93e6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2553_c7_93e6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2556_c7_dcd8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2553_c7_93e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2553_c7_93e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2553_c7_93e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2556_c7_dcd8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2553_c7_93e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_93e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_93e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_dcd8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_93e6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2553_c7_93e6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2554_c3_504b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2553_c7_93e6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_dcd8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2553_c7_93e6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2553_c7_93e6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2553_c7_93e6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_dcd8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2553_c7_93e6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2556_c11_fc66_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2556_c11_fc66_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2556_c11_fc66_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2556_c7_dcd8_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2556_c7_dcd8_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2561_c7_3623_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2556_c7_dcd8_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2556_c7_dcd8_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2556_c7_dcd8_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2561_c7_3623_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2556_c7_dcd8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2556_c7_dcd8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2556_c7_dcd8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2561_c7_3623_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2556_c7_dcd8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2556_c7_dcd8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2556_c7_dcd8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_3623_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2556_c7_dcd8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_dcd8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_dcd8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_3623_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_dcd8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_dcd8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2559_c3_24a5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_dcd8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_3623_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_dcd8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_dcd8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_dcd8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_3623_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_dcd8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_1176_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_1176_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_1176_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2561_c7_3623_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2561_c7_3623_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2565_c7_329b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2561_c7_3623_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2561_c7_3623_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2561_c7_3623_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2561_c7_3623_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2561_c7_3623_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2561_c7_3623_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2565_c7_329b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2561_c7_3623_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_3623_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_3623_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2565_c7_329b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_3623_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_3623_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_3623_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_329b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_3623_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_3623_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2563_c3_2e42 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_3623_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_329b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_3623_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_3623_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_3623_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_329b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_3623_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2562_c3_bcc5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2562_c3_bcc5_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2562_c3_bcc5_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c11_a6ad_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c11_a6ad_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c11_a6ad_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2565_c7_329b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2565_c7_329b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2569_c7_5340_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2565_c7_329b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2565_c7_329b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2565_c7_329b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2569_c7_5340_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2565_c7_329b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2565_c7_329b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2565_c7_329b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2569_c7_5340_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2565_c7_329b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_329b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_329b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_5340_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_329b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_329b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_329b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_5340_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_329b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_329b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_329b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_5340_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_329b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2569_c11_5296_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2569_c11_5296_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2569_c11_5296_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2569_c7_5340_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2569_c7_5340_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2569_c7_5340_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2569_c7_5340_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2569_c7_5340_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2577_c7_eae6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2569_c7_5340_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2569_c7_5340_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2569_c7_5340_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2577_c7_eae6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2569_c7_5340_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_5340_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_5340_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2577_c7_eae6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_5340_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_5340_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2574_c3_9ea7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_5340_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2577_c7_eae6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_5340_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_5340_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_5340_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2577_c7_eae6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_5340_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2570_c3_2ed7_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2570_c3_2ed7_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2570_c3_2ed7_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2572_c30_71a7_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2572_c30_71a7_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2572_c30_71a7_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2572_c30_71a7_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2575_c21_feb5_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2577_c11_3b3e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2577_c11_3b3e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2577_c11_3b3e_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2577_c7_eae6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2577_c7_eae6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2582_c7_9435_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2577_c7_eae6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2577_c7_eae6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2577_c7_eae6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_9435_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2577_c7_eae6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2577_c7_eae6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2577_c7_eae6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_9435_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2577_c7_eae6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2577_c7_eae6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2579_c3_9111 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2577_c7_eae6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_9435_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2577_c7_eae6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2577_c7_eae6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2578_c3_2a11 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2577_c7_eae6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2577_c7_eae6_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2580_c31_4a1d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2580_c31_4a1d_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2580_c21_b4ce_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_4923_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_4923_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_4923_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_9435_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_9435_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_c642_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_9435_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2582_c7_9435_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2582_c7_9435_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c7_c642_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2582_c7_9435_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_9435_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_9435_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_c642_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_9435_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_9435_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2583_c3_9af4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_9435_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_c642_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_9435_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2584_c21_68c7_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_a2a1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_a2a1_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_a2a1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_c642_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_c642_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2590_c7_1bea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_c642_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c7_c642_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c7_c642_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c7_c642_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_c642_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_c642_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2590_c7_1bea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_c642_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_c642_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2587_c3_6887 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_c642_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_c642_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2588_c31_c811_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2588_c31_c811_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2588_c21_9a26_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2590_c11_0748_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2590_c11_0748_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2590_c11_0748_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2590_c7_1bea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2590_c7_1bea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2590_c7_1bea_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2590_c7_1bea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2590_c7_1bea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2590_c7_1bea_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2556_l2586_l2553_l2546_l2565_l2561_DUPLICATE_71ef_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2590_l2556_l2586_l2553_l2582_l2546_l2577_l2565_l2561_DUPLICATE_809d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2556_l2553_l2546_l2577_l2565_l2561_DUPLICATE_897f_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2590_l2556_l2586_l2553_l2582_l2577_l2569_l2565_l2561_DUPLICATE_161c_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2557_l2570_l2562_l2566_DUPLICATE_72bf_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2567_l2558_DUPLICATE_4249_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2567_l2558_DUPLICATE_4249_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2565_l2586_DUPLICATE_1b3b_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l2542_l2595_DUPLICATE_9092_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2579_c3_9111 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2577_c7_eae6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2579_c3_9111;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2553_c11_6e4c_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c11_a6ad_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_4923_right := to_unsigned(7, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2590_c7_1bea_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2563_c3_2e42 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_3623_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2563_c3_2e42;
     VAR_sp_relative_shift_uxn_opcodes_h_l2572_c30_71a7_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2554_c3_504b := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2553_c7_93e6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2554_c3_504b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2577_c11_3b3e_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2556_c11_fc66_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2559_c3_24a5 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_dcd8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2559_c3_24a5;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2574_c3_9ea7 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_5340_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2574_c3_9ea7;
     VAR_sp_relative_shift_uxn_opcodes_h_l2572_c30_71a7_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2550_c3_ae7d := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c2_97e4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2550_c3_ae7d;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2569_c7_5340_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2546_c6_8684_right := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2578_c3_2a11 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2577_c7_eae6_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2578_c3_2a11;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2590_c7_1bea_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_a2a1_right := to_unsigned(8, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2546_c2_97e4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2569_c11_5296_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2590_c11_0748_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2587_c3_6887 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_c642_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2587_c3_6887;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2583_c3_9af4 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_9435_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2583_c3_9af4;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_1176_right := to_unsigned(3, 2);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2572_c30_71a7_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2570_c3_2ed7_left := n16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2580_c31_4a1d_x := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2546_c2_97e4_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2553_c7_93e6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2556_c7_dcd8_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2561_c7_3623_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2569_c7_5340_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2546_c6_8684_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2553_c11_6e4c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2556_c11_fc66_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_1176_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c11_a6ad_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2569_c11_5296_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2577_c11_3b3e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_4923_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_a2a1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2590_c11_0748_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2562_c3_bcc5_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2588_c31_c811_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2546_c2_97e4_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2553_c7_93e6_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2561_c7_3623_iffalse := t16;
     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2556_l2553_l2546_l2577_l2565_l2561_DUPLICATE_897f LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2556_l2553_l2546_l2577_l2565_l2561_DUPLICATE_897f_return_output := result.sp_relative_shift;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2584_c21_68c7] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2584_c21_68c7_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- BIN_OP_EQ[uxn_opcodes_h_l2582_c11_4923] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2582_c11_4923_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_4923_left;
     BIN_OP_EQ_uxn_opcodes_h_l2582_c11_4923_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_4923_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_4923_return_output := BIN_OP_EQ_uxn_opcodes_h_l2582_c11_4923_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2556_c11_fc66] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2556_c11_fc66_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2556_c11_fc66_left;
     BIN_OP_EQ_uxn_opcodes_h_l2556_c11_fc66_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2556_c11_fc66_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2556_c11_fc66_return_output := BIN_OP_EQ_uxn_opcodes_h_l2556_c11_fc66_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2565_c11_a6ad] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2565_c11_a6ad_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c11_a6ad_left;
     BIN_OP_EQ_uxn_opcodes_h_l2565_c11_a6ad_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c11_a6ad_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c11_a6ad_return_output := BIN_OP_EQ_uxn_opcodes_h_l2565_c11_a6ad_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2572_c30_71a7] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2572_c30_71a7_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2572_c30_71a7_ins;
     sp_relative_shift_uxn_opcodes_h_l2572_c30_71a7_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2572_c30_71a7_x;
     sp_relative_shift_uxn_opcodes_h_l2572_c30_71a7_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2572_c30_71a7_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2572_c30_71a7_return_output := sp_relative_shift_uxn_opcodes_h_l2572_c30_71a7_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2580_c31_4a1d] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2580_c31_4a1d_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2580_c31_4a1d_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2580_c31_4a1d_return_output := CONST_SR_8_uxn_opcodes_h_l2580_c31_4a1d_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2557_l2570_l2562_l2566_DUPLICATE_72bf LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2557_l2570_l2562_l2566_DUPLICATE_72bf_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2590_l2556_l2586_l2553_l2582_l2546_l2577_l2565_l2561_DUPLICATE_809d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2590_l2556_l2586_l2553_l2582_l2546_l2577_l2565_l2561_DUPLICATE_809d_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2546_c6_8684] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2546_c6_8684_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2546_c6_8684_left;
     BIN_OP_EQ_uxn_opcodes_h_l2546_c6_8684_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2546_c6_8684_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2546_c6_8684_return_output := BIN_OP_EQ_uxn_opcodes_h_l2546_c6_8684_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2569_c11_5296] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2569_c11_5296_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2569_c11_5296_left;
     BIN_OP_EQ_uxn_opcodes_h_l2569_c11_5296_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2569_c11_5296_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2569_c11_5296_return_output := BIN_OP_EQ_uxn_opcodes_h_l2569_c11_5296_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2586_c11_a2a1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2586_c11_a2a1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_a2a1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2586_c11_a2a1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_a2a1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_a2a1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2586_c11_a2a1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2590_c11_0748] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2590_c11_0748_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2590_c11_0748_left;
     BIN_OP_EQ_uxn_opcodes_h_l2590_c11_0748_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2590_c11_0748_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2590_c11_0748_return_output := BIN_OP_EQ_uxn_opcodes_h_l2590_c11_0748_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2577_c11_3b3e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2577_c11_3b3e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2577_c11_3b3e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2577_c11_3b3e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2577_c11_3b3e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2577_c11_3b3e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2577_c11_3b3e_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2556_l2586_l2553_l2546_l2565_l2561_DUPLICATE_71ef LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2556_l2586_l2553_l2546_l2565_l2561_DUPLICATE_71ef_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2561_c11_1176] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2561_c11_1176_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_1176_left;
     BIN_OP_EQ_uxn_opcodes_h_l2561_c11_1176_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_1176_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_1176_return_output := BIN_OP_EQ_uxn_opcodes_h_l2561_c11_1176_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2565_l2586_DUPLICATE_1b3b LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2565_l2586_DUPLICATE_1b3b_return_output := result.stack_address_sp_offset;

     -- CONST_SR_8[uxn_opcodes_h_l2588_c31_c811] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2588_c31_c811_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2588_c31_c811_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2588_c31_c811_return_output := CONST_SR_8_uxn_opcodes_h_l2588_c31_c811_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2553_c11_6e4c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2553_c11_6e4c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2553_c11_6e4c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2553_c11_6e4c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2553_c11_6e4c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2553_c11_6e4c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2553_c11_6e4c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2590_l2556_l2586_l2553_l2582_l2577_l2569_l2565_l2561_DUPLICATE_161c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2590_l2556_l2586_l2553_l2582_l2577_l2569_l2565_l2561_DUPLICATE_161c_return_output := result.is_opc_done;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l2546_c2_97e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2546_c6_8684_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2546_c2_97e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2546_c6_8684_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2546_c2_97e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2546_c6_8684_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2546_c2_97e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2546_c6_8684_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c2_97e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2546_c6_8684_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2546_c2_97e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2546_c6_8684_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2546_c2_97e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2546_c6_8684_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2553_c7_93e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2553_c11_6e4c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_93e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2553_c11_6e4c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2553_c7_93e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2553_c11_6e4c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2553_c7_93e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2553_c11_6e4c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2553_c7_93e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2553_c11_6e4c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2553_c7_93e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2553_c11_6e4c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2553_c7_93e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2553_c11_6e4c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2556_c7_dcd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2556_c11_fc66_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_dcd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2556_c11_fc66_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2556_c7_dcd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2556_c11_fc66_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_dcd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2556_c11_fc66_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_dcd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2556_c11_fc66_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2556_c7_dcd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2556_c11_fc66_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2556_c7_dcd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2556_c11_fc66_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2561_c7_3623_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_1176_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_3623_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_1176_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_3623_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_1176_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_3623_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_1176_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_3623_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_1176_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2561_c7_3623_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_1176_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2561_c7_3623_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_1176_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2565_c7_329b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c11_a6ad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_329b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c11_a6ad_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2565_c7_329b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c11_a6ad_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_329b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c11_a6ad_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_329b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c11_a6ad_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2565_c7_329b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c11_a6ad_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2569_c7_5340_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2569_c11_5296_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_5340_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2569_c11_5296_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2569_c7_5340_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2569_c11_5296_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_5340_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2569_c11_5296_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_5340_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2569_c11_5296_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2569_c7_5340_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2569_c11_5296_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2577_c7_eae6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2577_c11_3b3e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2577_c7_eae6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2577_c11_3b3e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2577_c7_eae6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2577_c11_3b3e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2577_c7_eae6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2577_c11_3b3e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2577_c7_eae6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2577_c11_3b3e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_9435_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_4923_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_9435_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_4923_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_9435_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_4923_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2582_c7_9435_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_4923_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_c642_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_a2a1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_c642_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_a2a1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_c642_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_a2a1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c7_c642_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_a2a1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2590_c7_1bea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2590_c11_0748_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2590_c7_1bea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2590_c11_0748_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2562_c3_bcc5_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2557_l2570_l2562_l2566_DUPLICATE_72bf_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2570_c3_2ed7_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2557_l2570_l2562_l2566_DUPLICATE_72bf_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2567_l2558_DUPLICATE_4249_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2557_l2570_l2562_l2566_DUPLICATE_72bf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2582_c7_9435_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2584_c21_68c7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2546_c2_97e4_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2556_l2553_l2546_l2577_l2565_l2561_DUPLICATE_897f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2553_c7_93e6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2556_l2553_l2546_l2577_l2565_l2561_DUPLICATE_897f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_dcd8_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2556_l2553_l2546_l2577_l2565_l2561_DUPLICATE_897f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_3623_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2556_l2553_l2546_l2577_l2565_l2561_DUPLICATE_897f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_329b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2556_l2553_l2546_l2577_l2565_l2561_DUPLICATE_897f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2577_c7_eae6_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2556_l2553_l2546_l2577_l2565_l2561_DUPLICATE_897f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_93e6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2590_l2556_l2586_l2553_l2582_l2577_l2569_l2565_l2561_DUPLICATE_161c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_dcd8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2590_l2556_l2586_l2553_l2582_l2577_l2569_l2565_l2561_DUPLICATE_161c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_3623_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2590_l2556_l2586_l2553_l2582_l2577_l2569_l2565_l2561_DUPLICATE_161c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_329b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2590_l2556_l2586_l2553_l2582_l2577_l2569_l2565_l2561_DUPLICATE_161c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_5340_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2590_l2556_l2586_l2553_l2582_l2577_l2569_l2565_l2561_DUPLICATE_161c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2577_c7_eae6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2590_l2556_l2586_l2553_l2582_l2577_l2569_l2565_l2561_DUPLICATE_161c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_9435_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2590_l2556_l2586_l2553_l2582_l2577_l2569_l2565_l2561_DUPLICATE_161c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_c642_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2590_l2556_l2586_l2553_l2582_l2577_l2569_l2565_l2561_DUPLICATE_161c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2590_c7_1bea_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2590_l2556_l2586_l2553_l2582_l2577_l2569_l2565_l2561_DUPLICATE_161c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2546_c2_97e4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2590_l2556_l2586_l2553_l2582_l2546_l2577_l2565_l2561_DUPLICATE_809d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2553_c7_93e6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2590_l2556_l2586_l2553_l2582_l2546_l2577_l2565_l2561_DUPLICATE_809d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2556_c7_dcd8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2590_l2556_l2586_l2553_l2582_l2546_l2577_l2565_l2561_DUPLICATE_809d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_3623_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2590_l2556_l2586_l2553_l2582_l2546_l2577_l2565_l2561_DUPLICATE_809d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2565_c7_329b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2590_l2556_l2586_l2553_l2582_l2546_l2577_l2565_l2561_DUPLICATE_809d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2577_c7_eae6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2590_l2556_l2586_l2553_l2582_l2546_l2577_l2565_l2561_DUPLICATE_809d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_9435_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2590_l2556_l2586_l2553_l2582_l2546_l2577_l2565_l2561_DUPLICATE_809d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_c642_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2590_l2556_l2586_l2553_l2582_l2546_l2577_l2565_l2561_DUPLICATE_809d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2590_c7_1bea_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2590_l2556_l2586_l2553_l2582_l2546_l2577_l2565_l2561_DUPLICATE_809d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_329b_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2565_l2586_DUPLICATE_1b3b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_c642_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2565_l2586_DUPLICATE_1b3b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2546_c2_97e4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2556_l2586_l2553_l2546_l2565_l2561_DUPLICATE_71ef_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2553_c7_93e6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2556_l2586_l2553_l2546_l2565_l2561_DUPLICATE_71ef_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2556_c7_dcd8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2556_l2586_l2553_l2546_l2565_l2561_DUPLICATE_71ef_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2561_c7_3623_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2556_l2586_l2553_l2546_l2565_l2561_DUPLICATE_71ef_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2565_c7_329b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2556_l2586_l2553_l2546_l2565_l2561_DUPLICATE_71ef_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c7_c642_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2556_l2586_l2553_l2546_l2565_l2561_DUPLICATE_71ef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_5340_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2572_c30_71a7_return_output;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l2588_c21_9a26] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2588_c21_9a26_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2588_c31_c811_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2586_c7_c642] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_c642_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_c642_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_c642_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_c642_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_c642_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_c642_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_c642_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_c642_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2590_c7_1bea] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2590_c7_1bea_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2590_c7_1bea_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2590_c7_1bea_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2590_c7_1bea_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2590_c7_1bea_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2590_c7_1bea_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2590_c7_1bea_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2590_c7_1bea_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2570_c3_2ed7] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2570_c3_2ed7_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2570_c3_2ed7_left;
     BIN_OP_OR_uxn_opcodes_h_l2570_c3_2ed7_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2570_c3_2ed7_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2570_c3_2ed7_return_output := BIN_OP_OR_uxn_opcodes_h_l2570_c3_2ed7_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2567_l2558_DUPLICATE_4249 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2567_l2558_DUPLICATE_4249_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2567_l2558_DUPLICATE_4249_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2567_l2558_DUPLICATE_4249_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2567_l2558_DUPLICATE_4249_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2562_c3_bcc5] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2562_c3_bcc5_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2562_c3_bcc5_left;
     BIN_OP_OR_uxn_opcodes_h_l2562_c3_bcc5_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2562_c3_bcc5_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2562_c3_bcc5_return_output := BIN_OP_OR_uxn_opcodes_h_l2562_c3_bcc5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2590_c7_1bea] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2590_c7_1bea_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2590_c7_1bea_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2590_c7_1bea_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2590_c7_1bea_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2590_c7_1bea_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2590_c7_1bea_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2590_c7_1bea_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2590_c7_1bea_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2580_c21_b4ce] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2580_c21_b4ce_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2580_c31_4a1d_return_output);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2577_c7_eae6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2577_c7_eae6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2577_c7_eae6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2577_c7_eae6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2577_c7_eae6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2577_c7_eae6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2577_c7_eae6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2577_c7_eae6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2577_c7_eae6_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2561_c7_3623_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2562_c3_bcc5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2569_c7_5340_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2570_c3_2ed7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2577_c7_eae6_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2580_c21_b4ce_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c7_c642_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2588_c21_9a26_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2565_c7_329b_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2567_l2558_DUPLICATE_4249_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2556_c7_dcd8_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2567_l2558_DUPLICATE_4249_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_c642_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2590_c7_1bea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_c642_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2590_c7_1bea_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_5340_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2577_c7_eae6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_9435_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_c642_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2569_c7_5340] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_5340_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_5340_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_5340_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_5340_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_5340_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_5340_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_5340_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_5340_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2582_c7_9435] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_9435_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_9435_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_9435_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_9435_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_9435_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_9435_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_9435_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_9435_return_output;

     -- n16_MUX[uxn_opcodes_h_l2569_c7_5340] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2569_c7_5340_cond <= VAR_n16_MUX_uxn_opcodes_h_l2569_c7_5340_cond;
     n16_MUX_uxn_opcodes_h_l2569_c7_5340_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2569_c7_5340_iftrue;
     n16_MUX_uxn_opcodes_h_l2569_c7_5340_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2569_c7_5340_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2569_c7_5340_return_output := n16_MUX_uxn_opcodes_h_l2569_c7_5340_return_output;

     -- t16_MUX[uxn_opcodes_h_l2561_c7_3623] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2561_c7_3623_cond <= VAR_t16_MUX_uxn_opcodes_h_l2561_c7_3623_cond;
     t16_MUX_uxn_opcodes_h_l2561_c7_3623_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2561_c7_3623_iftrue;
     t16_MUX_uxn_opcodes_h_l2561_c7_3623_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2561_c7_3623_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2561_c7_3623_return_output := t16_MUX_uxn_opcodes_h_l2561_c7_3623_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2575_c21_feb5] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2575_c21_feb5_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l2570_c3_2ed7_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2586_c7_c642] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_c642_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_c642_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_c642_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_c642_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_c642_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_c642_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_c642_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_c642_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2586_c7_c642] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_c642_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_c642_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_c642_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_c642_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_c642_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_c642_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_c642_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_c642_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2586_c7_c642] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2586_c7_c642_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c7_c642_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2586_c7_c642_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c7_c642_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2586_c7_c642_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c7_c642_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c7_c642_return_output := result_u8_value_MUX_uxn_opcodes_h_l2586_c7_c642_return_output;

     -- Submodule level 3
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2569_c7_5340_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2575_c21_feb5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2565_c7_329b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2569_c7_5340_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_9435_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_c642_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_9435_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_c642_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_329b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_5340_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2577_c7_eae6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_9435_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2582_c7_9435_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c7_c642_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2556_c7_dcd8_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2561_c7_3623_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2577_c7_eae6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2577_c7_eae6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2577_c7_eae6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2577_c7_eae6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2577_c7_eae6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2577_c7_eae6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2577_c7_eae6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2577_c7_eae6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2577_c7_eae6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2582_c7_9435] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2582_c7_9435_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2582_c7_9435_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2582_c7_9435_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2582_c7_9435_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2582_c7_9435_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2582_c7_9435_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2582_c7_9435_return_output := result_u8_value_MUX_uxn_opcodes_h_l2582_c7_9435_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2582_c7_9435] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_9435_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_9435_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_9435_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_9435_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_9435_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_9435_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_9435_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_9435_return_output;

     -- t16_MUX[uxn_opcodes_h_l2556_c7_dcd8] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2556_c7_dcd8_cond <= VAR_t16_MUX_uxn_opcodes_h_l2556_c7_dcd8_cond;
     t16_MUX_uxn_opcodes_h_l2556_c7_dcd8_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2556_c7_dcd8_iftrue;
     t16_MUX_uxn_opcodes_h_l2556_c7_dcd8_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2556_c7_dcd8_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2556_c7_dcd8_return_output := t16_MUX_uxn_opcodes_h_l2556_c7_dcd8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2582_c7_9435] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_9435_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_9435_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_9435_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_9435_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_9435_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_9435_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_9435_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_9435_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2565_c7_329b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_329b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_329b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_329b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_329b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_329b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_329b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_329b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_329b_return_output;

     -- n16_MUX[uxn_opcodes_h_l2565_c7_329b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2565_c7_329b_cond <= VAR_n16_MUX_uxn_opcodes_h_l2565_c7_329b_cond;
     n16_MUX_uxn_opcodes_h_l2565_c7_329b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2565_c7_329b_iftrue;
     n16_MUX_uxn_opcodes_h_l2565_c7_329b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2565_c7_329b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2565_c7_329b_return_output := n16_MUX_uxn_opcodes_h_l2565_c7_329b_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l2561_c7_3623_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2565_c7_329b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2577_c7_eae6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_9435_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2577_c7_eae6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_9435_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_3623_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_329b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_5340_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2577_c7_eae6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2577_c7_eae6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2582_c7_9435_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2553_c7_93e6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2556_c7_dcd8_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2577_c7_eae6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2577_c7_eae6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2577_c7_eae6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2577_c7_eae6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2577_c7_eae6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2577_c7_eae6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2577_c7_eae6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2577_c7_eae6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2577_c7_eae6_return_output;

     -- n16_MUX[uxn_opcodes_h_l2561_c7_3623] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2561_c7_3623_cond <= VAR_n16_MUX_uxn_opcodes_h_l2561_c7_3623_cond;
     n16_MUX_uxn_opcodes_h_l2561_c7_3623_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2561_c7_3623_iftrue;
     n16_MUX_uxn_opcodes_h_l2561_c7_3623_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2561_c7_3623_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2561_c7_3623_return_output := n16_MUX_uxn_opcodes_h_l2561_c7_3623_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2561_c7_3623] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_3623_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_3623_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_3623_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_3623_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_3623_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_3623_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_3623_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_3623_return_output;

     -- t16_MUX[uxn_opcodes_h_l2553_c7_93e6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2553_c7_93e6_cond <= VAR_t16_MUX_uxn_opcodes_h_l2553_c7_93e6_cond;
     t16_MUX_uxn_opcodes_h_l2553_c7_93e6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2553_c7_93e6_iftrue;
     t16_MUX_uxn_opcodes_h_l2553_c7_93e6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2553_c7_93e6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2553_c7_93e6_return_output := t16_MUX_uxn_opcodes_h_l2553_c7_93e6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2569_c7_5340] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_5340_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_5340_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_5340_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_5340_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_5340_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_5340_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_5340_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_5340_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2577_c7_eae6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2577_c7_eae6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2577_c7_eae6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2577_c7_eae6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2577_c7_eae6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2577_c7_eae6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2577_c7_eae6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2577_c7_eae6_return_output := result_u8_value_MUX_uxn_opcodes_h_l2577_c7_eae6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2577_c7_eae6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2577_c7_eae6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2577_c7_eae6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2577_c7_eae6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2577_c7_eae6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2577_c7_eae6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2577_c7_eae6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2577_c7_eae6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2577_c7_eae6_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2556_c7_dcd8_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2561_c7_3623_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_5340_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2577_c7_eae6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2569_c7_5340_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2577_c7_eae6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_dcd8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_3623_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_329b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_5340_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2569_c7_5340_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2577_c7_eae6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2546_c2_97e4_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2553_c7_93e6_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2565_c7_329b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_329b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_329b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_329b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_329b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_329b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_329b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_329b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_329b_return_output;

     -- t16_MUX[uxn_opcodes_h_l2546_c2_97e4] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2546_c2_97e4_cond <= VAR_t16_MUX_uxn_opcodes_h_l2546_c2_97e4_cond;
     t16_MUX_uxn_opcodes_h_l2546_c2_97e4_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2546_c2_97e4_iftrue;
     t16_MUX_uxn_opcodes_h_l2546_c2_97e4_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2546_c2_97e4_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2546_c2_97e4_return_output := t16_MUX_uxn_opcodes_h_l2546_c2_97e4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2569_c7_5340] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_5340_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_5340_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_5340_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_5340_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_5340_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_5340_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_5340_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_5340_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2569_c7_5340] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2569_c7_5340_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2569_c7_5340_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2569_c7_5340_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2569_c7_5340_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2569_c7_5340_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2569_c7_5340_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2569_c7_5340_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2569_c7_5340_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2569_c7_5340] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2569_c7_5340_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2569_c7_5340_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2569_c7_5340_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2569_c7_5340_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2569_c7_5340_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2569_c7_5340_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2569_c7_5340_return_output := result_u8_value_MUX_uxn_opcodes_h_l2569_c7_5340_return_output;

     -- n16_MUX[uxn_opcodes_h_l2556_c7_dcd8] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2556_c7_dcd8_cond <= VAR_n16_MUX_uxn_opcodes_h_l2556_c7_dcd8_cond;
     n16_MUX_uxn_opcodes_h_l2556_c7_dcd8_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2556_c7_dcd8_iftrue;
     n16_MUX_uxn_opcodes_h_l2556_c7_dcd8_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2556_c7_dcd8_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2556_c7_dcd8_return_output := n16_MUX_uxn_opcodes_h_l2556_c7_dcd8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2556_c7_dcd8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_dcd8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_dcd8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_dcd8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_dcd8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_dcd8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_dcd8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_dcd8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_dcd8_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2553_c7_93e6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2556_c7_dcd8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_329b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_5340_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2565_c7_329b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2569_c7_5340_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2553_c7_93e6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_dcd8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_3623_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_329b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2565_c7_329b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2569_c7_5340_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2546_c2_97e4_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2553_c7_93e6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2553_c7_93e6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2553_c7_93e6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2553_c7_93e6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2553_c7_93e6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2553_c7_93e6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2553_c7_93e6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2553_c7_93e6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2553_c7_93e6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2565_c7_329b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_329b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_329b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_329b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_329b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_329b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_329b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_329b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_329b_return_output;

     -- n16_MUX[uxn_opcodes_h_l2553_c7_93e6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2553_c7_93e6_cond <= VAR_n16_MUX_uxn_opcodes_h_l2553_c7_93e6_cond;
     n16_MUX_uxn_opcodes_h_l2553_c7_93e6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2553_c7_93e6_iftrue;
     n16_MUX_uxn_opcodes_h_l2553_c7_93e6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2553_c7_93e6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2553_c7_93e6_return_output := n16_MUX_uxn_opcodes_h_l2553_c7_93e6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2565_c7_329b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2565_c7_329b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2565_c7_329b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2565_c7_329b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2565_c7_329b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2565_c7_329b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2565_c7_329b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2565_c7_329b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2565_c7_329b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2565_c7_329b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2565_c7_329b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2565_c7_329b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2565_c7_329b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2565_c7_329b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2565_c7_329b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2565_c7_329b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2565_c7_329b_return_output := result_u8_value_MUX_uxn_opcodes_h_l2565_c7_329b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2561_c7_3623] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_3623_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_3623_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_3623_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_3623_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_3623_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_3623_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_3623_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_3623_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2546_c2_97e4_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2553_c7_93e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_3623_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_329b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_3623_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2565_c7_329b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2546_c2_97e4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2553_c7_93e6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_dcd8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_3623_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2561_c7_3623_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2565_c7_329b_return_output;
     -- n16_MUX[uxn_opcodes_h_l2546_c2_97e4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2546_c2_97e4_cond <= VAR_n16_MUX_uxn_opcodes_h_l2546_c2_97e4_cond;
     n16_MUX_uxn_opcodes_h_l2546_c2_97e4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2546_c2_97e4_iftrue;
     n16_MUX_uxn_opcodes_h_l2546_c2_97e4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2546_c2_97e4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2546_c2_97e4_return_output := n16_MUX_uxn_opcodes_h_l2546_c2_97e4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2561_c7_3623] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_3623_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_3623_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_3623_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_3623_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_3623_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_3623_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_3623_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_3623_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2546_c2_97e4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2546_c2_97e4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2546_c2_97e4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2546_c2_97e4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2546_c2_97e4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2546_c2_97e4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2546_c2_97e4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2546_c2_97e4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2546_c2_97e4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2556_c7_dcd8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_dcd8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_dcd8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_dcd8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_dcd8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_dcd8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_dcd8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_dcd8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_dcd8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2561_c7_3623] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2561_c7_3623_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2561_c7_3623_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2561_c7_3623_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2561_c7_3623_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2561_c7_3623_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2561_c7_3623_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2561_c7_3623_return_output := result_u8_value_MUX_uxn_opcodes_h_l2561_c7_3623_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2561_c7_3623] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_3623_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_3623_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_3623_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_3623_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_3623_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_3623_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_3623_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_3623_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2546_c2_97e4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_dcd8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_3623_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2556_c7_dcd8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_3623_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2553_c7_93e6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_dcd8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2556_c7_dcd8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2561_c7_3623_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2556_c7_dcd8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2556_c7_dcd8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2556_c7_dcd8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2556_c7_dcd8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2556_c7_dcd8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2556_c7_dcd8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2556_c7_dcd8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2556_c7_dcd8_return_output := result_u8_value_MUX_uxn_opcodes_h_l2556_c7_dcd8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2556_c7_dcd8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2556_c7_dcd8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2556_c7_dcd8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2556_c7_dcd8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2556_c7_dcd8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2556_c7_dcd8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2556_c7_dcd8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2556_c7_dcd8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2556_c7_dcd8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2556_c7_dcd8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_dcd8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_dcd8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_dcd8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_dcd8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_dcd8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_dcd8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_dcd8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_dcd8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2553_c7_93e6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2553_c7_93e6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2553_c7_93e6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2553_c7_93e6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2553_c7_93e6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2553_c7_93e6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2553_c7_93e6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2553_c7_93e6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2553_c7_93e6_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_93e6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_dcd8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2553_c7_93e6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2556_c7_dcd8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c2_97e4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2553_c7_93e6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2553_c7_93e6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2556_c7_dcd8_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2546_c2_97e4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c2_97e4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c2_97e4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c2_97e4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c2_97e4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c2_97e4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c2_97e4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c2_97e4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c2_97e4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2553_c7_93e6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2553_c7_93e6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2553_c7_93e6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2553_c7_93e6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2553_c7_93e6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2553_c7_93e6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2553_c7_93e6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2553_c7_93e6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2553_c7_93e6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2553_c7_93e6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2553_c7_93e6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2553_c7_93e6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2553_c7_93e6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2553_c7_93e6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2553_c7_93e6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2553_c7_93e6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2553_c7_93e6_return_output := result_u8_value_MUX_uxn_opcodes_h_l2553_c7_93e6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2553_c7_93e6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_93e6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_93e6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_93e6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_93e6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_93e6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_93e6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_93e6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_93e6_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2546_c2_97e4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_93e6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2546_c2_97e4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2553_c7_93e6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2546_c2_97e4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2553_c7_93e6_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2546_c2_97e4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2546_c2_97e4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2546_c2_97e4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2546_c2_97e4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2546_c2_97e4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2546_c2_97e4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2546_c2_97e4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2546_c2_97e4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2546_c2_97e4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2546_c2_97e4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2546_c2_97e4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2546_c2_97e4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2546_c2_97e4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2546_c2_97e4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2546_c2_97e4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2546_c2_97e4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2546_c2_97e4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2546_c2_97e4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2546_c2_97e4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2546_c2_97e4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2546_c2_97e4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2546_c2_97e4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2546_c2_97e4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2546_c2_97e4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2546_c2_97e4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2546_c2_97e4_return_output := result_u8_value_MUX_uxn_opcodes_h_l2546_c2_97e4_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l2542_l2595_DUPLICATE_9092 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l2542_l2595_DUPLICATE_9092_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_eae7(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2546_c2_97e4_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2546_c2_97e4_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2546_c2_97e4_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c2_97e4_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2546_c2_97e4_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l2542_l2595_DUPLICATE_9092_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l2542_l2595_DUPLICATE_9092_return_output;
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
