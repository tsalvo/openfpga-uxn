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
-- Submodules: 105
entity sub2_0CLK_e3a03e27 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sub2_0CLK_e3a03e27;
architecture arch of sub2_0CLK_e3a03e27 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2656_c6_dc6e]
signal BIN_OP_EQ_uxn_opcodes_h_l2656_c6_dc6e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2656_c6_dc6e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2656_c6_dc6e_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2656_c2_768c]
signal tmp16_MUX_uxn_opcodes_h_l2656_c2_768c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2656_c2_768c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2656_c2_768c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2656_c2_768c_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2656_c2_768c]
signal n16_MUX_uxn_opcodes_h_l2656_c2_768c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2656_c2_768c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2656_c2_768c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2656_c2_768c_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2656_c2_768c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c2_768c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c2_768c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c2_768c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c2_768c_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2656_c2_768c]
signal result_u8_value_MUX_uxn_opcodes_h_l2656_c2_768c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2656_c2_768c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2656_c2_768c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2656_c2_768c_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2656_c2_768c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2656_c2_768c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2656_c2_768c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2656_c2_768c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2656_c2_768c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2656_c2_768c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2656_c2_768c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2656_c2_768c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2656_c2_768c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2656_c2_768c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2656_c2_768c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c2_768c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c2_768c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c2_768c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c2_768c_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2656_c2_768c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2656_c2_768c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2656_c2_768c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2656_c2_768c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2656_c2_768c_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2656_c2_768c]
signal t16_MUX_uxn_opcodes_h_l2656_c2_768c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2656_c2_768c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2656_c2_768c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2656_c2_768c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2661_c11_9053]
signal BIN_OP_EQ_uxn_opcodes_h_l2661_c11_9053_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2661_c11_9053_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2661_c11_9053_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2661_c7_5427]
signal tmp16_MUX_uxn_opcodes_h_l2661_c7_5427_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2661_c7_5427_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2661_c7_5427_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2661_c7_5427_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2661_c7_5427]
signal n16_MUX_uxn_opcodes_h_l2661_c7_5427_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2661_c7_5427_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2661_c7_5427_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2661_c7_5427_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2661_c7_5427]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_5427_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_5427_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_5427_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_5427_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2661_c7_5427]
signal result_u8_value_MUX_uxn_opcodes_h_l2661_c7_5427_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2661_c7_5427_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2661_c7_5427_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2661_c7_5427_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2661_c7_5427]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_5427_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_5427_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_5427_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_5427_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2661_c7_5427]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_5427_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_5427_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_5427_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_5427_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2661_c7_5427]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_5427_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_5427_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_5427_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_5427_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2661_c7_5427]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_5427_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_5427_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_5427_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_5427_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2661_c7_5427]
signal t16_MUX_uxn_opcodes_h_l2661_c7_5427_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2661_c7_5427_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2661_c7_5427_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2661_c7_5427_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2664_c11_af09]
signal BIN_OP_EQ_uxn_opcodes_h_l2664_c11_af09_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2664_c11_af09_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2664_c11_af09_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2664_c7_74cf]
signal tmp16_MUX_uxn_opcodes_h_l2664_c7_74cf_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2664_c7_74cf_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2664_c7_74cf_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2664_c7_74cf_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2664_c7_74cf]
signal n16_MUX_uxn_opcodes_h_l2664_c7_74cf_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2664_c7_74cf_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2664_c7_74cf_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2664_c7_74cf_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2664_c7_74cf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_74cf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_74cf_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_74cf_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_74cf_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2664_c7_74cf]
signal result_u8_value_MUX_uxn_opcodes_h_l2664_c7_74cf_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2664_c7_74cf_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2664_c7_74cf_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2664_c7_74cf_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2664_c7_74cf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2664_c7_74cf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2664_c7_74cf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2664_c7_74cf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2664_c7_74cf_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2664_c7_74cf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_74cf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_74cf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_74cf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_74cf_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2664_c7_74cf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2664_c7_74cf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2664_c7_74cf_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2664_c7_74cf_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2664_c7_74cf_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2664_c7_74cf]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2664_c7_74cf_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2664_c7_74cf_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2664_c7_74cf_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2664_c7_74cf_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2664_c7_74cf]
signal t16_MUX_uxn_opcodes_h_l2664_c7_74cf_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2664_c7_74cf_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2664_c7_74cf_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2664_c7_74cf_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2669_c11_6e27]
signal BIN_OP_EQ_uxn_opcodes_h_l2669_c11_6e27_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2669_c11_6e27_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2669_c11_6e27_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2669_c7_4299]
signal tmp16_MUX_uxn_opcodes_h_l2669_c7_4299_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2669_c7_4299_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2669_c7_4299_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2669_c7_4299_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2669_c7_4299]
signal n16_MUX_uxn_opcodes_h_l2669_c7_4299_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2669_c7_4299_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2669_c7_4299_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2669_c7_4299_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2669_c7_4299]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_4299_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_4299_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_4299_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_4299_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2669_c7_4299]
signal result_u8_value_MUX_uxn_opcodes_h_l2669_c7_4299_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2669_c7_4299_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2669_c7_4299_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2669_c7_4299_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2669_c7_4299]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_4299_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_4299_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_4299_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_4299_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2669_c7_4299]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_4299_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_4299_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_4299_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_4299_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2669_c7_4299]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c7_4299_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c7_4299_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c7_4299_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c7_4299_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2669_c7_4299]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_4299_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_4299_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_4299_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_4299_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2669_c7_4299]
signal t16_MUX_uxn_opcodes_h_l2669_c7_4299_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2669_c7_4299_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2669_c7_4299_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2669_c7_4299_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2672_c11_8ae9]
signal BIN_OP_EQ_uxn_opcodes_h_l2672_c11_8ae9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2672_c11_8ae9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2672_c11_8ae9_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2672_c7_60a4]
signal tmp16_MUX_uxn_opcodes_h_l2672_c7_60a4_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2672_c7_60a4_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2672_c7_60a4_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2672_c7_60a4_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2672_c7_60a4]
signal n16_MUX_uxn_opcodes_h_l2672_c7_60a4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2672_c7_60a4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2672_c7_60a4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2672_c7_60a4_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2672_c7_60a4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2672_c7_60a4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2672_c7_60a4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2672_c7_60a4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2672_c7_60a4_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2672_c7_60a4]
signal result_u8_value_MUX_uxn_opcodes_h_l2672_c7_60a4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2672_c7_60a4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2672_c7_60a4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2672_c7_60a4_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2672_c7_60a4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_60a4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_60a4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_60a4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_60a4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2672_c7_60a4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_60a4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_60a4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_60a4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_60a4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2672_c7_60a4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2672_c7_60a4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2672_c7_60a4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2672_c7_60a4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2672_c7_60a4_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2672_c7_60a4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2672_c7_60a4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2672_c7_60a4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2672_c7_60a4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2672_c7_60a4_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2672_c7_60a4]
signal t16_MUX_uxn_opcodes_h_l2672_c7_60a4_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2672_c7_60a4_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2672_c7_60a4_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2672_c7_60a4_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2673_c3_6bf5]
signal BIN_OP_OR_uxn_opcodes_h_l2673_c3_6bf5_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2673_c3_6bf5_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2673_c3_6bf5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2676_c11_d166]
signal BIN_OP_EQ_uxn_opcodes_h_l2676_c11_d166_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2676_c11_d166_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2676_c11_d166_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2676_c7_ff52]
signal tmp16_MUX_uxn_opcodes_h_l2676_c7_ff52_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2676_c7_ff52_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2676_c7_ff52_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2676_c7_ff52_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2676_c7_ff52]
signal n16_MUX_uxn_opcodes_h_l2676_c7_ff52_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2676_c7_ff52_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2676_c7_ff52_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2676_c7_ff52_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2676_c7_ff52]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_ff52_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_ff52_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_ff52_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_ff52_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2676_c7_ff52]
signal result_u8_value_MUX_uxn_opcodes_h_l2676_c7_ff52_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2676_c7_ff52_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2676_c7_ff52_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2676_c7_ff52_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2676_c7_ff52]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2676_c7_ff52_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2676_c7_ff52_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2676_c7_ff52_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2676_c7_ff52_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2676_c7_ff52]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_ff52_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_ff52_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_ff52_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_ff52_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2676_c7_ff52]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_ff52_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_ff52_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_ff52_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_ff52_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2676_c7_ff52]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_ff52_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_ff52_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_ff52_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_ff52_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2679_c11_f02d]
signal BIN_OP_EQ_uxn_opcodes_h_l2679_c11_f02d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2679_c11_f02d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2679_c11_f02d_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2679_c7_ffed]
signal tmp16_MUX_uxn_opcodes_h_l2679_c7_ffed_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2679_c7_ffed_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2679_c7_ffed_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2679_c7_ffed_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2679_c7_ffed]
signal n16_MUX_uxn_opcodes_h_l2679_c7_ffed_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2679_c7_ffed_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2679_c7_ffed_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2679_c7_ffed_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2679_c7_ffed]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2679_c7_ffed_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2679_c7_ffed_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2679_c7_ffed_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2679_c7_ffed_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2679_c7_ffed]
signal result_u8_value_MUX_uxn_opcodes_h_l2679_c7_ffed_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2679_c7_ffed_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2679_c7_ffed_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2679_c7_ffed_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2679_c7_ffed]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2679_c7_ffed_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2679_c7_ffed_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2679_c7_ffed_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2679_c7_ffed_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2679_c7_ffed]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2679_c7_ffed_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2679_c7_ffed_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2679_c7_ffed_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2679_c7_ffed_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2679_c7_ffed]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2679_c7_ffed_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2679_c7_ffed_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2679_c7_ffed_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2679_c7_ffed_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2679_c7_ffed]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2679_c7_ffed_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2679_c7_ffed_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2679_c7_ffed_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2679_c7_ffed_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2684_c11_f3de]
signal BIN_OP_EQ_uxn_opcodes_h_l2684_c11_f3de_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2684_c11_f3de_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2684_c11_f3de_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2684_c7_7a50]
signal tmp16_MUX_uxn_opcodes_h_l2684_c7_7a50_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2684_c7_7a50_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2684_c7_7a50_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2684_c7_7a50_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2684_c7_7a50]
signal n16_MUX_uxn_opcodes_h_l2684_c7_7a50_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2684_c7_7a50_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2684_c7_7a50_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2684_c7_7a50_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2684_c7_7a50]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2684_c7_7a50_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2684_c7_7a50_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2684_c7_7a50_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2684_c7_7a50_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2684_c7_7a50]
signal result_u8_value_MUX_uxn_opcodes_h_l2684_c7_7a50_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2684_c7_7a50_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2684_c7_7a50_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2684_c7_7a50_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2684_c7_7a50]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2684_c7_7a50_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2684_c7_7a50_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2684_c7_7a50_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2684_c7_7a50_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2684_c7_7a50]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2684_c7_7a50_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2684_c7_7a50_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2684_c7_7a50_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2684_c7_7a50_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2684_c7_7a50]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2684_c7_7a50_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2684_c7_7a50_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2684_c7_7a50_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2684_c7_7a50_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2684_c7_7a50]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2684_c7_7a50_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2684_c7_7a50_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2684_c7_7a50_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2684_c7_7a50_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2687_c11_68ac]
signal BIN_OP_EQ_uxn_opcodes_h_l2687_c11_68ac_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2687_c11_68ac_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2687_c11_68ac_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2687_c7_1873]
signal tmp16_MUX_uxn_opcodes_h_l2687_c7_1873_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2687_c7_1873_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2687_c7_1873_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2687_c7_1873_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2687_c7_1873]
signal n16_MUX_uxn_opcodes_h_l2687_c7_1873_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2687_c7_1873_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2687_c7_1873_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2687_c7_1873_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2687_c7_1873]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2687_c7_1873_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2687_c7_1873_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2687_c7_1873_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2687_c7_1873_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2687_c7_1873]
signal result_u8_value_MUX_uxn_opcodes_h_l2687_c7_1873_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2687_c7_1873_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2687_c7_1873_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2687_c7_1873_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2687_c7_1873]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2687_c7_1873_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2687_c7_1873_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2687_c7_1873_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2687_c7_1873_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2687_c7_1873]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2687_c7_1873_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2687_c7_1873_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2687_c7_1873_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2687_c7_1873_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2687_c7_1873]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2687_c7_1873_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2687_c7_1873_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2687_c7_1873_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2687_c7_1873_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2687_c7_1873]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2687_c7_1873_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2687_c7_1873_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2687_c7_1873_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2687_c7_1873_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2688_c3_97b5]
signal BIN_OP_OR_uxn_opcodes_h_l2688_c3_97b5_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2688_c3_97b5_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2688_c3_97b5_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l2689_c11_0392]
signal BIN_OP_MINUS_uxn_opcodes_h_l2689_c11_0392_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2689_c11_0392_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2689_c11_0392_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2691_c30_e353]
signal sp_relative_shift_uxn_opcodes_h_l2691_c30_e353_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2691_c30_e353_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2691_c30_e353_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2691_c30_e353_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2696_c11_43f8]
signal BIN_OP_EQ_uxn_opcodes_h_l2696_c11_43f8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2696_c11_43f8_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2696_c11_43f8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2696_c7_a7c5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2696_c7_a7c5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2696_c7_a7c5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2696_c7_a7c5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2696_c7_a7c5_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2696_c7_a7c5]
signal result_u8_value_MUX_uxn_opcodes_h_l2696_c7_a7c5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2696_c7_a7c5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2696_c7_a7c5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2696_c7_a7c5_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2696_c7_a7c5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2696_c7_a7c5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2696_c7_a7c5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2696_c7_a7c5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2696_c7_a7c5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2696_c7_a7c5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2696_c7_a7c5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2696_c7_a7c5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2696_c7_a7c5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2696_c7_a7c5_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2696_c7_a7c5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2696_c7_a7c5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2696_c7_a7c5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2696_c7_a7c5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2696_c7_a7c5_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2699_c31_e0db]
signal CONST_SR_8_uxn_opcodes_h_l2699_c31_e0db_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2699_c31_e0db_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2701_c11_0ebe]
signal BIN_OP_EQ_uxn_opcodes_h_l2701_c11_0ebe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2701_c11_0ebe_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2701_c11_0ebe_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2701_c7_fee0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_fee0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_fee0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_fee0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_fee0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2701_c7_fee0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_fee0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_fee0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_fee0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_fee0_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2681_l2666_DUPLICATE_d39a
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2681_l2666_DUPLICATE_d39a_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2681_l2666_DUPLICATE_d39a_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_3345( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_sp_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2656_c6_dc6e
BIN_OP_EQ_uxn_opcodes_h_l2656_c6_dc6e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2656_c6_dc6e_left,
BIN_OP_EQ_uxn_opcodes_h_l2656_c6_dc6e_right,
BIN_OP_EQ_uxn_opcodes_h_l2656_c6_dc6e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2656_c2_768c
tmp16_MUX_uxn_opcodes_h_l2656_c2_768c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2656_c2_768c_cond,
tmp16_MUX_uxn_opcodes_h_l2656_c2_768c_iftrue,
tmp16_MUX_uxn_opcodes_h_l2656_c2_768c_iffalse,
tmp16_MUX_uxn_opcodes_h_l2656_c2_768c_return_output);

-- n16_MUX_uxn_opcodes_h_l2656_c2_768c
n16_MUX_uxn_opcodes_h_l2656_c2_768c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2656_c2_768c_cond,
n16_MUX_uxn_opcodes_h_l2656_c2_768c_iftrue,
n16_MUX_uxn_opcodes_h_l2656_c2_768c_iffalse,
n16_MUX_uxn_opcodes_h_l2656_c2_768c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c2_768c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c2_768c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c2_768c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c2_768c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c2_768c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c2_768c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2656_c2_768c
result_u8_value_MUX_uxn_opcodes_h_l2656_c2_768c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2656_c2_768c_cond,
result_u8_value_MUX_uxn_opcodes_h_l2656_c2_768c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2656_c2_768c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2656_c2_768c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2656_c2_768c
result_is_stack_write_MUX_uxn_opcodes_h_l2656_c2_768c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2656_c2_768c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2656_c2_768c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2656_c2_768c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2656_c2_768c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2656_c2_768c
result_is_opc_done_MUX_uxn_opcodes_h_l2656_c2_768c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2656_c2_768c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2656_c2_768c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2656_c2_768c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2656_c2_768c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c2_768c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c2_768c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c2_768c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c2_768c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c2_768c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c2_768c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2656_c2_768c
result_is_sp_shift_MUX_uxn_opcodes_h_l2656_c2_768c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2656_c2_768c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2656_c2_768c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2656_c2_768c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2656_c2_768c_return_output);

-- t16_MUX_uxn_opcodes_h_l2656_c2_768c
t16_MUX_uxn_opcodes_h_l2656_c2_768c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2656_c2_768c_cond,
t16_MUX_uxn_opcodes_h_l2656_c2_768c_iftrue,
t16_MUX_uxn_opcodes_h_l2656_c2_768c_iffalse,
t16_MUX_uxn_opcodes_h_l2656_c2_768c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2661_c11_9053
BIN_OP_EQ_uxn_opcodes_h_l2661_c11_9053 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2661_c11_9053_left,
BIN_OP_EQ_uxn_opcodes_h_l2661_c11_9053_right,
BIN_OP_EQ_uxn_opcodes_h_l2661_c11_9053_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2661_c7_5427
tmp16_MUX_uxn_opcodes_h_l2661_c7_5427 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2661_c7_5427_cond,
tmp16_MUX_uxn_opcodes_h_l2661_c7_5427_iftrue,
tmp16_MUX_uxn_opcodes_h_l2661_c7_5427_iffalse,
tmp16_MUX_uxn_opcodes_h_l2661_c7_5427_return_output);

-- n16_MUX_uxn_opcodes_h_l2661_c7_5427
n16_MUX_uxn_opcodes_h_l2661_c7_5427 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2661_c7_5427_cond,
n16_MUX_uxn_opcodes_h_l2661_c7_5427_iftrue,
n16_MUX_uxn_opcodes_h_l2661_c7_5427_iffalse,
n16_MUX_uxn_opcodes_h_l2661_c7_5427_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_5427
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_5427 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_5427_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_5427_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_5427_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_5427_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2661_c7_5427
result_u8_value_MUX_uxn_opcodes_h_l2661_c7_5427 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2661_c7_5427_cond,
result_u8_value_MUX_uxn_opcodes_h_l2661_c7_5427_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2661_c7_5427_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2661_c7_5427_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_5427
result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_5427 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_5427_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_5427_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_5427_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_5427_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_5427
result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_5427 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_5427_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_5427_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_5427_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_5427_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_5427
result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_5427 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_5427_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_5427_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_5427_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_5427_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_5427
result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_5427 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_5427_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_5427_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_5427_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_5427_return_output);

-- t16_MUX_uxn_opcodes_h_l2661_c7_5427
t16_MUX_uxn_opcodes_h_l2661_c7_5427 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2661_c7_5427_cond,
t16_MUX_uxn_opcodes_h_l2661_c7_5427_iftrue,
t16_MUX_uxn_opcodes_h_l2661_c7_5427_iffalse,
t16_MUX_uxn_opcodes_h_l2661_c7_5427_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2664_c11_af09
BIN_OP_EQ_uxn_opcodes_h_l2664_c11_af09 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2664_c11_af09_left,
BIN_OP_EQ_uxn_opcodes_h_l2664_c11_af09_right,
BIN_OP_EQ_uxn_opcodes_h_l2664_c11_af09_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2664_c7_74cf
tmp16_MUX_uxn_opcodes_h_l2664_c7_74cf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2664_c7_74cf_cond,
tmp16_MUX_uxn_opcodes_h_l2664_c7_74cf_iftrue,
tmp16_MUX_uxn_opcodes_h_l2664_c7_74cf_iffalse,
tmp16_MUX_uxn_opcodes_h_l2664_c7_74cf_return_output);

-- n16_MUX_uxn_opcodes_h_l2664_c7_74cf
n16_MUX_uxn_opcodes_h_l2664_c7_74cf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2664_c7_74cf_cond,
n16_MUX_uxn_opcodes_h_l2664_c7_74cf_iftrue,
n16_MUX_uxn_opcodes_h_l2664_c7_74cf_iffalse,
n16_MUX_uxn_opcodes_h_l2664_c7_74cf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_74cf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_74cf : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_74cf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_74cf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_74cf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_74cf_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2664_c7_74cf
result_u8_value_MUX_uxn_opcodes_h_l2664_c7_74cf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2664_c7_74cf_cond,
result_u8_value_MUX_uxn_opcodes_h_l2664_c7_74cf_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2664_c7_74cf_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2664_c7_74cf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2664_c7_74cf
result_is_stack_write_MUX_uxn_opcodes_h_l2664_c7_74cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2664_c7_74cf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2664_c7_74cf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2664_c7_74cf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2664_c7_74cf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_74cf
result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_74cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_74cf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_74cf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_74cf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_74cf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2664_c7_74cf
result_sp_relative_shift_MUX_uxn_opcodes_h_l2664_c7_74cf : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2664_c7_74cf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2664_c7_74cf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2664_c7_74cf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2664_c7_74cf_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2664_c7_74cf
result_is_sp_shift_MUX_uxn_opcodes_h_l2664_c7_74cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2664_c7_74cf_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2664_c7_74cf_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2664_c7_74cf_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2664_c7_74cf_return_output);

-- t16_MUX_uxn_opcodes_h_l2664_c7_74cf
t16_MUX_uxn_opcodes_h_l2664_c7_74cf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2664_c7_74cf_cond,
t16_MUX_uxn_opcodes_h_l2664_c7_74cf_iftrue,
t16_MUX_uxn_opcodes_h_l2664_c7_74cf_iffalse,
t16_MUX_uxn_opcodes_h_l2664_c7_74cf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2669_c11_6e27
BIN_OP_EQ_uxn_opcodes_h_l2669_c11_6e27 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2669_c11_6e27_left,
BIN_OP_EQ_uxn_opcodes_h_l2669_c11_6e27_right,
BIN_OP_EQ_uxn_opcodes_h_l2669_c11_6e27_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2669_c7_4299
tmp16_MUX_uxn_opcodes_h_l2669_c7_4299 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2669_c7_4299_cond,
tmp16_MUX_uxn_opcodes_h_l2669_c7_4299_iftrue,
tmp16_MUX_uxn_opcodes_h_l2669_c7_4299_iffalse,
tmp16_MUX_uxn_opcodes_h_l2669_c7_4299_return_output);

-- n16_MUX_uxn_opcodes_h_l2669_c7_4299
n16_MUX_uxn_opcodes_h_l2669_c7_4299 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2669_c7_4299_cond,
n16_MUX_uxn_opcodes_h_l2669_c7_4299_iftrue,
n16_MUX_uxn_opcodes_h_l2669_c7_4299_iffalse,
n16_MUX_uxn_opcodes_h_l2669_c7_4299_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_4299
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_4299 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_4299_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_4299_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_4299_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_4299_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2669_c7_4299
result_u8_value_MUX_uxn_opcodes_h_l2669_c7_4299 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2669_c7_4299_cond,
result_u8_value_MUX_uxn_opcodes_h_l2669_c7_4299_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2669_c7_4299_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2669_c7_4299_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_4299
result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_4299 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_4299_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_4299_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_4299_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_4299_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_4299
result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_4299 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_4299_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_4299_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_4299_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_4299_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c7_4299
result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c7_4299 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c7_4299_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c7_4299_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c7_4299_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c7_4299_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_4299
result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_4299 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_4299_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_4299_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_4299_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_4299_return_output);

-- t16_MUX_uxn_opcodes_h_l2669_c7_4299
t16_MUX_uxn_opcodes_h_l2669_c7_4299 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2669_c7_4299_cond,
t16_MUX_uxn_opcodes_h_l2669_c7_4299_iftrue,
t16_MUX_uxn_opcodes_h_l2669_c7_4299_iffalse,
t16_MUX_uxn_opcodes_h_l2669_c7_4299_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2672_c11_8ae9
BIN_OP_EQ_uxn_opcodes_h_l2672_c11_8ae9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2672_c11_8ae9_left,
BIN_OP_EQ_uxn_opcodes_h_l2672_c11_8ae9_right,
BIN_OP_EQ_uxn_opcodes_h_l2672_c11_8ae9_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2672_c7_60a4
tmp16_MUX_uxn_opcodes_h_l2672_c7_60a4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2672_c7_60a4_cond,
tmp16_MUX_uxn_opcodes_h_l2672_c7_60a4_iftrue,
tmp16_MUX_uxn_opcodes_h_l2672_c7_60a4_iffalse,
tmp16_MUX_uxn_opcodes_h_l2672_c7_60a4_return_output);

-- n16_MUX_uxn_opcodes_h_l2672_c7_60a4
n16_MUX_uxn_opcodes_h_l2672_c7_60a4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2672_c7_60a4_cond,
n16_MUX_uxn_opcodes_h_l2672_c7_60a4_iftrue,
n16_MUX_uxn_opcodes_h_l2672_c7_60a4_iffalse,
n16_MUX_uxn_opcodes_h_l2672_c7_60a4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2672_c7_60a4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2672_c7_60a4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2672_c7_60a4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2672_c7_60a4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2672_c7_60a4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2672_c7_60a4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2672_c7_60a4
result_u8_value_MUX_uxn_opcodes_h_l2672_c7_60a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2672_c7_60a4_cond,
result_u8_value_MUX_uxn_opcodes_h_l2672_c7_60a4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2672_c7_60a4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2672_c7_60a4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_60a4
result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_60a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_60a4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_60a4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_60a4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_60a4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_60a4
result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_60a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_60a4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_60a4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_60a4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_60a4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2672_c7_60a4
result_sp_relative_shift_MUX_uxn_opcodes_h_l2672_c7_60a4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2672_c7_60a4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2672_c7_60a4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2672_c7_60a4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2672_c7_60a4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2672_c7_60a4
result_is_sp_shift_MUX_uxn_opcodes_h_l2672_c7_60a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2672_c7_60a4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2672_c7_60a4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2672_c7_60a4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2672_c7_60a4_return_output);

-- t16_MUX_uxn_opcodes_h_l2672_c7_60a4
t16_MUX_uxn_opcodes_h_l2672_c7_60a4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2672_c7_60a4_cond,
t16_MUX_uxn_opcodes_h_l2672_c7_60a4_iftrue,
t16_MUX_uxn_opcodes_h_l2672_c7_60a4_iffalse,
t16_MUX_uxn_opcodes_h_l2672_c7_60a4_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2673_c3_6bf5
BIN_OP_OR_uxn_opcodes_h_l2673_c3_6bf5 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2673_c3_6bf5_left,
BIN_OP_OR_uxn_opcodes_h_l2673_c3_6bf5_right,
BIN_OP_OR_uxn_opcodes_h_l2673_c3_6bf5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2676_c11_d166
BIN_OP_EQ_uxn_opcodes_h_l2676_c11_d166 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2676_c11_d166_left,
BIN_OP_EQ_uxn_opcodes_h_l2676_c11_d166_right,
BIN_OP_EQ_uxn_opcodes_h_l2676_c11_d166_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2676_c7_ff52
tmp16_MUX_uxn_opcodes_h_l2676_c7_ff52 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2676_c7_ff52_cond,
tmp16_MUX_uxn_opcodes_h_l2676_c7_ff52_iftrue,
tmp16_MUX_uxn_opcodes_h_l2676_c7_ff52_iffalse,
tmp16_MUX_uxn_opcodes_h_l2676_c7_ff52_return_output);

-- n16_MUX_uxn_opcodes_h_l2676_c7_ff52
n16_MUX_uxn_opcodes_h_l2676_c7_ff52 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2676_c7_ff52_cond,
n16_MUX_uxn_opcodes_h_l2676_c7_ff52_iftrue,
n16_MUX_uxn_opcodes_h_l2676_c7_ff52_iffalse,
n16_MUX_uxn_opcodes_h_l2676_c7_ff52_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_ff52
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_ff52 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_ff52_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_ff52_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_ff52_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_ff52_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2676_c7_ff52
result_u8_value_MUX_uxn_opcodes_h_l2676_c7_ff52 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2676_c7_ff52_cond,
result_u8_value_MUX_uxn_opcodes_h_l2676_c7_ff52_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2676_c7_ff52_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2676_c7_ff52_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2676_c7_ff52
result_is_stack_write_MUX_uxn_opcodes_h_l2676_c7_ff52 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2676_c7_ff52_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2676_c7_ff52_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2676_c7_ff52_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2676_c7_ff52_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_ff52
result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_ff52 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_ff52_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_ff52_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_ff52_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_ff52_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_ff52
result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_ff52 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_ff52_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_ff52_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_ff52_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_ff52_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_ff52
result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_ff52 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_ff52_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_ff52_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_ff52_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_ff52_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2679_c11_f02d
BIN_OP_EQ_uxn_opcodes_h_l2679_c11_f02d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2679_c11_f02d_left,
BIN_OP_EQ_uxn_opcodes_h_l2679_c11_f02d_right,
BIN_OP_EQ_uxn_opcodes_h_l2679_c11_f02d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2679_c7_ffed
tmp16_MUX_uxn_opcodes_h_l2679_c7_ffed : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2679_c7_ffed_cond,
tmp16_MUX_uxn_opcodes_h_l2679_c7_ffed_iftrue,
tmp16_MUX_uxn_opcodes_h_l2679_c7_ffed_iffalse,
tmp16_MUX_uxn_opcodes_h_l2679_c7_ffed_return_output);

-- n16_MUX_uxn_opcodes_h_l2679_c7_ffed
n16_MUX_uxn_opcodes_h_l2679_c7_ffed : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2679_c7_ffed_cond,
n16_MUX_uxn_opcodes_h_l2679_c7_ffed_iftrue,
n16_MUX_uxn_opcodes_h_l2679_c7_ffed_iffalse,
n16_MUX_uxn_opcodes_h_l2679_c7_ffed_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2679_c7_ffed
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2679_c7_ffed : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2679_c7_ffed_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2679_c7_ffed_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2679_c7_ffed_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2679_c7_ffed_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2679_c7_ffed
result_u8_value_MUX_uxn_opcodes_h_l2679_c7_ffed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2679_c7_ffed_cond,
result_u8_value_MUX_uxn_opcodes_h_l2679_c7_ffed_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2679_c7_ffed_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2679_c7_ffed_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2679_c7_ffed
result_is_stack_write_MUX_uxn_opcodes_h_l2679_c7_ffed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2679_c7_ffed_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2679_c7_ffed_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2679_c7_ffed_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2679_c7_ffed_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2679_c7_ffed
result_is_opc_done_MUX_uxn_opcodes_h_l2679_c7_ffed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2679_c7_ffed_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2679_c7_ffed_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2679_c7_ffed_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2679_c7_ffed_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2679_c7_ffed
result_sp_relative_shift_MUX_uxn_opcodes_h_l2679_c7_ffed : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2679_c7_ffed_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2679_c7_ffed_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2679_c7_ffed_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2679_c7_ffed_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2679_c7_ffed
result_is_sp_shift_MUX_uxn_opcodes_h_l2679_c7_ffed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2679_c7_ffed_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2679_c7_ffed_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2679_c7_ffed_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2679_c7_ffed_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2684_c11_f3de
BIN_OP_EQ_uxn_opcodes_h_l2684_c11_f3de : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2684_c11_f3de_left,
BIN_OP_EQ_uxn_opcodes_h_l2684_c11_f3de_right,
BIN_OP_EQ_uxn_opcodes_h_l2684_c11_f3de_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2684_c7_7a50
tmp16_MUX_uxn_opcodes_h_l2684_c7_7a50 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2684_c7_7a50_cond,
tmp16_MUX_uxn_opcodes_h_l2684_c7_7a50_iftrue,
tmp16_MUX_uxn_opcodes_h_l2684_c7_7a50_iffalse,
tmp16_MUX_uxn_opcodes_h_l2684_c7_7a50_return_output);

-- n16_MUX_uxn_opcodes_h_l2684_c7_7a50
n16_MUX_uxn_opcodes_h_l2684_c7_7a50 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2684_c7_7a50_cond,
n16_MUX_uxn_opcodes_h_l2684_c7_7a50_iftrue,
n16_MUX_uxn_opcodes_h_l2684_c7_7a50_iffalse,
n16_MUX_uxn_opcodes_h_l2684_c7_7a50_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2684_c7_7a50
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2684_c7_7a50 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2684_c7_7a50_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2684_c7_7a50_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2684_c7_7a50_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2684_c7_7a50_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2684_c7_7a50
result_u8_value_MUX_uxn_opcodes_h_l2684_c7_7a50 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2684_c7_7a50_cond,
result_u8_value_MUX_uxn_opcodes_h_l2684_c7_7a50_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2684_c7_7a50_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2684_c7_7a50_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2684_c7_7a50
result_is_stack_write_MUX_uxn_opcodes_h_l2684_c7_7a50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2684_c7_7a50_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2684_c7_7a50_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2684_c7_7a50_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2684_c7_7a50_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2684_c7_7a50
result_is_opc_done_MUX_uxn_opcodes_h_l2684_c7_7a50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2684_c7_7a50_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2684_c7_7a50_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2684_c7_7a50_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2684_c7_7a50_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2684_c7_7a50
result_sp_relative_shift_MUX_uxn_opcodes_h_l2684_c7_7a50 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2684_c7_7a50_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2684_c7_7a50_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2684_c7_7a50_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2684_c7_7a50_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2684_c7_7a50
result_is_sp_shift_MUX_uxn_opcodes_h_l2684_c7_7a50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2684_c7_7a50_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2684_c7_7a50_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2684_c7_7a50_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2684_c7_7a50_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2687_c11_68ac
BIN_OP_EQ_uxn_opcodes_h_l2687_c11_68ac : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2687_c11_68ac_left,
BIN_OP_EQ_uxn_opcodes_h_l2687_c11_68ac_right,
BIN_OP_EQ_uxn_opcodes_h_l2687_c11_68ac_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2687_c7_1873
tmp16_MUX_uxn_opcodes_h_l2687_c7_1873 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2687_c7_1873_cond,
tmp16_MUX_uxn_opcodes_h_l2687_c7_1873_iftrue,
tmp16_MUX_uxn_opcodes_h_l2687_c7_1873_iffalse,
tmp16_MUX_uxn_opcodes_h_l2687_c7_1873_return_output);

-- n16_MUX_uxn_opcodes_h_l2687_c7_1873
n16_MUX_uxn_opcodes_h_l2687_c7_1873 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2687_c7_1873_cond,
n16_MUX_uxn_opcodes_h_l2687_c7_1873_iftrue,
n16_MUX_uxn_opcodes_h_l2687_c7_1873_iffalse,
n16_MUX_uxn_opcodes_h_l2687_c7_1873_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2687_c7_1873
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2687_c7_1873 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2687_c7_1873_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2687_c7_1873_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2687_c7_1873_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2687_c7_1873_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2687_c7_1873
result_u8_value_MUX_uxn_opcodes_h_l2687_c7_1873 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2687_c7_1873_cond,
result_u8_value_MUX_uxn_opcodes_h_l2687_c7_1873_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2687_c7_1873_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2687_c7_1873_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2687_c7_1873
result_is_stack_write_MUX_uxn_opcodes_h_l2687_c7_1873 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2687_c7_1873_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2687_c7_1873_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2687_c7_1873_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2687_c7_1873_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2687_c7_1873
result_is_opc_done_MUX_uxn_opcodes_h_l2687_c7_1873 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2687_c7_1873_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2687_c7_1873_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2687_c7_1873_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2687_c7_1873_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2687_c7_1873
result_sp_relative_shift_MUX_uxn_opcodes_h_l2687_c7_1873 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2687_c7_1873_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2687_c7_1873_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2687_c7_1873_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2687_c7_1873_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2687_c7_1873
result_is_sp_shift_MUX_uxn_opcodes_h_l2687_c7_1873 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2687_c7_1873_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2687_c7_1873_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2687_c7_1873_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2687_c7_1873_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2688_c3_97b5
BIN_OP_OR_uxn_opcodes_h_l2688_c3_97b5 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2688_c3_97b5_left,
BIN_OP_OR_uxn_opcodes_h_l2688_c3_97b5_right,
BIN_OP_OR_uxn_opcodes_h_l2688_c3_97b5_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l2689_c11_0392
BIN_OP_MINUS_uxn_opcodes_h_l2689_c11_0392 : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l2689_c11_0392_left,
BIN_OP_MINUS_uxn_opcodes_h_l2689_c11_0392_right,
BIN_OP_MINUS_uxn_opcodes_h_l2689_c11_0392_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2691_c30_e353
sp_relative_shift_uxn_opcodes_h_l2691_c30_e353 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2691_c30_e353_ins,
sp_relative_shift_uxn_opcodes_h_l2691_c30_e353_x,
sp_relative_shift_uxn_opcodes_h_l2691_c30_e353_y,
sp_relative_shift_uxn_opcodes_h_l2691_c30_e353_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2696_c11_43f8
BIN_OP_EQ_uxn_opcodes_h_l2696_c11_43f8 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2696_c11_43f8_left,
BIN_OP_EQ_uxn_opcodes_h_l2696_c11_43f8_right,
BIN_OP_EQ_uxn_opcodes_h_l2696_c11_43f8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2696_c7_a7c5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2696_c7_a7c5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2696_c7_a7c5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2696_c7_a7c5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2696_c7_a7c5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2696_c7_a7c5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2696_c7_a7c5
result_u8_value_MUX_uxn_opcodes_h_l2696_c7_a7c5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2696_c7_a7c5_cond,
result_u8_value_MUX_uxn_opcodes_h_l2696_c7_a7c5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2696_c7_a7c5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2696_c7_a7c5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2696_c7_a7c5
result_is_stack_write_MUX_uxn_opcodes_h_l2696_c7_a7c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2696_c7_a7c5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2696_c7_a7c5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2696_c7_a7c5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2696_c7_a7c5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2696_c7_a7c5
result_is_opc_done_MUX_uxn_opcodes_h_l2696_c7_a7c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2696_c7_a7c5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2696_c7_a7c5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2696_c7_a7c5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2696_c7_a7c5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2696_c7_a7c5
result_is_sp_shift_MUX_uxn_opcodes_h_l2696_c7_a7c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2696_c7_a7c5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2696_c7_a7c5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2696_c7_a7c5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2696_c7_a7c5_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2699_c31_e0db
CONST_SR_8_uxn_opcodes_h_l2699_c31_e0db : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2699_c31_e0db_x,
CONST_SR_8_uxn_opcodes_h_l2699_c31_e0db_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2701_c11_0ebe
BIN_OP_EQ_uxn_opcodes_h_l2701_c11_0ebe : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2701_c11_0ebe_left,
BIN_OP_EQ_uxn_opcodes_h_l2701_c11_0ebe_right,
BIN_OP_EQ_uxn_opcodes_h_l2701_c11_0ebe_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_fee0
result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_fee0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_fee0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_fee0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_fee0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_fee0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_fee0
result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_fee0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_fee0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_fee0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_fee0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_fee0_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2681_l2666_DUPLICATE_d39a
CONST_SL_8_uint16_t_uxn_opcodes_h_l2681_l2666_DUPLICATE_d39a : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2681_l2666_DUPLICATE_d39a_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2681_l2666_DUPLICATE_d39a_return_output);



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
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2656_c6_dc6e_return_output,
 tmp16_MUX_uxn_opcodes_h_l2656_c2_768c_return_output,
 n16_MUX_uxn_opcodes_h_l2656_c2_768c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c2_768c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2656_c2_768c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2656_c2_768c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2656_c2_768c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c2_768c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2656_c2_768c_return_output,
 t16_MUX_uxn_opcodes_h_l2656_c2_768c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2661_c11_9053_return_output,
 tmp16_MUX_uxn_opcodes_h_l2661_c7_5427_return_output,
 n16_MUX_uxn_opcodes_h_l2661_c7_5427_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_5427_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2661_c7_5427_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_5427_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_5427_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_5427_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_5427_return_output,
 t16_MUX_uxn_opcodes_h_l2661_c7_5427_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2664_c11_af09_return_output,
 tmp16_MUX_uxn_opcodes_h_l2664_c7_74cf_return_output,
 n16_MUX_uxn_opcodes_h_l2664_c7_74cf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_74cf_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2664_c7_74cf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2664_c7_74cf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_74cf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2664_c7_74cf_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2664_c7_74cf_return_output,
 t16_MUX_uxn_opcodes_h_l2664_c7_74cf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2669_c11_6e27_return_output,
 tmp16_MUX_uxn_opcodes_h_l2669_c7_4299_return_output,
 n16_MUX_uxn_opcodes_h_l2669_c7_4299_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_4299_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2669_c7_4299_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_4299_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_4299_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c7_4299_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_4299_return_output,
 t16_MUX_uxn_opcodes_h_l2669_c7_4299_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2672_c11_8ae9_return_output,
 tmp16_MUX_uxn_opcodes_h_l2672_c7_60a4_return_output,
 n16_MUX_uxn_opcodes_h_l2672_c7_60a4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2672_c7_60a4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2672_c7_60a4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_60a4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_60a4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2672_c7_60a4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2672_c7_60a4_return_output,
 t16_MUX_uxn_opcodes_h_l2672_c7_60a4_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2673_c3_6bf5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2676_c11_d166_return_output,
 tmp16_MUX_uxn_opcodes_h_l2676_c7_ff52_return_output,
 n16_MUX_uxn_opcodes_h_l2676_c7_ff52_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_ff52_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2676_c7_ff52_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2676_c7_ff52_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_ff52_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_ff52_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_ff52_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2679_c11_f02d_return_output,
 tmp16_MUX_uxn_opcodes_h_l2679_c7_ffed_return_output,
 n16_MUX_uxn_opcodes_h_l2679_c7_ffed_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2679_c7_ffed_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2679_c7_ffed_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2679_c7_ffed_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2679_c7_ffed_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2679_c7_ffed_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2679_c7_ffed_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2684_c11_f3de_return_output,
 tmp16_MUX_uxn_opcodes_h_l2684_c7_7a50_return_output,
 n16_MUX_uxn_opcodes_h_l2684_c7_7a50_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2684_c7_7a50_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2684_c7_7a50_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2684_c7_7a50_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2684_c7_7a50_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2684_c7_7a50_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2684_c7_7a50_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2687_c11_68ac_return_output,
 tmp16_MUX_uxn_opcodes_h_l2687_c7_1873_return_output,
 n16_MUX_uxn_opcodes_h_l2687_c7_1873_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2687_c7_1873_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2687_c7_1873_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2687_c7_1873_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2687_c7_1873_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2687_c7_1873_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2687_c7_1873_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2688_c3_97b5_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l2689_c11_0392_return_output,
 sp_relative_shift_uxn_opcodes_h_l2691_c30_e353_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2696_c11_43f8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2696_c7_a7c5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2696_c7_a7c5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2696_c7_a7c5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2696_c7_a7c5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2696_c7_a7c5_return_output,
 CONST_SR_8_uxn_opcodes_h_l2699_c31_e0db_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2701_c11_0ebe_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_fee0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_fee0_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2681_l2666_DUPLICATE_d39a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2656_c6_dc6e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2656_c6_dc6e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2656_c6_dc6e_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2656_c2_768c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2656_c2_768c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2661_c7_5427_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2656_c2_768c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2656_c2_768c_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2656_c2_768c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2656_c2_768c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2661_c7_5427_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2656_c2_768c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2656_c2_768c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c2_768c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2658_c3_f12f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c2_768c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_5427_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c2_768c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c2_768c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2656_c2_768c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2656_c2_768c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_5427_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2656_c2_768c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2656_c2_768c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2656_c2_768c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2656_c2_768c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_5427_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2656_c2_768c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2656_c2_768c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2656_c2_768c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2656_c2_768c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_5427_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2656_c2_768c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2656_c2_768c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c2_768c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c2_768c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_5427_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c2_768c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c2_768c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2656_c2_768c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2656_c2_768c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_5427_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2656_c2_768c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2656_c2_768c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2656_c2_768c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2656_c2_768c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2661_c7_5427_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2656_c2_768c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2656_c2_768c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_9053_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_9053_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_9053_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2661_c7_5427_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2661_c7_5427_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2664_c7_74cf_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2661_c7_5427_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2661_c7_5427_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2661_c7_5427_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2664_c7_74cf_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2661_c7_5427_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_5427_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2662_c3_7782 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_5427_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_74cf_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_5427_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_5427_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_5427_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2664_c7_74cf_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_5427_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_5427_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_5427_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2664_c7_74cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_5427_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_5427_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_5427_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_74cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_5427_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_5427_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_5427_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2664_c7_74cf_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_5427_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_5427_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_5427_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2664_c7_74cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_5427_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2661_c7_5427_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2661_c7_5427_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2664_c7_74cf_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2661_c7_5427_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2664_c11_af09_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2664_c11_af09_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2664_c11_af09_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2664_c7_74cf_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2664_c7_74cf_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2669_c7_4299_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2664_c7_74cf_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2664_c7_74cf_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2664_c7_74cf_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2669_c7_4299_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2664_c7_74cf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_74cf_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2667_c3_57ff : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_74cf_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_4299_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_74cf_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2664_c7_74cf_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2664_c7_74cf_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2669_c7_4299_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2664_c7_74cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2664_c7_74cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2664_c7_74cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_4299_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2664_c7_74cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_74cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_74cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_4299_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_74cf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2664_c7_74cf_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2664_c7_74cf_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c7_4299_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2664_c7_74cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2664_c7_74cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2664_c7_74cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_4299_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2664_c7_74cf_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2664_c7_74cf_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2664_c7_74cf_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2669_c7_4299_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2664_c7_74cf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c11_6e27_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c11_6e27_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c11_6e27_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2669_c7_4299_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2669_c7_4299_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2672_c7_60a4_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2669_c7_4299_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2669_c7_4299_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2669_c7_4299_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2672_c7_60a4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2669_c7_4299_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_4299_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2670_c3_43c0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_4299_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2672_c7_60a4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_4299_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2669_c7_4299_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2669_c7_4299_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2672_c7_60a4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2669_c7_4299_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_4299_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_4299_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_60a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_4299_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_4299_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_4299_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_60a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_4299_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c7_4299_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c7_4299_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2672_c7_60a4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c7_4299_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_4299_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_4299_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2672_c7_60a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_4299_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2669_c7_4299_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2669_c7_4299_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2672_c7_60a4_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2669_c7_4299_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2672_c11_8ae9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2672_c11_8ae9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2672_c11_8ae9_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2672_c7_60a4_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2672_c7_60a4_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2676_c7_ff52_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2672_c7_60a4_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2672_c7_60a4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2672_c7_60a4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2676_c7_ff52_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2672_c7_60a4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2672_c7_60a4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2674_c3_141e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2672_c7_60a4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_ff52_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2672_c7_60a4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2672_c7_60a4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2672_c7_60a4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2676_c7_ff52_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2672_c7_60a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_60a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_60a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2676_c7_ff52_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_60a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_60a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_60a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_ff52_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_60a4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2672_c7_60a4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2672_c7_60a4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_ff52_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2672_c7_60a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2672_c7_60a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2672_c7_60a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_ff52_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2672_c7_60a4_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2672_c7_60a4_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2672_c7_60a4_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2672_c7_60a4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2673_c3_6bf5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2673_c3_6bf5_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2673_c3_6bf5_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2676_c11_d166_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2676_c11_d166_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2676_c11_d166_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2676_c7_ff52_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2676_c7_ff52_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2679_c7_ffed_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2676_c7_ff52_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2676_c7_ff52_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2676_c7_ff52_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2679_c7_ffed_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2676_c7_ff52_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_ff52_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2677_c3_2e9d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_ff52_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2679_c7_ffed_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_ff52_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2676_c7_ff52_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2676_c7_ff52_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2679_c7_ffed_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2676_c7_ff52_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2676_c7_ff52_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2676_c7_ff52_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2679_c7_ffed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2676_c7_ff52_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_ff52_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_ff52_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2679_c7_ffed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_ff52_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_ff52_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_ff52_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2679_c7_ffed_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_ff52_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_ff52_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_ff52_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2679_c7_ffed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_ff52_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2679_c11_f02d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2679_c11_f02d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2679_c11_f02d_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2679_c7_ffed_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2679_c7_ffed_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2684_c7_7a50_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2679_c7_ffed_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2679_c7_ffed_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2679_c7_ffed_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2684_c7_7a50_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2679_c7_ffed_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2679_c7_ffed_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2682_c3_62ac : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2679_c7_ffed_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2684_c7_7a50_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2679_c7_ffed_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2679_c7_ffed_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2679_c7_ffed_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2684_c7_7a50_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2679_c7_ffed_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2679_c7_ffed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2679_c7_ffed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2684_c7_7a50_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2679_c7_ffed_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2679_c7_ffed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2679_c7_ffed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2684_c7_7a50_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2679_c7_ffed_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2679_c7_ffed_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2679_c7_ffed_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2684_c7_7a50_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2679_c7_ffed_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2679_c7_ffed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2679_c7_ffed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2684_c7_7a50_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2679_c7_ffed_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2684_c11_f3de_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2684_c11_f3de_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2684_c11_f3de_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2684_c7_7a50_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2684_c7_7a50_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2687_c7_1873_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2684_c7_7a50_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2684_c7_7a50_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2684_c7_7a50_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2687_c7_1873_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2684_c7_7a50_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2684_c7_7a50_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2685_c3_cb7b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2684_c7_7a50_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2687_c7_1873_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2684_c7_7a50_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2684_c7_7a50_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2684_c7_7a50_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2687_c7_1873_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2684_c7_7a50_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2684_c7_7a50_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2684_c7_7a50_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2687_c7_1873_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2684_c7_7a50_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2684_c7_7a50_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2684_c7_7a50_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2687_c7_1873_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2684_c7_7a50_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2684_c7_7a50_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2684_c7_7a50_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2687_c7_1873_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2684_c7_7a50_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2684_c7_7a50_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2684_c7_7a50_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2687_c7_1873_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2684_c7_7a50_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2687_c11_68ac_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2687_c11_68ac_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2687_c11_68ac_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2687_c7_1873_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2687_c7_1873_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2687_c7_1873_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2687_c7_1873_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2687_c7_1873_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2687_c7_1873_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2687_c7_1873_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2693_c3_070d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2687_c7_1873_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2696_c7_a7c5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2687_c7_1873_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2687_c7_1873_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2687_c7_1873_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2696_c7_a7c5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2687_c7_1873_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2687_c7_1873_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2687_c7_1873_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2696_c7_a7c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2687_c7_1873_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2687_c7_1873_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2687_c7_1873_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2696_c7_a7c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2687_c7_1873_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2687_c7_1873_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2687_c7_1873_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2687_c7_1873_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2687_c7_1873_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2687_c7_1873_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2696_c7_a7c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2687_c7_1873_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2688_c3_97b5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2688_c3_97b5_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2688_c3_97b5_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2689_c11_0392_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2689_c11_0392_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2689_c11_0392_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2691_c30_e353_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2691_c30_e353_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2691_c30_e353_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2691_c30_e353_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2694_c21_90f8_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2696_c11_43f8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2696_c11_43f8_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2696_c11_43f8_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2696_c7_a7c5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2698_c3_82e3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2696_c7_a7c5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2696_c7_a7c5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2696_c7_a7c5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2696_c7_a7c5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2696_c7_a7c5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2696_c7_a7c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2696_c7_a7c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2696_c7_a7c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_fee0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2696_c7_a7c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2696_c7_a7c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2696_c7_a7c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_fee0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2696_c7_a7c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2696_c7_a7c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2696_c7_a7c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2696_c7_a7c5_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2699_c31_e0db_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2699_c31_e0db_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2699_c21_60fe_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_0ebe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_0ebe_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_0ebe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_fee0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_fee0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_fee0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_fee0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_fee0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_fee0_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2696_l2664_l2661_l2684_l2656_l2679_l2676_l2672_l2669_DUPLICATE_6c20_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2696_l2664_l2661_l2684_l2656_l2679_l2676_l2672_l2701_l2669_DUPLICATE_e6cf_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2664_l2687_l2661_l2684_l2656_l2679_l2676_l2672_l2669_DUPLICATE_3069_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2696_l2664_l2661_l2684_l2656_l2679_l2676_l2672_l2669_DUPLICATE_ffb4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2696_l2664_l2687_l2661_l2684_l2679_l2676_l2672_l2701_l2669_DUPLICATE_f144_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2673_l2680_l2665_l2688_DUPLICATE_e5d8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2681_l2666_DUPLICATE_d39a_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2681_l2666_DUPLICATE_d39a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l2652_l2706_DUPLICATE_75b8_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c11_6e27_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2676_c11_d166_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2677_c3_2e9d := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_ff52_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2677_c3_2e9d;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2693_c3_070d := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2687_c7_1873_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2693_c3_070d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_9053_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2687_c11_68ac_right := to_unsigned(8, 4);
     VAR_sp_relative_shift_uxn_opcodes_h_l2691_c30_e353_y := resize(to_signed(-2, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2682_c3_62ac := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2679_c7_ffed_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2682_c3_62ac;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2684_c11_f3de_right := to_unsigned(7, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2656_c2_768c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2672_c11_8ae9_right := to_unsigned(4, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2687_c7_1873_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2667_c3_57ff := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_74cf_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2667_c3_57ff;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2670_c3_43c0 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_4299_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2670_c3_43c0;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2698_c3_82e3 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2696_c7_a7c5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2698_c3_82e3;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_fee0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2696_c11_43f8_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2664_c11_af09_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2696_c7_a7c5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2656_c6_dc6e_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2662_c3_7782 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_5427_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2662_c3_7782;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2674_c3_141e := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2672_c7_60a4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2674_c3_141e;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2687_c7_1873_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2685_c3_cb7b := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2684_c7_7a50_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2685_c3_cb7b;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_fee0_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2691_c30_e353_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2679_c11_f02d_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2658_c3_f12f := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c2_768c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2658_c3_f12f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_0ebe_right := to_unsigned(10, 4);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2691_c30_e353_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2688_c3_97b5_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2656_c2_768c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2661_c7_5427_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2664_c7_74cf_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2669_c7_4299_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2672_c7_60a4_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2676_c7_ff52_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2684_c7_7a50_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2687_c7_1873_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2656_c6_dc6e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_9053_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2664_c11_af09_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c11_6e27_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2672_c11_8ae9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2676_c11_d166_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2679_c11_f02d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2684_c11_f3de_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2687_c11_68ac_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2696_c11_43f8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_0ebe_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2689_c11_0392_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2673_c3_6bf5_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2656_c2_768c_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2661_c7_5427_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2669_c7_4299_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2672_c7_60a4_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2699_c31_e0db_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2656_c2_768c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2661_c7_5427_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2664_c7_74cf_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2669_c7_4299_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2672_c7_60a4_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2676_c7_ff52_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2679_c7_ffed_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2684_c7_7a50_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2687_c7_1873_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2669_c11_6e27] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2669_c11_6e27_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c11_6e27_left;
     BIN_OP_EQ_uxn_opcodes_h_l2669_c11_6e27_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c11_6e27_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c11_6e27_return_output := BIN_OP_EQ_uxn_opcodes_h_l2669_c11_6e27_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2699_c31_e0db] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2699_c31_e0db_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2699_c31_e0db_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2699_c31_e0db_return_output := CONST_SR_8_uxn_opcodes_h_l2699_c31_e0db_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2701_c11_0ebe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2701_c11_0ebe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_0ebe_left;
     BIN_OP_EQ_uxn_opcodes_h_l2701_c11_0ebe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_0ebe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_0ebe_return_output := BIN_OP_EQ_uxn_opcodes_h_l2701_c11_0ebe_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2664_l2687_l2661_l2684_l2656_l2679_l2676_l2672_l2669_DUPLICATE_3069 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2664_l2687_l2661_l2684_l2656_l2679_l2676_l2672_l2669_DUPLICATE_3069_return_output := result.sp_relative_shift;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2696_c7_a7c5] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2696_c7_a7c5_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2679_c11_f02d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2679_c11_f02d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2679_c11_f02d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2679_c11_f02d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2679_c11_f02d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2679_c11_f02d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2679_c11_f02d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2664_c11_af09] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2664_c11_af09_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2664_c11_af09_left;
     BIN_OP_EQ_uxn_opcodes_h_l2664_c11_af09_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2664_c11_af09_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2664_c11_af09_return_output := BIN_OP_EQ_uxn_opcodes_h_l2664_c11_af09_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2656_c6_dc6e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2656_c6_dc6e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2656_c6_dc6e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2656_c6_dc6e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2656_c6_dc6e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2656_c6_dc6e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2656_c6_dc6e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2696_l2664_l2661_l2684_l2656_l2679_l2676_l2672_l2669_DUPLICATE_ffb4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2696_l2664_l2661_l2684_l2656_l2679_l2676_l2672_l2669_DUPLICATE_ffb4_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2672_c11_8ae9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2672_c11_8ae9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2672_c11_8ae9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2672_c11_8ae9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2672_c11_8ae9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2672_c11_8ae9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2672_c11_8ae9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2684_c11_f3de] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2684_c11_f3de_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2684_c11_f3de_left;
     BIN_OP_EQ_uxn_opcodes_h_l2684_c11_f3de_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2684_c11_f3de_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2684_c11_f3de_return_output := BIN_OP_EQ_uxn_opcodes_h_l2684_c11_f3de_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2696_l2664_l2661_l2684_l2656_l2679_l2676_l2672_l2701_l2669_DUPLICATE_e6cf LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2696_l2664_l2661_l2684_l2656_l2679_l2676_l2672_l2701_l2669_DUPLICATE_e6cf_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2661_c11_9053] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2661_c11_9053_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_9053_left;
     BIN_OP_EQ_uxn_opcodes_h_l2661_c11_9053_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_9053_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_9053_return_output := BIN_OP_EQ_uxn_opcodes_h_l2661_c11_9053_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2696_l2664_l2687_l2661_l2684_l2679_l2676_l2672_l2701_l2669_DUPLICATE_f144 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2696_l2664_l2687_l2661_l2684_l2679_l2676_l2672_l2701_l2669_DUPLICATE_f144_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2696_l2664_l2661_l2684_l2656_l2679_l2676_l2672_l2669_DUPLICATE_6c20 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2696_l2664_l2661_l2684_l2656_l2679_l2676_l2672_l2669_DUPLICATE_6c20_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2687_c11_68ac] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2687_c11_68ac_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2687_c11_68ac_left;
     BIN_OP_EQ_uxn_opcodes_h_l2687_c11_68ac_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2687_c11_68ac_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2687_c11_68ac_return_output := BIN_OP_EQ_uxn_opcodes_h_l2687_c11_68ac_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2676_c11_d166] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2676_c11_d166_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2676_c11_d166_left;
     BIN_OP_EQ_uxn_opcodes_h_l2676_c11_d166_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2676_c11_d166_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2676_c11_d166_return_output := BIN_OP_EQ_uxn_opcodes_h_l2676_c11_d166_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2691_c30_e353] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2691_c30_e353_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2691_c30_e353_ins;
     sp_relative_shift_uxn_opcodes_h_l2691_c30_e353_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2691_c30_e353_x;
     sp_relative_shift_uxn_opcodes_h_l2691_c30_e353_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2691_c30_e353_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2691_c30_e353_return_output := sp_relative_shift_uxn_opcodes_h_l2691_c30_e353_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2696_c11_43f8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2696_c11_43f8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2696_c11_43f8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2696_c11_43f8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2696_c11_43f8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2696_c11_43f8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2696_c11_43f8_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2673_l2680_l2665_l2688_DUPLICATE_e5d8 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2673_l2680_l2665_l2688_DUPLICATE_e5d8_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l2656_c2_768c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2656_c6_dc6e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2656_c2_768c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2656_c6_dc6e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2656_c2_768c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2656_c6_dc6e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2656_c2_768c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2656_c6_dc6e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c2_768c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2656_c6_dc6e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c2_768c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2656_c6_dc6e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2656_c2_768c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2656_c6_dc6e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2656_c2_768c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2656_c6_dc6e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2656_c2_768c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2656_c6_dc6e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2661_c7_5427_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_9053_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_5427_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_9053_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_5427_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_9053_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_5427_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_9053_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_5427_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_9053_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_5427_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_9053_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_5427_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_9053_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2661_c7_5427_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_9053_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2661_c7_5427_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_9053_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2664_c7_74cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2664_c11_af09_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_74cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2664_c11_af09_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2664_c7_74cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2664_c11_af09_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2664_c7_74cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2664_c11_af09_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2664_c7_74cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2664_c11_af09_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_74cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2664_c11_af09_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2664_c7_74cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2664_c11_af09_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2664_c7_74cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2664_c11_af09_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2664_c7_74cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2664_c11_af09_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2669_c7_4299_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c11_6e27_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_4299_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c11_6e27_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_4299_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c11_6e27_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_4299_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c11_6e27_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c7_4299_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c11_6e27_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_4299_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c11_6e27_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2669_c7_4299_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c11_6e27_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2669_c7_4299_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c11_6e27_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2669_c7_4299_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c11_6e27_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2672_c7_60a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2672_c11_8ae9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_60a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2672_c11_8ae9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2672_c7_60a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2672_c11_8ae9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_60a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2672_c11_8ae9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2672_c7_60a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2672_c11_8ae9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2672_c7_60a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2672_c11_8ae9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2672_c7_60a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2672_c11_8ae9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2672_c7_60a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2672_c11_8ae9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2672_c7_60a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2672_c11_8ae9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2676_c7_ff52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2676_c11_d166_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_ff52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2676_c11_d166_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_ff52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2676_c11_d166_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2676_c7_ff52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2676_c11_d166_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_ff52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2676_c11_d166_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_ff52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2676_c11_d166_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2676_c7_ff52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2676_c11_d166_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2676_c7_ff52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2676_c11_d166_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2679_c7_ffed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2679_c11_f02d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2679_c7_ffed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2679_c11_f02d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2679_c7_ffed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2679_c11_f02d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2679_c7_ffed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2679_c11_f02d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2679_c7_ffed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2679_c11_f02d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2679_c7_ffed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2679_c11_f02d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2679_c7_ffed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2679_c11_f02d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2679_c7_ffed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2679_c11_f02d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2684_c7_7a50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2684_c11_f3de_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2684_c7_7a50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2684_c11_f3de_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2684_c7_7a50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2684_c11_f3de_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2684_c7_7a50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2684_c11_f3de_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2684_c7_7a50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2684_c11_f3de_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2684_c7_7a50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2684_c11_f3de_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2684_c7_7a50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2684_c11_f3de_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2684_c7_7a50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2684_c11_f3de_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2687_c7_1873_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2687_c11_68ac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2687_c7_1873_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2687_c11_68ac_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2687_c7_1873_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2687_c11_68ac_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2687_c7_1873_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2687_c11_68ac_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2687_c7_1873_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2687_c11_68ac_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2687_c7_1873_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2687_c11_68ac_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2687_c7_1873_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2687_c11_68ac_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2687_c7_1873_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2687_c11_68ac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2696_c7_a7c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2696_c11_43f8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2696_c7_a7c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2696_c11_43f8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2696_c7_a7c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2696_c11_43f8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2696_c7_a7c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2696_c11_43f8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2696_c7_a7c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2696_c11_43f8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_fee0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_0ebe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_fee0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_0ebe_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2673_c3_6bf5_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2673_l2680_l2665_l2688_DUPLICATE_e5d8_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2688_c3_97b5_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2673_l2680_l2665_l2688_DUPLICATE_e5d8_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2681_l2666_DUPLICATE_d39a_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2673_l2680_l2665_l2688_DUPLICATE_e5d8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c2_768c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2664_l2687_l2661_l2684_l2656_l2679_l2676_l2672_l2669_DUPLICATE_3069_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_5427_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2664_l2687_l2661_l2684_l2656_l2679_l2676_l2672_l2669_DUPLICATE_3069_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2664_c7_74cf_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2664_l2687_l2661_l2684_l2656_l2679_l2676_l2672_l2669_DUPLICATE_3069_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c7_4299_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2664_l2687_l2661_l2684_l2656_l2679_l2676_l2672_l2669_DUPLICATE_3069_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2672_c7_60a4_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2664_l2687_l2661_l2684_l2656_l2679_l2676_l2672_l2669_DUPLICATE_3069_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_ff52_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2664_l2687_l2661_l2684_l2656_l2679_l2676_l2672_l2669_DUPLICATE_3069_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2679_c7_ffed_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2664_l2687_l2661_l2684_l2656_l2679_l2676_l2672_l2669_DUPLICATE_3069_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2684_c7_7a50_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2664_l2687_l2661_l2684_l2656_l2679_l2676_l2672_l2669_DUPLICATE_3069_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2687_c7_1873_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2664_l2687_l2661_l2684_l2656_l2679_l2676_l2672_l2669_DUPLICATE_3069_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_5427_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2696_l2664_l2687_l2661_l2684_l2679_l2676_l2672_l2701_l2669_DUPLICATE_f144_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_74cf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2696_l2664_l2687_l2661_l2684_l2679_l2676_l2672_l2701_l2669_DUPLICATE_f144_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_4299_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2696_l2664_l2687_l2661_l2684_l2679_l2676_l2672_l2701_l2669_DUPLICATE_f144_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_60a4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2696_l2664_l2687_l2661_l2684_l2679_l2676_l2672_l2701_l2669_DUPLICATE_f144_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_ff52_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2696_l2664_l2687_l2661_l2684_l2679_l2676_l2672_l2701_l2669_DUPLICATE_f144_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2679_c7_ffed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2696_l2664_l2687_l2661_l2684_l2679_l2676_l2672_l2701_l2669_DUPLICATE_f144_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2684_c7_7a50_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2696_l2664_l2687_l2661_l2684_l2679_l2676_l2672_l2701_l2669_DUPLICATE_f144_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2687_c7_1873_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2696_l2664_l2687_l2661_l2684_l2679_l2676_l2672_l2701_l2669_DUPLICATE_f144_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2696_c7_a7c5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2696_l2664_l2687_l2661_l2684_l2679_l2676_l2672_l2701_l2669_DUPLICATE_f144_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_fee0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2696_l2664_l2687_l2661_l2684_l2679_l2676_l2672_l2701_l2669_DUPLICATE_f144_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2656_c2_768c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2696_l2664_l2661_l2684_l2656_l2679_l2676_l2672_l2669_DUPLICATE_ffb4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_5427_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2696_l2664_l2661_l2684_l2656_l2679_l2676_l2672_l2669_DUPLICATE_ffb4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2664_c7_74cf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2696_l2664_l2661_l2684_l2656_l2679_l2676_l2672_l2669_DUPLICATE_ffb4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_4299_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2696_l2664_l2661_l2684_l2656_l2679_l2676_l2672_l2669_DUPLICATE_ffb4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2672_c7_60a4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2696_l2664_l2661_l2684_l2656_l2679_l2676_l2672_l2669_DUPLICATE_ffb4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_ff52_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2696_l2664_l2661_l2684_l2656_l2679_l2676_l2672_l2669_DUPLICATE_ffb4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2679_c7_ffed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2696_l2664_l2661_l2684_l2656_l2679_l2676_l2672_l2669_DUPLICATE_ffb4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2684_c7_7a50_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2696_l2664_l2661_l2684_l2656_l2679_l2676_l2672_l2669_DUPLICATE_ffb4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2696_c7_a7c5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2696_l2664_l2661_l2684_l2656_l2679_l2676_l2672_l2669_DUPLICATE_ffb4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2656_c2_768c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2696_l2664_l2661_l2684_l2656_l2679_l2676_l2672_l2701_l2669_DUPLICATE_e6cf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_5427_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2696_l2664_l2661_l2684_l2656_l2679_l2676_l2672_l2701_l2669_DUPLICATE_e6cf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2664_c7_74cf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2696_l2664_l2661_l2684_l2656_l2679_l2676_l2672_l2701_l2669_DUPLICATE_e6cf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_4299_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2696_l2664_l2661_l2684_l2656_l2679_l2676_l2672_l2701_l2669_DUPLICATE_e6cf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_60a4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2696_l2664_l2661_l2684_l2656_l2679_l2676_l2672_l2701_l2669_DUPLICATE_e6cf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2676_c7_ff52_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2696_l2664_l2661_l2684_l2656_l2679_l2676_l2672_l2701_l2669_DUPLICATE_e6cf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2679_c7_ffed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2696_l2664_l2661_l2684_l2656_l2679_l2676_l2672_l2701_l2669_DUPLICATE_e6cf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2684_c7_7a50_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2696_l2664_l2661_l2684_l2656_l2679_l2676_l2672_l2701_l2669_DUPLICATE_e6cf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2696_c7_a7c5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2696_l2664_l2661_l2684_l2656_l2679_l2676_l2672_l2701_l2669_DUPLICATE_e6cf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_fee0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2696_l2664_l2661_l2684_l2656_l2679_l2676_l2672_l2701_l2669_DUPLICATE_e6cf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2656_c2_768c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2696_l2664_l2661_l2684_l2656_l2679_l2676_l2672_l2669_DUPLICATE_6c20_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_5427_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2696_l2664_l2661_l2684_l2656_l2679_l2676_l2672_l2669_DUPLICATE_6c20_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2664_c7_74cf_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2696_l2664_l2661_l2684_l2656_l2679_l2676_l2672_l2669_DUPLICATE_6c20_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2669_c7_4299_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2696_l2664_l2661_l2684_l2656_l2679_l2676_l2672_l2669_DUPLICATE_6c20_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2672_c7_60a4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2696_l2664_l2661_l2684_l2656_l2679_l2676_l2672_l2669_DUPLICATE_6c20_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2676_c7_ff52_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2696_l2664_l2661_l2684_l2656_l2679_l2676_l2672_l2669_DUPLICATE_6c20_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2679_c7_ffed_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2696_l2664_l2661_l2684_l2656_l2679_l2676_l2672_l2669_DUPLICATE_6c20_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2684_c7_7a50_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2696_l2664_l2661_l2684_l2656_l2679_l2676_l2672_l2669_DUPLICATE_6c20_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2696_c7_a7c5_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2696_l2664_l2661_l2684_l2656_l2679_l2676_l2672_l2669_DUPLICATE_6c20_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2696_c7_a7c5_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2696_c7_a7c5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2687_c7_1873_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2691_c30_e353_return_output;
     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2681_l2666_DUPLICATE_d39a LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2681_l2666_DUPLICATE_d39a_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2681_l2666_DUPLICATE_d39a_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2681_l2666_DUPLICATE_d39a_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2681_l2666_DUPLICATE_d39a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2696_c7_a7c5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2696_c7_a7c5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2696_c7_a7c5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2696_c7_a7c5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2696_c7_a7c5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2696_c7_a7c5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2696_c7_a7c5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2696_c7_a7c5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2696_c7_a7c5_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2699_c21_60fe] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2699_c21_60fe_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2699_c31_e0db_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l2673_c3_6bf5] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2673_c3_6bf5_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2673_c3_6bf5_left;
     BIN_OP_OR_uxn_opcodes_h_l2673_c3_6bf5_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2673_c3_6bf5_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2673_c3_6bf5_return_output := BIN_OP_OR_uxn_opcodes_h_l2673_c3_6bf5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2687_c7_1873] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2687_c7_1873_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2687_c7_1873_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2687_c7_1873_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2687_c7_1873_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2687_c7_1873_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2687_c7_1873_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2687_c7_1873_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2687_c7_1873_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2701_c7_fee0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_fee0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_fee0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_fee0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_fee0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_fee0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_fee0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_fee0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_fee0_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2688_c3_97b5] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2688_c3_97b5_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2688_c3_97b5_left;
     BIN_OP_OR_uxn_opcodes_h_l2688_c3_97b5_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2688_c3_97b5_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2688_c3_97b5_return_output := BIN_OP_OR_uxn_opcodes_h_l2688_c3_97b5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2701_c7_fee0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_fee0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_fee0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_fee0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_fee0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_fee0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_fee0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_fee0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_fee0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2696_c7_a7c5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2696_c7_a7c5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2696_c7_a7c5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2696_c7_a7c5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2696_c7_a7c5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2696_c7_a7c5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2696_c7_a7c5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2696_c7_a7c5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2696_c7_a7c5_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2672_c7_60a4_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2673_c3_6bf5_return_output;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2689_c11_0392_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2688_c3_97b5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2687_c7_1873_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2688_c3_97b5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2696_c7_a7c5_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2699_c21_60fe_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2679_c7_ffed_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2681_l2666_DUPLICATE_d39a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2664_c7_74cf_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2681_l2666_DUPLICATE_d39a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2696_c7_a7c5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_fee0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2687_c7_1873_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2696_c7_a7c5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2696_c7_a7c5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_fee0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2684_c7_7a50_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2687_c7_1873_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2687_c7_1873_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2696_c7_a7c5_return_output;
     -- n16_MUX[uxn_opcodes_h_l2687_c7_1873] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2687_c7_1873_cond <= VAR_n16_MUX_uxn_opcodes_h_l2687_c7_1873_cond;
     n16_MUX_uxn_opcodes_h_l2687_c7_1873_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2687_c7_1873_iftrue;
     n16_MUX_uxn_opcodes_h_l2687_c7_1873_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2687_c7_1873_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2687_c7_1873_return_output := n16_MUX_uxn_opcodes_h_l2687_c7_1873_return_output;

     -- BIN_OP_MINUS[uxn_opcodes_h_l2689_c11_0392] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l2689_c11_0392_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2689_c11_0392_left;
     BIN_OP_MINUS_uxn_opcodes_h_l2689_c11_0392_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2689_c11_0392_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2689_c11_0392_return_output := BIN_OP_MINUS_uxn_opcodes_h_l2689_c11_0392_return_output;

     -- t16_MUX[uxn_opcodes_h_l2672_c7_60a4] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2672_c7_60a4_cond <= VAR_t16_MUX_uxn_opcodes_h_l2672_c7_60a4_cond;
     t16_MUX_uxn_opcodes_h_l2672_c7_60a4_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2672_c7_60a4_iftrue;
     t16_MUX_uxn_opcodes_h_l2672_c7_60a4_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2672_c7_60a4_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2672_c7_60a4_return_output := t16_MUX_uxn_opcodes_h_l2672_c7_60a4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2696_c7_a7c5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2696_c7_a7c5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2696_c7_a7c5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2696_c7_a7c5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2696_c7_a7c5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2696_c7_a7c5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2696_c7_a7c5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2696_c7_a7c5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2696_c7_a7c5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2684_c7_7a50] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2684_c7_7a50_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2684_c7_7a50_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2684_c7_7a50_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2684_c7_7a50_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2684_c7_7a50_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2684_c7_7a50_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2684_c7_7a50_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2684_c7_7a50_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2696_c7_a7c5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2696_c7_a7c5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2696_c7_a7c5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2696_c7_a7c5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2696_c7_a7c5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2696_c7_a7c5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2696_c7_a7c5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2696_c7_a7c5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2696_c7_a7c5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2696_c7_a7c5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2696_c7_a7c5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2696_c7_a7c5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2696_c7_a7c5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2696_c7_a7c5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2696_c7_a7c5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2696_c7_a7c5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2696_c7_a7c5_return_output := result_u8_value_MUX_uxn_opcodes_h_l2696_c7_a7c5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2687_c7_1873] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2687_c7_1873_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2687_c7_1873_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2687_c7_1873_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2687_c7_1873_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2687_c7_1873_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2687_c7_1873_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2687_c7_1873_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2687_c7_1873_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2687_c7_1873] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2687_c7_1873_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2687_c7_1873_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2687_c7_1873_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2687_c7_1873_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2687_c7_1873_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2687_c7_1873_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2687_c7_1873_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2687_c7_1873_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l2687_c7_1873_iftrue := VAR_BIN_OP_MINUS_uxn_opcodes_h_l2689_c11_0392_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2684_c7_7a50_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2687_c7_1873_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2687_c7_1873_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2696_c7_a7c5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2684_c7_7a50_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2687_c7_1873_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2687_c7_1873_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2696_c7_a7c5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2679_c7_ffed_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2684_c7_7a50_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2684_c7_7a50_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2687_c7_1873_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2687_c7_1873_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2696_c7_a7c5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2669_c7_4299_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2672_c7_60a4_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2684_c7_7a50] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2684_c7_7a50_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2684_c7_7a50_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2684_c7_7a50_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2684_c7_7a50_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2684_c7_7a50_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2684_c7_7a50_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2684_c7_7a50_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2684_c7_7a50_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2684_c7_7a50] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2684_c7_7a50_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2684_c7_7a50_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2684_c7_7a50_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2684_c7_7a50_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2684_c7_7a50_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2684_c7_7a50_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2684_c7_7a50_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2684_c7_7a50_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2687_c7_1873] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2687_c7_1873_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2687_c7_1873_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2687_c7_1873_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2687_c7_1873_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2687_c7_1873_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2687_c7_1873_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2687_c7_1873_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2687_c7_1873_return_output;

     -- n16_MUX[uxn_opcodes_h_l2684_c7_7a50] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2684_c7_7a50_cond <= VAR_n16_MUX_uxn_opcodes_h_l2684_c7_7a50_cond;
     n16_MUX_uxn_opcodes_h_l2684_c7_7a50_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2684_c7_7a50_iftrue;
     n16_MUX_uxn_opcodes_h_l2684_c7_7a50_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2684_c7_7a50_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2684_c7_7a50_return_output := n16_MUX_uxn_opcodes_h_l2684_c7_7a50_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2687_c7_1873] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2687_c7_1873_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2687_c7_1873_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2687_c7_1873_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2687_c7_1873_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2687_c7_1873_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2687_c7_1873_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2687_c7_1873_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2687_c7_1873_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2679_c7_ffed] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2679_c7_ffed_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2679_c7_ffed_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2679_c7_ffed_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2679_c7_ffed_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2679_c7_ffed_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2679_c7_ffed_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2679_c7_ffed_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2679_c7_ffed_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2687_c7_1873] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2687_c7_1873_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2687_c7_1873_cond;
     tmp16_MUX_uxn_opcodes_h_l2687_c7_1873_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2687_c7_1873_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2687_c7_1873_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2687_c7_1873_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2687_c7_1873_return_output := tmp16_MUX_uxn_opcodes_h_l2687_c7_1873_return_output;

     -- t16_MUX[uxn_opcodes_h_l2669_c7_4299] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2669_c7_4299_cond <= VAR_t16_MUX_uxn_opcodes_h_l2669_c7_4299_cond;
     t16_MUX_uxn_opcodes_h_l2669_c7_4299_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2669_c7_4299_iftrue;
     t16_MUX_uxn_opcodes_h_l2669_c7_4299_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2669_c7_4299_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2669_c7_4299_return_output := t16_MUX_uxn_opcodes_h_l2669_c7_4299_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2694_c21_90f8] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2694_c21_90f8_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2689_c11_0392_return_output);

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2687_c7_1873_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2694_c21_90f8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2679_c7_ffed_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2684_c7_7a50_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2684_c7_7a50_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2687_c7_1873_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2679_c7_ffed_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2684_c7_7a50_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2684_c7_7a50_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2687_c7_1873_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_ff52_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2679_c7_ffed_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2679_c7_ffed_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2684_c7_7a50_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2664_c7_74cf_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2669_c7_4299_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2684_c7_7a50_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2687_c7_1873_return_output;
     -- t16_MUX[uxn_opcodes_h_l2664_c7_74cf] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2664_c7_74cf_cond <= VAR_t16_MUX_uxn_opcodes_h_l2664_c7_74cf_cond;
     t16_MUX_uxn_opcodes_h_l2664_c7_74cf_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2664_c7_74cf_iftrue;
     t16_MUX_uxn_opcodes_h_l2664_c7_74cf_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2664_c7_74cf_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2664_c7_74cf_return_output := t16_MUX_uxn_opcodes_h_l2664_c7_74cf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2684_c7_7a50] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2684_c7_7a50_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2684_c7_7a50_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2684_c7_7a50_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2684_c7_7a50_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2684_c7_7a50_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2684_c7_7a50_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2684_c7_7a50_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2684_c7_7a50_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2679_c7_ffed] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2679_c7_ffed_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2679_c7_ffed_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2679_c7_ffed_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2679_c7_ffed_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2679_c7_ffed_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2679_c7_ffed_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2679_c7_ffed_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2679_c7_ffed_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2687_c7_1873] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2687_c7_1873_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2687_c7_1873_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2687_c7_1873_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2687_c7_1873_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2687_c7_1873_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2687_c7_1873_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2687_c7_1873_return_output := result_u8_value_MUX_uxn_opcodes_h_l2687_c7_1873_return_output;

     -- n16_MUX[uxn_opcodes_h_l2679_c7_ffed] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2679_c7_ffed_cond <= VAR_n16_MUX_uxn_opcodes_h_l2679_c7_ffed_cond;
     n16_MUX_uxn_opcodes_h_l2679_c7_ffed_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2679_c7_ffed_iftrue;
     n16_MUX_uxn_opcodes_h_l2679_c7_ffed_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2679_c7_ffed_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2679_c7_ffed_return_output := n16_MUX_uxn_opcodes_h_l2679_c7_ffed_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2676_c7_ff52] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_ff52_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_ff52_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_ff52_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_ff52_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_ff52_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_ff52_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_ff52_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_ff52_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2684_c7_7a50] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2684_c7_7a50_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2684_c7_7a50_cond;
     tmp16_MUX_uxn_opcodes_h_l2684_c7_7a50_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2684_c7_7a50_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2684_c7_7a50_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2684_c7_7a50_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2684_c7_7a50_return_output := tmp16_MUX_uxn_opcodes_h_l2684_c7_7a50_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2679_c7_ffed] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2679_c7_ffed_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2679_c7_ffed_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2679_c7_ffed_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2679_c7_ffed_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2679_c7_ffed_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2679_c7_ffed_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2679_c7_ffed_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2679_c7_ffed_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2684_c7_7a50] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2684_c7_7a50_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2684_c7_7a50_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2684_c7_7a50_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2684_c7_7a50_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2684_c7_7a50_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2684_c7_7a50_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2684_c7_7a50_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2684_c7_7a50_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2676_c7_ff52_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2679_c7_ffed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2679_c7_ffed_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2684_c7_7a50_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_ff52_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2679_c7_ffed_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2679_c7_ffed_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2684_c7_7a50_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2672_c7_60a4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_ff52_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_ff52_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2679_c7_ffed_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2684_c7_7a50_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2687_c7_1873_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2661_c7_5427_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2664_c7_74cf_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2679_c7_ffed_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2684_c7_7a50_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2679_c7_ffed] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2679_c7_ffed_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2679_c7_ffed_cond;
     tmp16_MUX_uxn_opcodes_h_l2679_c7_ffed_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2679_c7_ffed_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2679_c7_ffed_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2679_c7_ffed_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2679_c7_ffed_return_output := tmp16_MUX_uxn_opcodes_h_l2679_c7_ffed_return_output;

     -- t16_MUX[uxn_opcodes_h_l2661_c7_5427] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2661_c7_5427_cond <= VAR_t16_MUX_uxn_opcodes_h_l2661_c7_5427_cond;
     t16_MUX_uxn_opcodes_h_l2661_c7_5427_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2661_c7_5427_iftrue;
     t16_MUX_uxn_opcodes_h_l2661_c7_5427_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2661_c7_5427_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2661_c7_5427_return_output := t16_MUX_uxn_opcodes_h_l2661_c7_5427_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2679_c7_ffed] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2679_c7_ffed_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2679_c7_ffed_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2679_c7_ffed_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2679_c7_ffed_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2679_c7_ffed_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2679_c7_ffed_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2679_c7_ffed_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2679_c7_ffed_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2672_c7_60a4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2672_c7_60a4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2672_c7_60a4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2672_c7_60a4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2672_c7_60a4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2672_c7_60a4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2672_c7_60a4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2672_c7_60a4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2672_c7_60a4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2679_c7_ffed] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2679_c7_ffed_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2679_c7_ffed_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2679_c7_ffed_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2679_c7_ffed_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2679_c7_ffed_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2679_c7_ffed_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2679_c7_ffed_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2679_c7_ffed_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2676_c7_ff52] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_ff52_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_ff52_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_ff52_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_ff52_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_ff52_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_ff52_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_ff52_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_ff52_return_output;

     -- n16_MUX[uxn_opcodes_h_l2676_c7_ff52] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2676_c7_ff52_cond <= VAR_n16_MUX_uxn_opcodes_h_l2676_c7_ff52_cond;
     n16_MUX_uxn_opcodes_h_l2676_c7_ff52_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2676_c7_ff52_iftrue;
     n16_MUX_uxn_opcodes_h_l2676_c7_ff52_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2676_c7_ff52_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2676_c7_ff52_return_output := n16_MUX_uxn_opcodes_h_l2676_c7_ff52_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2676_c7_ff52] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_ff52_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_ff52_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_ff52_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_ff52_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_ff52_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_ff52_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_ff52_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_ff52_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2684_c7_7a50] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2684_c7_7a50_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2684_c7_7a50_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2684_c7_7a50_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2684_c7_7a50_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2684_c7_7a50_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2684_c7_7a50_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2684_c7_7a50_return_output := result_u8_value_MUX_uxn_opcodes_h_l2684_c7_7a50_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2672_c7_60a4_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2676_c7_ff52_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_ff52_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2679_c7_ffed_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2672_c7_60a4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_ff52_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2676_c7_ff52_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2679_c7_ffed_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c7_4299_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2672_c7_60a4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2672_c7_60a4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_ff52_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2679_c7_ffed_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2684_c7_7a50_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2656_c2_768c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2661_c7_5427_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2676_c7_ff52_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2679_c7_ffed_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2676_c7_ff52] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_ff52_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_ff52_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_ff52_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_ff52_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_ff52_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_ff52_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_ff52_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_ff52_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2676_c7_ff52] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2676_c7_ff52_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2676_c7_ff52_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2676_c7_ff52_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2676_c7_ff52_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2676_c7_ff52_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2676_c7_ff52_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2676_c7_ff52_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2676_c7_ff52_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2676_c7_ff52] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2676_c7_ff52_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2676_c7_ff52_cond;
     tmp16_MUX_uxn_opcodes_h_l2676_c7_ff52_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2676_c7_ff52_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2676_c7_ff52_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2676_c7_ff52_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2676_c7_ff52_return_output := tmp16_MUX_uxn_opcodes_h_l2676_c7_ff52_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2672_c7_60a4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2672_c7_60a4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2672_c7_60a4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2672_c7_60a4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2672_c7_60a4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2672_c7_60a4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2672_c7_60a4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2672_c7_60a4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2672_c7_60a4_return_output;

     -- t16_MUX[uxn_opcodes_h_l2656_c2_768c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2656_c2_768c_cond <= VAR_t16_MUX_uxn_opcodes_h_l2656_c2_768c_cond;
     t16_MUX_uxn_opcodes_h_l2656_c2_768c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2656_c2_768c_iftrue;
     t16_MUX_uxn_opcodes_h_l2656_c2_768c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2656_c2_768c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2656_c2_768c_return_output := t16_MUX_uxn_opcodes_h_l2656_c2_768c_return_output;

     -- n16_MUX[uxn_opcodes_h_l2672_c7_60a4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2672_c7_60a4_cond <= VAR_n16_MUX_uxn_opcodes_h_l2672_c7_60a4_cond;
     n16_MUX_uxn_opcodes_h_l2672_c7_60a4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2672_c7_60a4_iftrue;
     n16_MUX_uxn_opcodes_h_l2672_c7_60a4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2672_c7_60a4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2672_c7_60a4_return_output := n16_MUX_uxn_opcodes_h_l2672_c7_60a4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2679_c7_ffed] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2679_c7_ffed_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2679_c7_ffed_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2679_c7_ffed_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2679_c7_ffed_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2679_c7_ffed_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2679_c7_ffed_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2679_c7_ffed_return_output := result_u8_value_MUX_uxn_opcodes_h_l2679_c7_ffed_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2669_c7_4299] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c7_4299_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c7_4299_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c7_4299_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c7_4299_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c7_4299_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c7_4299_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c7_4299_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c7_4299_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2672_c7_60a4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2672_c7_60a4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2672_c7_60a4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2672_c7_60a4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2672_c7_60a4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2672_c7_60a4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2672_c7_60a4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2672_c7_60a4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2672_c7_60a4_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2669_c7_4299_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2672_c7_60a4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_60a4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_ff52_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_4299_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2672_c7_60a4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_60a4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2676_c7_ff52_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2664_c7_74cf_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c7_4299_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_4299_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2672_c7_60a4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2676_c7_ff52_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2679_c7_ffed_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2656_c2_768c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2672_c7_60a4_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2676_c7_ff52_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2676_c7_ff52] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2676_c7_ff52_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2676_c7_ff52_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2676_c7_ff52_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2676_c7_ff52_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2676_c7_ff52_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2676_c7_ff52_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2676_c7_ff52_return_output := result_u8_value_MUX_uxn_opcodes_h_l2676_c7_ff52_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2664_c7_74cf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2664_c7_74cf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2664_c7_74cf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2664_c7_74cf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2664_c7_74cf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2664_c7_74cf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2664_c7_74cf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2664_c7_74cf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2664_c7_74cf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2669_c7_4299] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_4299_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_4299_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_4299_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_4299_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_4299_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_4299_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_4299_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_4299_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2669_c7_4299] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_4299_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_4299_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_4299_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_4299_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_4299_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_4299_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_4299_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_4299_return_output;

     -- n16_MUX[uxn_opcodes_h_l2669_c7_4299] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2669_c7_4299_cond <= VAR_n16_MUX_uxn_opcodes_h_l2669_c7_4299_cond;
     n16_MUX_uxn_opcodes_h_l2669_c7_4299_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2669_c7_4299_iftrue;
     n16_MUX_uxn_opcodes_h_l2669_c7_4299_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2669_c7_4299_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2669_c7_4299_return_output := n16_MUX_uxn_opcodes_h_l2669_c7_4299_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2672_c7_60a4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_60a4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_60a4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_60a4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_60a4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_60a4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_60a4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_60a4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_60a4_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2672_c7_60a4] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2672_c7_60a4_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2672_c7_60a4_cond;
     tmp16_MUX_uxn_opcodes_h_l2672_c7_60a4_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2672_c7_60a4_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2672_c7_60a4_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2672_c7_60a4_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2672_c7_60a4_return_output := tmp16_MUX_uxn_opcodes_h_l2672_c7_60a4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2672_c7_60a4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_60a4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_60a4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_60a4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_60a4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_60a4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_60a4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_60a4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_60a4_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l2664_c7_74cf_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2669_c7_4299_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_4299_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_60a4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2664_c7_74cf_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_4299_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_4299_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_60a4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_5427_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2664_c7_74cf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_74cf_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_4299_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2672_c7_60a4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2676_c7_ff52_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2669_c7_4299_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2672_c7_60a4_return_output;
     -- n16_MUX[uxn_opcodes_h_l2664_c7_74cf] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2664_c7_74cf_cond <= VAR_n16_MUX_uxn_opcodes_h_l2664_c7_74cf_cond;
     n16_MUX_uxn_opcodes_h_l2664_c7_74cf_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2664_c7_74cf_iftrue;
     n16_MUX_uxn_opcodes_h_l2664_c7_74cf_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2664_c7_74cf_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2664_c7_74cf_return_output := n16_MUX_uxn_opcodes_h_l2664_c7_74cf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2669_c7_4299] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_4299_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_4299_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_4299_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_4299_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_4299_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_4299_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_4299_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_4299_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2669_c7_4299] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2669_c7_4299_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2669_c7_4299_cond;
     tmp16_MUX_uxn_opcodes_h_l2669_c7_4299_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2669_c7_4299_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2669_c7_4299_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2669_c7_4299_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2669_c7_4299_return_output := tmp16_MUX_uxn_opcodes_h_l2669_c7_4299_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2664_c7_74cf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_74cf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_74cf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_74cf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_74cf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_74cf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_74cf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_74cf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_74cf_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2672_c7_60a4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2672_c7_60a4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2672_c7_60a4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2672_c7_60a4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2672_c7_60a4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2672_c7_60a4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2672_c7_60a4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2672_c7_60a4_return_output := result_u8_value_MUX_uxn_opcodes_h_l2672_c7_60a4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2664_c7_74cf] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2664_c7_74cf_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2664_c7_74cf_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2664_c7_74cf_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2664_c7_74cf_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2664_c7_74cf_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2664_c7_74cf_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2664_c7_74cf_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2664_c7_74cf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2669_c7_4299] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_4299_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_4299_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_4299_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_4299_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_4299_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_4299_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_4299_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_4299_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2661_c7_5427] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_5427_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_5427_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_5427_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_5427_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_5427_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_5427_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_5427_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_5427_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l2661_c7_5427_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2664_c7_74cf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_74cf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_4299_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_5427_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2664_c7_74cf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2664_c7_74cf_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_4299_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c2_768c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_5427_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_5427_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_74cf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2669_c7_4299_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2672_c7_60a4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2664_c7_74cf_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2669_c7_4299_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2664_c7_74cf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2664_c7_74cf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2664_c7_74cf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2664_c7_74cf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2664_c7_74cf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2664_c7_74cf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2664_c7_74cf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2664_c7_74cf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2664_c7_74cf_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2664_c7_74cf] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2664_c7_74cf_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2664_c7_74cf_cond;
     tmp16_MUX_uxn_opcodes_h_l2664_c7_74cf_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2664_c7_74cf_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2664_c7_74cf_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2664_c7_74cf_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2664_c7_74cf_return_output := tmp16_MUX_uxn_opcodes_h_l2664_c7_74cf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2661_c7_5427] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_5427_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_5427_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_5427_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_5427_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_5427_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_5427_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_5427_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_5427_return_output;

     -- n16_MUX[uxn_opcodes_h_l2661_c7_5427] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2661_c7_5427_cond <= VAR_n16_MUX_uxn_opcodes_h_l2661_c7_5427_cond;
     n16_MUX_uxn_opcodes_h_l2661_c7_5427_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2661_c7_5427_iftrue;
     n16_MUX_uxn_opcodes_h_l2661_c7_5427_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2661_c7_5427_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2661_c7_5427_return_output := n16_MUX_uxn_opcodes_h_l2661_c7_5427_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2669_c7_4299] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2669_c7_4299_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2669_c7_4299_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2669_c7_4299_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2669_c7_4299_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2669_c7_4299_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2669_c7_4299_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2669_c7_4299_return_output := result_u8_value_MUX_uxn_opcodes_h_l2669_c7_4299_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2656_c2_768c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c2_768c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c2_768c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c2_768c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c2_768c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c2_768c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c2_768c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c2_768c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c2_768c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2664_c7_74cf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_74cf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_74cf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_74cf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_74cf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_74cf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_74cf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_74cf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_74cf_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2661_c7_5427] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_5427_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_5427_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_5427_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_5427_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_5427_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_5427_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_5427_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_5427_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l2656_c2_768c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2661_c7_5427_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_5427_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_74cf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2656_c2_768c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_5427_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_5427_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2664_c7_74cf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c2_768c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_5427_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2664_c7_74cf_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2669_c7_4299_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2661_c7_5427_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2664_c7_74cf_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2661_c7_5427] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_5427_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_5427_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_5427_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_5427_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_5427_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_5427_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_5427_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_5427_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2656_c2_768c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2656_c2_768c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2656_c2_768c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2656_c2_768c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2656_c2_768c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2656_c2_768c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2656_c2_768c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2656_c2_768c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2656_c2_768c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2661_c7_5427] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2661_c7_5427_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2661_c7_5427_cond;
     tmp16_MUX_uxn_opcodes_h_l2661_c7_5427_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2661_c7_5427_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2661_c7_5427_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2661_c7_5427_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2661_c7_5427_return_output := tmp16_MUX_uxn_opcodes_h_l2661_c7_5427_return_output;

     -- n16_MUX[uxn_opcodes_h_l2656_c2_768c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2656_c2_768c_cond <= VAR_n16_MUX_uxn_opcodes_h_l2656_c2_768c_cond;
     n16_MUX_uxn_opcodes_h_l2656_c2_768c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2656_c2_768c_iftrue;
     n16_MUX_uxn_opcodes_h_l2656_c2_768c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2656_c2_768c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2656_c2_768c_return_output := n16_MUX_uxn_opcodes_h_l2656_c2_768c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2656_c2_768c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c2_768c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c2_768c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c2_768c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c2_768c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c2_768c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c2_768c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c2_768c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c2_768c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2661_c7_5427] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_5427_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_5427_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_5427_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_5427_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_5427_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_5427_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_5427_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_5427_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2664_c7_74cf] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2664_c7_74cf_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2664_c7_74cf_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2664_c7_74cf_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2664_c7_74cf_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2664_c7_74cf_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2664_c7_74cf_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2664_c7_74cf_return_output := result_u8_value_MUX_uxn_opcodes_h_l2664_c7_74cf_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2656_c2_768c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2656_c2_768c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_5427_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2656_c2_768c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_5427_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_5427_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2664_c7_74cf_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2656_c2_768c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2661_c7_5427_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2656_c2_768c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2656_c2_768c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2656_c2_768c_cond;
     tmp16_MUX_uxn_opcodes_h_l2656_c2_768c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2656_c2_768c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2656_c2_768c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2656_c2_768c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2656_c2_768c_return_output := tmp16_MUX_uxn_opcodes_h_l2656_c2_768c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2656_c2_768c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2656_c2_768c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2656_c2_768c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2656_c2_768c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2656_c2_768c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2656_c2_768c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2656_c2_768c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2656_c2_768c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2656_c2_768c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2656_c2_768c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2656_c2_768c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2656_c2_768c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2656_c2_768c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2656_c2_768c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2656_c2_768c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2656_c2_768c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2656_c2_768c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2656_c2_768c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2661_c7_5427] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2661_c7_5427_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_5427_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2661_c7_5427_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_5427_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2661_c7_5427_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_5427_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_5427_return_output := result_u8_value_MUX_uxn_opcodes_h_l2661_c7_5427_return_output;

     -- Submodule level 12
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2656_c2_768c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_5427_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2656_c2_768c_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2656_c2_768c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2656_c2_768c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2656_c2_768c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2656_c2_768c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2656_c2_768c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2656_c2_768c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2656_c2_768c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2656_c2_768c_return_output := result_u8_value_MUX_uxn_opcodes_h_l2656_c2_768c_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l2652_l2706_DUPLICATE_75b8 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l2652_l2706_DUPLICATE_75b8_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3345(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c2_768c_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2656_c2_768c_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2656_c2_768c_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2656_c2_768c_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c2_768c_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2656_c2_768c_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l2652_l2706_DUPLICATE_75b8_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l2652_l2706_DUPLICATE_75b8_return_output;
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
