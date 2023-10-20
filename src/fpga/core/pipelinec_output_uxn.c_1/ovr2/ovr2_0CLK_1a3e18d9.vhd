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
-- Submodules: 119
entity ovr2_0CLK_1a3e18d9 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ovr2_0CLK_1a3e18d9;
architecture arch of ovr2_0CLK_1a3e18d9 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l348_c6_9568]
signal BIN_OP_EQ_uxn_opcodes_h_l348_c6_9568_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l348_c6_9568_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l348_c6_9568_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l348_c2_28f2]
signal n16_MUX_uxn_opcodes_h_l348_c2_28f2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l348_c2_28f2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l348_c2_28f2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l348_c2_28f2_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l348_c2_28f2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_28f2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_28f2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_28f2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_28f2_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l348_c2_28f2]
signal result_u8_value_MUX_uxn_opcodes_h_l348_c2_28f2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l348_c2_28f2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l348_c2_28f2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l348_c2_28f2_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l348_c2_28f2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_28f2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_28f2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_28f2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_28f2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l348_c2_28f2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_28f2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_28f2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_28f2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_28f2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l348_c2_28f2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_28f2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_28f2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_28f2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_28f2_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l348_c2_28f2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_28f2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_28f2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_28f2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_28f2_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l348_c2_28f2]
signal t16_MUX_uxn_opcodes_h_l348_c2_28f2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l348_c2_28f2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l348_c2_28f2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l348_c2_28f2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l353_c11_eef9]
signal BIN_OP_EQ_uxn_opcodes_h_l353_c11_eef9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l353_c11_eef9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l353_c11_eef9_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l353_c7_3e10]
signal n16_MUX_uxn_opcodes_h_l353_c7_3e10_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l353_c7_3e10_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l353_c7_3e10_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l353_c7_3e10_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l353_c7_3e10]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_3e10_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_3e10_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_3e10_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_3e10_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l353_c7_3e10]
signal result_u8_value_MUX_uxn_opcodes_h_l353_c7_3e10_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l353_c7_3e10_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l353_c7_3e10_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l353_c7_3e10_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l353_c7_3e10]
signal result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_3e10_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_3e10_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_3e10_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_3e10_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l353_c7_3e10]
signal result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_3e10_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_3e10_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_3e10_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_3e10_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l353_c7_3e10]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_3e10_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_3e10_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_3e10_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_3e10_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l353_c7_3e10]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_3e10_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_3e10_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_3e10_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_3e10_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l353_c7_3e10]
signal t16_MUX_uxn_opcodes_h_l353_c7_3e10_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l353_c7_3e10_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l353_c7_3e10_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l353_c7_3e10_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l356_c11_eb4a]
signal BIN_OP_EQ_uxn_opcodes_h_l356_c11_eb4a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l356_c11_eb4a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l356_c11_eb4a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l356_c7_73a7]
signal n16_MUX_uxn_opcodes_h_l356_c7_73a7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l356_c7_73a7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l356_c7_73a7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l356_c7_73a7_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l356_c7_73a7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_73a7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_73a7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_73a7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_73a7_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l356_c7_73a7]
signal result_u8_value_MUX_uxn_opcodes_h_l356_c7_73a7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l356_c7_73a7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l356_c7_73a7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l356_c7_73a7_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l356_c7_73a7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_73a7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_73a7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_73a7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_73a7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l356_c7_73a7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_73a7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_73a7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_73a7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_73a7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l356_c7_73a7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_73a7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_73a7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_73a7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_73a7_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l356_c7_73a7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_73a7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_73a7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_73a7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_73a7_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l356_c7_73a7]
signal t16_MUX_uxn_opcodes_h_l356_c7_73a7_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l356_c7_73a7_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l356_c7_73a7_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l356_c7_73a7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l361_c11_2266]
signal BIN_OP_EQ_uxn_opcodes_h_l361_c11_2266_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l361_c11_2266_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l361_c11_2266_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l361_c7_5c31]
signal n16_MUX_uxn_opcodes_h_l361_c7_5c31_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l361_c7_5c31_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l361_c7_5c31_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l361_c7_5c31_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l361_c7_5c31]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_5c31_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_5c31_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_5c31_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_5c31_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l361_c7_5c31]
signal result_u8_value_MUX_uxn_opcodes_h_l361_c7_5c31_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l361_c7_5c31_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l361_c7_5c31_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l361_c7_5c31_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l361_c7_5c31]
signal result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_5c31_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_5c31_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_5c31_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_5c31_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l361_c7_5c31]
signal result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_5c31_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_5c31_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_5c31_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_5c31_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l361_c7_5c31]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_5c31_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_5c31_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_5c31_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_5c31_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l361_c7_5c31]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_5c31_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_5c31_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_5c31_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_5c31_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l361_c7_5c31]
signal t16_MUX_uxn_opcodes_h_l361_c7_5c31_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l361_c7_5c31_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l361_c7_5c31_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l361_c7_5c31_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l364_c11_6b38]
signal BIN_OP_EQ_uxn_opcodes_h_l364_c11_6b38_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l364_c11_6b38_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l364_c11_6b38_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l364_c7_4ad9]
signal n16_MUX_uxn_opcodes_h_l364_c7_4ad9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l364_c7_4ad9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l364_c7_4ad9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l364_c7_4ad9_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l364_c7_4ad9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_4ad9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_4ad9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_4ad9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_4ad9_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l364_c7_4ad9]
signal result_u8_value_MUX_uxn_opcodes_h_l364_c7_4ad9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l364_c7_4ad9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l364_c7_4ad9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l364_c7_4ad9_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l364_c7_4ad9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_4ad9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_4ad9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_4ad9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_4ad9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l364_c7_4ad9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_4ad9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_4ad9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_4ad9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_4ad9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l364_c7_4ad9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_4ad9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_4ad9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_4ad9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_4ad9_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l364_c7_4ad9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_4ad9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_4ad9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_4ad9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_4ad9_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l364_c7_4ad9]
signal t16_MUX_uxn_opcodes_h_l364_c7_4ad9_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l364_c7_4ad9_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l364_c7_4ad9_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l364_c7_4ad9_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l365_c3_78ab]
signal BIN_OP_OR_uxn_opcodes_h_l365_c3_78ab_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l365_c3_78ab_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l365_c3_78ab_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l368_c11_7ea2]
signal BIN_OP_EQ_uxn_opcodes_h_l368_c11_7ea2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l368_c11_7ea2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l368_c11_7ea2_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l368_c7_3e9c]
signal n16_MUX_uxn_opcodes_h_l368_c7_3e9c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l368_c7_3e9c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l368_c7_3e9c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l368_c7_3e9c_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l368_c7_3e9c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_3e9c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_3e9c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_3e9c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_3e9c_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l368_c7_3e9c]
signal result_u8_value_MUX_uxn_opcodes_h_l368_c7_3e9c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l368_c7_3e9c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l368_c7_3e9c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l368_c7_3e9c_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l368_c7_3e9c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_3e9c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_3e9c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_3e9c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_3e9c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l368_c7_3e9c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_3e9c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_3e9c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_3e9c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_3e9c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l368_c7_3e9c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_3e9c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_3e9c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_3e9c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_3e9c_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l368_c7_3e9c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_3e9c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_3e9c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_3e9c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_3e9c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l371_c11_7e11]
signal BIN_OP_EQ_uxn_opcodes_h_l371_c11_7e11_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l371_c11_7e11_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l371_c11_7e11_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l371_c7_6cf3]
signal n16_MUX_uxn_opcodes_h_l371_c7_6cf3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l371_c7_6cf3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l371_c7_6cf3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l371_c7_6cf3_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l371_c7_6cf3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_6cf3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_6cf3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_6cf3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_6cf3_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l371_c7_6cf3]
signal result_u8_value_MUX_uxn_opcodes_h_l371_c7_6cf3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l371_c7_6cf3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l371_c7_6cf3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l371_c7_6cf3_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l371_c7_6cf3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_6cf3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_6cf3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_6cf3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_6cf3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l371_c7_6cf3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_6cf3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_6cf3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_6cf3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_6cf3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l371_c7_6cf3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_6cf3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_6cf3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_6cf3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_6cf3_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l371_c7_6cf3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_6cf3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_6cf3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_6cf3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_6cf3_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l376_c11_3f47]
signal BIN_OP_EQ_uxn_opcodes_h_l376_c11_3f47_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l376_c11_3f47_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l376_c11_3f47_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l376_c7_d9fb]
signal n16_MUX_uxn_opcodes_h_l376_c7_d9fb_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l376_c7_d9fb_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l376_c7_d9fb_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l376_c7_d9fb_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l376_c7_d9fb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_d9fb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_d9fb_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_d9fb_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_d9fb_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l376_c7_d9fb]
signal result_u8_value_MUX_uxn_opcodes_h_l376_c7_d9fb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l376_c7_d9fb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l376_c7_d9fb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l376_c7_d9fb_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l376_c7_d9fb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_d9fb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_d9fb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_d9fb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_d9fb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l376_c7_d9fb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_d9fb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_d9fb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_d9fb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_d9fb_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l376_c7_d9fb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_d9fb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_d9fb_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_d9fb_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_d9fb_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l376_c7_d9fb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_d9fb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_d9fb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_d9fb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_d9fb_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l379_c11_8334]
signal BIN_OP_EQ_uxn_opcodes_h_l379_c11_8334_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l379_c11_8334_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l379_c11_8334_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l379_c7_640a]
signal n16_MUX_uxn_opcodes_h_l379_c7_640a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l379_c7_640a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l379_c7_640a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l379_c7_640a_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l379_c7_640a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_640a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_640a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_640a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_640a_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l379_c7_640a]
signal result_u8_value_MUX_uxn_opcodes_h_l379_c7_640a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l379_c7_640a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l379_c7_640a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l379_c7_640a_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l379_c7_640a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_640a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_640a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_640a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_640a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l379_c7_640a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_640a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_640a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_640a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_640a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l379_c7_640a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_640a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_640a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_640a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_640a_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l379_c7_640a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_640a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_640a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_640a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_640a_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l380_c3_707b]
signal BIN_OP_OR_uxn_opcodes_h_l380_c3_707b_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l380_c3_707b_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l380_c3_707b_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l382_c30_5d4c]
signal sp_relative_shift_uxn_opcodes_h_l382_c30_5d4c_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l382_c30_5d4c_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l382_c30_5d4c_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l382_c30_5d4c_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l387_c11_9c69]
signal BIN_OP_EQ_uxn_opcodes_h_l387_c11_9c69_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l387_c11_9c69_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l387_c11_9c69_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l387_c7_5463]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_5463_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_5463_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_5463_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_5463_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l387_c7_5463]
signal result_u8_value_MUX_uxn_opcodes_h_l387_c7_5463_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l387_c7_5463_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l387_c7_5463_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l387_c7_5463_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l387_c7_5463]
signal result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_5463_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_5463_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_5463_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_5463_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l387_c7_5463]
signal result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_5463_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_5463_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_5463_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_5463_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l387_c7_5463]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_5463_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_5463_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_5463_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_5463_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l392_c11_e3a4]
signal BIN_OP_EQ_uxn_opcodes_h_l392_c11_e3a4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l392_c11_e3a4_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l392_c11_e3a4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l392_c7_5f33]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_5f33_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_5f33_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_5f33_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_5f33_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l392_c7_5f33]
signal result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_5f33_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_5f33_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_5f33_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_5f33_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l392_c7_5f33]
signal result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_5f33_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_5f33_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_5f33_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_5f33_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l392_c7_5f33]
signal result_u8_value_MUX_uxn_opcodes_h_l392_c7_5f33_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l392_c7_5f33_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l392_c7_5f33_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l392_c7_5f33_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l396_c11_711c]
signal BIN_OP_EQ_uxn_opcodes_h_l396_c11_711c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l396_c11_711c_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l396_c11_711c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l396_c7_d38d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_d38d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_d38d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_d38d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_d38d_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l396_c7_d38d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_d38d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_d38d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_d38d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_d38d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l396_c7_d38d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_d38d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_d38d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_d38d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_d38d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l396_c7_d38d]
signal result_u8_value_MUX_uxn_opcodes_h_l396_c7_d38d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l396_c7_d38d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l396_c7_d38d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l396_c7_d38d_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l398_c31_ff86]
signal CONST_SR_8_uxn_opcodes_h_l398_c31_ff86_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l398_c31_ff86_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l400_c11_af80]
signal BIN_OP_EQ_uxn_opcodes_h_l400_c11_af80_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l400_c11_af80_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l400_c11_af80_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l400_c7_e177]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_e177_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_e177_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_e177_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_e177_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l400_c7_e177]
signal result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_e177_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_e177_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_e177_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_e177_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l400_c7_e177]
signal result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_e177_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_e177_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_e177_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_e177_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l400_c7_e177]
signal result_u8_value_MUX_uxn_opcodes_h_l400_c7_e177_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l400_c7_e177_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l400_c7_e177_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l400_c7_e177_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l404_c11_1228]
signal BIN_OP_EQ_uxn_opcodes_h_l404_c11_1228_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l404_c11_1228_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l404_c11_1228_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l404_c7_1de4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_1de4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_1de4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_1de4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_1de4_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l404_c7_1de4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_1de4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_1de4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_1de4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_1de4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l404_c7_1de4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_1de4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_1de4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_1de4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_1de4_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l404_c7_1de4]
signal result_u8_value_MUX_uxn_opcodes_h_l404_c7_1de4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l404_c7_1de4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l404_c7_1de4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l404_c7_1de4_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l408_c11_0ea0]
signal BIN_OP_EQ_uxn_opcodes_h_l408_c11_0ea0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l408_c11_0ea0_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l408_c11_0ea0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l408_c7_7285]
signal result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_7285_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_7285_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_7285_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_7285_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l408_c7_7285]
signal result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_7285_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_7285_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_7285_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_7285_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l373_l358_DUPLICATE_0833
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l373_l358_DUPLICATE_0833_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l373_l358_DUPLICATE_0833_return_output : unsigned(15 downto 0);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l406_l390_DUPLICATE_1cb9
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l406_l390_DUPLICATE_1cb9_x : unsigned(15 downto 0);
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l406_l390_DUPLICATE_1cb9_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l348_c6_9568
BIN_OP_EQ_uxn_opcodes_h_l348_c6_9568 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l348_c6_9568_left,
BIN_OP_EQ_uxn_opcodes_h_l348_c6_9568_right,
BIN_OP_EQ_uxn_opcodes_h_l348_c6_9568_return_output);

-- n16_MUX_uxn_opcodes_h_l348_c2_28f2
n16_MUX_uxn_opcodes_h_l348_c2_28f2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l348_c2_28f2_cond,
n16_MUX_uxn_opcodes_h_l348_c2_28f2_iftrue,
n16_MUX_uxn_opcodes_h_l348_c2_28f2_iffalse,
n16_MUX_uxn_opcodes_h_l348_c2_28f2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_28f2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_28f2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_28f2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_28f2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_28f2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_28f2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l348_c2_28f2
result_u8_value_MUX_uxn_opcodes_h_l348_c2_28f2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l348_c2_28f2_cond,
result_u8_value_MUX_uxn_opcodes_h_l348_c2_28f2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l348_c2_28f2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l348_c2_28f2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_28f2
result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_28f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_28f2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_28f2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_28f2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_28f2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_28f2
result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_28f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_28f2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_28f2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_28f2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_28f2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_28f2
result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_28f2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_28f2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_28f2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_28f2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_28f2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_28f2
result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_28f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_28f2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_28f2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_28f2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_28f2_return_output);

-- t16_MUX_uxn_opcodes_h_l348_c2_28f2
t16_MUX_uxn_opcodes_h_l348_c2_28f2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l348_c2_28f2_cond,
t16_MUX_uxn_opcodes_h_l348_c2_28f2_iftrue,
t16_MUX_uxn_opcodes_h_l348_c2_28f2_iffalse,
t16_MUX_uxn_opcodes_h_l348_c2_28f2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l353_c11_eef9
BIN_OP_EQ_uxn_opcodes_h_l353_c11_eef9 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l353_c11_eef9_left,
BIN_OP_EQ_uxn_opcodes_h_l353_c11_eef9_right,
BIN_OP_EQ_uxn_opcodes_h_l353_c11_eef9_return_output);

-- n16_MUX_uxn_opcodes_h_l353_c7_3e10
n16_MUX_uxn_opcodes_h_l353_c7_3e10 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l353_c7_3e10_cond,
n16_MUX_uxn_opcodes_h_l353_c7_3e10_iftrue,
n16_MUX_uxn_opcodes_h_l353_c7_3e10_iffalse,
n16_MUX_uxn_opcodes_h_l353_c7_3e10_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_3e10
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_3e10 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_3e10_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_3e10_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_3e10_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_3e10_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l353_c7_3e10
result_u8_value_MUX_uxn_opcodes_h_l353_c7_3e10 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l353_c7_3e10_cond,
result_u8_value_MUX_uxn_opcodes_h_l353_c7_3e10_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l353_c7_3e10_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l353_c7_3e10_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_3e10
result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_3e10 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_3e10_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_3e10_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_3e10_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_3e10_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_3e10
result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_3e10 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_3e10_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_3e10_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_3e10_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_3e10_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_3e10
result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_3e10 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_3e10_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_3e10_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_3e10_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_3e10_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_3e10
result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_3e10 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_3e10_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_3e10_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_3e10_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_3e10_return_output);

-- t16_MUX_uxn_opcodes_h_l353_c7_3e10
t16_MUX_uxn_opcodes_h_l353_c7_3e10 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l353_c7_3e10_cond,
t16_MUX_uxn_opcodes_h_l353_c7_3e10_iftrue,
t16_MUX_uxn_opcodes_h_l353_c7_3e10_iffalse,
t16_MUX_uxn_opcodes_h_l353_c7_3e10_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l356_c11_eb4a
BIN_OP_EQ_uxn_opcodes_h_l356_c11_eb4a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l356_c11_eb4a_left,
BIN_OP_EQ_uxn_opcodes_h_l356_c11_eb4a_right,
BIN_OP_EQ_uxn_opcodes_h_l356_c11_eb4a_return_output);

-- n16_MUX_uxn_opcodes_h_l356_c7_73a7
n16_MUX_uxn_opcodes_h_l356_c7_73a7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l356_c7_73a7_cond,
n16_MUX_uxn_opcodes_h_l356_c7_73a7_iftrue,
n16_MUX_uxn_opcodes_h_l356_c7_73a7_iffalse,
n16_MUX_uxn_opcodes_h_l356_c7_73a7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_73a7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_73a7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_73a7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_73a7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_73a7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_73a7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l356_c7_73a7
result_u8_value_MUX_uxn_opcodes_h_l356_c7_73a7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l356_c7_73a7_cond,
result_u8_value_MUX_uxn_opcodes_h_l356_c7_73a7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l356_c7_73a7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l356_c7_73a7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_73a7
result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_73a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_73a7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_73a7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_73a7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_73a7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_73a7
result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_73a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_73a7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_73a7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_73a7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_73a7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_73a7
result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_73a7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_73a7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_73a7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_73a7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_73a7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_73a7
result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_73a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_73a7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_73a7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_73a7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_73a7_return_output);

-- t16_MUX_uxn_opcodes_h_l356_c7_73a7
t16_MUX_uxn_opcodes_h_l356_c7_73a7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l356_c7_73a7_cond,
t16_MUX_uxn_opcodes_h_l356_c7_73a7_iftrue,
t16_MUX_uxn_opcodes_h_l356_c7_73a7_iffalse,
t16_MUX_uxn_opcodes_h_l356_c7_73a7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l361_c11_2266
BIN_OP_EQ_uxn_opcodes_h_l361_c11_2266 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l361_c11_2266_left,
BIN_OP_EQ_uxn_opcodes_h_l361_c11_2266_right,
BIN_OP_EQ_uxn_opcodes_h_l361_c11_2266_return_output);

-- n16_MUX_uxn_opcodes_h_l361_c7_5c31
n16_MUX_uxn_opcodes_h_l361_c7_5c31 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l361_c7_5c31_cond,
n16_MUX_uxn_opcodes_h_l361_c7_5c31_iftrue,
n16_MUX_uxn_opcodes_h_l361_c7_5c31_iffalse,
n16_MUX_uxn_opcodes_h_l361_c7_5c31_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_5c31
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_5c31 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_5c31_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_5c31_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_5c31_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_5c31_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l361_c7_5c31
result_u8_value_MUX_uxn_opcodes_h_l361_c7_5c31 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l361_c7_5c31_cond,
result_u8_value_MUX_uxn_opcodes_h_l361_c7_5c31_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l361_c7_5c31_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l361_c7_5c31_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_5c31
result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_5c31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_5c31_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_5c31_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_5c31_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_5c31_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_5c31
result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_5c31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_5c31_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_5c31_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_5c31_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_5c31_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_5c31
result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_5c31 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_5c31_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_5c31_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_5c31_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_5c31_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_5c31
result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_5c31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_5c31_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_5c31_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_5c31_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_5c31_return_output);

-- t16_MUX_uxn_opcodes_h_l361_c7_5c31
t16_MUX_uxn_opcodes_h_l361_c7_5c31 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l361_c7_5c31_cond,
t16_MUX_uxn_opcodes_h_l361_c7_5c31_iftrue,
t16_MUX_uxn_opcodes_h_l361_c7_5c31_iffalse,
t16_MUX_uxn_opcodes_h_l361_c7_5c31_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l364_c11_6b38
BIN_OP_EQ_uxn_opcodes_h_l364_c11_6b38 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l364_c11_6b38_left,
BIN_OP_EQ_uxn_opcodes_h_l364_c11_6b38_right,
BIN_OP_EQ_uxn_opcodes_h_l364_c11_6b38_return_output);

-- n16_MUX_uxn_opcodes_h_l364_c7_4ad9
n16_MUX_uxn_opcodes_h_l364_c7_4ad9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l364_c7_4ad9_cond,
n16_MUX_uxn_opcodes_h_l364_c7_4ad9_iftrue,
n16_MUX_uxn_opcodes_h_l364_c7_4ad9_iffalse,
n16_MUX_uxn_opcodes_h_l364_c7_4ad9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_4ad9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_4ad9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_4ad9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_4ad9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_4ad9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_4ad9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l364_c7_4ad9
result_u8_value_MUX_uxn_opcodes_h_l364_c7_4ad9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l364_c7_4ad9_cond,
result_u8_value_MUX_uxn_opcodes_h_l364_c7_4ad9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l364_c7_4ad9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l364_c7_4ad9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_4ad9
result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_4ad9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_4ad9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_4ad9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_4ad9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_4ad9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_4ad9
result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_4ad9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_4ad9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_4ad9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_4ad9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_4ad9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_4ad9
result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_4ad9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_4ad9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_4ad9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_4ad9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_4ad9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_4ad9
result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_4ad9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_4ad9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_4ad9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_4ad9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_4ad9_return_output);

-- t16_MUX_uxn_opcodes_h_l364_c7_4ad9
t16_MUX_uxn_opcodes_h_l364_c7_4ad9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l364_c7_4ad9_cond,
t16_MUX_uxn_opcodes_h_l364_c7_4ad9_iftrue,
t16_MUX_uxn_opcodes_h_l364_c7_4ad9_iffalse,
t16_MUX_uxn_opcodes_h_l364_c7_4ad9_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l365_c3_78ab
BIN_OP_OR_uxn_opcodes_h_l365_c3_78ab : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l365_c3_78ab_left,
BIN_OP_OR_uxn_opcodes_h_l365_c3_78ab_right,
BIN_OP_OR_uxn_opcodes_h_l365_c3_78ab_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l368_c11_7ea2
BIN_OP_EQ_uxn_opcodes_h_l368_c11_7ea2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l368_c11_7ea2_left,
BIN_OP_EQ_uxn_opcodes_h_l368_c11_7ea2_right,
BIN_OP_EQ_uxn_opcodes_h_l368_c11_7ea2_return_output);

-- n16_MUX_uxn_opcodes_h_l368_c7_3e9c
n16_MUX_uxn_opcodes_h_l368_c7_3e9c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l368_c7_3e9c_cond,
n16_MUX_uxn_opcodes_h_l368_c7_3e9c_iftrue,
n16_MUX_uxn_opcodes_h_l368_c7_3e9c_iffalse,
n16_MUX_uxn_opcodes_h_l368_c7_3e9c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_3e9c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_3e9c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_3e9c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_3e9c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_3e9c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_3e9c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l368_c7_3e9c
result_u8_value_MUX_uxn_opcodes_h_l368_c7_3e9c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l368_c7_3e9c_cond,
result_u8_value_MUX_uxn_opcodes_h_l368_c7_3e9c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l368_c7_3e9c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l368_c7_3e9c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_3e9c
result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_3e9c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_3e9c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_3e9c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_3e9c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_3e9c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_3e9c
result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_3e9c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_3e9c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_3e9c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_3e9c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_3e9c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_3e9c
result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_3e9c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_3e9c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_3e9c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_3e9c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_3e9c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_3e9c
result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_3e9c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_3e9c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_3e9c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_3e9c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_3e9c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l371_c11_7e11
BIN_OP_EQ_uxn_opcodes_h_l371_c11_7e11 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l371_c11_7e11_left,
BIN_OP_EQ_uxn_opcodes_h_l371_c11_7e11_right,
BIN_OP_EQ_uxn_opcodes_h_l371_c11_7e11_return_output);

-- n16_MUX_uxn_opcodes_h_l371_c7_6cf3
n16_MUX_uxn_opcodes_h_l371_c7_6cf3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l371_c7_6cf3_cond,
n16_MUX_uxn_opcodes_h_l371_c7_6cf3_iftrue,
n16_MUX_uxn_opcodes_h_l371_c7_6cf3_iffalse,
n16_MUX_uxn_opcodes_h_l371_c7_6cf3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_6cf3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_6cf3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_6cf3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_6cf3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_6cf3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_6cf3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l371_c7_6cf3
result_u8_value_MUX_uxn_opcodes_h_l371_c7_6cf3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l371_c7_6cf3_cond,
result_u8_value_MUX_uxn_opcodes_h_l371_c7_6cf3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l371_c7_6cf3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l371_c7_6cf3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_6cf3
result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_6cf3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_6cf3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_6cf3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_6cf3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_6cf3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_6cf3
result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_6cf3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_6cf3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_6cf3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_6cf3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_6cf3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_6cf3
result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_6cf3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_6cf3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_6cf3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_6cf3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_6cf3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_6cf3
result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_6cf3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_6cf3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_6cf3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_6cf3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_6cf3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l376_c11_3f47
BIN_OP_EQ_uxn_opcodes_h_l376_c11_3f47 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l376_c11_3f47_left,
BIN_OP_EQ_uxn_opcodes_h_l376_c11_3f47_right,
BIN_OP_EQ_uxn_opcodes_h_l376_c11_3f47_return_output);

-- n16_MUX_uxn_opcodes_h_l376_c7_d9fb
n16_MUX_uxn_opcodes_h_l376_c7_d9fb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l376_c7_d9fb_cond,
n16_MUX_uxn_opcodes_h_l376_c7_d9fb_iftrue,
n16_MUX_uxn_opcodes_h_l376_c7_d9fb_iffalse,
n16_MUX_uxn_opcodes_h_l376_c7_d9fb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_d9fb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_d9fb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_d9fb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_d9fb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_d9fb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_d9fb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l376_c7_d9fb
result_u8_value_MUX_uxn_opcodes_h_l376_c7_d9fb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l376_c7_d9fb_cond,
result_u8_value_MUX_uxn_opcodes_h_l376_c7_d9fb_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l376_c7_d9fb_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l376_c7_d9fb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_d9fb
result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_d9fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_d9fb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_d9fb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_d9fb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_d9fb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_d9fb
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_d9fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_d9fb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_d9fb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_d9fb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_d9fb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_d9fb
result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_d9fb : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_d9fb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_d9fb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_d9fb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_d9fb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_d9fb
result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_d9fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_d9fb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_d9fb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_d9fb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_d9fb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l379_c11_8334
BIN_OP_EQ_uxn_opcodes_h_l379_c11_8334 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l379_c11_8334_left,
BIN_OP_EQ_uxn_opcodes_h_l379_c11_8334_right,
BIN_OP_EQ_uxn_opcodes_h_l379_c11_8334_return_output);

-- n16_MUX_uxn_opcodes_h_l379_c7_640a
n16_MUX_uxn_opcodes_h_l379_c7_640a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l379_c7_640a_cond,
n16_MUX_uxn_opcodes_h_l379_c7_640a_iftrue,
n16_MUX_uxn_opcodes_h_l379_c7_640a_iffalse,
n16_MUX_uxn_opcodes_h_l379_c7_640a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_640a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_640a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_640a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_640a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_640a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_640a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l379_c7_640a
result_u8_value_MUX_uxn_opcodes_h_l379_c7_640a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l379_c7_640a_cond,
result_u8_value_MUX_uxn_opcodes_h_l379_c7_640a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l379_c7_640a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l379_c7_640a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_640a
result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_640a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_640a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_640a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_640a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_640a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_640a
result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_640a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_640a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_640a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_640a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_640a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_640a
result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_640a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_640a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_640a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_640a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_640a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_640a
result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_640a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_640a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_640a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_640a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_640a_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l380_c3_707b
BIN_OP_OR_uxn_opcodes_h_l380_c3_707b : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l380_c3_707b_left,
BIN_OP_OR_uxn_opcodes_h_l380_c3_707b_right,
BIN_OP_OR_uxn_opcodes_h_l380_c3_707b_return_output);

-- sp_relative_shift_uxn_opcodes_h_l382_c30_5d4c
sp_relative_shift_uxn_opcodes_h_l382_c30_5d4c : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l382_c30_5d4c_ins,
sp_relative_shift_uxn_opcodes_h_l382_c30_5d4c_x,
sp_relative_shift_uxn_opcodes_h_l382_c30_5d4c_y,
sp_relative_shift_uxn_opcodes_h_l382_c30_5d4c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l387_c11_9c69
BIN_OP_EQ_uxn_opcodes_h_l387_c11_9c69 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l387_c11_9c69_left,
BIN_OP_EQ_uxn_opcodes_h_l387_c11_9c69_right,
BIN_OP_EQ_uxn_opcodes_h_l387_c11_9c69_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_5463
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_5463 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_5463_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_5463_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_5463_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_5463_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l387_c7_5463
result_u8_value_MUX_uxn_opcodes_h_l387_c7_5463 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l387_c7_5463_cond,
result_u8_value_MUX_uxn_opcodes_h_l387_c7_5463_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l387_c7_5463_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l387_c7_5463_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_5463
result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_5463 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_5463_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_5463_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_5463_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_5463_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_5463
result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_5463 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_5463_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_5463_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_5463_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_5463_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_5463
result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_5463 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_5463_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_5463_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_5463_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_5463_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l392_c11_e3a4
BIN_OP_EQ_uxn_opcodes_h_l392_c11_e3a4 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l392_c11_e3a4_left,
BIN_OP_EQ_uxn_opcodes_h_l392_c11_e3a4_right,
BIN_OP_EQ_uxn_opcodes_h_l392_c11_e3a4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_5f33
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_5f33 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_5f33_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_5f33_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_5f33_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_5f33_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_5f33
result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_5f33 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_5f33_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_5f33_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_5f33_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_5f33_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_5f33
result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_5f33 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_5f33_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_5f33_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_5f33_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_5f33_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l392_c7_5f33
result_u8_value_MUX_uxn_opcodes_h_l392_c7_5f33 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l392_c7_5f33_cond,
result_u8_value_MUX_uxn_opcodes_h_l392_c7_5f33_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l392_c7_5f33_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l392_c7_5f33_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l396_c11_711c
BIN_OP_EQ_uxn_opcodes_h_l396_c11_711c : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l396_c11_711c_left,
BIN_OP_EQ_uxn_opcodes_h_l396_c11_711c_right,
BIN_OP_EQ_uxn_opcodes_h_l396_c11_711c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_d38d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_d38d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_d38d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_d38d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_d38d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_d38d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_d38d
result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_d38d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_d38d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_d38d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_d38d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_d38d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_d38d
result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_d38d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_d38d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_d38d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_d38d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_d38d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l396_c7_d38d
result_u8_value_MUX_uxn_opcodes_h_l396_c7_d38d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l396_c7_d38d_cond,
result_u8_value_MUX_uxn_opcodes_h_l396_c7_d38d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l396_c7_d38d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l396_c7_d38d_return_output);

-- CONST_SR_8_uxn_opcodes_h_l398_c31_ff86
CONST_SR_8_uxn_opcodes_h_l398_c31_ff86 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l398_c31_ff86_x,
CONST_SR_8_uxn_opcodes_h_l398_c31_ff86_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l400_c11_af80
BIN_OP_EQ_uxn_opcodes_h_l400_c11_af80 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l400_c11_af80_left,
BIN_OP_EQ_uxn_opcodes_h_l400_c11_af80_right,
BIN_OP_EQ_uxn_opcodes_h_l400_c11_af80_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_e177
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_e177 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_e177_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_e177_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_e177_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_e177_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_e177
result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_e177 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_e177_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_e177_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_e177_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_e177_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_e177
result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_e177 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_e177_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_e177_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_e177_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_e177_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l400_c7_e177
result_u8_value_MUX_uxn_opcodes_h_l400_c7_e177 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l400_c7_e177_cond,
result_u8_value_MUX_uxn_opcodes_h_l400_c7_e177_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l400_c7_e177_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l400_c7_e177_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l404_c11_1228
BIN_OP_EQ_uxn_opcodes_h_l404_c11_1228 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l404_c11_1228_left,
BIN_OP_EQ_uxn_opcodes_h_l404_c11_1228_right,
BIN_OP_EQ_uxn_opcodes_h_l404_c11_1228_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_1de4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_1de4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_1de4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_1de4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_1de4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_1de4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_1de4
result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_1de4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_1de4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_1de4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_1de4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_1de4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_1de4
result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_1de4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_1de4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_1de4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_1de4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_1de4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l404_c7_1de4
result_u8_value_MUX_uxn_opcodes_h_l404_c7_1de4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l404_c7_1de4_cond,
result_u8_value_MUX_uxn_opcodes_h_l404_c7_1de4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l404_c7_1de4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l404_c7_1de4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l408_c11_0ea0
BIN_OP_EQ_uxn_opcodes_h_l408_c11_0ea0 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l408_c11_0ea0_left,
BIN_OP_EQ_uxn_opcodes_h_l408_c11_0ea0_right,
BIN_OP_EQ_uxn_opcodes_h_l408_c11_0ea0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_7285
result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_7285 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_7285_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_7285_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_7285_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_7285_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_7285
result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_7285 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_7285_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_7285_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_7285_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_7285_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l373_l358_DUPLICATE_0833
CONST_SL_8_uint16_t_uxn_opcodes_h_l373_l358_DUPLICATE_0833 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l373_l358_DUPLICATE_0833_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l373_l358_DUPLICATE_0833_return_output);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l406_l390_DUPLICATE_1cb9
CONST_SR_8_uint16_t_uxn_opcodes_h_l406_l390_DUPLICATE_1cb9 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uint16_t_uxn_opcodes_h_l406_l390_DUPLICATE_1cb9_x,
CONST_SR_8_uint16_t_uxn_opcodes_h_l406_l390_DUPLICATE_1cb9_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l348_c6_9568_return_output,
 n16_MUX_uxn_opcodes_h_l348_c2_28f2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_28f2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l348_c2_28f2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_28f2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_28f2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_28f2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_28f2_return_output,
 t16_MUX_uxn_opcodes_h_l348_c2_28f2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l353_c11_eef9_return_output,
 n16_MUX_uxn_opcodes_h_l353_c7_3e10_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_3e10_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l353_c7_3e10_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_3e10_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_3e10_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_3e10_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_3e10_return_output,
 t16_MUX_uxn_opcodes_h_l353_c7_3e10_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l356_c11_eb4a_return_output,
 n16_MUX_uxn_opcodes_h_l356_c7_73a7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_73a7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l356_c7_73a7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_73a7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_73a7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_73a7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_73a7_return_output,
 t16_MUX_uxn_opcodes_h_l356_c7_73a7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l361_c11_2266_return_output,
 n16_MUX_uxn_opcodes_h_l361_c7_5c31_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_5c31_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l361_c7_5c31_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_5c31_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_5c31_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_5c31_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_5c31_return_output,
 t16_MUX_uxn_opcodes_h_l361_c7_5c31_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l364_c11_6b38_return_output,
 n16_MUX_uxn_opcodes_h_l364_c7_4ad9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_4ad9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l364_c7_4ad9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_4ad9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_4ad9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_4ad9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_4ad9_return_output,
 t16_MUX_uxn_opcodes_h_l364_c7_4ad9_return_output,
 BIN_OP_OR_uxn_opcodes_h_l365_c3_78ab_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l368_c11_7ea2_return_output,
 n16_MUX_uxn_opcodes_h_l368_c7_3e9c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_3e9c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l368_c7_3e9c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_3e9c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_3e9c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_3e9c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_3e9c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l371_c11_7e11_return_output,
 n16_MUX_uxn_opcodes_h_l371_c7_6cf3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_6cf3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l371_c7_6cf3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_6cf3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_6cf3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_6cf3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_6cf3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l376_c11_3f47_return_output,
 n16_MUX_uxn_opcodes_h_l376_c7_d9fb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_d9fb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l376_c7_d9fb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_d9fb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_d9fb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_d9fb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_d9fb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l379_c11_8334_return_output,
 n16_MUX_uxn_opcodes_h_l379_c7_640a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_640a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l379_c7_640a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_640a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_640a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_640a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_640a_return_output,
 BIN_OP_OR_uxn_opcodes_h_l380_c3_707b_return_output,
 sp_relative_shift_uxn_opcodes_h_l382_c30_5d4c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l387_c11_9c69_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_5463_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l387_c7_5463_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_5463_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_5463_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_5463_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l392_c11_e3a4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_5f33_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_5f33_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_5f33_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l392_c7_5f33_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l396_c11_711c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_d38d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_d38d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_d38d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l396_c7_d38d_return_output,
 CONST_SR_8_uxn_opcodes_h_l398_c31_ff86_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l400_c11_af80_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_e177_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_e177_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_e177_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l400_c7_e177_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l404_c11_1228_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_1de4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_1de4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_1de4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l404_c7_1de4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l408_c11_0ea0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_7285_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_7285_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l373_l358_DUPLICATE_0833_return_output,
 CONST_SR_8_uint16_t_uxn_opcodes_h_l406_l390_DUPLICATE_1cb9_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l348_c6_9568_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l348_c6_9568_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l348_c6_9568_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l348_c2_28f2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l348_c2_28f2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l353_c7_3e10_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l348_c2_28f2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l348_c2_28f2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_28f2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l350_c3_8331 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_28f2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_3e10_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_28f2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_28f2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l348_c2_28f2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l348_c2_28f2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l353_c7_3e10_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l348_c2_28f2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l348_c2_28f2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_28f2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_28f2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_3e10_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_28f2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_28f2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_28f2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_28f2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_3e10_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_28f2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_28f2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_28f2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_28f2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_3e10_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_28f2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_28f2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_28f2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_28f2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_3e10_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_28f2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_28f2_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l348_c2_28f2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l348_c2_28f2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l353_c7_3e10_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l348_c2_28f2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l348_c2_28f2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_eef9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_eef9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_eef9_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l353_c7_3e10_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l353_c7_3e10_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l356_c7_73a7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l353_c7_3e10_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_3e10_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l354_c3_3c7a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_3e10_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_73a7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_3e10_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l353_c7_3e10_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l353_c7_3e10_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l356_c7_73a7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l353_c7_3e10_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_3e10_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_3e10_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_73a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_3e10_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_3e10_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_3e10_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_73a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_3e10_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_3e10_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_3e10_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_73a7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_3e10_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_3e10_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_3e10_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_73a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_3e10_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l353_c7_3e10_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l353_c7_3e10_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l356_c7_73a7_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l353_c7_3e10_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_eb4a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_eb4a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_eb4a_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l356_c7_73a7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l356_c7_73a7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l361_c7_5c31_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l356_c7_73a7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_73a7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l359_c3_2e1e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_73a7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_5c31_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_73a7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l356_c7_73a7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l356_c7_73a7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l361_c7_5c31_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l356_c7_73a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_73a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_73a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_5c31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_73a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_73a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_73a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_5c31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_73a7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_73a7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_73a7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_5c31_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_73a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_73a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_73a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_5c31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_73a7_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l356_c7_73a7_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l356_c7_73a7_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l361_c7_5c31_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l356_c7_73a7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_2266_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_2266_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_2266_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l361_c7_5c31_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l361_c7_5c31_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l364_c7_4ad9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l361_c7_5c31_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_5c31_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l362_c3_e5ec : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_5c31_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_4ad9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_5c31_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l361_c7_5c31_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l361_c7_5c31_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l364_c7_4ad9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l361_c7_5c31_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_5c31_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_5c31_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_4ad9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_5c31_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_5c31_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_5c31_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_4ad9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_5c31_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_5c31_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_5c31_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_4ad9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_5c31_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_5c31_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_5c31_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_4ad9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_5c31_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l361_c7_5c31_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l361_c7_5c31_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l364_c7_4ad9_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l361_c7_5c31_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_6b38_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_6b38_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_6b38_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l364_c7_4ad9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l364_c7_4ad9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l368_c7_3e9c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l364_c7_4ad9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_4ad9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l366_c3_d4cf : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_4ad9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_3e9c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_4ad9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l364_c7_4ad9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l364_c7_4ad9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_3e9c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l364_c7_4ad9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_4ad9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_4ad9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_3e9c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_4ad9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_4ad9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_4ad9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_3e9c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_4ad9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_4ad9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_4ad9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_3e9c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_4ad9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_4ad9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_4ad9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_3e9c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_4ad9_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l364_c7_4ad9_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l364_c7_4ad9_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l364_c7_4ad9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l365_c3_78ab_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l365_c3_78ab_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l365_c3_78ab_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_7ea2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_7ea2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_7ea2_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l368_c7_3e9c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l368_c7_3e9c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l371_c7_6cf3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l368_c7_3e9c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_3e9c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l369_c3_f3f8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_3e9c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_6cf3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_3e9c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_3e9c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_3e9c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l371_c7_6cf3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_3e9c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_3e9c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_3e9c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_6cf3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_3e9c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_3e9c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_3e9c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_6cf3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_3e9c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_3e9c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_3e9c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_6cf3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_3e9c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_3e9c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_3e9c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_6cf3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_3e9c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l371_c11_7e11_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l371_c11_7e11_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l371_c11_7e11_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l371_c7_6cf3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l371_c7_6cf3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l376_c7_d9fb_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l371_c7_6cf3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_6cf3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l374_c3_5a47 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_6cf3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_d9fb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_6cf3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l371_c7_6cf3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l371_c7_6cf3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_d9fb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l371_c7_6cf3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_6cf3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_6cf3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_d9fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_6cf3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_6cf3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_6cf3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_d9fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_6cf3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_6cf3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_6cf3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_d9fb_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_6cf3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_6cf3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_6cf3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_d9fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_6cf3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_3f47_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_3f47_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_3f47_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l376_c7_d9fb_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l376_c7_d9fb_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l379_c7_640a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l376_c7_d9fb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_d9fb_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l377_c3_1925 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_d9fb_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_640a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_d9fb_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_d9fb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_d9fb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l379_c7_640a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_d9fb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_d9fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_d9fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_640a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_d9fb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_d9fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_d9fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_640a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_d9fb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_d9fb_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_d9fb_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_640a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_d9fb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_d9fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_d9fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_640a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_d9fb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l379_c11_8334_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l379_c11_8334_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l379_c11_8334_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l379_c7_640a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l379_c7_640a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l379_c7_640a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_640a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l384_c3_e27f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_640a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_5463_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_640a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l379_c7_640a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l379_c7_640a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l387_c7_5463_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l379_c7_640a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_640a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_640a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_5463_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_640a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_640a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_640a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_5463_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_640a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_640a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_640a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_640a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_640a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_640a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_5463_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_640a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l380_c3_707b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l380_c3_707b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l380_c3_707b_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l382_c30_5d4c_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l382_c30_5d4c_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l382_c30_5d4c_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l382_c30_5d4c_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l385_c21_60c2_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_9c69_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_9c69_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_9c69_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_5463_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l389_c3_1dec : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_5463_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_5f33_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_5463_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l387_c7_5463_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l387_c7_5463_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l392_c7_5f33_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l387_c7_5463_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_5463_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_5463_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_5f33_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_5463_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_5463_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_5463_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_5f33_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_5463_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_5463_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_5463_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_5463_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_e3a4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_e3a4_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_e3a4_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_5f33_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l393_c3_c028 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_5f33_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_d38d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_5f33_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_5f33_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_5f33_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_d38d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_5f33_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_5f33_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_5f33_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_d38d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_5f33_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l392_c7_5f33_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l392_c7_5f33_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l396_c7_d38d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l392_c7_5f33_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l394_c21_e1c2_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l396_c11_711c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l396_c11_711c_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l396_c11_711c_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_d38d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l397_c3_7392 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_d38d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_e177_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_d38d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_d38d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_d38d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_e177_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_d38d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_d38d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_d38d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_e177_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_d38d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l396_c7_d38d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l396_c7_d38d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l400_c7_e177_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l396_c7_d38d_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l398_c31_ff86_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l398_c31_ff86_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l398_c21_896f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_af80_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_af80_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_af80_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_e177_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l401_c3_0cf3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_e177_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_1de4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_e177_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_e177_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_e177_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_1de4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_e177_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_e177_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_e177_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_1de4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_e177_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l400_c7_e177_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l400_c7_e177_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l404_c7_1de4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l400_c7_e177_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l402_c21_0b99_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l404_c11_1228_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l404_c11_1228_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l404_c11_1228_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_1de4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l405_c3_f248 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_1de4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l404_c7_1de4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_1de4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_1de4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_1de4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_7285_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_1de4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_1de4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_1de4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_7285_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_1de4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l404_c7_1de4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l404_c7_1de4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l404_c7_1de4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l408_c11_0ea0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l408_c11_0ea0_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l408_c11_0ea0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_7285_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_7285_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_7285_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_7285_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_7285_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_7285_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l353_l376_l356_l404_l361_l368_l371_l364_l348_DUPLICATE_907f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l353_l376_l396_l356_l404_l408_l361_l368_l400_l371_l387_l364_l348_l392_DUPLICATE_a111_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l379_l353_l376_l356_l361_l368_l371_l364_l348_DUPLICATE_a249_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l353_l376_l356_l361_l368_l371_l387_l364_l348_DUPLICATE_44f8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l379_l353_l376_l396_l356_l404_l408_l361_l368_l400_l371_l387_l364_l392_DUPLICATE_6318_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l357_l365_l372_l380_DUPLICATE_7536_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l373_l358_DUPLICATE_0833_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l373_l358_DUPLICATE_0833_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l406_l390_DUPLICATE_1cb9_x : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l406_l390_DUPLICATE_1cb9_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l406_l390_DUPLICATE_7248_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l344_l413_DUPLICATE_3f69_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l393_c3_c028 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_5f33_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l393_c3_c028;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l401_c3_0cf3 := resize(to_unsigned(5, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_e177_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l401_c3_0cf3;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_7285_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l405_c3_f248 := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_1de4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l405_c3_f248;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l362_c3_e5ec := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_5c31_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l362_c3_e5ec;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l371_c11_7e11_right := to_unsigned(6, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_5463_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l382_c30_5d4c_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_2266_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l350_c3_8331 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_28f2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l350_c3_8331;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_6b38_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l354_c3_3c7a := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_3e10_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l354_c3_3c7a;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_28f2_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l382_c30_5d4c_y := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l396_c11_711c_right := to_unsigned(11, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_eb4a_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_e3a4_right := to_unsigned(10, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l389_c3_1dec := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_5463_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l389_c3_1dec;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l404_c11_1228_right := to_unsigned(13, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_9c69_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_eef9_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_640a_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l369_c3_f3f8 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_3e9c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l369_c3_f3f8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_af80_right := to_unsigned(12, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l397_c3_7392 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_d38d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l397_c3_7392;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_7ea2_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l366_c3_d4cf := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_4ad9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l366_c3_d4cf;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l379_c11_8334_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_3f47_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l348_c6_9568_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l384_c3_e27f := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_640a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l384_c3_e27f;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_7285_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l374_c3_5a47 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_6cf3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l374_c3_5a47;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l359_c3_2e1e := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_73a7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l359_c3_2e1e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l408_c11_0ea0_right := to_unsigned(14, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l377_c3_1925 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_d9fb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l377_c3_1925;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_640a_iftrue := to_unsigned(1, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l382_c30_5d4c_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l380_c3_707b_left := n16;
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l406_l390_DUPLICATE_1cb9_x := n16;
     VAR_n16_MUX_uxn_opcodes_h_l348_c2_28f2_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l353_c7_3e10_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l356_c7_73a7_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l361_c7_5c31_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l364_c7_4ad9_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l368_c7_3e9c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l376_c7_d9fb_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l379_c7_640a_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l348_c6_9568_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_eef9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_eb4a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_2266_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_6b38_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_7ea2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l371_c11_7e11_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_3f47_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l379_c11_8334_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_9c69_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_e3a4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l396_c11_711c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_af80_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l404_c11_1228_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l408_c11_0ea0_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l365_c3_78ab_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l398_c31_ff86_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l348_c2_28f2_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l353_c7_3e10_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l361_c7_5c31_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l364_c7_4ad9_iffalse := t16;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l402_c21_0b99] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l402_c21_0b99_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- BIN_OP_EQ[uxn_opcodes_h_l379_c11_8334] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l379_c11_8334_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l379_c11_8334_left;
     BIN_OP_EQ_uxn_opcodes_h_l379_c11_8334_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l379_c11_8334_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l379_c11_8334_return_output := BIN_OP_EQ_uxn_opcodes_h_l379_c11_8334_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l404_c11_1228] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l404_c11_1228_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l404_c11_1228_left;
     BIN_OP_EQ_uxn_opcodes_h_l404_c11_1228_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l404_c11_1228_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l404_c11_1228_return_output := BIN_OP_EQ_uxn_opcodes_h_l404_c11_1228_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l353_c11_eef9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l353_c11_eef9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_eef9_left;
     BIN_OP_EQ_uxn_opcodes_h_l353_c11_eef9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_eef9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_eef9_return_output := BIN_OP_EQ_uxn_opcodes_h_l353_c11_eef9_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l353_l376_l356_l361_l368_l371_l387_l364_l348_DUPLICATE_44f8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l353_l376_l356_l361_l368_l371_l387_l364_l348_DUPLICATE_44f8_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l353_l376_l356_l404_l361_l368_l371_l364_l348_DUPLICATE_907f LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l353_l376_l356_l404_l361_l368_l371_l364_l348_DUPLICATE_907f_return_output := result.u8_value;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l379_l353_l376_l356_l361_l368_l371_l364_l348_DUPLICATE_a249 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l379_l353_l376_l356_l361_l368_l371_l364_l348_DUPLICATE_a249_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l376_c11_3f47] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l376_c11_3f47_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_3f47_left;
     BIN_OP_EQ_uxn_opcodes_h_l376_c11_3f47_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_3f47_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_3f47_return_output := BIN_OP_EQ_uxn_opcodes_h_l376_c11_3f47_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l371_c11_7e11] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l371_c11_7e11_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l371_c11_7e11_left;
     BIN_OP_EQ_uxn_opcodes_h_l371_c11_7e11_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l371_c11_7e11_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l371_c11_7e11_return_output := BIN_OP_EQ_uxn_opcodes_h_l371_c11_7e11_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l398_c31_ff86] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l398_c31_ff86_x <= VAR_CONST_SR_8_uxn_opcodes_h_l398_c31_ff86_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l398_c31_ff86_return_output := CONST_SR_8_uxn_opcodes_h_l398_c31_ff86_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l356_c11_eb4a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l356_c11_eb4a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_eb4a_left;
     BIN_OP_EQ_uxn_opcodes_h_l356_c11_eb4a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_eb4a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_eb4a_return_output := BIN_OP_EQ_uxn_opcodes_h_l356_c11_eb4a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l361_c11_2266] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l361_c11_2266_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_2266_left;
     BIN_OP_EQ_uxn_opcodes_h_l361_c11_2266_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_2266_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_2266_return_output := BIN_OP_EQ_uxn_opcodes_h_l361_c11_2266_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l404_c7_1de4] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l404_c7_1de4_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l396_c11_711c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l396_c11_711c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l396_c11_711c_left;
     BIN_OP_EQ_uxn_opcodes_h_l396_c11_711c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l396_c11_711c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l396_c11_711c_return_output := BIN_OP_EQ_uxn_opcodes_h_l396_c11_711c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l353_l376_l396_l356_l404_l408_l361_l368_l400_l371_l387_l364_l348_l392_DUPLICATE_a111 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l353_l376_l396_l356_l404_l408_l361_l368_l400_l371_l387_l364_l348_l392_DUPLICATE_a111_return_output := result.is_stack_write;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l394_c21_e1c2] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l394_c21_e1c2_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- BIN_OP_EQ[uxn_opcodes_h_l408_c11_0ea0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l408_c11_0ea0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l408_c11_0ea0_left;
     BIN_OP_EQ_uxn_opcodes_h_l408_c11_0ea0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l408_c11_0ea0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l408_c11_0ea0_return_output := BIN_OP_EQ_uxn_opcodes_h_l408_c11_0ea0_return_output;

     -- CONST_SR_8_uint16_t_uxn_opcodes_h_l406_l390_DUPLICATE_1cb9 LATENCY=0
     -- Inputs
     CONST_SR_8_uint16_t_uxn_opcodes_h_l406_l390_DUPLICATE_1cb9_x <= VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l406_l390_DUPLICATE_1cb9_x;
     -- Outputs
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l406_l390_DUPLICATE_1cb9_return_output := CONST_SR_8_uint16_t_uxn_opcodes_h_l406_l390_DUPLICATE_1cb9_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l379_l353_l376_l396_l356_l404_l408_l361_l368_l400_l371_l387_l364_l392_DUPLICATE_6318 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l379_l353_l376_l396_l356_l404_l408_l361_l368_l400_l371_l387_l364_l392_DUPLICATE_6318_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l368_c11_7ea2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l368_c11_7ea2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_7ea2_left;
     BIN_OP_EQ_uxn_opcodes_h_l368_c11_7ea2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_7ea2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_7ea2_return_output := BIN_OP_EQ_uxn_opcodes_h_l368_c11_7ea2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l364_c11_6b38] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l364_c11_6b38_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_6b38_left;
     BIN_OP_EQ_uxn_opcodes_h_l364_c11_6b38_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_6b38_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_6b38_return_output := BIN_OP_EQ_uxn_opcodes_h_l364_c11_6b38_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l400_c11_af80] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l400_c11_af80_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_af80_left;
     BIN_OP_EQ_uxn_opcodes_h_l400_c11_af80_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_af80_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_af80_return_output := BIN_OP_EQ_uxn_opcodes_h_l400_c11_af80_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l382_c30_5d4c] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l382_c30_5d4c_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l382_c30_5d4c_ins;
     sp_relative_shift_uxn_opcodes_h_l382_c30_5d4c_x <= VAR_sp_relative_shift_uxn_opcodes_h_l382_c30_5d4c_x;
     sp_relative_shift_uxn_opcodes_h_l382_c30_5d4c_y <= VAR_sp_relative_shift_uxn_opcodes_h_l382_c30_5d4c_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l382_c30_5d4c_return_output := sp_relative_shift_uxn_opcodes_h_l382_c30_5d4c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l392_c11_e3a4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l392_c11_e3a4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_e3a4_left;
     BIN_OP_EQ_uxn_opcodes_h_l392_c11_e3a4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_e3a4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_e3a4_return_output := BIN_OP_EQ_uxn_opcodes_h_l392_c11_e3a4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l387_c11_9c69] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l387_c11_9c69_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_9c69_left;
     BIN_OP_EQ_uxn_opcodes_h_l387_c11_9c69_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_9c69_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_9c69_return_output := BIN_OP_EQ_uxn_opcodes_h_l387_c11_9c69_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l357_l365_l372_l380_DUPLICATE_7536 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l357_l365_l372_l380_DUPLICATE_7536_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l348_c6_9568] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l348_c6_9568_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l348_c6_9568_left;
     BIN_OP_EQ_uxn_opcodes_h_l348_c6_9568_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l348_c6_9568_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l348_c6_9568_return_output := BIN_OP_EQ_uxn_opcodes_h_l348_c6_9568_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l348_c2_28f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l348_c6_9568_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_28f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l348_c6_9568_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_28f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l348_c6_9568_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_28f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l348_c6_9568_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_28f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l348_c6_9568_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_28f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l348_c6_9568_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l348_c2_28f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l348_c6_9568_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l348_c2_28f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l348_c6_9568_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l353_c7_3e10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_eef9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_3e10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_eef9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_3e10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_eef9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_3e10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_eef9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_3e10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_eef9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_3e10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_eef9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l353_c7_3e10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_eef9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l353_c7_3e10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_eef9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l356_c7_73a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_eb4a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_73a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_eb4a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_73a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_eb4a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_73a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_eb4a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_73a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_eb4a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_73a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_eb4a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l356_c7_73a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_eb4a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l356_c7_73a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_eb4a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l361_c7_5c31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_2266_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_5c31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_2266_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_5c31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_2266_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_5c31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_2266_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_5c31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_2266_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_5c31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_2266_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l361_c7_5c31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_2266_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l361_c7_5c31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_2266_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l364_c7_4ad9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_6b38_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_4ad9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_6b38_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_4ad9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_6b38_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_4ad9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_6b38_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_4ad9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_6b38_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_4ad9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_6b38_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l364_c7_4ad9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_6b38_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l364_c7_4ad9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_6b38_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l368_c7_3e9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_7ea2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_3e9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_7ea2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_3e9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_7ea2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_3e9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_7ea2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_3e9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_7ea2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_3e9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_7ea2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_3e9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_7ea2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l371_c7_6cf3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l371_c11_7e11_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_6cf3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l371_c11_7e11_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_6cf3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l371_c11_7e11_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_6cf3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l371_c11_7e11_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_6cf3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l371_c11_7e11_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_6cf3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l371_c11_7e11_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l371_c7_6cf3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l371_c11_7e11_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l376_c7_d9fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_3f47_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_d9fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_3f47_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_d9fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_3f47_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_d9fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_3f47_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_d9fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_3f47_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_d9fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_3f47_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_d9fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_3f47_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l379_c7_640a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l379_c11_8334_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_640a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l379_c11_8334_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_640a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l379_c11_8334_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_640a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l379_c11_8334_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_640a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l379_c11_8334_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_640a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l379_c11_8334_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l379_c7_640a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l379_c11_8334_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_5463_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_9c69_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_5463_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_9c69_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_5463_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_9c69_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_5463_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_9c69_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l387_c7_5463_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_9c69_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_5f33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_e3a4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_5f33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_e3a4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_5f33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_e3a4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l392_c7_5f33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_e3a4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_d38d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l396_c11_711c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_d38d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l396_c11_711c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_d38d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l396_c11_711c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l396_c7_d38d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l396_c11_711c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_e177_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_af80_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_e177_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_af80_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_e177_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_af80_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l400_c7_e177_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_af80_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_1de4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l404_c11_1228_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_1de4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l404_c11_1228_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_1de4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l404_c11_1228_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l404_c7_1de4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l404_c11_1228_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_7285_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l408_c11_0ea0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_7285_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l408_c11_0ea0_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l365_c3_78ab_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l357_l365_l372_l380_DUPLICATE_7536_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l380_c3_707b_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l357_l365_l372_l380_DUPLICATE_7536_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l373_l358_DUPLICATE_0833_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l357_l365_l372_l380_DUPLICATE_7536_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l392_c7_5f33_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l394_c21_e1c2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l400_c7_e177_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l402_c21_0b99_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_28f2_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l379_l353_l376_l356_l361_l368_l371_l364_l348_DUPLICATE_a249_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_3e10_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l379_l353_l376_l356_l361_l368_l371_l364_l348_DUPLICATE_a249_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_73a7_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l379_l353_l376_l356_l361_l368_l371_l364_l348_DUPLICATE_a249_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_5c31_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l379_l353_l376_l356_l361_l368_l371_l364_l348_DUPLICATE_a249_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_4ad9_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l379_l353_l376_l356_l361_l368_l371_l364_l348_DUPLICATE_a249_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_3e9c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l379_l353_l376_l356_l361_l368_l371_l364_l348_DUPLICATE_a249_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_6cf3_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l379_l353_l376_l356_l361_l368_l371_l364_l348_DUPLICATE_a249_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_d9fb_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l379_l353_l376_l356_l361_l368_l371_l364_l348_DUPLICATE_a249_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_640a_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l379_l353_l376_l356_l361_l368_l371_l364_l348_DUPLICATE_a249_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_3e10_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l379_l353_l376_l396_l356_l404_l408_l361_l368_l400_l371_l387_l364_l392_DUPLICATE_6318_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_73a7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l379_l353_l376_l396_l356_l404_l408_l361_l368_l400_l371_l387_l364_l392_DUPLICATE_6318_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_5c31_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l379_l353_l376_l396_l356_l404_l408_l361_l368_l400_l371_l387_l364_l392_DUPLICATE_6318_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_4ad9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l379_l353_l376_l396_l356_l404_l408_l361_l368_l400_l371_l387_l364_l392_DUPLICATE_6318_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_3e9c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l379_l353_l376_l396_l356_l404_l408_l361_l368_l400_l371_l387_l364_l392_DUPLICATE_6318_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_6cf3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l379_l353_l376_l396_l356_l404_l408_l361_l368_l400_l371_l387_l364_l392_DUPLICATE_6318_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_d9fb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l379_l353_l376_l396_l356_l404_l408_l361_l368_l400_l371_l387_l364_l392_DUPLICATE_6318_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_640a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l379_l353_l376_l396_l356_l404_l408_l361_l368_l400_l371_l387_l364_l392_DUPLICATE_6318_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_5463_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l379_l353_l376_l396_l356_l404_l408_l361_l368_l400_l371_l387_l364_l392_DUPLICATE_6318_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_5f33_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l379_l353_l376_l396_l356_l404_l408_l361_l368_l400_l371_l387_l364_l392_DUPLICATE_6318_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_d38d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l379_l353_l376_l396_l356_l404_l408_l361_l368_l400_l371_l387_l364_l392_DUPLICATE_6318_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_e177_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l379_l353_l376_l396_l356_l404_l408_l361_l368_l400_l371_l387_l364_l392_DUPLICATE_6318_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_1de4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l379_l353_l376_l396_l356_l404_l408_l361_l368_l400_l371_l387_l364_l392_DUPLICATE_6318_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_7285_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l379_l353_l376_l396_l356_l404_l408_l361_l368_l400_l371_l387_l364_l392_DUPLICATE_6318_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_28f2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l353_l376_l356_l361_l368_l371_l387_l364_l348_DUPLICATE_44f8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_3e10_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l353_l376_l356_l361_l368_l371_l387_l364_l348_DUPLICATE_44f8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_73a7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l353_l376_l356_l361_l368_l371_l387_l364_l348_DUPLICATE_44f8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_5c31_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l353_l376_l356_l361_l368_l371_l387_l364_l348_DUPLICATE_44f8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_4ad9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l353_l376_l356_l361_l368_l371_l387_l364_l348_DUPLICATE_44f8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_3e9c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l353_l376_l356_l361_l368_l371_l387_l364_l348_DUPLICATE_44f8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_6cf3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l353_l376_l356_l361_l368_l371_l387_l364_l348_DUPLICATE_44f8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_d9fb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l353_l376_l356_l361_l368_l371_l387_l364_l348_DUPLICATE_44f8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_5463_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l353_l376_l356_l361_l368_l371_l387_l364_l348_DUPLICATE_44f8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_28f2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l353_l376_l396_l356_l404_l408_l361_l368_l400_l371_l387_l364_l348_l392_DUPLICATE_a111_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_3e10_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l353_l376_l396_l356_l404_l408_l361_l368_l400_l371_l387_l364_l348_l392_DUPLICATE_a111_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_73a7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l353_l376_l396_l356_l404_l408_l361_l368_l400_l371_l387_l364_l348_l392_DUPLICATE_a111_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_5c31_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l353_l376_l396_l356_l404_l408_l361_l368_l400_l371_l387_l364_l348_l392_DUPLICATE_a111_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_4ad9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l353_l376_l396_l356_l404_l408_l361_l368_l400_l371_l387_l364_l348_l392_DUPLICATE_a111_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_3e9c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l353_l376_l396_l356_l404_l408_l361_l368_l400_l371_l387_l364_l348_l392_DUPLICATE_a111_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_6cf3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l353_l376_l396_l356_l404_l408_l361_l368_l400_l371_l387_l364_l348_l392_DUPLICATE_a111_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_d9fb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l353_l376_l396_l356_l404_l408_l361_l368_l400_l371_l387_l364_l348_l392_DUPLICATE_a111_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_5463_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l353_l376_l396_l356_l404_l408_l361_l368_l400_l371_l387_l364_l348_l392_DUPLICATE_a111_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_5f33_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l353_l376_l396_l356_l404_l408_l361_l368_l400_l371_l387_l364_l348_l392_DUPLICATE_a111_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_d38d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l353_l376_l396_l356_l404_l408_l361_l368_l400_l371_l387_l364_l348_l392_DUPLICATE_a111_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_e177_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l353_l376_l396_l356_l404_l408_l361_l368_l400_l371_l387_l364_l348_l392_DUPLICATE_a111_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_1de4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l353_l376_l396_l356_l404_l408_l361_l368_l400_l371_l387_l364_l348_l392_DUPLICATE_a111_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_7285_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l353_l376_l396_l356_l404_l408_l361_l368_l400_l371_l387_l364_l348_l392_DUPLICATE_a111_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l348_c2_28f2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l353_l376_l356_l404_l361_l368_l371_l364_l348_DUPLICATE_907f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l353_c7_3e10_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l353_l376_l356_l404_l361_l368_l371_l364_l348_DUPLICATE_907f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l356_c7_73a7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l353_l376_l356_l404_l361_l368_l371_l364_l348_DUPLICATE_907f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l361_c7_5c31_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l353_l376_l356_l404_l361_l368_l371_l364_l348_DUPLICATE_907f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l364_c7_4ad9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l353_l376_l356_l404_l361_l368_l371_l364_l348_DUPLICATE_907f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_3e9c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l353_l376_l356_l404_l361_l368_l371_l364_l348_DUPLICATE_907f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l371_c7_6cf3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l353_l376_l356_l404_l361_l368_l371_l364_l348_DUPLICATE_907f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_d9fb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l353_l376_l356_l404_l361_l368_l371_l364_l348_DUPLICATE_907f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l404_c7_1de4_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l353_l376_l356_l404_l361_l368_l371_l364_l348_DUPLICATE_907f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_1de4_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l404_c7_1de4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_640a_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l382_c30_5d4c_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l404_c7_1de4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_1de4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_1de4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_1de4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_1de4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_1de4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_1de4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_1de4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_1de4_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l373_l358_DUPLICATE_0833 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l373_l358_DUPLICATE_0833_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l373_l358_DUPLICATE_0833_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l373_l358_DUPLICATE_0833_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l373_l358_DUPLICATE_0833_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l379_c7_640a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_640a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_640a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_640a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_640a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_640a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_640a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_640a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_640a_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l398_c21_896f] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l398_c21_896f_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l398_c31_ff86_return_output);

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l387_c7_5463] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_5463_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_5463_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_5463_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_5463_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_5463_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_5463_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_5463_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_5463_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l380_c3_707b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l380_c3_707b_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l380_c3_707b_left;
     BIN_OP_OR_uxn_opcodes_h_l380_c3_707b_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l380_c3_707b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l380_c3_707b_return_output := BIN_OP_OR_uxn_opcodes_h_l380_c3_707b_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l365_c3_78ab] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l365_c3_78ab_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l365_c3_78ab_left;
     BIN_OP_OR_uxn_opcodes_h_l365_c3_78ab_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l365_c3_78ab_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l365_c3_78ab_return_output := BIN_OP_OR_uxn_opcodes_h_l365_c3_78ab_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l408_c7_7285] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_7285_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_7285_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_7285_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_7285_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_7285_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_7285_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_7285_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_7285_return_output;

     -- CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l406_l390_DUPLICATE_7248 LATENCY=0
     VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l406_l390_DUPLICATE_7248_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l406_l390_DUPLICATE_1cb9_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l408_c7_7285] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_7285_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_7285_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_7285_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_7285_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_7285_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_7285_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_7285_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_7285_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l364_c7_4ad9_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l365_c3_78ab_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l379_c7_640a_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l380_c3_707b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l396_c7_d38d_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l398_c21_896f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l387_c7_5463_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l406_l390_DUPLICATE_7248_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l404_c7_1de4_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l406_l390_DUPLICATE_7248_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l371_c7_6cf3_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l373_l358_DUPLICATE_0833_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l356_c7_73a7_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l373_l358_DUPLICATE_0833_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_1de4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_7285_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_640a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_5463_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_1de4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_7285_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_d9fb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_640a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_e177_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_1de4_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l404_c7_1de4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_1de4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_1de4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_1de4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_1de4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_1de4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_1de4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_1de4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_1de4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l379_c7_640a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_640a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_640a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_640a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_640a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_640a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_640a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_640a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_640a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l404_c7_1de4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l404_c7_1de4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l404_c7_1de4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l404_c7_1de4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l404_c7_1de4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l404_c7_1de4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l404_c7_1de4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l404_c7_1de4_return_output := result_u8_value_MUX_uxn_opcodes_h_l404_c7_1de4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l400_c7_e177] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_e177_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_e177_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_e177_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_e177_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_e177_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_e177_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_e177_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_e177_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l376_c7_d9fb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_d9fb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_d9fb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_d9fb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_d9fb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_d9fb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_d9fb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_d9fb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_d9fb_return_output;

     -- t16_MUX[uxn_opcodes_h_l364_c7_4ad9] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l364_c7_4ad9_cond <= VAR_t16_MUX_uxn_opcodes_h_l364_c7_4ad9_cond;
     t16_MUX_uxn_opcodes_h_l364_c7_4ad9_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l364_c7_4ad9_iftrue;
     t16_MUX_uxn_opcodes_h_l364_c7_4ad9_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l364_c7_4ad9_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l364_c7_4ad9_return_output := t16_MUX_uxn_opcodes_h_l364_c7_4ad9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l404_c7_1de4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_1de4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_1de4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_1de4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_1de4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_1de4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_1de4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_1de4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_1de4_return_output;

     -- n16_MUX[uxn_opcodes_h_l379_c7_640a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l379_c7_640a_cond <= VAR_n16_MUX_uxn_opcodes_h_l379_c7_640a_cond;
     n16_MUX_uxn_opcodes_h_l379_c7_640a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l379_c7_640a_iftrue;
     n16_MUX_uxn_opcodes_h_l379_c7_640a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l379_c7_640a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l379_c7_640a_return_output := n16_MUX_uxn_opcodes_h_l379_c7_640a_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l385_c21_60c2] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l385_c21_60c2_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l380_c3_707b_return_output);

     -- Submodule level 3
     VAR_result_u8_value_MUX_uxn_opcodes_h_l379_c7_640a_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l385_c21_60c2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l376_c7_d9fb_iffalse := VAR_n16_MUX_uxn_opcodes_h_l379_c7_640a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_e177_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_1de4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_d9fb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_640a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_e177_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_1de4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_6cf3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_d9fb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_d38d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_e177_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l400_c7_e177_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l404_c7_1de4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l361_c7_5c31_iffalse := VAR_t16_MUX_uxn_opcodes_h_l364_c7_4ad9_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l400_c7_e177] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_e177_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_e177_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_e177_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_e177_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_e177_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_e177_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_e177_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_e177_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l396_c7_d38d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_d38d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_d38d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_d38d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_d38d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_d38d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_d38d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_d38d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_d38d_return_output;

     -- n16_MUX[uxn_opcodes_h_l376_c7_d9fb] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l376_c7_d9fb_cond <= VAR_n16_MUX_uxn_opcodes_h_l376_c7_d9fb_cond;
     n16_MUX_uxn_opcodes_h_l376_c7_d9fb_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l376_c7_d9fb_iftrue;
     n16_MUX_uxn_opcodes_h_l376_c7_d9fb_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l376_c7_d9fb_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l376_c7_d9fb_return_output := n16_MUX_uxn_opcodes_h_l376_c7_d9fb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l400_c7_e177] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_e177_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_e177_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_e177_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_e177_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_e177_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_e177_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_e177_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_e177_return_output;

     -- t16_MUX[uxn_opcodes_h_l361_c7_5c31] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l361_c7_5c31_cond <= VAR_t16_MUX_uxn_opcodes_h_l361_c7_5c31_cond;
     t16_MUX_uxn_opcodes_h_l361_c7_5c31_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l361_c7_5c31_iftrue;
     t16_MUX_uxn_opcodes_h_l361_c7_5c31_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l361_c7_5c31_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l361_c7_5c31_return_output := t16_MUX_uxn_opcodes_h_l361_c7_5c31_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l400_c7_e177] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l400_c7_e177_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l400_c7_e177_cond;
     result_u8_value_MUX_uxn_opcodes_h_l400_c7_e177_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l400_c7_e177_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l400_c7_e177_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l400_c7_e177_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l400_c7_e177_return_output := result_u8_value_MUX_uxn_opcodes_h_l400_c7_e177_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l376_c7_d9fb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_d9fb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_d9fb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_d9fb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_d9fb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_d9fb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_d9fb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_d9fb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_d9fb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l371_c7_6cf3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_6cf3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_6cf3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_6cf3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_6cf3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_6cf3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_6cf3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_6cf3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_6cf3_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l371_c7_6cf3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l376_c7_d9fb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_d38d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_e177_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_6cf3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_d9fb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_d38d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_e177_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_3e9c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_6cf3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_5f33_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_d38d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l396_c7_d38d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l400_c7_e177_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l356_c7_73a7_iffalse := VAR_t16_MUX_uxn_opcodes_h_l361_c7_5c31_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l392_c7_5f33] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_5f33_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_5f33_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_5f33_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_5f33_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_5f33_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_5f33_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_5f33_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_5f33_return_output;

     -- t16_MUX[uxn_opcodes_h_l356_c7_73a7] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l356_c7_73a7_cond <= VAR_t16_MUX_uxn_opcodes_h_l356_c7_73a7_cond;
     t16_MUX_uxn_opcodes_h_l356_c7_73a7_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l356_c7_73a7_iftrue;
     t16_MUX_uxn_opcodes_h_l356_c7_73a7_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l356_c7_73a7_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l356_c7_73a7_return_output := t16_MUX_uxn_opcodes_h_l356_c7_73a7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l368_c7_3e9c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_3e9c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_3e9c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_3e9c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_3e9c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_3e9c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_3e9c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_3e9c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_3e9c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l396_c7_d38d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_d38d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_d38d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_d38d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_d38d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_d38d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_d38d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_d38d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_d38d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l396_c7_d38d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l396_c7_d38d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l396_c7_d38d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l396_c7_d38d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l396_c7_d38d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l396_c7_d38d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l396_c7_d38d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l396_c7_d38d_return_output := result_u8_value_MUX_uxn_opcodes_h_l396_c7_d38d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l371_c7_6cf3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_6cf3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_6cf3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_6cf3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_6cf3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_6cf3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_6cf3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_6cf3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_6cf3_return_output;

     -- n16_MUX[uxn_opcodes_h_l371_c7_6cf3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l371_c7_6cf3_cond <= VAR_n16_MUX_uxn_opcodes_h_l371_c7_6cf3_cond;
     n16_MUX_uxn_opcodes_h_l371_c7_6cf3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l371_c7_6cf3_iftrue;
     n16_MUX_uxn_opcodes_h_l371_c7_6cf3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l371_c7_6cf3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l371_c7_6cf3_return_output := n16_MUX_uxn_opcodes_h_l371_c7_6cf3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l396_c7_d38d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_d38d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_d38d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_d38d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_d38d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_d38d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_d38d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_d38d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_d38d_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l368_c7_3e9c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l371_c7_6cf3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_5f33_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_d38d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_3e9c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_6cf3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_5f33_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_d38d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_4ad9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_3e9c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_5463_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_5f33_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l392_c7_5f33_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l396_c7_d38d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l353_c7_3e10_iffalse := VAR_t16_MUX_uxn_opcodes_h_l356_c7_73a7_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l364_c7_4ad9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_4ad9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_4ad9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_4ad9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_4ad9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_4ad9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_4ad9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_4ad9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_4ad9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l392_c7_5f33] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l392_c7_5f33_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l392_c7_5f33_cond;
     result_u8_value_MUX_uxn_opcodes_h_l392_c7_5f33_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l392_c7_5f33_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l392_c7_5f33_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l392_c7_5f33_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l392_c7_5f33_return_output := result_u8_value_MUX_uxn_opcodes_h_l392_c7_5f33_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l392_c7_5f33] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_5f33_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_5f33_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_5f33_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_5f33_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_5f33_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_5f33_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_5f33_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_5f33_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l387_c7_5463] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_5463_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_5463_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_5463_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_5463_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_5463_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_5463_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_5463_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_5463_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l368_c7_3e9c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_3e9c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_3e9c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_3e9c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_3e9c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_3e9c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_3e9c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_3e9c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_3e9c_return_output;

     -- t16_MUX[uxn_opcodes_h_l353_c7_3e10] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l353_c7_3e10_cond <= VAR_t16_MUX_uxn_opcodes_h_l353_c7_3e10_cond;
     t16_MUX_uxn_opcodes_h_l353_c7_3e10_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l353_c7_3e10_iftrue;
     t16_MUX_uxn_opcodes_h_l353_c7_3e10_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l353_c7_3e10_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l353_c7_3e10_return_output := t16_MUX_uxn_opcodes_h_l353_c7_3e10_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l392_c7_5f33] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_5f33_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_5f33_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_5f33_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_5f33_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_5f33_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_5f33_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_5f33_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_5f33_return_output;

     -- n16_MUX[uxn_opcodes_h_l368_c7_3e9c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l368_c7_3e9c_cond <= VAR_n16_MUX_uxn_opcodes_h_l368_c7_3e9c_cond;
     n16_MUX_uxn_opcodes_h_l368_c7_3e9c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l368_c7_3e9c_iftrue;
     n16_MUX_uxn_opcodes_h_l368_c7_3e9c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l368_c7_3e9c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l368_c7_3e9c_return_output := n16_MUX_uxn_opcodes_h_l368_c7_3e9c_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l364_c7_4ad9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l368_c7_3e9c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_5463_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_5f33_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_4ad9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_3e9c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_5463_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_5f33_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_5c31_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_4ad9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_640a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_5463_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l387_c7_5463_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l392_c7_5f33_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l348_c2_28f2_iffalse := VAR_t16_MUX_uxn_opcodes_h_l353_c7_3e10_return_output;
     -- t16_MUX[uxn_opcodes_h_l348_c2_28f2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l348_c2_28f2_cond <= VAR_t16_MUX_uxn_opcodes_h_l348_c2_28f2_cond;
     t16_MUX_uxn_opcodes_h_l348_c2_28f2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l348_c2_28f2_iftrue;
     t16_MUX_uxn_opcodes_h_l348_c2_28f2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l348_c2_28f2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l348_c2_28f2_return_output := t16_MUX_uxn_opcodes_h_l348_c2_28f2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l387_c7_5463] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l387_c7_5463_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l387_c7_5463_cond;
     result_u8_value_MUX_uxn_opcodes_h_l387_c7_5463_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l387_c7_5463_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l387_c7_5463_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l387_c7_5463_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l387_c7_5463_return_output := result_u8_value_MUX_uxn_opcodes_h_l387_c7_5463_return_output;

     -- n16_MUX[uxn_opcodes_h_l364_c7_4ad9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l364_c7_4ad9_cond <= VAR_n16_MUX_uxn_opcodes_h_l364_c7_4ad9_cond;
     n16_MUX_uxn_opcodes_h_l364_c7_4ad9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l364_c7_4ad9_iftrue;
     n16_MUX_uxn_opcodes_h_l364_c7_4ad9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l364_c7_4ad9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l364_c7_4ad9_return_output := n16_MUX_uxn_opcodes_h_l364_c7_4ad9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l387_c7_5463] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_5463_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_5463_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_5463_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_5463_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_5463_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_5463_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_5463_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_5463_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l387_c7_5463] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_5463_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_5463_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_5463_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_5463_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_5463_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_5463_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_5463_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_5463_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l361_c7_5c31] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_5c31_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_5c31_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_5c31_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_5c31_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_5c31_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_5c31_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_5c31_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_5c31_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l364_c7_4ad9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_4ad9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_4ad9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_4ad9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_4ad9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_4ad9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_4ad9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_4ad9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_4ad9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l379_c7_640a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_640a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_640a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_640a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_640a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_640a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_640a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_640a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_640a_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l361_c7_5c31_iffalse := VAR_n16_MUX_uxn_opcodes_h_l364_c7_4ad9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_640a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_5463_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_5c31_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_4ad9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_640a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_5463_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_73a7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_5c31_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_d9fb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_640a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l379_c7_640a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l387_c7_5463_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l348_c2_28f2_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l376_c7_d9fb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_d9fb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_d9fb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_d9fb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_d9fb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_d9fb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_d9fb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_d9fb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_d9fb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l379_c7_640a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_640a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_640a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_640a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_640a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_640a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_640a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_640a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_640a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l361_c7_5c31] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_5c31_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_5c31_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_5c31_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_5c31_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_5c31_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_5c31_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_5c31_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_5c31_return_output;

     -- n16_MUX[uxn_opcodes_h_l361_c7_5c31] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l361_c7_5c31_cond <= VAR_n16_MUX_uxn_opcodes_h_l361_c7_5c31_cond;
     n16_MUX_uxn_opcodes_h_l361_c7_5c31_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l361_c7_5c31_iftrue;
     n16_MUX_uxn_opcodes_h_l361_c7_5c31_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l361_c7_5c31_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l361_c7_5c31_return_output := n16_MUX_uxn_opcodes_h_l361_c7_5c31_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l356_c7_73a7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_73a7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_73a7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_73a7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_73a7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_73a7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_73a7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_73a7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_73a7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l379_c7_640a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l379_c7_640a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l379_c7_640a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l379_c7_640a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l379_c7_640a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l379_c7_640a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l379_c7_640a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l379_c7_640a_return_output := result_u8_value_MUX_uxn_opcodes_h_l379_c7_640a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l379_c7_640a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_640a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_640a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_640a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_640a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_640a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_640a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_640a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_640a_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l356_c7_73a7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l361_c7_5c31_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_d9fb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_640a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_73a7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_5c31_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_d9fb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_640a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_3e10_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_73a7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_6cf3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_d9fb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_d9fb_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l379_c7_640a_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l376_c7_d9fb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_d9fb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_d9fb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_d9fb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_d9fb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_d9fb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_d9fb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_d9fb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_d9fb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l376_c7_d9fb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_d9fb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_d9fb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_d9fb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_d9fb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_d9fb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_d9fb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_d9fb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_d9fb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l356_c7_73a7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_73a7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_73a7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_73a7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_73a7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_73a7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_73a7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_73a7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_73a7_return_output;

     -- n16_MUX[uxn_opcodes_h_l356_c7_73a7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l356_c7_73a7_cond <= VAR_n16_MUX_uxn_opcodes_h_l356_c7_73a7_cond;
     n16_MUX_uxn_opcodes_h_l356_c7_73a7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l356_c7_73a7_iftrue;
     n16_MUX_uxn_opcodes_h_l356_c7_73a7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l356_c7_73a7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l356_c7_73a7_return_output := n16_MUX_uxn_opcodes_h_l356_c7_73a7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l353_c7_3e10] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_3e10_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_3e10_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_3e10_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_3e10_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_3e10_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_3e10_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_3e10_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_3e10_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l376_c7_d9fb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l376_c7_d9fb_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_d9fb_cond;
     result_u8_value_MUX_uxn_opcodes_h_l376_c7_d9fb_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_d9fb_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l376_c7_d9fb_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_d9fb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_d9fb_return_output := result_u8_value_MUX_uxn_opcodes_h_l376_c7_d9fb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l371_c7_6cf3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_6cf3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_6cf3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_6cf3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_6cf3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_6cf3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_6cf3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_6cf3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_6cf3_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l353_c7_3e10_iffalse := VAR_n16_MUX_uxn_opcodes_h_l356_c7_73a7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_6cf3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_d9fb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_3e10_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_73a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_6cf3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_d9fb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_28f2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_3e10_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_3e9c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_6cf3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l371_c7_6cf3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_d9fb_return_output;
     -- n16_MUX[uxn_opcodes_h_l353_c7_3e10] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l353_c7_3e10_cond <= VAR_n16_MUX_uxn_opcodes_h_l353_c7_3e10_cond;
     n16_MUX_uxn_opcodes_h_l353_c7_3e10_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l353_c7_3e10_iftrue;
     n16_MUX_uxn_opcodes_h_l353_c7_3e10_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l353_c7_3e10_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l353_c7_3e10_return_output := n16_MUX_uxn_opcodes_h_l353_c7_3e10_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l348_c2_28f2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_28f2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_28f2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_28f2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_28f2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_28f2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_28f2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_28f2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_28f2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l371_c7_6cf3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_6cf3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_6cf3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_6cf3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_6cf3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_6cf3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_6cf3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_6cf3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_6cf3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l353_c7_3e10] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_3e10_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_3e10_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_3e10_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_3e10_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_3e10_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_3e10_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_3e10_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_3e10_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l371_c7_6cf3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_6cf3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_6cf3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_6cf3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_6cf3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_6cf3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_6cf3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_6cf3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_6cf3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l371_c7_6cf3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l371_c7_6cf3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l371_c7_6cf3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l371_c7_6cf3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l371_c7_6cf3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l371_c7_6cf3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l371_c7_6cf3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l371_c7_6cf3_return_output := result_u8_value_MUX_uxn_opcodes_h_l371_c7_6cf3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l368_c7_3e9c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_3e9c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_3e9c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_3e9c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_3e9c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_3e9c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_3e9c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_3e9c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_3e9c_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l348_c2_28f2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l353_c7_3e10_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_3e9c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_6cf3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_28f2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_3e10_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_3e9c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_6cf3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_4ad9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_3e9c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_3e9c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l371_c7_6cf3_return_output;
     -- n16_MUX[uxn_opcodes_h_l348_c2_28f2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l348_c2_28f2_cond <= VAR_n16_MUX_uxn_opcodes_h_l348_c2_28f2_cond;
     n16_MUX_uxn_opcodes_h_l348_c2_28f2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l348_c2_28f2_iftrue;
     n16_MUX_uxn_opcodes_h_l348_c2_28f2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l348_c2_28f2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l348_c2_28f2_return_output := n16_MUX_uxn_opcodes_h_l348_c2_28f2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l364_c7_4ad9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_4ad9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_4ad9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_4ad9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_4ad9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_4ad9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_4ad9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_4ad9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_4ad9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l348_c2_28f2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_28f2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_28f2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_28f2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_28f2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_28f2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_28f2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_28f2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_28f2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l368_c7_3e9c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_3e9c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_3e9c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_3e9c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_3e9c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_3e9c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_3e9c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_3e9c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_3e9c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l368_c7_3e9c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l368_c7_3e9c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_3e9c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l368_c7_3e9c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_3e9c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l368_c7_3e9c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_3e9c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_3e9c_return_output := result_u8_value_MUX_uxn_opcodes_h_l368_c7_3e9c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l368_c7_3e9c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_3e9c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_3e9c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_3e9c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_3e9c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_3e9c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_3e9c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_3e9c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_3e9c_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l348_c2_28f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_4ad9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_3e9c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_4ad9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_3e9c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_5c31_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_4ad9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l364_c7_4ad9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_3e9c_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l361_c7_5c31] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_5c31_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_5c31_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_5c31_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_5c31_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_5c31_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_5c31_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_5c31_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_5c31_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l364_c7_4ad9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_4ad9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_4ad9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_4ad9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_4ad9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_4ad9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_4ad9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_4ad9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_4ad9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l364_c7_4ad9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_4ad9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_4ad9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_4ad9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_4ad9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_4ad9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_4ad9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_4ad9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_4ad9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l364_c7_4ad9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l364_c7_4ad9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l364_c7_4ad9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l364_c7_4ad9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l364_c7_4ad9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l364_c7_4ad9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l364_c7_4ad9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l364_c7_4ad9_return_output := result_u8_value_MUX_uxn_opcodes_h_l364_c7_4ad9_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_5c31_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_4ad9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_5c31_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_4ad9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_73a7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_5c31_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l361_c7_5c31_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l364_c7_4ad9_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l361_c7_5c31] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l361_c7_5c31_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l361_c7_5c31_cond;
     result_u8_value_MUX_uxn_opcodes_h_l361_c7_5c31_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l361_c7_5c31_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l361_c7_5c31_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l361_c7_5c31_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l361_c7_5c31_return_output := result_u8_value_MUX_uxn_opcodes_h_l361_c7_5c31_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l361_c7_5c31] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_5c31_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_5c31_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_5c31_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_5c31_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_5c31_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_5c31_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_5c31_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_5c31_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l356_c7_73a7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_73a7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_73a7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_73a7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_73a7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_73a7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_73a7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_73a7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_73a7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l361_c7_5c31] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_5c31_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_5c31_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_5c31_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_5c31_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_5c31_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_5c31_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_5c31_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_5c31_return_output;

     -- Submodule level 13
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_73a7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_5c31_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_73a7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_5c31_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_3e10_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_73a7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l356_c7_73a7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l361_c7_5c31_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l356_c7_73a7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l356_c7_73a7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l356_c7_73a7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l356_c7_73a7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l356_c7_73a7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l356_c7_73a7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l356_c7_73a7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l356_c7_73a7_return_output := result_u8_value_MUX_uxn_opcodes_h_l356_c7_73a7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l356_c7_73a7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_73a7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_73a7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_73a7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_73a7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_73a7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_73a7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_73a7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_73a7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l356_c7_73a7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_73a7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_73a7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_73a7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_73a7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_73a7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_73a7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_73a7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_73a7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l353_c7_3e10] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_3e10_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_3e10_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_3e10_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_3e10_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_3e10_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_3e10_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_3e10_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_3e10_return_output;

     -- Submodule level 14
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_3e10_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_73a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_3e10_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_73a7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_28f2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_3e10_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l353_c7_3e10_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l356_c7_73a7_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l353_c7_3e10] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_3e10_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_3e10_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_3e10_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_3e10_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_3e10_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_3e10_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_3e10_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_3e10_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l353_c7_3e10] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l353_c7_3e10_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l353_c7_3e10_cond;
     result_u8_value_MUX_uxn_opcodes_h_l353_c7_3e10_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l353_c7_3e10_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l353_c7_3e10_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l353_c7_3e10_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l353_c7_3e10_return_output := result_u8_value_MUX_uxn_opcodes_h_l353_c7_3e10_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l348_c2_28f2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_28f2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_28f2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_28f2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_28f2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_28f2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_28f2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_28f2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_28f2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l353_c7_3e10] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_3e10_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_3e10_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_3e10_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_3e10_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_3e10_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_3e10_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_3e10_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_3e10_return_output;

     -- Submodule level 15
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_28f2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_3e10_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_28f2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_3e10_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l348_c2_28f2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l353_c7_3e10_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l348_c2_28f2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_28f2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_28f2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_28f2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_28f2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_28f2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_28f2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_28f2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_28f2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l348_c2_28f2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_28f2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_28f2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_28f2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_28f2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_28f2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_28f2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_28f2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_28f2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l348_c2_28f2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l348_c2_28f2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l348_c2_28f2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l348_c2_28f2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l348_c2_28f2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l348_c2_28f2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l348_c2_28f2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l348_c2_28f2_return_output := result_u8_value_MUX_uxn_opcodes_h_l348_c2_28f2_return_output;

     -- Submodule level 16
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l344_l413_DUPLICATE_3f69 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l344_l413_DUPLICATE_3f69_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3345(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_28f2_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l348_c2_28f2_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_28f2_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_28f2_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_28f2_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_28f2_return_output);

     -- Submodule level 17
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l344_l413_DUPLICATE_3f69_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l344_l413_DUPLICATE_3f69_return_output;
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
