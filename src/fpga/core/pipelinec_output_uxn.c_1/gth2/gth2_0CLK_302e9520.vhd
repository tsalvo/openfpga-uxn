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
-- Submodules: 66
entity gth2_0CLK_302e9520 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end gth2_0CLK_302e9520;
architecture arch of gth2_0CLK_302e9520 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1758_c6_5895]
signal BIN_OP_EQ_uxn_opcodes_h_l1758_c6_5895_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1758_c6_5895_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1758_c6_5895_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1758_c1_215c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_215c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_215c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_215c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_215c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1758_c2_fb8d]
signal n16_MUX_uxn_opcodes_h_l1758_c2_fb8d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1758_c2_fb8d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1758_c2_fb8d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1758_c2_fb8d_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1758_c2_fb8d]
signal result_u8_value_MUX_uxn_opcodes_h_l1758_c2_fb8d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1758_c2_fb8d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1758_c2_fb8d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1758_c2_fb8d_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1758_c2_fb8d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_fb8d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_fb8d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_fb8d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_fb8d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1758_c2_fb8d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_fb8d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_fb8d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_fb8d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_fb8d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1758_c2_fb8d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_fb8d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_fb8d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_fb8d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_fb8d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1758_c2_fb8d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_fb8d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_fb8d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_fb8d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_fb8d_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1758_c2_fb8d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_fb8d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_fb8d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_fb8d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_fb8d_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1758_c2_fb8d]
signal t16_MUX_uxn_opcodes_h_l1758_c2_fb8d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1758_c2_fb8d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1758_c2_fb8d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1758_c2_fb8d_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1759_c3_1207[uxn_opcodes_h_l1759_c3_1207]
signal printf_uxn_opcodes_h_l1759_c3_1207_uxn_opcodes_h_l1759_c3_1207_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1763_c11_d06d]
signal BIN_OP_EQ_uxn_opcodes_h_l1763_c11_d06d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1763_c11_d06d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1763_c11_d06d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1763_c7_b588]
signal n16_MUX_uxn_opcodes_h_l1763_c7_b588_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1763_c7_b588_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1763_c7_b588_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1763_c7_b588_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1763_c7_b588]
signal result_u8_value_MUX_uxn_opcodes_h_l1763_c7_b588_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1763_c7_b588_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1763_c7_b588_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1763_c7_b588_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1763_c7_b588]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_b588_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_b588_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_b588_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_b588_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1763_c7_b588]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_b588_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_b588_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_b588_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_b588_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1763_c7_b588]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_b588_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_b588_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_b588_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_b588_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1763_c7_b588]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_b588_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_b588_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_b588_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_b588_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1763_c7_b588]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_b588_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_b588_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_b588_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_b588_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1763_c7_b588]
signal t16_MUX_uxn_opcodes_h_l1763_c7_b588_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1763_c7_b588_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1763_c7_b588_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1763_c7_b588_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1766_c11_9b08]
signal BIN_OP_EQ_uxn_opcodes_h_l1766_c11_9b08_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1766_c11_9b08_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1766_c11_9b08_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1766_c7_bc1b]
signal n16_MUX_uxn_opcodes_h_l1766_c7_bc1b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1766_c7_bc1b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1766_c7_bc1b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1766_c7_bc1b_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1766_c7_bc1b]
signal result_u8_value_MUX_uxn_opcodes_h_l1766_c7_bc1b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1766_c7_bc1b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1766_c7_bc1b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1766_c7_bc1b_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1766_c7_bc1b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_bc1b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_bc1b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_bc1b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_bc1b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1766_c7_bc1b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_bc1b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_bc1b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_bc1b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_bc1b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1766_c7_bc1b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_bc1b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_bc1b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_bc1b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_bc1b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1766_c7_bc1b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_bc1b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_bc1b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_bc1b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_bc1b_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1766_c7_bc1b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_bc1b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_bc1b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_bc1b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_bc1b_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1766_c7_bc1b]
signal t16_MUX_uxn_opcodes_h_l1766_c7_bc1b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1766_c7_bc1b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1766_c7_bc1b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1766_c7_bc1b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1771_c11_9ae8]
signal BIN_OP_EQ_uxn_opcodes_h_l1771_c11_9ae8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1771_c11_9ae8_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1771_c11_9ae8_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1771_c7_8ccd]
signal n16_MUX_uxn_opcodes_h_l1771_c7_8ccd_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1771_c7_8ccd_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1771_c7_8ccd_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1771_c7_8ccd_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1771_c7_8ccd]
signal result_u8_value_MUX_uxn_opcodes_h_l1771_c7_8ccd_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1771_c7_8ccd_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1771_c7_8ccd_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1771_c7_8ccd_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1771_c7_8ccd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_8ccd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_8ccd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_8ccd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_8ccd_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1771_c7_8ccd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_8ccd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_8ccd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_8ccd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_8ccd_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1771_c7_8ccd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_8ccd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_8ccd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_8ccd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_8ccd_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1771_c7_8ccd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_8ccd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_8ccd_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_8ccd_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_8ccd_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1771_c7_8ccd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_8ccd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_8ccd_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_8ccd_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_8ccd_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1771_c7_8ccd]
signal t16_MUX_uxn_opcodes_h_l1771_c7_8ccd_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1771_c7_8ccd_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1771_c7_8ccd_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1771_c7_8ccd_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1772_c3_0e5f]
signal BIN_OP_OR_uxn_opcodes_h_l1772_c3_0e5f_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1772_c3_0e5f_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1772_c3_0e5f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1775_c11_eca0]
signal BIN_OP_EQ_uxn_opcodes_h_l1775_c11_eca0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1775_c11_eca0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1775_c11_eca0_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1775_c7_023c]
signal n16_MUX_uxn_opcodes_h_l1775_c7_023c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1775_c7_023c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1775_c7_023c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1775_c7_023c_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1775_c7_023c]
signal result_u8_value_MUX_uxn_opcodes_h_l1775_c7_023c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1775_c7_023c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1775_c7_023c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1775_c7_023c_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1775_c7_023c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_023c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_023c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_023c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_023c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1775_c7_023c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_023c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_023c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_023c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_023c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1775_c7_023c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_023c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_023c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_023c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_023c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1775_c7_023c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_023c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_023c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_023c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_023c_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1775_c7_023c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_023c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_023c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_023c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_023c_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1779_c11_0793]
signal BIN_OP_EQ_uxn_opcodes_h_l1779_c11_0793_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1779_c11_0793_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1779_c11_0793_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1779_c7_b654]
signal n16_MUX_uxn_opcodes_h_l1779_c7_b654_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1779_c7_b654_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1779_c7_b654_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1779_c7_b654_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1779_c7_b654]
signal result_u8_value_MUX_uxn_opcodes_h_l1779_c7_b654_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1779_c7_b654_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1779_c7_b654_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1779_c7_b654_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1779_c7_b654]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_b654_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_b654_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_b654_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_b654_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1779_c7_b654]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_b654_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_b654_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_b654_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_b654_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1779_c7_b654]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_b654_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_b654_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_b654_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_b654_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1779_c7_b654]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_b654_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_b654_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_b654_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_b654_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1779_c7_b654]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_b654_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_b654_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_b654_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_b654_return_output : signed(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1780_c3_8f56]
signal BIN_OP_OR_uxn_opcodes_h_l1780_c3_8f56_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1780_c3_8f56_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1780_c3_8f56_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1782_c30_1a9b]
signal sp_relative_shift_uxn_opcodes_h_l1782_c30_1a9b_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1782_c30_1a9b_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1782_c30_1a9b_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1782_c30_1a9b_return_output : signed(3 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1785_c21_b92b]
signal BIN_OP_GT_uxn_opcodes_h_l1785_c21_b92b_left : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1785_c21_b92b_right : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1785_c21_b92b_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1785_c21_2c42]
signal MUX_uxn_opcodes_h_l1785_c21_2c42_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1785_c21_2c42_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1785_c21_2c42_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1785_c21_2c42_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1787_c11_2135]
signal BIN_OP_EQ_uxn_opcodes_h_l1787_c11_2135_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1787_c11_2135_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1787_c11_2135_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1787_c7_bb2f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_bb2f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_bb2f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_bb2f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_bb2f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1787_c7_bb2f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_bb2f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_bb2f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_bb2f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_bb2f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1787_c7_bb2f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_bb2f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_bb2f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_bb2f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_bb2f_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1768_l1777_DUPLICATE_eebe
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1768_l1777_DUPLICATE_eebe_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1768_l1777_DUPLICATE_eebe_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1758_c6_5895
BIN_OP_EQ_uxn_opcodes_h_l1758_c6_5895 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1758_c6_5895_left,
BIN_OP_EQ_uxn_opcodes_h_l1758_c6_5895_right,
BIN_OP_EQ_uxn_opcodes_h_l1758_c6_5895_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_215c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_215c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_215c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_215c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_215c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_215c_return_output);

-- n16_MUX_uxn_opcodes_h_l1758_c2_fb8d
n16_MUX_uxn_opcodes_h_l1758_c2_fb8d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1758_c2_fb8d_cond,
n16_MUX_uxn_opcodes_h_l1758_c2_fb8d_iftrue,
n16_MUX_uxn_opcodes_h_l1758_c2_fb8d_iffalse,
n16_MUX_uxn_opcodes_h_l1758_c2_fb8d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1758_c2_fb8d
result_u8_value_MUX_uxn_opcodes_h_l1758_c2_fb8d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1758_c2_fb8d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1758_c2_fb8d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1758_c2_fb8d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1758_c2_fb8d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_fb8d
result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_fb8d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_fb8d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_fb8d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_fb8d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_fb8d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_fb8d
result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_fb8d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_fb8d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_fb8d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_fb8d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_fb8d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_fb8d
result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_fb8d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_fb8d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_fb8d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_fb8d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_fb8d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_fb8d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_fb8d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_fb8d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_fb8d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_fb8d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_fb8d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_fb8d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_fb8d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_fb8d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_fb8d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_fb8d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_fb8d_return_output);

-- t16_MUX_uxn_opcodes_h_l1758_c2_fb8d
t16_MUX_uxn_opcodes_h_l1758_c2_fb8d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1758_c2_fb8d_cond,
t16_MUX_uxn_opcodes_h_l1758_c2_fb8d_iftrue,
t16_MUX_uxn_opcodes_h_l1758_c2_fb8d_iffalse,
t16_MUX_uxn_opcodes_h_l1758_c2_fb8d_return_output);

-- printf_uxn_opcodes_h_l1759_c3_1207_uxn_opcodes_h_l1759_c3_1207
printf_uxn_opcodes_h_l1759_c3_1207_uxn_opcodes_h_l1759_c3_1207 : entity work.printf_uxn_opcodes_h_l1759_c3_1207_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1759_c3_1207_uxn_opcodes_h_l1759_c3_1207_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1763_c11_d06d
BIN_OP_EQ_uxn_opcodes_h_l1763_c11_d06d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1763_c11_d06d_left,
BIN_OP_EQ_uxn_opcodes_h_l1763_c11_d06d_right,
BIN_OP_EQ_uxn_opcodes_h_l1763_c11_d06d_return_output);

-- n16_MUX_uxn_opcodes_h_l1763_c7_b588
n16_MUX_uxn_opcodes_h_l1763_c7_b588 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1763_c7_b588_cond,
n16_MUX_uxn_opcodes_h_l1763_c7_b588_iftrue,
n16_MUX_uxn_opcodes_h_l1763_c7_b588_iffalse,
n16_MUX_uxn_opcodes_h_l1763_c7_b588_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1763_c7_b588
result_u8_value_MUX_uxn_opcodes_h_l1763_c7_b588 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1763_c7_b588_cond,
result_u8_value_MUX_uxn_opcodes_h_l1763_c7_b588_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1763_c7_b588_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1763_c7_b588_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_b588
result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_b588 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_b588_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_b588_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_b588_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_b588_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_b588
result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_b588 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_b588_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_b588_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_b588_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_b588_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_b588
result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_b588 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_b588_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_b588_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_b588_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_b588_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_b588
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_b588 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_b588_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_b588_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_b588_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_b588_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_b588
result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_b588 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_b588_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_b588_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_b588_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_b588_return_output);

-- t16_MUX_uxn_opcodes_h_l1763_c7_b588
t16_MUX_uxn_opcodes_h_l1763_c7_b588 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1763_c7_b588_cond,
t16_MUX_uxn_opcodes_h_l1763_c7_b588_iftrue,
t16_MUX_uxn_opcodes_h_l1763_c7_b588_iffalse,
t16_MUX_uxn_opcodes_h_l1763_c7_b588_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1766_c11_9b08
BIN_OP_EQ_uxn_opcodes_h_l1766_c11_9b08 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1766_c11_9b08_left,
BIN_OP_EQ_uxn_opcodes_h_l1766_c11_9b08_right,
BIN_OP_EQ_uxn_opcodes_h_l1766_c11_9b08_return_output);

-- n16_MUX_uxn_opcodes_h_l1766_c7_bc1b
n16_MUX_uxn_opcodes_h_l1766_c7_bc1b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1766_c7_bc1b_cond,
n16_MUX_uxn_opcodes_h_l1766_c7_bc1b_iftrue,
n16_MUX_uxn_opcodes_h_l1766_c7_bc1b_iffalse,
n16_MUX_uxn_opcodes_h_l1766_c7_bc1b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1766_c7_bc1b
result_u8_value_MUX_uxn_opcodes_h_l1766_c7_bc1b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1766_c7_bc1b_cond,
result_u8_value_MUX_uxn_opcodes_h_l1766_c7_bc1b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1766_c7_bc1b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1766_c7_bc1b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_bc1b
result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_bc1b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_bc1b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_bc1b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_bc1b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_bc1b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_bc1b
result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_bc1b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_bc1b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_bc1b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_bc1b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_bc1b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_bc1b
result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_bc1b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_bc1b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_bc1b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_bc1b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_bc1b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_bc1b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_bc1b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_bc1b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_bc1b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_bc1b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_bc1b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_bc1b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_bc1b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_bc1b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_bc1b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_bc1b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_bc1b_return_output);

-- t16_MUX_uxn_opcodes_h_l1766_c7_bc1b
t16_MUX_uxn_opcodes_h_l1766_c7_bc1b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1766_c7_bc1b_cond,
t16_MUX_uxn_opcodes_h_l1766_c7_bc1b_iftrue,
t16_MUX_uxn_opcodes_h_l1766_c7_bc1b_iffalse,
t16_MUX_uxn_opcodes_h_l1766_c7_bc1b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1771_c11_9ae8
BIN_OP_EQ_uxn_opcodes_h_l1771_c11_9ae8 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1771_c11_9ae8_left,
BIN_OP_EQ_uxn_opcodes_h_l1771_c11_9ae8_right,
BIN_OP_EQ_uxn_opcodes_h_l1771_c11_9ae8_return_output);

-- n16_MUX_uxn_opcodes_h_l1771_c7_8ccd
n16_MUX_uxn_opcodes_h_l1771_c7_8ccd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1771_c7_8ccd_cond,
n16_MUX_uxn_opcodes_h_l1771_c7_8ccd_iftrue,
n16_MUX_uxn_opcodes_h_l1771_c7_8ccd_iffalse,
n16_MUX_uxn_opcodes_h_l1771_c7_8ccd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1771_c7_8ccd
result_u8_value_MUX_uxn_opcodes_h_l1771_c7_8ccd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1771_c7_8ccd_cond,
result_u8_value_MUX_uxn_opcodes_h_l1771_c7_8ccd_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1771_c7_8ccd_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1771_c7_8ccd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_8ccd
result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_8ccd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_8ccd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_8ccd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_8ccd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_8ccd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_8ccd
result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_8ccd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_8ccd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_8ccd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_8ccd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_8ccd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_8ccd
result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_8ccd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_8ccd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_8ccd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_8ccd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_8ccd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_8ccd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_8ccd : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_8ccd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_8ccd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_8ccd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_8ccd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_8ccd
result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_8ccd : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_8ccd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_8ccd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_8ccd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_8ccd_return_output);

-- t16_MUX_uxn_opcodes_h_l1771_c7_8ccd
t16_MUX_uxn_opcodes_h_l1771_c7_8ccd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1771_c7_8ccd_cond,
t16_MUX_uxn_opcodes_h_l1771_c7_8ccd_iftrue,
t16_MUX_uxn_opcodes_h_l1771_c7_8ccd_iffalse,
t16_MUX_uxn_opcodes_h_l1771_c7_8ccd_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1772_c3_0e5f
BIN_OP_OR_uxn_opcodes_h_l1772_c3_0e5f : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1772_c3_0e5f_left,
BIN_OP_OR_uxn_opcodes_h_l1772_c3_0e5f_right,
BIN_OP_OR_uxn_opcodes_h_l1772_c3_0e5f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1775_c11_eca0
BIN_OP_EQ_uxn_opcodes_h_l1775_c11_eca0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1775_c11_eca0_left,
BIN_OP_EQ_uxn_opcodes_h_l1775_c11_eca0_right,
BIN_OP_EQ_uxn_opcodes_h_l1775_c11_eca0_return_output);

-- n16_MUX_uxn_opcodes_h_l1775_c7_023c
n16_MUX_uxn_opcodes_h_l1775_c7_023c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1775_c7_023c_cond,
n16_MUX_uxn_opcodes_h_l1775_c7_023c_iftrue,
n16_MUX_uxn_opcodes_h_l1775_c7_023c_iffalse,
n16_MUX_uxn_opcodes_h_l1775_c7_023c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1775_c7_023c
result_u8_value_MUX_uxn_opcodes_h_l1775_c7_023c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1775_c7_023c_cond,
result_u8_value_MUX_uxn_opcodes_h_l1775_c7_023c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1775_c7_023c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1775_c7_023c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_023c
result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_023c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_023c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_023c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_023c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_023c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_023c
result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_023c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_023c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_023c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_023c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_023c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_023c
result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_023c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_023c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_023c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_023c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_023c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_023c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_023c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_023c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_023c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_023c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_023c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_023c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_023c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_023c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_023c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_023c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_023c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1779_c11_0793
BIN_OP_EQ_uxn_opcodes_h_l1779_c11_0793 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1779_c11_0793_left,
BIN_OP_EQ_uxn_opcodes_h_l1779_c11_0793_right,
BIN_OP_EQ_uxn_opcodes_h_l1779_c11_0793_return_output);

-- n16_MUX_uxn_opcodes_h_l1779_c7_b654
n16_MUX_uxn_opcodes_h_l1779_c7_b654 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1779_c7_b654_cond,
n16_MUX_uxn_opcodes_h_l1779_c7_b654_iftrue,
n16_MUX_uxn_opcodes_h_l1779_c7_b654_iffalse,
n16_MUX_uxn_opcodes_h_l1779_c7_b654_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1779_c7_b654
result_u8_value_MUX_uxn_opcodes_h_l1779_c7_b654 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1779_c7_b654_cond,
result_u8_value_MUX_uxn_opcodes_h_l1779_c7_b654_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1779_c7_b654_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1779_c7_b654_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_b654
result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_b654 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_b654_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_b654_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_b654_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_b654_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_b654
result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_b654 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_b654_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_b654_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_b654_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_b654_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_b654
result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_b654 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_b654_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_b654_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_b654_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_b654_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_b654
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_b654 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_b654_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_b654_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_b654_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_b654_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_b654
result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_b654 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_b654_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_b654_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_b654_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_b654_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1780_c3_8f56
BIN_OP_OR_uxn_opcodes_h_l1780_c3_8f56 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1780_c3_8f56_left,
BIN_OP_OR_uxn_opcodes_h_l1780_c3_8f56_right,
BIN_OP_OR_uxn_opcodes_h_l1780_c3_8f56_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1782_c30_1a9b
sp_relative_shift_uxn_opcodes_h_l1782_c30_1a9b : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1782_c30_1a9b_ins,
sp_relative_shift_uxn_opcodes_h_l1782_c30_1a9b_x,
sp_relative_shift_uxn_opcodes_h_l1782_c30_1a9b_y,
sp_relative_shift_uxn_opcodes_h_l1782_c30_1a9b_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1785_c21_b92b
BIN_OP_GT_uxn_opcodes_h_l1785_c21_b92b : entity work.BIN_OP_GT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1785_c21_b92b_left,
BIN_OP_GT_uxn_opcodes_h_l1785_c21_b92b_right,
BIN_OP_GT_uxn_opcodes_h_l1785_c21_b92b_return_output);

-- MUX_uxn_opcodes_h_l1785_c21_2c42
MUX_uxn_opcodes_h_l1785_c21_2c42 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1785_c21_2c42_cond,
MUX_uxn_opcodes_h_l1785_c21_2c42_iftrue,
MUX_uxn_opcodes_h_l1785_c21_2c42_iffalse,
MUX_uxn_opcodes_h_l1785_c21_2c42_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1787_c11_2135
BIN_OP_EQ_uxn_opcodes_h_l1787_c11_2135 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1787_c11_2135_left,
BIN_OP_EQ_uxn_opcodes_h_l1787_c11_2135_right,
BIN_OP_EQ_uxn_opcodes_h_l1787_c11_2135_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_bb2f
result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_bb2f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_bb2f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_bb2f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_bb2f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_bb2f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_bb2f
result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_bb2f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_bb2f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_bb2f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_bb2f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_bb2f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_bb2f
result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_bb2f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_bb2f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_bb2f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_bb2f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_bb2f_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1768_l1777_DUPLICATE_eebe
CONST_SL_8_uint16_t_uxn_opcodes_h_l1768_l1777_DUPLICATE_eebe : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1768_l1777_DUPLICATE_eebe_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1768_l1777_DUPLICATE_eebe_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1758_c6_5895_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_215c_return_output,
 n16_MUX_uxn_opcodes_h_l1758_c2_fb8d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1758_c2_fb8d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_fb8d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_fb8d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_fb8d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_fb8d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_fb8d_return_output,
 t16_MUX_uxn_opcodes_h_l1758_c2_fb8d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1763_c11_d06d_return_output,
 n16_MUX_uxn_opcodes_h_l1763_c7_b588_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1763_c7_b588_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_b588_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_b588_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_b588_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_b588_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_b588_return_output,
 t16_MUX_uxn_opcodes_h_l1763_c7_b588_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1766_c11_9b08_return_output,
 n16_MUX_uxn_opcodes_h_l1766_c7_bc1b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1766_c7_bc1b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_bc1b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_bc1b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_bc1b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_bc1b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_bc1b_return_output,
 t16_MUX_uxn_opcodes_h_l1766_c7_bc1b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1771_c11_9ae8_return_output,
 n16_MUX_uxn_opcodes_h_l1771_c7_8ccd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1771_c7_8ccd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_8ccd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_8ccd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_8ccd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_8ccd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_8ccd_return_output,
 t16_MUX_uxn_opcodes_h_l1771_c7_8ccd_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1772_c3_0e5f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1775_c11_eca0_return_output,
 n16_MUX_uxn_opcodes_h_l1775_c7_023c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1775_c7_023c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_023c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_023c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_023c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_023c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_023c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1779_c11_0793_return_output,
 n16_MUX_uxn_opcodes_h_l1779_c7_b654_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1779_c7_b654_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_b654_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_b654_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_b654_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_b654_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_b654_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1780_c3_8f56_return_output,
 sp_relative_shift_uxn_opcodes_h_l1782_c30_1a9b_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1785_c21_b92b_return_output,
 MUX_uxn_opcodes_h_l1785_c21_2c42_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1787_c11_2135_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_bb2f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_bb2f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_bb2f_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1768_l1777_DUPLICATE_eebe_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c6_5895_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c6_5895_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c6_5895_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_215c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_215c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_215c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_215c_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1758_c2_fb8d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1758_c2_fb8d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1763_c7_b588_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1758_c2_fb8d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1758_c2_fb8d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c2_fb8d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c2_fb8d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1763_c7_b588_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c2_fb8d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c2_fb8d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_fb8d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_fb8d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_b588_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_fb8d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_fb8d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_fb8d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_fb8d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_b588_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_fb8d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_fb8d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_fb8d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_fb8d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_b588_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_fb8d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_fb8d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_fb8d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1760_c3_8e94 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_fb8d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_b588_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_fb8d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_fb8d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_fb8d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_fb8d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_b588_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_fb8d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_fb8d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1758_c2_fb8d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1758_c2_fb8d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1763_c7_b588_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1758_c2_fb8d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1758_c2_fb8d_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1759_c3_1207_uxn_opcodes_h_l1759_c3_1207_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_d06d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_d06d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_d06d_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1763_c7_b588_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1763_c7_b588_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1766_c7_bc1b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1763_c7_b588_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1763_c7_b588_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1763_c7_b588_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1766_c7_bc1b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1763_c7_b588_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_b588_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_b588_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_bc1b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_b588_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_b588_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_b588_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_bc1b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_b588_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_b588_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_b588_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_bc1b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_b588_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_b588_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1764_c3_efb4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_b588_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_bc1b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_b588_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_b588_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_b588_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_bc1b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_b588_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1763_c7_b588_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1763_c7_b588_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1766_c7_bc1b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1763_c7_b588_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_9b08_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_9b08_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_9b08_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1766_c7_bc1b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1766_c7_bc1b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1771_c7_8ccd_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1766_c7_bc1b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1766_c7_bc1b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1766_c7_bc1b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1771_c7_8ccd_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1766_c7_bc1b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_bc1b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_bc1b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_8ccd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_bc1b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_bc1b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_bc1b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_8ccd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_bc1b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_bc1b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_bc1b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_8ccd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_bc1b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_bc1b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1769_c3_40f0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_bc1b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_8ccd_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_bc1b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_bc1b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_bc1b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_8ccd_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_bc1b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1766_c7_bc1b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1766_c7_bc1b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1771_c7_8ccd_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1766_c7_bc1b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_9ae8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_9ae8_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_9ae8_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1771_c7_8ccd_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1771_c7_8ccd_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1775_c7_023c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1771_c7_8ccd_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1771_c7_8ccd_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1771_c7_8ccd_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1775_c7_023c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1771_c7_8ccd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_8ccd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_8ccd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_023c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_8ccd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_8ccd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_8ccd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_023c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_8ccd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_8ccd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_8ccd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_023c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_8ccd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_8ccd_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1773_c3_22fb : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_8ccd_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_023c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_8ccd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_8ccd_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_8ccd_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_023c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_8ccd_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1771_c7_8ccd_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1771_c7_8ccd_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1771_c7_8ccd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1772_c3_0e5f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1772_c3_0e5f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1772_c3_0e5f_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_eca0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_eca0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_eca0_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1775_c7_023c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1775_c7_023c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1779_c7_b654_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1775_c7_023c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1775_c7_023c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1775_c7_023c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c7_b654_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1775_c7_023c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_023c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_023c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_b654_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_023c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_023c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_023c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_b654_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_023c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_023c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_023c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_b654_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_023c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_023c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_023c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_b654_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_023c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_023c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_023c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_b654_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_023c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_0793_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_0793_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_0793_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1779_c7_b654_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1779_c7_b654_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1779_c7_b654_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c7_b654_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c7_b654_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c7_b654_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_b654_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_b654_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_bb2f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_b654_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_b654_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_b654_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_bb2f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_b654_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_b654_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_b654_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_bb2f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_b654_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_b654_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1784_c3_043f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_b654_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_b654_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_b654_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_b654_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_b654_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1780_c3_8f56_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1780_c3_8f56_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1780_c3_8f56_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_1a9b_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_1a9b_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_1a9b_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_1a9b_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1785_c21_2c42_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1785_c21_2c42_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1785_c21_2c42_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1785_c21_b92b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1785_c21_b92b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1785_c21_b92b_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1785_c21_2c42_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1787_c11_2135_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1787_c11_2135_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1787_c11_2135_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_bb2f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_bb2f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_bb2f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_bb2f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_bb2f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_bb2f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_bb2f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_bb2f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_bb2f_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1763_l1758_l1779_l1775_l1771_l1766_DUPLICATE_41b1_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1763_l1758_l1787_l1775_l1771_l1766_DUPLICATE_3c4b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1763_l1758_l1787_l1775_l1771_l1766_DUPLICATE_8e5d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1763_l1758_l1779_l1775_l1771_l1766_DUPLICATE_853c_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1763_l1787_l1779_l1775_l1771_l1766_DUPLICATE_6b8a_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1776_l1780_l1767_l1772_DUPLICATE_3796_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1768_l1777_DUPLICATE_eebe_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1768_l1777_DUPLICATE_eebe_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1775_l1779_DUPLICATE_9f7c_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l1754_l1793_DUPLICATE_e34d_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_fb8d_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1784_c3_043f := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_b654_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1784_c3_043f;
     VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_1a9b_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1787_c11_2135_right := to_unsigned(6, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_215c_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c6_5895_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_9b08_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_bb2f_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_1a9b_y := resize(to_signed(-3, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_d06d_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_eca0_right := to_unsigned(4, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_b654_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_9ae8_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1769_c3_40f0 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_bc1b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1769_c3_40f0;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_bb2f_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1760_c3_8e94 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_fb8d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1760_c3_8e94;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_bb2f_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1764_c3_efb4 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_b588_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1764_c3_efb4;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_b654_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1785_c21_2c42_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1773_c3_22fb := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_8ccd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1773_c3_22fb;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_0793_right := to_unsigned(5, 3);
     VAR_MUX_uxn_opcodes_h_l1785_c21_2c42_iftrue := resize(to_unsigned(1, 1), 8);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_215c_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_1a9b_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1780_c3_8f56_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1758_c2_fb8d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1763_c7_b588_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1766_c7_bc1b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1771_c7_8ccd_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1779_c7_b654_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c6_5895_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_d06d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_9b08_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_9ae8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_eca0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_0793_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1787_c11_2135_left := VAR_phase;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1785_c21_b92b_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1772_c3_0e5f_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1758_c2_fb8d_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1763_c7_b588_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1771_c7_8ccd_iffalse := t16;
     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1763_l1758_l1779_l1775_l1771_l1766_DUPLICATE_41b1 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1763_l1758_l1779_l1775_l1771_l1766_DUPLICATE_41b1_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1766_c11_9b08] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1766_c11_9b08_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_9b08_left;
     BIN_OP_EQ_uxn_opcodes_h_l1766_c11_9b08_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_9b08_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_9b08_return_output := BIN_OP_EQ_uxn_opcodes_h_l1766_c11_9b08_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1775_c11_eca0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1775_c11_eca0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_eca0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1775_c11_eca0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_eca0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_eca0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1775_c11_eca0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1787_c11_2135] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1787_c11_2135_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1787_c11_2135_left;
     BIN_OP_EQ_uxn_opcodes_h_l1787_c11_2135_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1787_c11_2135_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1787_c11_2135_return_output := BIN_OP_EQ_uxn_opcodes_h_l1787_c11_2135_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1763_l1758_l1787_l1775_l1771_l1766_DUPLICATE_3c4b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1763_l1758_l1787_l1775_l1771_l1766_DUPLICATE_3c4b_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1771_c11_9ae8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1771_c11_9ae8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_9ae8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1771_c11_9ae8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_9ae8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_9ae8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1771_c11_9ae8_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1763_l1758_l1779_l1775_l1771_l1766_DUPLICATE_853c LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1763_l1758_l1779_l1775_l1771_l1766_DUPLICATE_853c_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1779_c11_0793] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1779_c11_0793_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_0793_left;
     BIN_OP_EQ_uxn_opcodes_h_l1779_c11_0793_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_0793_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_0793_return_output := BIN_OP_EQ_uxn_opcodes_h_l1779_c11_0793_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1763_c11_d06d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1763_c11_d06d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_d06d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1763_c11_d06d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_d06d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_d06d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1763_c11_d06d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1763_l1758_l1787_l1775_l1771_l1766_DUPLICATE_8e5d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1763_l1758_l1787_l1775_l1771_l1766_DUPLICATE_8e5d_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1775_l1779_DUPLICATE_9f7c LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1775_l1779_DUPLICATE_9f7c_return_output := result.stack_address_sp_offset;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1776_l1780_l1767_l1772_DUPLICATE_3796 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1776_l1780_l1767_l1772_DUPLICATE_3796_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1763_l1787_l1779_l1775_l1771_l1766_DUPLICATE_6b8a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1763_l1787_l1779_l1775_l1771_l1766_DUPLICATE_6b8a_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1758_c6_5895] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1758_c6_5895_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c6_5895_left;
     BIN_OP_EQ_uxn_opcodes_h_l1758_c6_5895_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c6_5895_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c6_5895_return_output := BIN_OP_EQ_uxn_opcodes_h_l1758_c6_5895_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1782_c30_1a9b] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1782_c30_1a9b_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_1a9b_ins;
     sp_relative_shift_uxn_opcodes_h_l1782_c30_1a9b_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_1a9b_x;
     sp_relative_shift_uxn_opcodes_h_l1782_c30_1a9b_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_1a9b_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_1a9b_return_output := sp_relative_shift_uxn_opcodes_h_l1782_c30_1a9b_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_215c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c6_5895_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1758_c2_fb8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c6_5895_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_fb8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c6_5895_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_fb8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c6_5895_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_fb8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c6_5895_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_fb8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c6_5895_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_fb8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c6_5895_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c2_fb8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c6_5895_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1758_c2_fb8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c6_5895_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1763_c7_b588_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_d06d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_b588_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_d06d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_b588_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_d06d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_b588_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_d06d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_b588_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_d06d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_b588_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_d06d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1763_c7_b588_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_d06d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1763_c7_b588_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_d06d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1766_c7_bc1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_9b08_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_bc1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_9b08_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_bc1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_9b08_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_bc1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_9b08_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_bc1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_9b08_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_bc1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_9b08_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1766_c7_bc1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_9b08_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1766_c7_bc1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_9b08_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1771_c7_8ccd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_9ae8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_8ccd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_9ae8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_8ccd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_9ae8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_8ccd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_9ae8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_8ccd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_9ae8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_8ccd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_9ae8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1771_c7_8ccd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_9ae8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1771_c7_8ccd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_9ae8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1775_c7_023c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_eca0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_023c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_eca0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_023c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_eca0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_023c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_eca0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_023c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_eca0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_023c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_eca0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1775_c7_023c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_eca0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1779_c7_b654_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_0793_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_b654_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_0793_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_b654_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_0793_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_b654_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_0793_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_b654_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_0793_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_b654_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_0793_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c7_b654_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_0793_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_bb2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1787_c11_2135_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_bb2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1787_c11_2135_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_bb2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1787_c11_2135_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1772_c3_0e5f_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1776_l1780_l1767_l1772_DUPLICATE_3796_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1780_c3_8f56_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1776_l1780_l1767_l1772_DUPLICATE_3796_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1768_l1777_DUPLICATE_eebe_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1776_l1780_l1767_l1772_DUPLICATE_3796_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_fb8d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1763_l1758_l1779_l1775_l1771_l1766_DUPLICATE_853c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_b588_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1763_l1758_l1779_l1775_l1771_l1766_DUPLICATE_853c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_bc1b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1763_l1758_l1779_l1775_l1771_l1766_DUPLICATE_853c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_8ccd_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1763_l1758_l1779_l1775_l1771_l1766_DUPLICATE_853c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_023c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1763_l1758_l1779_l1775_l1771_l1766_DUPLICATE_853c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_b654_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1763_l1758_l1779_l1775_l1771_l1766_DUPLICATE_853c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_b588_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1763_l1787_l1779_l1775_l1771_l1766_DUPLICATE_6b8a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_bc1b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1763_l1787_l1779_l1775_l1771_l1766_DUPLICATE_6b8a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_8ccd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1763_l1787_l1779_l1775_l1771_l1766_DUPLICATE_6b8a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_023c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1763_l1787_l1779_l1775_l1771_l1766_DUPLICATE_6b8a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_b654_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1763_l1787_l1779_l1775_l1771_l1766_DUPLICATE_6b8a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_bb2f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1763_l1787_l1779_l1775_l1771_l1766_DUPLICATE_6b8a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_fb8d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1763_l1758_l1787_l1775_l1771_l1766_DUPLICATE_3c4b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_b588_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1763_l1758_l1787_l1775_l1771_l1766_DUPLICATE_3c4b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_bc1b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1763_l1758_l1787_l1775_l1771_l1766_DUPLICATE_3c4b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_8ccd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1763_l1758_l1787_l1775_l1771_l1766_DUPLICATE_3c4b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_023c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1763_l1758_l1787_l1775_l1771_l1766_DUPLICATE_3c4b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_bb2f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1763_l1758_l1787_l1775_l1771_l1766_DUPLICATE_3c4b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_fb8d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1763_l1758_l1787_l1775_l1771_l1766_DUPLICATE_8e5d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_b588_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1763_l1758_l1787_l1775_l1771_l1766_DUPLICATE_8e5d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_bc1b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1763_l1758_l1787_l1775_l1771_l1766_DUPLICATE_8e5d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_8ccd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1763_l1758_l1787_l1775_l1771_l1766_DUPLICATE_8e5d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_023c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1763_l1758_l1787_l1775_l1771_l1766_DUPLICATE_8e5d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_bb2f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1763_l1758_l1787_l1775_l1771_l1766_DUPLICATE_8e5d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_023c_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1775_l1779_DUPLICATE_9f7c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_b654_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1775_l1779_DUPLICATE_9f7c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c2_fb8d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1763_l1758_l1779_l1775_l1771_l1766_DUPLICATE_41b1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1763_c7_b588_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1763_l1758_l1779_l1775_l1771_l1766_DUPLICATE_41b1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1766_c7_bc1b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1763_l1758_l1779_l1775_l1771_l1766_DUPLICATE_41b1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1771_c7_8ccd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1763_l1758_l1779_l1775_l1771_l1766_DUPLICATE_41b1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1775_c7_023c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1763_l1758_l1779_l1775_l1771_l1766_DUPLICATE_41b1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c7_b654_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1763_l1758_l1779_l1775_l1771_l1766_DUPLICATE_41b1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_b654_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_1a9b_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1779_c7_b654] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_b654_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_b654_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_b654_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_b654_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_b654_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_b654_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_b654_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_b654_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1779_c7_b654] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_b654_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_b654_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_b654_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_b654_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_b654_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_b654_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_b654_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_b654_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1787_c7_bb2f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_bb2f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_bb2f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_bb2f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_bb2f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_bb2f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_bb2f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_bb2f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_bb2f_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1780_c3_8f56] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1780_c3_8f56_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1780_c3_8f56_left;
     BIN_OP_OR_uxn_opcodes_h_l1780_c3_8f56_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1780_c3_8f56_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1780_c3_8f56_return_output := BIN_OP_OR_uxn_opcodes_h_l1780_c3_8f56_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1772_c3_0e5f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1772_c3_0e5f_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1772_c3_0e5f_left;
     BIN_OP_OR_uxn_opcodes_h_l1772_c3_0e5f_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1772_c3_0e5f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1772_c3_0e5f_return_output := BIN_OP_OR_uxn_opcodes_h_l1772_c3_0e5f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1787_c7_bb2f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_bb2f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_bb2f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_bb2f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_bb2f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_bb2f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_bb2f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_bb2f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_bb2f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1787_c7_bb2f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_bb2f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_bb2f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_bb2f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_bb2f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_bb2f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_bb2f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_bb2f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_bb2f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1758_c1_215c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_215c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_215c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_215c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_215c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_215c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_215c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_215c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_215c_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1768_l1777_DUPLICATE_eebe LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1768_l1777_DUPLICATE_eebe_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1768_l1777_DUPLICATE_eebe_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1768_l1777_DUPLICATE_eebe_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1768_l1777_DUPLICATE_eebe_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1771_c7_8ccd_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1772_c3_0e5f_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1785_c21_b92b_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1780_c3_8f56_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1779_c7_b654_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1780_c3_8f56_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1775_c7_023c_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1768_l1777_DUPLICATE_eebe_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1766_c7_bc1b_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1768_l1777_DUPLICATE_eebe_return_output;
     VAR_printf_uxn_opcodes_h_l1759_c3_1207_uxn_opcodes_h_l1759_c3_1207_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_215c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_b654_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_bb2f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_b654_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_bb2f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_b654_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_bb2f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_023c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_b654_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_023c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_b654_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1779_c7_b654] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_b654_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_b654_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_b654_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_b654_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_b654_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_b654_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_b654_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_b654_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1785_c21_b92b] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1785_c21_b92b_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1785_c21_b92b_left;
     BIN_OP_GT_uxn_opcodes_h_l1785_c21_b92b_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1785_c21_b92b_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1785_c21_b92b_return_output := BIN_OP_GT_uxn_opcodes_h_l1785_c21_b92b_return_output;

     -- n16_MUX[uxn_opcodes_h_l1779_c7_b654] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1779_c7_b654_cond <= VAR_n16_MUX_uxn_opcodes_h_l1779_c7_b654_cond;
     n16_MUX_uxn_opcodes_h_l1779_c7_b654_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1779_c7_b654_iftrue;
     n16_MUX_uxn_opcodes_h_l1779_c7_b654_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1779_c7_b654_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1779_c7_b654_return_output := n16_MUX_uxn_opcodes_h_l1779_c7_b654_return_output;

     -- t16_MUX[uxn_opcodes_h_l1771_c7_8ccd] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1771_c7_8ccd_cond <= VAR_t16_MUX_uxn_opcodes_h_l1771_c7_8ccd_cond;
     t16_MUX_uxn_opcodes_h_l1771_c7_8ccd_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1771_c7_8ccd_iftrue;
     t16_MUX_uxn_opcodes_h_l1771_c7_8ccd_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1771_c7_8ccd_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1771_c7_8ccd_return_output := t16_MUX_uxn_opcodes_h_l1771_c7_8ccd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1779_c7_b654] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_b654_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_b654_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_b654_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_b654_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_b654_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_b654_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_b654_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_b654_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1775_c7_023c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_023c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_023c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_023c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_023c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_023c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_023c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_023c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_023c_return_output;

     -- printf_uxn_opcodes_h_l1759_c3_1207[uxn_opcodes_h_l1759_c3_1207] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1759_c3_1207_uxn_opcodes_h_l1759_c3_1207_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1759_c3_1207_uxn_opcodes_h_l1759_c3_1207_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1779_c7_b654] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_b654_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_b654_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_b654_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_b654_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_b654_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_b654_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_b654_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_b654_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1775_c7_023c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_023c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_023c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_023c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_023c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_023c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_023c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_023c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_023c_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1785_c21_2c42_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1785_c21_b92b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1775_c7_023c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1779_c7_b654_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_023c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_b654_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_023c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_b654_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_023c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_b654_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_8ccd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_023c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_8ccd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_023c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1766_c7_bc1b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1771_c7_8ccd_return_output;
     -- n16_MUX[uxn_opcodes_h_l1775_c7_023c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1775_c7_023c_cond <= VAR_n16_MUX_uxn_opcodes_h_l1775_c7_023c_cond;
     n16_MUX_uxn_opcodes_h_l1775_c7_023c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1775_c7_023c_iftrue;
     n16_MUX_uxn_opcodes_h_l1775_c7_023c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1775_c7_023c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1775_c7_023c_return_output := n16_MUX_uxn_opcodes_h_l1775_c7_023c_return_output;

     -- MUX[uxn_opcodes_h_l1785_c21_2c42] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1785_c21_2c42_cond <= VAR_MUX_uxn_opcodes_h_l1785_c21_2c42_cond;
     MUX_uxn_opcodes_h_l1785_c21_2c42_iftrue <= VAR_MUX_uxn_opcodes_h_l1785_c21_2c42_iftrue;
     MUX_uxn_opcodes_h_l1785_c21_2c42_iffalse <= VAR_MUX_uxn_opcodes_h_l1785_c21_2c42_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1785_c21_2c42_return_output := MUX_uxn_opcodes_h_l1785_c21_2c42_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1775_c7_023c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_023c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_023c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_023c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_023c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_023c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_023c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_023c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_023c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1771_c7_8ccd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_8ccd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_8ccd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_8ccd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_8ccd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_8ccd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_8ccd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_8ccd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_8ccd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1775_c7_023c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_023c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_023c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_023c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_023c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_023c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_023c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_023c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_023c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1771_c7_8ccd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_8ccd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_8ccd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_8ccd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_8ccd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_8ccd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_8ccd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_8ccd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_8ccd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1775_c7_023c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_023c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_023c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_023c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_023c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_023c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_023c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_023c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_023c_return_output;

     -- t16_MUX[uxn_opcodes_h_l1766_c7_bc1b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1766_c7_bc1b_cond <= VAR_t16_MUX_uxn_opcodes_h_l1766_c7_bc1b_cond;
     t16_MUX_uxn_opcodes_h_l1766_c7_bc1b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1766_c7_bc1b_iftrue;
     t16_MUX_uxn_opcodes_h_l1766_c7_bc1b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1766_c7_bc1b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1766_c7_bc1b_return_output := t16_MUX_uxn_opcodes_h_l1766_c7_bc1b_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c7_b654_iftrue := VAR_MUX_uxn_opcodes_h_l1785_c21_2c42_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1771_c7_8ccd_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1775_c7_023c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_8ccd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_023c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_8ccd_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_023c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_8ccd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_023c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_bc1b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_8ccd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_bc1b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_8ccd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1763_c7_b588_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1766_c7_bc1b_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1771_c7_8ccd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_8ccd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_8ccd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_8ccd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_8ccd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_8ccd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_8ccd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_8ccd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_8ccd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1771_c7_8ccd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_8ccd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_8ccd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_8ccd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_8ccd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_8ccd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_8ccd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_8ccd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_8ccd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1766_c7_bc1b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_bc1b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_bc1b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_bc1b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_bc1b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_bc1b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_bc1b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_bc1b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_bc1b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1766_c7_bc1b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_bc1b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_bc1b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_bc1b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_bc1b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_bc1b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_bc1b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_bc1b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_bc1b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1779_c7_b654] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1779_c7_b654_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c7_b654_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1779_c7_b654_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c7_b654_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1779_c7_b654_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c7_b654_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c7_b654_return_output := result_u8_value_MUX_uxn_opcodes_h_l1779_c7_b654_return_output;

     -- n16_MUX[uxn_opcodes_h_l1771_c7_8ccd] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1771_c7_8ccd_cond <= VAR_n16_MUX_uxn_opcodes_h_l1771_c7_8ccd_cond;
     n16_MUX_uxn_opcodes_h_l1771_c7_8ccd_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1771_c7_8ccd_iftrue;
     n16_MUX_uxn_opcodes_h_l1771_c7_8ccd_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1771_c7_8ccd_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1771_c7_8ccd_return_output := n16_MUX_uxn_opcodes_h_l1771_c7_8ccd_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1771_c7_8ccd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_8ccd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_8ccd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_8ccd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_8ccd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_8ccd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_8ccd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_8ccd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_8ccd_return_output;

     -- t16_MUX[uxn_opcodes_h_l1763_c7_b588] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1763_c7_b588_cond <= VAR_t16_MUX_uxn_opcodes_h_l1763_c7_b588_cond;
     t16_MUX_uxn_opcodes_h_l1763_c7_b588_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1763_c7_b588_iftrue;
     t16_MUX_uxn_opcodes_h_l1763_c7_b588_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1763_c7_b588_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1763_c7_b588_return_output := t16_MUX_uxn_opcodes_h_l1763_c7_b588_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1766_c7_bc1b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1771_c7_8ccd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_bc1b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_8ccd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_bc1b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_8ccd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_bc1b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_8ccd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_b588_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_bc1b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_b588_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_bc1b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1775_c7_023c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c7_b654_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1758_c2_fb8d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1763_c7_b588_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1766_c7_bc1b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_bc1b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_bc1b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_bc1b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_bc1b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_bc1b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_bc1b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_bc1b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_bc1b_return_output;

     -- t16_MUX[uxn_opcodes_h_l1758_c2_fb8d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1758_c2_fb8d_cond <= VAR_t16_MUX_uxn_opcodes_h_l1758_c2_fb8d_cond;
     t16_MUX_uxn_opcodes_h_l1758_c2_fb8d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1758_c2_fb8d_iftrue;
     t16_MUX_uxn_opcodes_h_l1758_c2_fb8d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1758_c2_fb8d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1758_c2_fb8d_return_output := t16_MUX_uxn_opcodes_h_l1758_c2_fb8d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1775_c7_023c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1775_c7_023c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1775_c7_023c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1775_c7_023c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1775_c7_023c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1775_c7_023c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1775_c7_023c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1775_c7_023c_return_output := result_u8_value_MUX_uxn_opcodes_h_l1775_c7_023c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1766_c7_bc1b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_bc1b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_bc1b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_bc1b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_bc1b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_bc1b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_bc1b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_bc1b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_bc1b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1766_c7_bc1b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_bc1b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_bc1b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_bc1b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_bc1b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_bc1b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_bc1b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_bc1b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_bc1b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1763_c7_b588] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_b588_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_b588_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_b588_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_b588_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_b588_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_b588_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_b588_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_b588_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1763_c7_b588] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_b588_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_b588_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_b588_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_b588_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_b588_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_b588_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_b588_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_b588_return_output;

     -- n16_MUX[uxn_opcodes_h_l1766_c7_bc1b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1766_c7_bc1b_cond <= VAR_n16_MUX_uxn_opcodes_h_l1766_c7_bc1b_cond;
     n16_MUX_uxn_opcodes_h_l1766_c7_bc1b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1766_c7_bc1b_iftrue;
     n16_MUX_uxn_opcodes_h_l1766_c7_bc1b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1766_c7_bc1b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1766_c7_bc1b_return_output := n16_MUX_uxn_opcodes_h_l1766_c7_bc1b_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1763_c7_b588_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1766_c7_bc1b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_b588_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_bc1b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_b588_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_bc1b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_b588_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_bc1b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_fb8d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_b588_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_fb8d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_b588_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1771_c7_8ccd_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1775_c7_023c_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1758_c2_fb8d_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1771_c7_8ccd] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1771_c7_8ccd_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1771_c7_8ccd_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1771_c7_8ccd_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1771_c7_8ccd_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1771_c7_8ccd_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1771_c7_8ccd_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1771_c7_8ccd_return_output := result_u8_value_MUX_uxn_opcodes_h_l1771_c7_8ccd_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1763_c7_b588] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_b588_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_b588_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_b588_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_b588_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_b588_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_b588_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_b588_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_b588_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1763_c7_b588] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_b588_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_b588_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_b588_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_b588_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_b588_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_b588_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_b588_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_b588_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1763_c7_b588] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_b588_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_b588_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_b588_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_b588_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_b588_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_b588_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_b588_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_b588_return_output;

     -- n16_MUX[uxn_opcodes_h_l1763_c7_b588] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1763_c7_b588_cond <= VAR_n16_MUX_uxn_opcodes_h_l1763_c7_b588_cond;
     n16_MUX_uxn_opcodes_h_l1763_c7_b588_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1763_c7_b588_iftrue;
     n16_MUX_uxn_opcodes_h_l1763_c7_b588_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1763_c7_b588_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1763_c7_b588_return_output := n16_MUX_uxn_opcodes_h_l1763_c7_b588_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1758_c2_fb8d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_fb8d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_fb8d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_fb8d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_fb8d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_fb8d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_fb8d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_fb8d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_fb8d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1758_c2_fb8d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_fb8d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_fb8d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_fb8d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_fb8d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_fb8d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_fb8d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_fb8d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_fb8d_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1758_c2_fb8d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1763_c7_b588_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_fb8d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_b588_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_fb8d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_b588_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_fb8d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_b588_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1766_c7_bc1b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1771_c7_8ccd_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1758_c2_fb8d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_fb8d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_fb8d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_fb8d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_fb8d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_fb8d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_fb8d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_fb8d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_fb8d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1766_c7_bc1b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1766_c7_bc1b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1766_c7_bc1b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1766_c7_bc1b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1766_c7_bc1b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1766_c7_bc1b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1766_c7_bc1b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1766_c7_bc1b_return_output := result_u8_value_MUX_uxn_opcodes_h_l1766_c7_bc1b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1758_c2_fb8d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_fb8d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_fb8d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_fb8d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_fb8d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_fb8d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_fb8d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_fb8d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_fb8d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1758_c2_fb8d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_fb8d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_fb8d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_fb8d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_fb8d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_fb8d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_fb8d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_fb8d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_fb8d_return_output;

     -- n16_MUX[uxn_opcodes_h_l1758_c2_fb8d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1758_c2_fb8d_cond <= VAR_n16_MUX_uxn_opcodes_h_l1758_c2_fb8d_cond;
     n16_MUX_uxn_opcodes_h_l1758_c2_fb8d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1758_c2_fb8d_iftrue;
     n16_MUX_uxn_opcodes_h_l1758_c2_fb8d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1758_c2_fb8d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1758_c2_fb8d_return_output := n16_MUX_uxn_opcodes_h_l1758_c2_fb8d_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1758_c2_fb8d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1763_c7_b588_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1766_c7_bc1b_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1763_c7_b588] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1763_c7_b588_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1763_c7_b588_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1763_c7_b588_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1763_c7_b588_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1763_c7_b588_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1763_c7_b588_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1763_c7_b588_return_output := result_u8_value_MUX_uxn_opcodes_h_l1763_c7_b588_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c2_fb8d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1763_c7_b588_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1758_c2_fb8d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1758_c2_fb8d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c2_fb8d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1758_c2_fb8d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c2_fb8d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1758_c2_fb8d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c2_fb8d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c2_fb8d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1758_c2_fb8d_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l1754_l1793_DUPLICATE_e34d LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l1754_l1793_DUPLICATE_e34d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c2_fb8d_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_fb8d_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_fb8d_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_fb8d_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_fb8d_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_fb8d_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l1754_l1793_DUPLICATE_e34d_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l1754_l1793_DUPLICATE_e34d_return_output;
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
