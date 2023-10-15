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
-- -- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 58
entity lth_0CLK_3d5a5eea is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lth_0CLK_3d5a5eea;
architecture arch of lth_0CLK_3d5a5eea is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2047_c6_0bb9]
signal BIN_OP_EQ_uxn_opcodes_h_l2047_c6_0bb9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2047_c6_0bb9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2047_c6_0bb9_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2047_c2_d87f]
signal n8_MUX_uxn_opcodes_h_l2047_c2_d87f_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2047_c2_d87f_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2047_c2_d87f_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2047_c2_d87f_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2047_c2_d87f]
signal t8_MUX_uxn_opcodes_h_l2047_c2_d87f_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2047_c2_d87f_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2047_c2_d87f_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2047_c2_d87f_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2047_c2_d87f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c2_d87f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c2_d87f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c2_d87f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c2_d87f_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2047_c2_d87f]
signal result_stack_value_MUX_uxn_opcodes_h_l2047_c2_d87f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2047_c2_d87f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2047_c2_d87f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2047_c2_d87f_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2047_c2_d87f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c2_d87f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c2_d87f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c2_d87f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c2_d87f_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2047_c2_d87f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c2_d87f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c2_d87f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c2_d87f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c2_d87f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2047_c2_d87f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2047_c2_d87f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2047_c2_d87f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2047_c2_d87f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2047_c2_d87f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2047_c2_d87f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2047_c2_d87f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2047_c2_d87f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2047_c2_d87f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2047_c2_d87f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2052_c11_38be]
signal BIN_OP_EQ_uxn_opcodes_h_l2052_c11_38be_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2052_c11_38be_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2052_c11_38be_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2052_c7_5966]
signal n8_MUX_uxn_opcodes_h_l2052_c7_5966_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2052_c7_5966_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2052_c7_5966_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2052_c7_5966_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2052_c7_5966]
signal t8_MUX_uxn_opcodes_h_l2052_c7_5966_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2052_c7_5966_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2052_c7_5966_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2052_c7_5966_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2052_c7_5966]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_5966_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_5966_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_5966_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_5966_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2052_c7_5966]
signal result_stack_value_MUX_uxn_opcodes_h_l2052_c7_5966_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2052_c7_5966_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2052_c7_5966_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2052_c7_5966_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2052_c7_5966]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_5966_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_5966_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_5966_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_5966_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2052_c7_5966]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2052_c7_5966_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2052_c7_5966_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2052_c7_5966_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2052_c7_5966_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2052_c7_5966]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_5966_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_5966_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_5966_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_5966_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2052_c7_5966]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_5966_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_5966_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_5966_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_5966_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2055_c11_3b81]
signal BIN_OP_EQ_uxn_opcodes_h_l2055_c11_3b81_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2055_c11_3b81_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2055_c11_3b81_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2055_c7_af15]
signal n8_MUX_uxn_opcodes_h_l2055_c7_af15_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2055_c7_af15_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2055_c7_af15_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2055_c7_af15_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2055_c7_af15]
signal t8_MUX_uxn_opcodes_h_l2055_c7_af15_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2055_c7_af15_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2055_c7_af15_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2055_c7_af15_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2055_c7_af15]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_af15_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_af15_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_af15_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_af15_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2055_c7_af15]
signal result_stack_value_MUX_uxn_opcodes_h_l2055_c7_af15_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2055_c7_af15_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2055_c7_af15_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2055_c7_af15_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2055_c7_af15]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_af15_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_af15_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_af15_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_af15_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2055_c7_af15]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_af15_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_af15_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_af15_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_af15_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2055_c7_af15]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_af15_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_af15_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_af15_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_af15_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2055_c7_af15]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_af15_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_af15_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_af15_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_af15_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2059_c11_2d10]
signal BIN_OP_EQ_uxn_opcodes_h_l2059_c11_2d10_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2059_c11_2d10_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2059_c11_2d10_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2059_c7_b6a3]
signal n8_MUX_uxn_opcodes_h_l2059_c7_b6a3_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2059_c7_b6a3_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2059_c7_b6a3_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2059_c7_b6a3_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2059_c7_b6a3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_b6a3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_b6a3_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_b6a3_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_b6a3_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2059_c7_b6a3]
signal result_stack_value_MUX_uxn_opcodes_h_l2059_c7_b6a3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2059_c7_b6a3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2059_c7_b6a3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2059_c7_b6a3_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2059_c7_b6a3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_b6a3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_b6a3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_b6a3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_b6a3_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2059_c7_b6a3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_b6a3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_b6a3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_b6a3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_b6a3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2059_c7_b6a3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_b6a3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_b6a3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_b6a3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_b6a3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2059_c7_b6a3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_b6a3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_b6a3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_b6a3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_b6a3_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2062_c11_802d]
signal BIN_OP_EQ_uxn_opcodes_h_l2062_c11_802d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2062_c11_802d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2062_c11_802d_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2062_c7_b164]
signal n8_MUX_uxn_opcodes_h_l2062_c7_b164_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2062_c7_b164_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2062_c7_b164_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2062_c7_b164_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2062_c7_b164]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_b164_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_b164_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_b164_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_b164_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2062_c7_b164]
signal result_stack_value_MUX_uxn_opcodes_h_l2062_c7_b164_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2062_c7_b164_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2062_c7_b164_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2062_c7_b164_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2062_c7_b164]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_b164_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_b164_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_b164_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_b164_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2062_c7_b164]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_b164_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_b164_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_b164_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_b164_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2062_c7_b164]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2062_c7_b164_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2062_c7_b164_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2062_c7_b164_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2062_c7_b164_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2062_c7_b164]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_b164_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_b164_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_b164_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_b164_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2065_c32_4db0]
signal BIN_OP_AND_uxn_opcodes_h_l2065_c32_4db0_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2065_c32_4db0_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2065_c32_4db0_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2065_c32_ca9f]
signal BIN_OP_GT_uxn_opcodes_h_l2065_c32_ca9f_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2065_c32_ca9f_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2065_c32_ca9f_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2065_c32_687c]
signal MUX_uxn_opcodes_h_l2065_c32_687c_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2065_c32_687c_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2065_c32_687c_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2065_c32_687c_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2067_c11_6f85]
signal BIN_OP_EQ_uxn_opcodes_h_l2067_c11_6f85_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2067_c11_6f85_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2067_c11_6f85_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2067_c7_874f]
signal result_stack_value_MUX_uxn_opcodes_h_l2067_c7_874f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2067_c7_874f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2067_c7_874f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2067_c7_874f_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2067_c7_874f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2067_c7_874f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2067_c7_874f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2067_c7_874f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2067_c7_874f_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2067_c7_874f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2067_c7_874f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2067_c7_874f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2067_c7_874f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2067_c7_874f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2067_c7_874f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2067_c7_874f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2067_c7_874f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2067_c7_874f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2067_c7_874f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2067_c7_874f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2067_c7_874f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2067_c7_874f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2067_c7_874f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2067_c7_874f_return_output : unsigned(0 downto 0);

-- BIN_OP_LT[uxn_opcodes_h_l2071_c24_28c1]
signal BIN_OP_LT_uxn_opcodes_h_l2071_c24_28c1_left : unsigned(7 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l2071_c24_28c1_right : unsigned(7 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l2071_c24_28c1_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2071_c24_0b02]
signal MUX_uxn_opcodes_h_l2071_c24_0b02_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2071_c24_0b02_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2071_c24_0b02_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2071_c24_0b02_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2073_c11_44a0]
signal BIN_OP_EQ_uxn_opcodes_h_l2073_c11_44a0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2073_c11_44a0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2073_c11_44a0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2073_c7_9995]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2073_c7_9995_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2073_c7_9995_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2073_c7_9995_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2073_c7_9995_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2073_c7_9995]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2073_c7_9995_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2073_c7_9995_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2073_c7_9995_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2073_c7_9995_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5( ref_toks_0 : opcode_result_t;
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
      base.stack_value := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.is_opc_done := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2047_c6_0bb9
BIN_OP_EQ_uxn_opcodes_h_l2047_c6_0bb9 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2047_c6_0bb9_left,
BIN_OP_EQ_uxn_opcodes_h_l2047_c6_0bb9_right,
BIN_OP_EQ_uxn_opcodes_h_l2047_c6_0bb9_return_output);

-- n8_MUX_uxn_opcodes_h_l2047_c2_d87f
n8_MUX_uxn_opcodes_h_l2047_c2_d87f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2047_c2_d87f_cond,
n8_MUX_uxn_opcodes_h_l2047_c2_d87f_iftrue,
n8_MUX_uxn_opcodes_h_l2047_c2_d87f_iffalse,
n8_MUX_uxn_opcodes_h_l2047_c2_d87f_return_output);

-- t8_MUX_uxn_opcodes_h_l2047_c2_d87f
t8_MUX_uxn_opcodes_h_l2047_c2_d87f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2047_c2_d87f_cond,
t8_MUX_uxn_opcodes_h_l2047_c2_d87f_iftrue,
t8_MUX_uxn_opcodes_h_l2047_c2_d87f_iffalse,
t8_MUX_uxn_opcodes_h_l2047_c2_d87f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c2_d87f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c2_d87f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c2_d87f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c2_d87f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c2_d87f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c2_d87f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2047_c2_d87f
result_stack_value_MUX_uxn_opcodes_h_l2047_c2_d87f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2047_c2_d87f_cond,
result_stack_value_MUX_uxn_opcodes_h_l2047_c2_d87f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2047_c2_d87f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2047_c2_d87f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c2_d87f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c2_d87f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c2_d87f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c2_d87f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c2_d87f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c2_d87f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c2_d87f
result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c2_d87f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c2_d87f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c2_d87f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c2_d87f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c2_d87f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2047_c2_d87f
result_is_stack_write_MUX_uxn_opcodes_h_l2047_c2_d87f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2047_c2_d87f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2047_c2_d87f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2047_c2_d87f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2047_c2_d87f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2047_c2_d87f
result_is_opc_done_MUX_uxn_opcodes_h_l2047_c2_d87f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2047_c2_d87f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2047_c2_d87f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2047_c2_d87f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2047_c2_d87f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2052_c11_38be
BIN_OP_EQ_uxn_opcodes_h_l2052_c11_38be : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2052_c11_38be_left,
BIN_OP_EQ_uxn_opcodes_h_l2052_c11_38be_right,
BIN_OP_EQ_uxn_opcodes_h_l2052_c11_38be_return_output);

-- n8_MUX_uxn_opcodes_h_l2052_c7_5966
n8_MUX_uxn_opcodes_h_l2052_c7_5966 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2052_c7_5966_cond,
n8_MUX_uxn_opcodes_h_l2052_c7_5966_iftrue,
n8_MUX_uxn_opcodes_h_l2052_c7_5966_iffalse,
n8_MUX_uxn_opcodes_h_l2052_c7_5966_return_output);

-- t8_MUX_uxn_opcodes_h_l2052_c7_5966
t8_MUX_uxn_opcodes_h_l2052_c7_5966 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2052_c7_5966_cond,
t8_MUX_uxn_opcodes_h_l2052_c7_5966_iftrue,
t8_MUX_uxn_opcodes_h_l2052_c7_5966_iffalse,
t8_MUX_uxn_opcodes_h_l2052_c7_5966_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_5966
result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_5966 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_5966_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_5966_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_5966_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_5966_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2052_c7_5966
result_stack_value_MUX_uxn_opcodes_h_l2052_c7_5966 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2052_c7_5966_cond,
result_stack_value_MUX_uxn_opcodes_h_l2052_c7_5966_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2052_c7_5966_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2052_c7_5966_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_5966
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_5966 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_5966_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_5966_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_5966_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_5966_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2052_c7_5966
result_is_sp_shift_MUX_uxn_opcodes_h_l2052_c7_5966 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2052_c7_5966_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2052_c7_5966_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2052_c7_5966_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2052_c7_5966_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_5966
result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_5966 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_5966_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_5966_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_5966_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_5966_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_5966
result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_5966 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_5966_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_5966_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_5966_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_5966_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2055_c11_3b81
BIN_OP_EQ_uxn_opcodes_h_l2055_c11_3b81 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2055_c11_3b81_left,
BIN_OP_EQ_uxn_opcodes_h_l2055_c11_3b81_right,
BIN_OP_EQ_uxn_opcodes_h_l2055_c11_3b81_return_output);

-- n8_MUX_uxn_opcodes_h_l2055_c7_af15
n8_MUX_uxn_opcodes_h_l2055_c7_af15 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2055_c7_af15_cond,
n8_MUX_uxn_opcodes_h_l2055_c7_af15_iftrue,
n8_MUX_uxn_opcodes_h_l2055_c7_af15_iffalse,
n8_MUX_uxn_opcodes_h_l2055_c7_af15_return_output);

-- t8_MUX_uxn_opcodes_h_l2055_c7_af15
t8_MUX_uxn_opcodes_h_l2055_c7_af15 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2055_c7_af15_cond,
t8_MUX_uxn_opcodes_h_l2055_c7_af15_iftrue,
t8_MUX_uxn_opcodes_h_l2055_c7_af15_iffalse,
t8_MUX_uxn_opcodes_h_l2055_c7_af15_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_af15
result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_af15 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_af15_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_af15_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_af15_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_af15_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2055_c7_af15
result_stack_value_MUX_uxn_opcodes_h_l2055_c7_af15 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2055_c7_af15_cond,
result_stack_value_MUX_uxn_opcodes_h_l2055_c7_af15_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2055_c7_af15_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2055_c7_af15_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_af15
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_af15 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_af15_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_af15_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_af15_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_af15_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_af15
result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_af15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_af15_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_af15_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_af15_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_af15_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_af15
result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_af15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_af15_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_af15_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_af15_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_af15_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_af15
result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_af15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_af15_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_af15_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_af15_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_af15_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2059_c11_2d10
BIN_OP_EQ_uxn_opcodes_h_l2059_c11_2d10 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2059_c11_2d10_left,
BIN_OP_EQ_uxn_opcodes_h_l2059_c11_2d10_right,
BIN_OP_EQ_uxn_opcodes_h_l2059_c11_2d10_return_output);

-- n8_MUX_uxn_opcodes_h_l2059_c7_b6a3
n8_MUX_uxn_opcodes_h_l2059_c7_b6a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2059_c7_b6a3_cond,
n8_MUX_uxn_opcodes_h_l2059_c7_b6a3_iftrue,
n8_MUX_uxn_opcodes_h_l2059_c7_b6a3_iffalse,
n8_MUX_uxn_opcodes_h_l2059_c7_b6a3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_b6a3
result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_b6a3 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_b6a3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_b6a3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_b6a3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_b6a3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2059_c7_b6a3
result_stack_value_MUX_uxn_opcodes_h_l2059_c7_b6a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2059_c7_b6a3_cond,
result_stack_value_MUX_uxn_opcodes_h_l2059_c7_b6a3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2059_c7_b6a3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2059_c7_b6a3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_b6a3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_b6a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_b6a3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_b6a3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_b6a3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_b6a3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_b6a3
result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_b6a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_b6a3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_b6a3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_b6a3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_b6a3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_b6a3
result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_b6a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_b6a3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_b6a3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_b6a3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_b6a3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_b6a3
result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_b6a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_b6a3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_b6a3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_b6a3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_b6a3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2062_c11_802d
BIN_OP_EQ_uxn_opcodes_h_l2062_c11_802d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2062_c11_802d_left,
BIN_OP_EQ_uxn_opcodes_h_l2062_c11_802d_right,
BIN_OP_EQ_uxn_opcodes_h_l2062_c11_802d_return_output);

-- n8_MUX_uxn_opcodes_h_l2062_c7_b164
n8_MUX_uxn_opcodes_h_l2062_c7_b164 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2062_c7_b164_cond,
n8_MUX_uxn_opcodes_h_l2062_c7_b164_iftrue,
n8_MUX_uxn_opcodes_h_l2062_c7_b164_iffalse,
n8_MUX_uxn_opcodes_h_l2062_c7_b164_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_b164
result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_b164 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_b164_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_b164_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_b164_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_b164_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2062_c7_b164
result_stack_value_MUX_uxn_opcodes_h_l2062_c7_b164 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2062_c7_b164_cond,
result_stack_value_MUX_uxn_opcodes_h_l2062_c7_b164_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2062_c7_b164_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2062_c7_b164_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_b164
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_b164 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_b164_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_b164_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_b164_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_b164_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_b164
result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_b164 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_b164_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_b164_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_b164_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_b164_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2062_c7_b164
result_is_stack_write_MUX_uxn_opcodes_h_l2062_c7_b164 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2062_c7_b164_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2062_c7_b164_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2062_c7_b164_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2062_c7_b164_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_b164
result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_b164 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_b164_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_b164_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_b164_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_b164_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2065_c32_4db0
BIN_OP_AND_uxn_opcodes_h_l2065_c32_4db0 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2065_c32_4db0_left,
BIN_OP_AND_uxn_opcodes_h_l2065_c32_4db0_right,
BIN_OP_AND_uxn_opcodes_h_l2065_c32_4db0_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2065_c32_ca9f
BIN_OP_GT_uxn_opcodes_h_l2065_c32_ca9f : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2065_c32_ca9f_left,
BIN_OP_GT_uxn_opcodes_h_l2065_c32_ca9f_right,
BIN_OP_GT_uxn_opcodes_h_l2065_c32_ca9f_return_output);

-- MUX_uxn_opcodes_h_l2065_c32_687c
MUX_uxn_opcodes_h_l2065_c32_687c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2065_c32_687c_cond,
MUX_uxn_opcodes_h_l2065_c32_687c_iftrue,
MUX_uxn_opcodes_h_l2065_c32_687c_iffalse,
MUX_uxn_opcodes_h_l2065_c32_687c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2067_c11_6f85
BIN_OP_EQ_uxn_opcodes_h_l2067_c11_6f85 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2067_c11_6f85_left,
BIN_OP_EQ_uxn_opcodes_h_l2067_c11_6f85_right,
BIN_OP_EQ_uxn_opcodes_h_l2067_c11_6f85_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2067_c7_874f
result_stack_value_MUX_uxn_opcodes_h_l2067_c7_874f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2067_c7_874f_cond,
result_stack_value_MUX_uxn_opcodes_h_l2067_c7_874f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2067_c7_874f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2067_c7_874f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2067_c7_874f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2067_c7_874f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2067_c7_874f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2067_c7_874f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2067_c7_874f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2067_c7_874f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2067_c7_874f
result_is_sp_shift_MUX_uxn_opcodes_h_l2067_c7_874f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2067_c7_874f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2067_c7_874f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2067_c7_874f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2067_c7_874f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2067_c7_874f
result_is_stack_write_MUX_uxn_opcodes_h_l2067_c7_874f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2067_c7_874f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2067_c7_874f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2067_c7_874f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2067_c7_874f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2067_c7_874f
result_is_opc_done_MUX_uxn_opcodes_h_l2067_c7_874f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2067_c7_874f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2067_c7_874f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2067_c7_874f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2067_c7_874f_return_output);

-- BIN_OP_LT_uxn_opcodes_h_l2071_c24_28c1
BIN_OP_LT_uxn_opcodes_h_l2071_c24_28c1 : entity work.BIN_OP_LT_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_LT_uxn_opcodes_h_l2071_c24_28c1_left,
BIN_OP_LT_uxn_opcodes_h_l2071_c24_28c1_right,
BIN_OP_LT_uxn_opcodes_h_l2071_c24_28c1_return_output);

-- MUX_uxn_opcodes_h_l2071_c24_0b02
MUX_uxn_opcodes_h_l2071_c24_0b02 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2071_c24_0b02_cond,
MUX_uxn_opcodes_h_l2071_c24_0b02_iftrue,
MUX_uxn_opcodes_h_l2071_c24_0b02_iffalse,
MUX_uxn_opcodes_h_l2071_c24_0b02_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2073_c11_44a0
BIN_OP_EQ_uxn_opcodes_h_l2073_c11_44a0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2073_c11_44a0_left,
BIN_OP_EQ_uxn_opcodes_h_l2073_c11_44a0_right,
BIN_OP_EQ_uxn_opcodes_h_l2073_c11_44a0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2073_c7_9995
result_is_stack_write_MUX_uxn_opcodes_h_l2073_c7_9995 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2073_c7_9995_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2073_c7_9995_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2073_c7_9995_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2073_c7_9995_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2073_c7_9995
result_is_opc_done_MUX_uxn_opcodes_h_l2073_c7_9995 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2073_c7_9995_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2073_c7_9995_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2073_c7_9995_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2073_c7_9995_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2047_c6_0bb9_return_output,
 n8_MUX_uxn_opcodes_h_l2047_c2_d87f_return_output,
 t8_MUX_uxn_opcodes_h_l2047_c2_d87f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c2_d87f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2047_c2_d87f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c2_d87f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c2_d87f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2047_c2_d87f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2047_c2_d87f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2052_c11_38be_return_output,
 n8_MUX_uxn_opcodes_h_l2052_c7_5966_return_output,
 t8_MUX_uxn_opcodes_h_l2052_c7_5966_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_5966_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2052_c7_5966_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_5966_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2052_c7_5966_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_5966_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_5966_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2055_c11_3b81_return_output,
 n8_MUX_uxn_opcodes_h_l2055_c7_af15_return_output,
 t8_MUX_uxn_opcodes_h_l2055_c7_af15_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_af15_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2055_c7_af15_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_af15_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_af15_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_af15_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_af15_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2059_c11_2d10_return_output,
 n8_MUX_uxn_opcodes_h_l2059_c7_b6a3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_b6a3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2059_c7_b6a3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_b6a3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_b6a3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_b6a3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_b6a3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2062_c11_802d_return_output,
 n8_MUX_uxn_opcodes_h_l2062_c7_b164_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_b164_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2062_c7_b164_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_b164_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_b164_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2062_c7_b164_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_b164_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2065_c32_4db0_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2065_c32_ca9f_return_output,
 MUX_uxn_opcodes_h_l2065_c32_687c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2067_c11_6f85_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2067_c7_874f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2067_c7_874f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2067_c7_874f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2067_c7_874f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2067_c7_874f_return_output,
 BIN_OP_LT_uxn_opcodes_h_l2071_c24_28c1_return_output,
 MUX_uxn_opcodes_h_l2071_c24_0b02_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2073_c11_44a0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2073_c7_9995_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2073_c7_9995_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c6_0bb9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c6_0bb9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c6_0bb9_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2047_c2_d87f_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2047_c2_d87f_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2052_c7_5966_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2047_c2_d87f_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2047_c2_d87f_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2047_c2_d87f_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2047_c2_d87f_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2052_c7_5966_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2047_c2_d87f_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2047_c2_d87f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c2_d87f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c2_d87f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_5966_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c2_d87f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c2_d87f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2047_c2_d87f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2047_c2_d87f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2052_c7_5966_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2047_c2_d87f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2047_c2_d87f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c2_d87f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2049_c3_fa75 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c2_d87f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_5966_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c2_d87f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c2_d87f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c2_d87f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c2_d87f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2052_c7_5966_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c2_d87f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c2_d87f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2047_c2_d87f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2047_c2_d87f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_5966_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2047_c2_d87f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2047_c2_d87f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2047_c2_d87f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2047_c2_d87f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_5966_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2047_c2_d87f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2047_c2_d87f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_38be_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_38be_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_38be_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2052_c7_5966_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2052_c7_5966_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2055_c7_af15_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2052_c7_5966_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2052_c7_5966_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2052_c7_5966_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2055_c7_af15_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2052_c7_5966_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_5966_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_5966_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_af15_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_5966_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2052_c7_5966_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2052_c7_5966_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2055_c7_af15_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2052_c7_5966_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_5966_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2053_c3_27b4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_5966_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_af15_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_5966_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2052_c7_5966_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2052_c7_5966_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_af15_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2052_c7_5966_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_5966_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_5966_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_af15_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_5966_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_5966_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_5966_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_af15_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_5966_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_3b81_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_3b81_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_3b81_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2055_c7_af15_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2055_c7_af15_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2059_c7_b6a3_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2055_c7_af15_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2055_c7_af15_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2055_c7_af15_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2055_c7_af15_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_af15_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_af15_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_b6a3_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_af15_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2055_c7_af15_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2055_c7_af15_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2059_c7_b6a3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2055_c7_af15_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_af15_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2057_c3_6710 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_af15_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_b6a3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_af15_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_af15_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_af15_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_b6a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_af15_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_af15_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_af15_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_b6a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_af15_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_af15_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_af15_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_b6a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_af15_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_2d10_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_2d10_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_2d10_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2059_c7_b6a3_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2059_c7_b6a3_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2062_c7_b164_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2059_c7_b6a3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_b6a3_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_b6a3_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_b164_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_b6a3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2059_c7_b6a3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2059_c7_b6a3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2062_c7_b164_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2059_c7_b6a3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_b6a3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2060_c3_7a11 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_b6a3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_b164_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_b6a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_b6a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_b6a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_b164_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_b6a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_b6a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_b6a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2062_c7_b164_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_b6a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_b6a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_b6a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_b164_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_b6a3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_802d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_802d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_802d_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2062_c7_b164_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2062_c7_b164_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2062_c7_b164_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_b164_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_b164_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_b164_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2062_c7_b164_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2062_c7_b164_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2067_c7_874f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2062_c7_b164_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_b164_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_b164_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2067_c7_874f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_b164_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_b164_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_b164_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2067_c7_874f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_b164_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2062_c7_b164_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2062_c7_b164_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2067_c7_874f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2062_c7_b164_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_b164_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_b164_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2067_c7_874f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_b164_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2065_c32_687c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2065_c32_687c_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2065_c32_687c_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2065_c32_4db0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2065_c32_4db0_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2065_c32_4db0_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2065_c32_ca9f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2065_c32_ca9f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2065_c32_ca9f_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2065_c32_687c_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2067_c11_6f85_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2067_c11_6f85_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2067_c11_6f85_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2067_c7_874f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2067_c7_874f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2067_c7_874f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2067_c7_874f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2070_c3_9438 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2067_c7_874f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2067_c7_874f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2067_c7_874f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2067_c7_874f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2067_c7_874f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2067_c7_874f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2067_c7_874f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2073_c7_9995_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2067_c7_874f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2067_c7_874f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2067_c7_874f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2073_c7_9995_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2067_c7_874f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2071_c24_0b02_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2071_c24_0b02_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2071_c24_0b02_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l2071_c24_28c1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l2071_c24_28c1_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l2071_c24_28c1_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2071_c24_0b02_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2073_c11_44a0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2073_c11_44a0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2073_c11_44a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2073_c7_9995_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2073_c7_9995_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2073_c7_9995_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2073_c7_9995_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2073_c7_9995_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2073_c7_9995_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2062_l2059_l2055_l2052_l2047_DUPLICATE_a236_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2062_l2059_l2055_l2052_l2047_l2067_DUPLICATE_defd_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2059_l2055_l2052_l2047_l2067_DUPLICATE_eae5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2062_l2059_l2055_l2052_l2047_l2073_DUPLICATE_b467_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2062_l2059_l2055_l2052_l2073_l2067_DUPLICATE_bba4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2062_l2067_DUPLICATE_0d22_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l2043_l2078_DUPLICATE_aaf2_return_output : opcode_result_t;
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
     VAR_BIN_OP_AND_uxn_opcodes_h_l2065_c32_4db0_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2073_c11_44a0_right := to_unsigned(6, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2073_c7_9995_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2070_c3_9438 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2067_c7_874f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2070_c3_9438;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_802d_right := to_unsigned(4, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2067_c7_874f_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2057_c3_6710 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_af15_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2057_c3_6710;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_b164_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l2065_c32_687c_iffalse := resize(to_signed(-1, 2), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2053_c3_27b4 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_5966_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2053_c3_27b4;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_3b81_right := to_unsigned(2, 2);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2065_c32_ca9f_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2071_c24_0b02_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2067_c7_874f_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2073_c7_9995_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2060_c3_7a11 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_b6a3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2060_c3_7a11;
     VAR_MUX_uxn_opcodes_h_l2065_c32_687c_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2047_c2_d87f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2067_c11_6f85_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c6_0bb9_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2071_c24_0b02_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2049_c3_fa75 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c2_d87f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2049_c3_fa75;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_2d10_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_38be_right := to_unsigned(1, 1);

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
     VAR_BIN_OP_AND_uxn_opcodes_h_l2065_c32_4db0_left := VAR_ins;
     VAR_BIN_OP_LT_uxn_opcodes_h_l2071_c24_28c1_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2047_c2_d87f_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2052_c7_5966_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2055_c7_af15_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2059_c7_b6a3_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2062_c7_b164_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c6_0bb9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_38be_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_3b81_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_2d10_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_802d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2067_c11_6f85_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2073_c11_44a0_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l2062_c7_b164_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2055_c7_af15_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_LT_uxn_opcodes_h_l2071_c24_28c1_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2047_c2_d87f_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2052_c7_5966_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2055_c7_af15_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l2055_c11_3b81] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2055_c11_3b81_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_3b81_left;
     BIN_OP_EQ_uxn_opcodes_h_l2055_c11_3b81_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_3b81_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_3b81_return_output := BIN_OP_EQ_uxn_opcodes_h_l2055_c11_3b81_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2062_l2059_l2055_l2052_l2047_l2067_DUPLICATE_defd LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2062_l2059_l2055_l2052_l2047_l2067_DUPLICATE_defd_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2067_c11_6f85] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2067_c11_6f85_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2067_c11_6f85_left;
     BIN_OP_EQ_uxn_opcodes_h_l2067_c11_6f85_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2067_c11_6f85_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2067_c11_6f85_return_output := BIN_OP_EQ_uxn_opcodes_h_l2067_c11_6f85_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2073_c11_44a0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2073_c11_44a0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2073_c11_44a0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2073_c11_44a0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2073_c11_44a0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2073_c11_44a0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2073_c11_44a0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2059_c11_2d10] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2059_c11_2d10_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_2d10_left;
     BIN_OP_EQ_uxn_opcodes_h_l2059_c11_2d10_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_2d10_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_2d10_return_output := BIN_OP_EQ_uxn_opcodes_h_l2059_c11_2d10_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2062_l2059_l2055_l2052_l2047_DUPLICATE_a236 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2062_l2059_l2055_l2052_l2047_DUPLICATE_a236_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2059_l2055_l2052_l2047_l2067_DUPLICATE_eae5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2059_l2055_l2052_l2047_l2067_DUPLICATE_eae5_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2062_l2059_l2055_l2052_l2047_l2073_DUPLICATE_b467 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2062_l2059_l2055_l2052_l2047_l2073_DUPLICATE_b467_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2052_c11_38be] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2052_c11_38be_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_38be_left;
     BIN_OP_EQ_uxn_opcodes_h_l2052_c11_38be_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_38be_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_38be_return_output := BIN_OP_EQ_uxn_opcodes_h_l2052_c11_38be_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2062_l2059_l2055_l2052_l2073_l2067_DUPLICATE_bba4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2062_l2059_l2055_l2052_l2073_l2067_DUPLICATE_bba4_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2062_l2067_DUPLICATE_0d22 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2062_l2067_DUPLICATE_0d22_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2062_c11_802d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2062_c11_802d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_802d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2062_c11_802d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_802d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_802d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2062_c11_802d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2047_c6_0bb9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2047_c6_0bb9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c6_0bb9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2047_c6_0bb9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c6_0bb9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c6_0bb9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2047_c6_0bb9_return_output;

     -- BIN_OP_LT[uxn_opcodes_h_l2071_c24_28c1] LATENCY=0
     -- Inputs
     BIN_OP_LT_uxn_opcodes_h_l2071_c24_28c1_left <= VAR_BIN_OP_LT_uxn_opcodes_h_l2071_c24_28c1_left;
     BIN_OP_LT_uxn_opcodes_h_l2071_c24_28c1_right <= VAR_BIN_OP_LT_uxn_opcodes_h_l2071_c24_28c1_right;
     -- Outputs
     VAR_BIN_OP_LT_uxn_opcodes_h_l2071_c24_28c1_return_output := BIN_OP_LT_uxn_opcodes_h_l2071_c24_28c1_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2065_c32_4db0] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2065_c32_4db0_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2065_c32_4db0_left;
     BIN_OP_AND_uxn_opcodes_h_l2065_c32_4db0_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2065_c32_4db0_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2065_c32_4db0_return_output := BIN_OP_AND_uxn_opcodes_h_l2065_c32_4db0_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2065_c32_ca9f_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2065_c32_4db0_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2047_c2_d87f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c6_0bb9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2047_c2_d87f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c6_0bb9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c2_d87f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c6_0bb9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2047_c2_d87f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c6_0bb9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c2_d87f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c6_0bb9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c2_d87f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c6_0bb9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2047_c2_d87f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c6_0bb9_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2047_c2_d87f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c6_0bb9_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2052_c7_5966_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_38be_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_5966_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_38be_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2052_c7_5966_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_38be_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_5966_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_38be_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_5966_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_38be_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_5966_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_38be_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2052_c7_5966_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_38be_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2052_c7_5966_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_38be_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2055_c7_af15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_3b81_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_af15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_3b81_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_af15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_3b81_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_af15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_3b81_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_af15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_3b81_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_af15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_3b81_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2055_c7_af15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_3b81_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2055_c7_af15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_3b81_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2059_c7_b6a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_2d10_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_b6a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_2d10_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_b6a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_2d10_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_b6a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_2d10_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_b6a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_2d10_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_b6a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_2d10_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2059_c7_b6a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_2d10_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2062_c7_b164_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_802d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_b164_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_802d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_b164_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_802d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2062_c7_b164_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_802d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_b164_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_802d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_b164_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_802d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2062_c7_b164_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_802d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2067_c7_874f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2067_c11_6f85_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2067_c7_874f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2067_c11_6f85_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2067_c7_874f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2067_c11_6f85_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2067_c7_874f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2067_c11_6f85_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2067_c7_874f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2067_c11_6f85_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2073_c7_9995_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2073_c11_44a0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2073_c7_9995_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2073_c11_44a0_return_output;
     VAR_MUX_uxn_opcodes_h_l2071_c24_0b02_cond := VAR_BIN_OP_LT_uxn_opcodes_h_l2071_c24_28c1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c2_d87f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2062_l2059_l2055_l2052_l2047_DUPLICATE_a236_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_5966_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2062_l2059_l2055_l2052_l2047_DUPLICATE_a236_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_af15_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2062_l2059_l2055_l2052_l2047_DUPLICATE_a236_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_b6a3_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2062_l2059_l2055_l2052_l2047_DUPLICATE_a236_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_b164_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2062_l2059_l2055_l2052_l2047_DUPLICATE_a236_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_5966_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2062_l2059_l2055_l2052_l2073_l2067_DUPLICATE_bba4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_af15_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2062_l2059_l2055_l2052_l2073_l2067_DUPLICATE_bba4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_b6a3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2062_l2059_l2055_l2052_l2073_l2067_DUPLICATE_bba4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_b164_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2062_l2059_l2055_l2052_l2073_l2067_DUPLICATE_bba4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2067_c7_874f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2062_l2059_l2055_l2052_l2073_l2067_DUPLICATE_bba4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2073_c7_9995_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2062_l2059_l2055_l2052_l2073_l2067_DUPLICATE_bba4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c2_d87f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2059_l2055_l2052_l2047_l2067_DUPLICATE_eae5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2052_c7_5966_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2059_l2055_l2052_l2047_l2067_DUPLICATE_eae5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_af15_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2059_l2055_l2052_l2047_l2067_DUPLICATE_eae5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_b6a3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2059_l2055_l2052_l2047_l2067_DUPLICATE_eae5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2067_c7_874f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2059_l2055_l2052_l2047_l2067_DUPLICATE_eae5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2047_c2_d87f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2062_l2059_l2055_l2052_l2047_l2073_DUPLICATE_b467_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_5966_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2062_l2059_l2055_l2052_l2047_l2073_DUPLICATE_b467_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_af15_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2062_l2059_l2055_l2052_l2047_l2073_DUPLICATE_b467_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_b6a3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2062_l2059_l2055_l2052_l2047_l2073_DUPLICATE_b467_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2062_c7_b164_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2062_l2059_l2055_l2052_l2047_l2073_DUPLICATE_b467_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2073_c7_9995_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2062_l2059_l2055_l2052_l2047_l2073_DUPLICATE_b467_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_b164_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2062_l2067_DUPLICATE_0d22_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2067_c7_874f_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2062_l2067_DUPLICATE_0d22_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2047_c2_d87f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2062_l2059_l2055_l2052_l2047_l2067_DUPLICATE_defd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2052_c7_5966_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2062_l2059_l2055_l2052_l2047_l2067_DUPLICATE_defd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2055_c7_af15_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2062_l2059_l2055_l2052_l2047_l2067_DUPLICATE_defd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2059_c7_b6a3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2062_l2059_l2055_l2052_l2047_l2067_DUPLICATE_defd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2062_c7_b164_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2062_l2059_l2055_l2052_l2047_l2067_DUPLICATE_defd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2067_c7_874f_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2062_l2059_l2055_l2052_l2047_l2067_DUPLICATE_defd_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2073_c7_9995] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2073_c7_9995_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2073_c7_9995_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2073_c7_9995_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2073_c7_9995_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2073_c7_9995_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2073_c7_9995_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2073_c7_9995_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2073_c7_9995_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2067_c7_874f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2067_c7_874f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2067_c7_874f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2067_c7_874f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2067_c7_874f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2067_c7_874f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2067_c7_874f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2067_c7_874f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2067_c7_874f_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2065_c32_ca9f] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2065_c32_ca9f_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2065_c32_ca9f_left;
     BIN_OP_GT_uxn_opcodes_h_l2065_c32_ca9f_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2065_c32_ca9f_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2065_c32_ca9f_return_output := BIN_OP_GT_uxn_opcodes_h_l2065_c32_ca9f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2067_c7_874f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2067_c7_874f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2067_c7_874f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2067_c7_874f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2067_c7_874f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2067_c7_874f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2067_c7_874f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2067_c7_874f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2067_c7_874f_return_output;

     -- t8_MUX[uxn_opcodes_h_l2055_c7_af15] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2055_c7_af15_cond <= VAR_t8_MUX_uxn_opcodes_h_l2055_c7_af15_cond;
     t8_MUX_uxn_opcodes_h_l2055_c7_af15_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2055_c7_af15_iftrue;
     t8_MUX_uxn_opcodes_h_l2055_c7_af15_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2055_c7_af15_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2055_c7_af15_return_output := t8_MUX_uxn_opcodes_h_l2055_c7_af15_return_output;

     -- MUX[uxn_opcodes_h_l2071_c24_0b02] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2071_c24_0b02_cond <= VAR_MUX_uxn_opcodes_h_l2071_c24_0b02_cond;
     MUX_uxn_opcodes_h_l2071_c24_0b02_iftrue <= VAR_MUX_uxn_opcodes_h_l2071_c24_0b02_iftrue;
     MUX_uxn_opcodes_h_l2071_c24_0b02_iffalse <= VAR_MUX_uxn_opcodes_h_l2071_c24_0b02_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2071_c24_0b02_return_output := MUX_uxn_opcodes_h_l2071_c24_0b02_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2073_c7_9995] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2073_c7_9995_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2073_c7_9995_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2073_c7_9995_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2073_c7_9995_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2073_c7_9995_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2073_c7_9995_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2073_c7_9995_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2073_c7_9995_return_output;

     -- n8_MUX[uxn_opcodes_h_l2062_c7_b164] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2062_c7_b164_cond <= VAR_n8_MUX_uxn_opcodes_h_l2062_c7_b164_cond;
     n8_MUX_uxn_opcodes_h_l2062_c7_b164_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2062_c7_b164_iftrue;
     n8_MUX_uxn_opcodes_h_l2062_c7_b164_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2062_c7_b164_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2062_c7_b164_return_output := n8_MUX_uxn_opcodes_h_l2062_c7_b164_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2065_c32_687c_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2065_c32_ca9f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2067_c7_874f_iftrue := VAR_MUX_uxn_opcodes_h_l2071_c24_0b02_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2059_c7_b6a3_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2062_c7_b164_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2067_c7_874f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2073_c7_9995_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_b164_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2067_c7_874f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2067_c7_874f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2073_c7_9995_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_b164_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2067_c7_874f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2052_c7_5966_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2055_c7_af15_return_output;
     -- n8_MUX[uxn_opcodes_h_l2059_c7_b6a3] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2059_c7_b6a3_cond <= VAR_n8_MUX_uxn_opcodes_h_l2059_c7_b6a3_cond;
     n8_MUX_uxn_opcodes_h_l2059_c7_b6a3_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2059_c7_b6a3_iftrue;
     n8_MUX_uxn_opcodes_h_l2059_c7_b6a3_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2059_c7_b6a3_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2059_c7_b6a3_return_output := n8_MUX_uxn_opcodes_h_l2059_c7_b6a3_return_output;

     -- MUX[uxn_opcodes_h_l2065_c32_687c] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2065_c32_687c_cond <= VAR_MUX_uxn_opcodes_h_l2065_c32_687c_cond;
     MUX_uxn_opcodes_h_l2065_c32_687c_iftrue <= VAR_MUX_uxn_opcodes_h_l2065_c32_687c_iftrue;
     MUX_uxn_opcodes_h_l2065_c32_687c_iffalse <= VAR_MUX_uxn_opcodes_h_l2065_c32_687c_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2065_c32_687c_return_output := MUX_uxn_opcodes_h_l2065_c32_687c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2062_c7_b164] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_b164_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_b164_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_b164_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_b164_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_b164_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_b164_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_b164_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_b164_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2067_c7_874f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2067_c7_874f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2067_c7_874f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2067_c7_874f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2067_c7_874f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2067_c7_874f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2067_c7_874f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2067_c7_874f_return_output := result_stack_value_MUX_uxn_opcodes_h_l2067_c7_874f_return_output;

     -- t8_MUX[uxn_opcodes_h_l2052_c7_5966] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2052_c7_5966_cond <= VAR_t8_MUX_uxn_opcodes_h_l2052_c7_5966_cond;
     t8_MUX_uxn_opcodes_h_l2052_c7_5966_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2052_c7_5966_iftrue;
     t8_MUX_uxn_opcodes_h_l2052_c7_5966_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2052_c7_5966_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2052_c7_5966_return_output := t8_MUX_uxn_opcodes_h_l2052_c7_5966_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2067_c7_874f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2067_c7_874f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2067_c7_874f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2067_c7_874f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2067_c7_874f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2067_c7_874f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2067_c7_874f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2067_c7_874f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2067_c7_874f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2067_c7_874f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2067_c7_874f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2067_c7_874f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2067_c7_874f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2067_c7_874f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2067_c7_874f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2067_c7_874f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2067_c7_874f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2067_c7_874f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2062_c7_b164] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_b164_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_b164_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_b164_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_b164_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_b164_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_b164_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_b164_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_b164_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_b164_iftrue := VAR_MUX_uxn_opcodes_h_l2065_c32_687c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2055_c7_af15_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2059_c7_b6a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_b164_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2067_c7_874f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_b6a3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_b164_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2062_c7_b164_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2067_c7_874f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_b6a3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_b164_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2062_c7_b164_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2067_c7_874f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2047_c2_d87f_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2052_c7_5966_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2062_c7_b164] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_b164_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_b164_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_b164_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_b164_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_b164_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_b164_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_b164_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_b164_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2059_c7_b6a3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_b6a3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_b6a3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_b6a3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_b6a3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_b6a3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_b6a3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_b6a3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_b6a3_return_output;

     -- n8_MUX[uxn_opcodes_h_l2055_c7_af15] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2055_c7_af15_cond <= VAR_n8_MUX_uxn_opcodes_h_l2055_c7_af15_cond;
     n8_MUX_uxn_opcodes_h_l2055_c7_af15_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2055_c7_af15_iftrue;
     n8_MUX_uxn_opcodes_h_l2055_c7_af15_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2055_c7_af15_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2055_c7_af15_return_output := n8_MUX_uxn_opcodes_h_l2055_c7_af15_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2062_c7_b164] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2062_c7_b164_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2062_c7_b164_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2062_c7_b164_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2062_c7_b164_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2062_c7_b164_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2062_c7_b164_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2062_c7_b164_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2062_c7_b164_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2062_c7_b164] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2062_c7_b164_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2062_c7_b164_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2062_c7_b164_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2062_c7_b164_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2062_c7_b164_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2062_c7_b164_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2062_c7_b164_return_output := result_stack_value_MUX_uxn_opcodes_h_l2062_c7_b164_return_output;

     -- t8_MUX[uxn_opcodes_h_l2047_c2_d87f] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2047_c2_d87f_cond <= VAR_t8_MUX_uxn_opcodes_h_l2047_c2_d87f_cond;
     t8_MUX_uxn_opcodes_h_l2047_c2_d87f_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2047_c2_d87f_iftrue;
     t8_MUX_uxn_opcodes_h_l2047_c2_d87f_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2047_c2_d87f_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2047_c2_d87f_return_output := t8_MUX_uxn_opcodes_h_l2047_c2_d87f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2059_c7_b6a3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_b6a3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_b6a3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_b6a3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_b6a3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_b6a3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_b6a3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_b6a3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_b6a3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2062_c7_b164] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_b164_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_b164_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_b164_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_b164_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_b164_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_b164_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_b164_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_b164_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l2052_c7_5966_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2055_c7_af15_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_b6a3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_b164_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_af15_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_b6a3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_b6a3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2062_c7_b164_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_b6a3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_b164_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_af15_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_b6a3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2059_c7_b6a3_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2062_c7_b164_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2047_c2_d87f_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2059_c7_b6a3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_b6a3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_b6a3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_b6a3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_b6a3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_b6a3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_b6a3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_b6a3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_b6a3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2055_c7_af15] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_af15_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_af15_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_af15_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_af15_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_af15_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_af15_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_af15_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_af15_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2059_c7_b6a3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2059_c7_b6a3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2059_c7_b6a3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2059_c7_b6a3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2059_c7_b6a3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2059_c7_b6a3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2059_c7_b6a3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2059_c7_b6a3_return_output := result_stack_value_MUX_uxn_opcodes_h_l2059_c7_b6a3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2059_c7_b6a3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_b6a3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_b6a3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_b6a3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_b6a3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_b6a3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_b6a3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_b6a3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_b6a3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2055_c7_af15] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_af15_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_af15_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_af15_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_af15_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_af15_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_af15_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_af15_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_af15_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2059_c7_b6a3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_b6a3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_b6a3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_b6a3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_b6a3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_b6a3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_b6a3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_b6a3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_b6a3_return_output;

     -- n8_MUX[uxn_opcodes_h_l2052_c7_5966] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2052_c7_5966_cond <= VAR_n8_MUX_uxn_opcodes_h_l2052_c7_5966_cond;
     n8_MUX_uxn_opcodes_h_l2052_c7_5966_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2052_c7_5966_iftrue;
     n8_MUX_uxn_opcodes_h_l2052_c7_5966_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2052_c7_5966_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2052_c7_5966_return_output := n8_MUX_uxn_opcodes_h_l2052_c7_5966_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l2047_c2_d87f_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2052_c7_5966_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_af15_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_b6a3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2052_c7_5966_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_af15_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_af15_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_b6a3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_af15_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_b6a3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_5966_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_af15_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2055_c7_af15_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2059_c7_b6a3_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2055_c7_af15] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_af15_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_af15_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_af15_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_af15_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_af15_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_af15_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_af15_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_af15_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2052_c7_5966] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2052_c7_5966_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2052_c7_5966_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2052_c7_5966_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2052_c7_5966_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2052_c7_5966_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2052_c7_5966_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2052_c7_5966_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2052_c7_5966_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2052_c7_5966] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_5966_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_5966_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_5966_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_5966_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_5966_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_5966_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_5966_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_5966_return_output;

     -- n8_MUX[uxn_opcodes_h_l2047_c2_d87f] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2047_c2_d87f_cond <= VAR_n8_MUX_uxn_opcodes_h_l2047_c2_d87f_cond;
     n8_MUX_uxn_opcodes_h_l2047_c2_d87f_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2047_c2_d87f_iftrue;
     n8_MUX_uxn_opcodes_h_l2047_c2_d87f_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2047_c2_d87f_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2047_c2_d87f_return_output := n8_MUX_uxn_opcodes_h_l2047_c2_d87f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2055_c7_af15] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_af15_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_af15_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_af15_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_af15_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_af15_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_af15_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_af15_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_af15_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2055_c7_af15] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_af15_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_af15_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_af15_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_af15_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_af15_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_af15_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_af15_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_af15_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2055_c7_af15] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2055_c7_af15_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2055_c7_af15_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2055_c7_af15_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2055_c7_af15_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2055_c7_af15_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2055_c7_af15_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2055_c7_af15_return_output := result_stack_value_MUX_uxn_opcodes_h_l2055_c7_af15_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2047_c2_d87f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_5966_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_af15_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c2_d87f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2052_c7_5966_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_5966_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_af15_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_5966_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_af15_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c2_d87f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_5966_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2052_c7_5966_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2055_c7_af15_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2052_c7_5966] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2052_c7_5966_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2052_c7_5966_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2052_c7_5966_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2052_c7_5966_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2052_c7_5966_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2052_c7_5966_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2052_c7_5966_return_output := result_stack_value_MUX_uxn_opcodes_h_l2052_c7_5966_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2052_c7_5966] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_5966_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_5966_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_5966_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_5966_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_5966_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_5966_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_5966_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_5966_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2047_c2_d87f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c2_d87f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c2_d87f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c2_d87f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c2_d87f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c2_d87f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c2_d87f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c2_d87f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c2_d87f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2052_c7_5966] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_5966_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_5966_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_5966_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_5966_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_5966_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_5966_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_5966_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_5966_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2047_c2_d87f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c2_d87f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c2_d87f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c2_d87f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c2_d87f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c2_d87f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c2_d87f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c2_d87f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c2_d87f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2052_c7_5966] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_5966_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_5966_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_5966_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_5966_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_5966_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_5966_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_5966_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_5966_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2047_c2_d87f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_5966_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2047_c2_d87f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_5966_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c2_d87f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_5966_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2047_c2_d87f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2052_c7_5966_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2047_c2_d87f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2047_c2_d87f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2047_c2_d87f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2047_c2_d87f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2047_c2_d87f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2047_c2_d87f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2047_c2_d87f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2047_c2_d87f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2047_c2_d87f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2047_c2_d87f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2047_c2_d87f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2047_c2_d87f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2047_c2_d87f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2047_c2_d87f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2047_c2_d87f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2047_c2_d87f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2047_c2_d87f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2047_c2_d87f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2047_c2_d87f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2047_c2_d87f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2047_c2_d87f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2047_c2_d87f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2047_c2_d87f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2047_c2_d87f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2047_c2_d87f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2047_c2_d87f_return_output := result_stack_value_MUX_uxn_opcodes_h_l2047_c2_d87f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2047_c2_d87f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c2_d87f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c2_d87f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c2_d87f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c2_d87f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c2_d87f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c2_d87f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c2_d87f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c2_d87f_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l2043_l2078_DUPLICATE_aaf2 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l2043_l2078_DUPLICATE_aaf2_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c2_d87f_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2047_c2_d87f_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c2_d87f_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c2_d87f_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2047_c2_d87f_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2047_c2_d87f_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l2043_l2078_DUPLICATE_aaf2_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l2043_l2078_DUPLICATE_aaf2_return_output;
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
