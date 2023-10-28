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
-- Submodules: 121
entity ovr2_0CLK_a10f7d9d is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ovr2_0CLK_a10f7d9d;
architecture arch of ovr2_0CLK_a10f7d9d is
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
-- BIN_OP_EQ[uxn_opcodes_h_l348_c6_f089]
signal BIN_OP_EQ_uxn_opcodes_h_l348_c6_f089_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l348_c6_f089_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l348_c6_f089_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l348_c1_69e1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l348_c1_69e1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l348_c1_69e1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l348_c1_69e1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l348_c1_69e1_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l348_c2_62ca]
signal t16_MUX_uxn_opcodes_h_l348_c2_62ca_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l348_c2_62ca_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l348_c2_62ca_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l348_c2_62ca_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l348_c2_62ca]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_62ca_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_62ca_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_62ca_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_62ca_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l348_c2_62ca]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_62ca_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_62ca_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_62ca_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_62ca_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l348_c2_62ca]
signal result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_62ca_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_62ca_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_62ca_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_62ca_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l348_c2_62ca]
signal result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_62ca_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_62ca_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_62ca_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_62ca_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l348_c2_62ca]
signal result_u8_value_MUX_uxn_opcodes_h_l348_c2_62ca_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l348_c2_62ca_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l348_c2_62ca_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l348_c2_62ca_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l348_c2_62ca]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_62ca_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_62ca_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_62ca_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_62ca_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l348_c2_62ca]
signal n16_MUX_uxn_opcodes_h_l348_c2_62ca_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l348_c2_62ca_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l348_c2_62ca_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l348_c2_62ca_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l349_c3_be6a[uxn_opcodes_h_l349_c3_be6a]
signal printf_uxn_opcodes_h_l349_c3_be6a_uxn_opcodes_h_l349_c3_be6a_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l353_c11_dc3d]
signal BIN_OP_EQ_uxn_opcodes_h_l353_c11_dc3d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l353_c11_dc3d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l353_c11_dc3d_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l353_c7_9e10]
signal t16_MUX_uxn_opcodes_h_l353_c7_9e10_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l353_c7_9e10_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l353_c7_9e10_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l353_c7_9e10_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l353_c7_9e10]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_9e10_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_9e10_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_9e10_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_9e10_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l353_c7_9e10]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_9e10_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_9e10_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_9e10_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_9e10_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l353_c7_9e10]
signal result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_9e10_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_9e10_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_9e10_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_9e10_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l353_c7_9e10]
signal result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_9e10_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_9e10_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_9e10_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_9e10_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l353_c7_9e10]
signal result_u8_value_MUX_uxn_opcodes_h_l353_c7_9e10_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l353_c7_9e10_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l353_c7_9e10_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l353_c7_9e10_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l353_c7_9e10]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_9e10_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_9e10_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_9e10_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_9e10_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l353_c7_9e10]
signal n16_MUX_uxn_opcodes_h_l353_c7_9e10_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l353_c7_9e10_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l353_c7_9e10_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l353_c7_9e10_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l356_c11_c3eb]
signal BIN_OP_EQ_uxn_opcodes_h_l356_c11_c3eb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l356_c11_c3eb_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l356_c11_c3eb_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l356_c7_9d03]
signal t16_MUX_uxn_opcodes_h_l356_c7_9d03_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l356_c7_9d03_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l356_c7_9d03_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l356_c7_9d03_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l356_c7_9d03]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_9d03_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_9d03_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_9d03_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_9d03_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l356_c7_9d03]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_9d03_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_9d03_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_9d03_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_9d03_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l356_c7_9d03]
signal result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_9d03_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_9d03_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_9d03_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_9d03_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l356_c7_9d03]
signal result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_9d03_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_9d03_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_9d03_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_9d03_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l356_c7_9d03]
signal result_u8_value_MUX_uxn_opcodes_h_l356_c7_9d03_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l356_c7_9d03_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l356_c7_9d03_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l356_c7_9d03_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l356_c7_9d03]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_9d03_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_9d03_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_9d03_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_9d03_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l356_c7_9d03]
signal n16_MUX_uxn_opcodes_h_l356_c7_9d03_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l356_c7_9d03_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l356_c7_9d03_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l356_c7_9d03_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l361_c11_4a8a]
signal BIN_OP_EQ_uxn_opcodes_h_l361_c11_4a8a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l361_c11_4a8a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l361_c11_4a8a_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l361_c7_6eec]
signal t16_MUX_uxn_opcodes_h_l361_c7_6eec_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l361_c7_6eec_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l361_c7_6eec_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l361_c7_6eec_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l361_c7_6eec]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_6eec_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_6eec_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_6eec_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_6eec_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l361_c7_6eec]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_6eec_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_6eec_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_6eec_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_6eec_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l361_c7_6eec]
signal result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_6eec_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_6eec_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_6eec_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_6eec_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l361_c7_6eec]
signal result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_6eec_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_6eec_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_6eec_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_6eec_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l361_c7_6eec]
signal result_u8_value_MUX_uxn_opcodes_h_l361_c7_6eec_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l361_c7_6eec_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l361_c7_6eec_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l361_c7_6eec_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l361_c7_6eec]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_6eec_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_6eec_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_6eec_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_6eec_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l361_c7_6eec]
signal n16_MUX_uxn_opcodes_h_l361_c7_6eec_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l361_c7_6eec_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l361_c7_6eec_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l361_c7_6eec_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l364_c11_7b3f]
signal BIN_OP_EQ_uxn_opcodes_h_l364_c11_7b3f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l364_c11_7b3f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l364_c11_7b3f_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l364_c7_c862]
signal t16_MUX_uxn_opcodes_h_l364_c7_c862_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l364_c7_c862_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l364_c7_c862_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l364_c7_c862_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l364_c7_c862]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_c862_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_c862_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_c862_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_c862_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l364_c7_c862]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_c862_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_c862_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_c862_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_c862_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l364_c7_c862]
signal result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_c862_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_c862_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_c862_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_c862_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l364_c7_c862]
signal result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_c862_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_c862_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_c862_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_c862_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l364_c7_c862]
signal result_u8_value_MUX_uxn_opcodes_h_l364_c7_c862_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l364_c7_c862_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l364_c7_c862_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l364_c7_c862_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l364_c7_c862]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_c862_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_c862_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_c862_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_c862_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l364_c7_c862]
signal n16_MUX_uxn_opcodes_h_l364_c7_c862_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l364_c7_c862_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l364_c7_c862_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l364_c7_c862_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l365_c3_ae74]
signal BIN_OP_OR_uxn_opcodes_h_l365_c3_ae74_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l365_c3_ae74_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l365_c3_ae74_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l368_c11_9d32]
signal BIN_OP_EQ_uxn_opcodes_h_l368_c11_9d32_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l368_c11_9d32_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l368_c11_9d32_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l368_c7_5470]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_5470_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_5470_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_5470_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_5470_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l368_c7_5470]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_5470_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_5470_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_5470_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_5470_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l368_c7_5470]
signal result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_5470_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_5470_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_5470_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_5470_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l368_c7_5470]
signal result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_5470_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_5470_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_5470_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_5470_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l368_c7_5470]
signal result_u8_value_MUX_uxn_opcodes_h_l368_c7_5470_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l368_c7_5470_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l368_c7_5470_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l368_c7_5470_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l368_c7_5470]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_5470_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_5470_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_5470_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_5470_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l368_c7_5470]
signal n16_MUX_uxn_opcodes_h_l368_c7_5470_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l368_c7_5470_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l368_c7_5470_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l368_c7_5470_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l371_c11_b3cb]
signal BIN_OP_EQ_uxn_opcodes_h_l371_c11_b3cb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l371_c11_b3cb_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l371_c11_b3cb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l371_c7_9e90]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_9e90_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_9e90_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_9e90_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_9e90_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l371_c7_9e90]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_9e90_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_9e90_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_9e90_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_9e90_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l371_c7_9e90]
signal result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_9e90_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_9e90_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_9e90_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_9e90_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l371_c7_9e90]
signal result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_9e90_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_9e90_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_9e90_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_9e90_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l371_c7_9e90]
signal result_u8_value_MUX_uxn_opcodes_h_l371_c7_9e90_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l371_c7_9e90_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l371_c7_9e90_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l371_c7_9e90_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l371_c7_9e90]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_9e90_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_9e90_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_9e90_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_9e90_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l371_c7_9e90]
signal n16_MUX_uxn_opcodes_h_l371_c7_9e90_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l371_c7_9e90_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l371_c7_9e90_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l371_c7_9e90_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l376_c11_6afd]
signal BIN_OP_EQ_uxn_opcodes_h_l376_c11_6afd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l376_c11_6afd_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l376_c11_6afd_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l376_c7_8b04]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_8b04_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_8b04_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_8b04_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_8b04_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l376_c7_8b04]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_8b04_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_8b04_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_8b04_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_8b04_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l376_c7_8b04]
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_8b04_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_8b04_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_8b04_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_8b04_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l376_c7_8b04]
signal result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_8b04_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_8b04_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_8b04_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_8b04_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l376_c7_8b04]
signal result_u8_value_MUX_uxn_opcodes_h_l376_c7_8b04_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l376_c7_8b04_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l376_c7_8b04_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l376_c7_8b04_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l376_c7_8b04]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_8b04_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_8b04_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_8b04_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_8b04_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l376_c7_8b04]
signal n16_MUX_uxn_opcodes_h_l376_c7_8b04_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l376_c7_8b04_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l376_c7_8b04_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l376_c7_8b04_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l379_c11_321f]
signal BIN_OP_EQ_uxn_opcodes_h_l379_c11_321f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l379_c11_321f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l379_c11_321f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l379_c7_91fd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_91fd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_91fd_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_91fd_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_91fd_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l379_c7_91fd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_91fd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_91fd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_91fd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_91fd_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l379_c7_91fd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_91fd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_91fd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_91fd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_91fd_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l379_c7_91fd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_91fd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_91fd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_91fd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_91fd_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l379_c7_91fd]
signal result_u8_value_MUX_uxn_opcodes_h_l379_c7_91fd_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l379_c7_91fd_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l379_c7_91fd_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l379_c7_91fd_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l379_c7_91fd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_91fd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_91fd_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_91fd_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_91fd_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l379_c7_91fd]
signal n16_MUX_uxn_opcodes_h_l379_c7_91fd_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l379_c7_91fd_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l379_c7_91fd_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l379_c7_91fd_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l380_c3_8fb5]
signal BIN_OP_OR_uxn_opcodes_h_l380_c3_8fb5_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l380_c3_8fb5_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l380_c3_8fb5_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l382_c30_e91a]
signal sp_relative_shift_uxn_opcodes_h_l382_c30_e91a_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l382_c30_e91a_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l382_c30_e91a_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l382_c30_e91a_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l387_c11_2b34]
signal BIN_OP_EQ_uxn_opcodes_h_l387_c11_2b34_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l387_c11_2b34_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l387_c11_2b34_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l387_c7_d352]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_d352_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_d352_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_d352_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_d352_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l387_c7_d352]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_d352_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_d352_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_d352_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_d352_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l387_c7_d352]
signal result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_d352_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_d352_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_d352_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_d352_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l387_c7_d352]
signal result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_d352_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_d352_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_d352_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_d352_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l387_c7_d352]
signal result_u8_value_MUX_uxn_opcodes_h_l387_c7_d352_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l387_c7_d352_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l387_c7_d352_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l387_c7_d352_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l392_c11_59ff]
signal BIN_OP_EQ_uxn_opcodes_h_l392_c11_59ff_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l392_c11_59ff_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l392_c11_59ff_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l392_c7_50f0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_50f0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_50f0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_50f0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_50f0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l392_c7_50f0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_50f0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_50f0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_50f0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_50f0_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l392_c7_50f0]
signal result_u8_value_MUX_uxn_opcodes_h_l392_c7_50f0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l392_c7_50f0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l392_c7_50f0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l392_c7_50f0_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l392_c7_50f0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_50f0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_50f0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_50f0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_50f0_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l396_c11_7a01]
signal BIN_OP_EQ_uxn_opcodes_h_l396_c11_7a01_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l396_c11_7a01_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l396_c11_7a01_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l396_c7_9ee6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_9ee6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_9ee6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_9ee6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_9ee6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l396_c7_9ee6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_9ee6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_9ee6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_9ee6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_9ee6_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l396_c7_9ee6]
signal result_u8_value_MUX_uxn_opcodes_h_l396_c7_9ee6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l396_c7_9ee6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l396_c7_9ee6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l396_c7_9ee6_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l396_c7_9ee6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_9ee6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_9ee6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_9ee6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_9ee6_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l398_c31_3a62]
signal CONST_SR_8_uxn_opcodes_h_l398_c31_3a62_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l398_c31_3a62_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l400_c11_bd12]
signal BIN_OP_EQ_uxn_opcodes_h_l400_c11_bd12_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l400_c11_bd12_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l400_c11_bd12_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l400_c7_dce6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_dce6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_dce6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_dce6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_dce6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l400_c7_dce6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_dce6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_dce6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_dce6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_dce6_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l400_c7_dce6]
signal result_u8_value_MUX_uxn_opcodes_h_l400_c7_dce6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l400_c7_dce6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l400_c7_dce6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l400_c7_dce6_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l400_c7_dce6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_dce6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_dce6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_dce6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_dce6_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l404_c11_dabb]
signal BIN_OP_EQ_uxn_opcodes_h_l404_c11_dabb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l404_c11_dabb_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l404_c11_dabb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l404_c7_e6ed]
signal result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_e6ed_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_e6ed_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_e6ed_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_e6ed_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l404_c7_e6ed]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_e6ed_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_e6ed_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_e6ed_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_e6ed_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l404_c7_e6ed]
signal result_u8_value_MUX_uxn_opcodes_h_l404_c7_e6ed_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l404_c7_e6ed_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l404_c7_e6ed_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l404_c7_e6ed_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l404_c7_e6ed]
signal result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_e6ed_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_e6ed_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_e6ed_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_e6ed_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l408_c11_5704]
signal BIN_OP_EQ_uxn_opcodes_h_l408_c11_5704_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l408_c11_5704_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l408_c11_5704_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l408_c7_d383]
signal result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_d383_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_d383_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_d383_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_d383_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l408_c7_d383]
signal result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_d383_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_d383_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_d383_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_d383_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l373_l358_DUPLICATE_1563
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l373_l358_DUPLICATE_1563_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l373_l358_DUPLICATE_1563_return_output : unsigned(15 downto 0);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l390_l406_DUPLICATE_0fe0
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l390_l406_DUPLICATE_0fe0_x : unsigned(15 downto 0);
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l390_l406_DUPLICATE_0fe0_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_641b( ref_toks_0 : opcode_result_t;
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
      base.stack_address_sp_offset := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l348_c6_f089
BIN_OP_EQ_uxn_opcodes_h_l348_c6_f089 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l348_c6_f089_left,
BIN_OP_EQ_uxn_opcodes_h_l348_c6_f089_right,
BIN_OP_EQ_uxn_opcodes_h_l348_c6_f089_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l348_c1_69e1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l348_c1_69e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l348_c1_69e1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l348_c1_69e1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l348_c1_69e1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l348_c1_69e1_return_output);

-- t16_MUX_uxn_opcodes_h_l348_c2_62ca
t16_MUX_uxn_opcodes_h_l348_c2_62ca : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l348_c2_62ca_cond,
t16_MUX_uxn_opcodes_h_l348_c2_62ca_iftrue,
t16_MUX_uxn_opcodes_h_l348_c2_62ca_iffalse,
t16_MUX_uxn_opcodes_h_l348_c2_62ca_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_62ca
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_62ca : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_62ca_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_62ca_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_62ca_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_62ca_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_62ca
result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_62ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_62ca_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_62ca_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_62ca_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_62ca_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_62ca
result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_62ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_62ca_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_62ca_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_62ca_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_62ca_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_62ca
result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_62ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_62ca_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_62ca_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_62ca_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_62ca_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l348_c2_62ca
result_u8_value_MUX_uxn_opcodes_h_l348_c2_62ca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l348_c2_62ca_cond,
result_u8_value_MUX_uxn_opcodes_h_l348_c2_62ca_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l348_c2_62ca_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l348_c2_62ca_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_62ca
result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_62ca : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_62ca_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_62ca_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_62ca_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_62ca_return_output);

-- n16_MUX_uxn_opcodes_h_l348_c2_62ca
n16_MUX_uxn_opcodes_h_l348_c2_62ca : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l348_c2_62ca_cond,
n16_MUX_uxn_opcodes_h_l348_c2_62ca_iftrue,
n16_MUX_uxn_opcodes_h_l348_c2_62ca_iffalse,
n16_MUX_uxn_opcodes_h_l348_c2_62ca_return_output);

-- printf_uxn_opcodes_h_l349_c3_be6a_uxn_opcodes_h_l349_c3_be6a
printf_uxn_opcodes_h_l349_c3_be6a_uxn_opcodes_h_l349_c3_be6a : entity work.printf_uxn_opcodes_h_l349_c3_be6a_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l349_c3_be6a_uxn_opcodes_h_l349_c3_be6a_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l353_c11_dc3d
BIN_OP_EQ_uxn_opcodes_h_l353_c11_dc3d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l353_c11_dc3d_left,
BIN_OP_EQ_uxn_opcodes_h_l353_c11_dc3d_right,
BIN_OP_EQ_uxn_opcodes_h_l353_c11_dc3d_return_output);

-- t16_MUX_uxn_opcodes_h_l353_c7_9e10
t16_MUX_uxn_opcodes_h_l353_c7_9e10 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l353_c7_9e10_cond,
t16_MUX_uxn_opcodes_h_l353_c7_9e10_iftrue,
t16_MUX_uxn_opcodes_h_l353_c7_9e10_iffalse,
t16_MUX_uxn_opcodes_h_l353_c7_9e10_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_9e10
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_9e10 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_9e10_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_9e10_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_9e10_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_9e10_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_9e10
result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_9e10 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_9e10_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_9e10_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_9e10_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_9e10_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_9e10
result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_9e10 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_9e10_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_9e10_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_9e10_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_9e10_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_9e10
result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_9e10 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_9e10_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_9e10_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_9e10_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_9e10_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l353_c7_9e10
result_u8_value_MUX_uxn_opcodes_h_l353_c7_9e10 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l353_c7_9e10_cond,
result_u8_value_MUX_uxn_opcodes_h_l353_c7_9e10_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l353_c7_9e10_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l353_c7_9e10_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_9e10
result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_9e10 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_9e10_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_9e10_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_9e10_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_9e10_return_output);

-- n16_MUX_uxn_opcodes_h_l353_c7_9e10
n16_MUX_uxn_opcodes_h_l353_c7_9e10 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l353_c7_9e10_cond,
n16_MUX_uxn_opcodes_h_l353_c7_9e10_iftrue,
n16_MUX_uxn_opcodes_h_l353_c7_9e10_iffalse,
n16_MUX_uxn_opcodes_h_l353_c7_9e10_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l356_c11_c3eb
BIN_OP_EQ_uxn_opcodes_h_l356_c11_c3eb : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l356_c11_c3eb_left,
BIN_OP_EQ_uxn_opcodes_h_l356_c11_c3eb_right,
BIN_OP_EQ_uxn_opcodes_h_l356_c11_c3eb_return_output);

-- t16_MUX_uxn_opcodes_h_l356_c7_9d03
t16_MUX_uxn_opcodes_h_l356_c7_9d03 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l356_c7_9d03_cond,
t16_MUX_uxn_opcodes_h_l356_c7_9d03_iftrue,
t16_MUX_uxn_opcodes_h_l356_c7_9d03_iffalse,
t16_MUX_uxn_opcodes_h_l356_c7_9d03_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_9d03
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_9d03 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_9d03_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_9d03_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_9d03_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_9d03_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_9d03
result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_9d03 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_9d03_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_9d03_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_9d03_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_9d03_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_9d03
result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_9d03 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_9d03_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_9d03_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_9d03_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_9d03_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_9d03
result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_9d03 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_9d03_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_9d03_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_9d03_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_9d03_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l356_c7_9d03
result_u8_value_MUX_uxn_opcodes_h_l356_c7_9d03 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l356_c7_9d03_cond,
result_u8_value_MUX_uxn_opcodes_h_l356_c7_9d03_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l356_c7_9d03_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l356_c7_9d03_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_9d03
result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_9d03 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_9d03_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_9d03_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_9d03_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_9d03_return_output);

-- n16_MUX_uxn_opcodes_h_l356_c7_9d03
n16_MUX_uxn_opcodes_h_l356_c7_9d03 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l356_c7_9d03_cond,
n16_MUX_uxn_opcodes_h_l356_c7_9d03_iftrue,
n16_MUX_uxn_opcodes_h_l356_c7_9d03_iffalse,
n16_MUX_uxn_opcodes_h_l356_c7_9d03_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l361_c11_4a8a
BIN_OP_EQ_uxn_opcodes_h_l361_c11_4a8a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l361_c11_4a8a_left,
BIN_OP_EQ_uxn_opcodes_h_l361_c11_4a8a_right,
BIN_OP_EQ_uxn_opcodes_h_l361_c11_4a8a_return_output);

-- t16_MUX_uxn_opcodes_h_l361_c7_6eec
t16_MUX_uxn_opcodes_h_l361_c7_6eec : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l361_c7_6eec_cond,
t16_MUX_uxn_opcodes_h_l361_c7_6eec_iftrue,
t16_MUX_uxn_opcodes_h_l361_c7_6eec_iffalse,
t16_MUX_uxn_opcodes_h_l361_c7_6eec_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_6eec
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_6eec : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_6eec_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_6eec_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_6eec_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_6eec_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_6eec
result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_6eec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_6eec_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_6eec_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_6eec_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_6eec_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_6eec
result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_6eec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_6eec_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_6eec_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_6eec_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_6eec_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_6eec
result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_6eec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_6eec_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_6eec_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_6eec_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_6eec_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l361_c7_6eec
result_u8_value_MUX_uxn_opcodes_h_l361_c7_6eec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l361_c7_6eec_cond,
result_u8_value_MUX_uxn_opcodes_h_l361_c7_6eec_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l361_c7_6eec_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l361_c7_6eec_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_6eec
result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_6eec : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_6eec_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_6eec_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_6eec_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_6eec_return_output);

-- n16_MUX_uxn_opcodes_h_l361_c7_6eec
n16_MUX_uxn_opcodes_h_l361_c7_6eec : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l361_c7_6eec_cond,
n16_MUX_uxn_opcodes_h_l361_c7_6eec_iftrue,
n16_MUX_uxn_opcodes_h_l361_c7_6eec_iffalse,
n16_MUX_uxn_opcodes_h_l361_c7_6eec_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l364_c11_7b3f
BIN_OP_EQ_uxn_opcodes_h_l364_c11_7b3f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l364_c11_7b3f_left,
BIN_OP_EQ_uxn_opcodes_h_l364_c11_7b3f_right,
BIN_OP_EQ_uxn_opcodes_h_l364_c11_7b3f_return_output);

-- t16_MUX_uxn_opcodes_h_l364_c7_c862
t16_MUX_uxn_opcodes_h_l364_c7_c862 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l364_c7_c862_cond,
t16_MUX_uxn_opcodes_h_l364_c7_c862_iftrue,
t16_MUX_uxn_opcodes_h_l364_c7_c862_iffalse,
t16_MUX_uxn_opcodes_h_l364_c7_c862_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_c862
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_c862 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_c862_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_c862_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_c862_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_c862_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_c862
result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_c862 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_c862_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_c862_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_c862_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_c862_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_c862
result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_c862 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_c862_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_c862_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_c862_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_c862_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_c862
result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_c862 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_c862_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_c862_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_c862_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_c862_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l364_c7_c862
result_u8_value_MUX_uxn_opcodes_h_l364_c7_c862 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l364_c7_c862_cond,
result_u8_value_MUX_uxn_opcodes_h_l364_c7_c862_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l364_c7_c862_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l364_c7_c862_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_c862
result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_c862 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_c862_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_c862_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_c862_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_c862_return_output);

-- n16_MUX_uxn_opcodes_h_l364_c7_c862
n16_MUX_uxn_opcodes_h_l364_c7_c862 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l364_c7_c862_cond,
n16_MUX_uxn_opcodes_h_l364_c7_c862_iftrue,
n16_MUX_uxn_opcodes_h_l364_c7_c862_iffalse,
n16_MUX_uxn_opcodes_h_l364_c7_c862_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l365_c3_ae74
BIN_OP_OR_uxn_opcodes_h_l365_c3_ae74 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l365_c3_ae74_left,
BIN_OP_OR_uxn_opcodes_h_l365_c3_ae74_right,
BIN_OP_OR_uxn_opcodes_h_l365_c3_ae74_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l368_c11_9d32
BIN_OP_EQ_uxn_opcodes_h_l368_c11_9d32 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l368_c11_9d32_left,
BIN_OP_EQ_uxn_opcodes_h_l368_c11_9d32_right,
BIN_OP_EQ_uxn_opcodes_h_l368_c11_9d32_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_5470
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_5470 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_5470_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_5470_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_5470_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_5470_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_5470
result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_5470 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_5470_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_5470_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_5470_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_5470_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_5470
result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_5470 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_5470_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_5470_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_5470_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_5470_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_5470
result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_5470 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_5470_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_5470_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_5470_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_5470_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l368_c7_5470
result_u8_value_MUX_uxn_opcodes_h_l368_c7_5470 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l368_c7_5470_cond,
result_u8_value_MUX_uxn_opcodes_h_l368_c7_5470_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l368_c7_5470_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l368_c7_5470_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_5470
result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_5470 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_5470_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_5470_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_5470_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_5470_return_output);

-- n16_MUX_uxn_opcodes_h_l368_c7_5470
n16_MUX_uxn_opcodes_h_l368_c7_5470 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l368_c7_5470_cond,
n16_MUX_uxn_opcodes_h_l368_c7_5470_iftrue,
n16_MUX_uxn_opcodes_h_l368_c7_5470_iffalse,
n16_MUX_uxn_opcodes_h_l368_c7_5470_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l371_c11_b3cb
BIN_OP_EQ_uxn_opcodes_h_l371_c11_b3cb : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l371_c11_b3cb_left,
BIN_OP_EQ_uxn_opcodes_h_l371_c11_b3cb_right,
BIN_OP_EQ_uxn_opcodes_h_l371_c11_b3cb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_9e90
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_9e90 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_9e90_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_9e90_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_9e90_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_9e90_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_9e90
result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_9e90 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_9e90_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_9e90_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_9e90_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_9e90_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_9e90
result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_9e90 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_9e90_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_9e90_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_9e90_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_9e90_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_9e90
result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_9e90 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_9e90_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_9e90_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_9e90_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_9e90_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l371_c7_9e90
result_u8_value_MUX_uxn_opcodes_h_l371_c7_9e90 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l371_c7_9e90_cond,
result_u8_value_MUX_uxn_opcodes_h_l371_c7_9e90_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l371_c7_9e90_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l371_c7_9e90_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_9e90
result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_9e90 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_9e90_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_9e90_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_9e90_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_9e90_return_output);

-- n16_MUX_uxn_opcodes_h_l371_c7_9e90
n16_MUX_uxn_opcodes_h_l371_c7_9e90 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l371_c7_9e90_cond,
n16_MUX_uxn_opcodes_h_l371_c7_9e90_iftrue,
n16_MUX_uxn_opcodes_h_l371_c7_9e90_iffalse,
n16_MUX_uxn_opcodes_h_l371_c7_9e90_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l376_c11_6afd
BIN_OP_EQ_uxn_opcodes_h_l376_c11_6afd : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l376_c11_6afd_left,
BIN_OP_EQ_uxn_opcodes_h_l376_c11_6afd_right,
BIN_OP_EQ_uxn_opcodes_h_l376_c11_6afd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_8b04
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_8b04 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_8b04_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_8b04_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_8b04_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_8b04_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_8b04
result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_8b04 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_8b04_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_8b04_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_8b04_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_8b04_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_8b04
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_8b04 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_8b04_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_8b04_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_8b04_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_8b04_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_8b04
result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_8b04 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_8b04_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_8b04_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_8b04_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_8b04_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l376_c7_8b04
result_u8_value_MUX_uxn_opcodes_h_l376_c7_8b04 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l376_c7_8b04_cond,
result_u8_value_MUX_uxn_opcodes_h_l376_c7_8b04_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l376_c7_8b04_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l376_c7_8b04_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_8b04
result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_8b04 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_8b04_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_8b04_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_8b04_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_8b04_return_output);

-- n16_MUX_uxn_opcodes_h_l376_c7_8b04
n16_MUX_uxn_opcodes_h_l376_c7_8b04 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l376_c7_8b04_cond,
n16_MUX_uxn_opcodes_h_l376_c7_8b04_iftrue,
n16_MUX_uxn_opcodes_h_l376_c7_8b04_iffalse,
n16_MUX_uxn_opcodes_h_l376_c7_8b04_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l379_c11_321f
BIN_OP_EQ_uxn_opcodes_h_l379_c11_321f : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l379_c11_321f_left,
BIN_OP_EQ_uxn_opcodes_h_l379_c11_321f_right,
BIN_OP_EQ_uxn_opcodes_h_l379_c11_321f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_91fd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_91fd : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_91fd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_91fd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_91fd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_91fd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_91fd
result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_91fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_91fd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_91fd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_91fd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_91fd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_91fd
result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_91fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_91fd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_91fd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_91fd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_91fd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_91fd
result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_91fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_91fd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_91fd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_91fd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_91fd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l379_c7_91fd
result_u8_value_MUX_uxn_opcodes_h_l379_c7_91fd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l379_c7_91fd_cond,
result_u8_value_MUX_uxn_opcodes_h_l379_c7_91fd_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l379_c7_91fd_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l379_c7_91fd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_91fd
result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_91fd : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_91fd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_91fd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_91fd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_91fd_return_output);

-- n16_MUX_uxn_opcodes_h_l379_c7_91fd
n16_MUX_uxn_opcodes_h_l379_c7_91fd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l379_c7_91fd_cond,
n16_MUX_uxn_opcodes_h_l379_c7_91fd_iftrue,
n16_MUX_uxn_opcodes_h_l379_c7_91fd_iffalse,
n16_MUX_uxn_opcodes_h_l379_c7_91fd_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l380_c3_8fb5
BIN_OP_OR_uxn_opcodes_h_l380_c3_8fb5 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l380_c3_8fb5_left,
BIN_OP_OR_uxn_opcodes_h_l380_c3_8fb5_right,
BIN_OP_OR_uxn_opcodes_h_l380_c3_8fb5_return_output);

-- sp_relative_shift_uxn_opcodes_h_l382_c30_e91a
sp_relative_shift_uxn_opcodes_h_l382_c30_e91a : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l382_c30_e91a_ins,
sp_relative_shift_uxn_opcodes_h_l382_c30_e91a_x,
sp_relative_shift_uxn_opcodes_h_l382_c30_e91a_y,
sp_relative_shift_uxn_opcodes_h_l382_c30_e91a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l387_c11_2b34
BIN_OP_EQ_uxn_opcodes_h_l387_c11_2b34 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l387_c11_2b34_left,
BIN_OP_EQ_uxn_opcodes_h_l387_c11_2b34_right,
BIN_OP_EQ_uxn_opcodes_h_l387_c11_2b34_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_d352
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_d352 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_d352_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_d352_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_d352_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_d352_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_d352
result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_d352 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_d352_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_d352_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_d352_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_d352_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_d352
result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_d352 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_d352_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_d352_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_d352_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_d352_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_d352
result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_d352 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_d352_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_d352_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_d352_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_d352_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l387_c7_d352
result_u8_value_MUX_uxn_opcodes_h_l387_c7_d352 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l387_c7_d352_cond,
result_u8_value_MUX_uxn_opcodes_h_l387_c7_d352_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l387_c7_d352_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l387_c7_d352_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l392_c11_59ff
BIN_OP_EQ_uxn_opcodes_h_l392_c11_59ff : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l392_c11_59ff_left,
BIN_OP_EQ_uxn_opcodes_h_l392_c11_59ff_right,
BIN_OP_EQ_uxn_opcodes_h_l392_c11_59ff_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_50f0
result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_50f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_50f0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_50f0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_50f0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_50f0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_50f0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_50f0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_50f0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_50f0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_50f0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_50f0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l392_c7_50f0
result_u8_value_MUX_uxn_opcodes_h_l392_c7_50f0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l392_c7_50f0_cond,
result_u8_value_MUX_uxn_opcodes_h_l392_c7_50f0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l392_c7_50f0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l392_c7_50f0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_50f0
result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_50f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_50f0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_50f0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_50f0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_50f0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l396_c11_7a01
BIN_OP_EQ_uxn_opcodes_h_l396_c11_7a01 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l396_c11_7a01_left,
BIN_OP_EQ_uxn_opcodes_h_l396_c11_7a01_right,
BIN_OP_EQ_uxn_opcodes_h_l396_c11_7a01_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_9ee6
result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_9ee6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_9ee6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_9ee6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_9ee6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_9ee6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_9ee6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_9ee6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_9ee6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_9ee6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_9ee6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_9ee6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l396_c7_9ee6
result_u8_value_MUX_uxn_opcodes_h_l396_c7_9ee6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l396_c7_9ee6_cond,
result_u8_value_MUX_uxn_opcodes_h_l396_c7_9ee6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l396_c7_9ee6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l396_c7_9ee6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_9ee6
result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_9ee6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_9ee6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_9ee6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_9ee6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_9ee6_return_output);

-- CONST_SR_8_uxn_opcodes_h_l398_c31_3a62
CONST_SR_8_uxn_opcodes_h_l398_c31_3a62 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l398_c31_3a62_x,
CONST_SR_8_uxn_opcodes_h_l398_c31_3a62_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l400_c11_bd12
BIN_OP_EQ_uxn_opcodes_h_l400_c11_bd12 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l400_c11_bd12_left,
BIN_OP_EQ_uxn_opcodes_h_l400_c11_bd12_right,
BIN_OP_EQ_uxn_opcodes_h_l400_c11_bd12_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_dce6
result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_dce6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_dce6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_dce6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_dce6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_dce6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_dce6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_dce6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_dce6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_dce6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_dce6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_dce6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l400_c7_dce6
result_u8_value_MUX_uxn_opcodes_h_l400_c7_dce6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l400_c7_dce6_cond,
result_u8_value_MUX_uxn_opcodes_h_l400_c7_dce6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l400_c7_dce6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l400_c7_dce6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_dce6
result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_dce6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_dce6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_dce6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_dce6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_dce6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l404_c11_dabb
BIN_OP_EQ_uxn_opcodes_h_l404_c11_dabb : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l404_c11_dabb_left,
BIN_OP_EQ_uxn_opcodes_h_l404_c11_dabb_right,
BIN_OP_EQ_uxn_opcodes_h_l404_c11_dabb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_e6ed
result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_e6ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_e6ed_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_e6ed_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_e6ed_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_e6ed_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_e6ed
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_e6ed : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_e6ed_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_e6ed_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_e6ed_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_e6ed_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l404_c7_e6ed
result_u8_value_MUX_uxn_opcodes_h_l404_c7_e6ed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l404_c7_e6ed_cond,
result_u8_value_MUX_uxn_opcodes_h_l404_c7_e6ed_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l404_c7_e6ed_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l404_c7_e6ed_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_e6ed
result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_e6ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_e6ed_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_e6ed_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_e6ed_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_e6ed_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l408_c11_5704
BIN_OP_EQ_uxn_opcodes_h_l408_c11_5704 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l408_c11_5704_left,
BIN_OP_EQ_uxn_opcodes_h_l408_c11_5704_right,
BIN_OP_EQ_uxn_opcodes_h_l408_c11_5704_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_d383
result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_d383 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_d383_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_d383_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_d383_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_d383_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_d383
result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_d383 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_d383_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_d383_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_d383_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_d383_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l373_l358_DUPLICATE_1563
CONST_SL_8_uint16_t_uxn_opcodes_h_l373_l358_DUPLICATE_1563 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l373_l358_DUPLICATE_1563_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l373_l358_DUPLICATE_1563_return_output);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l390_l406_DUPLICATE_0fe0
CONST_SR_8_uint16_t_uxn_opcodes_h_l390_l406_DUPLICATE_0fe0 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uint16_t_uxn_opcodes_h_l390_l406_DUPLICATE_0fe0_x,
CONST_SR_8_uint16_t_uxn_opcodes_h_l390_l406_DUPLICATE_0fe0_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l348_c6_f089_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l348_c1_69e1_return_output,
 t16_MUX_uxn_opcodes_h_l348_c2_62ca_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_62ca_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_62ca_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_62ca_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_62ca_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l348_c2_62ca_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_62ca_return_output,
 n16_MUX_uxn_opcodes_h_l348_c2_62ca_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l353_c11_dc3d_return_output,
 t16_MUX_uxn_opcodes_h_l353_c7_9e10_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_9e10_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_9e10_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_9e10_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_9e10_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l353_c7_9e10_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_9e10_return_output,
 n16_MUX_uxn_opcodes_h_l353_c7_9e10_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l356_c11_c3eb_return_output,
 t16_MUX_uxn_opcodes_h_l356_c7_9d03_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_9d03_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_9d03_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_9d03_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_9d03_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l356_c7_9d03_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_9d03_return_output,
 n16_MUX_uxn_opcodes_h_l356_c7_9d03_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l361_c11_4a8a_return_output,
 t16_MUX_uxn_opcodes_h_l361_c7_6eec_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_6eec_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_6eec_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_6eec_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_6eec_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l361_c7_6eec_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_6eec_return_output,
 n16_MUX_uxn_opcodes_h_l361_c7_6eec_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l364_c11_7b3f_return_output,
 t16_MUX_uxn_opcodes_h_l364_c7_c862_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_c862_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_c862_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_c862_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_c862_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l364_c7_c862_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_c862_return_output,
 n16_MUX_uxn_opcodes_h_l364_c7_c862_return_output,
 BIN_OP_OR_uxn_opcodes_h_l365_c3_ae74_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l368_c11_9d32_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_5470_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_5470_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_5470_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_5470_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l368_c7_5470_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_5470_return_output,
 n16_MUX_uxn_opcodes_h_l368_c7_5470_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l371_c11_b3cb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_9e90_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_9e90_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_9e90_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_9e90_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l371_c7_9e90_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_9e90_return_output,
 n16_MUX_uxn_opcodes_h_l371_c7_9e90_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l376_c11_6afd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_8b04_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_8b04_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_8b04_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_8b04_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l376_c7_8b04_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_8b04_return_output,
 n16_MUX_uxn_opcodes_h_l376_c7_8b04_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l379_c11_321f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_91fd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_91fd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_91fd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_91fd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l379_c7_91fd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_91fd_return_output,
 n16_MUX_uxn_opcodes_h_l379_c7_91fd_return_output,
 BIN_OP_OR_uxn_opcodes_h_l380_c3_8fb5_return_output,
 sp_relative_shift_uxn_opcodes_h_l382_c30_e91a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l387_c11_2b34_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_d352_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_d352_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_d352_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_d352_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l387_c7_d352_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l392_c11_59ff_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_50f0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_50f0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l392_c7_50f0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_50f0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l396_c11_7a01_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_9ee6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_9ee6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l396_c7_9ee6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_9ee6_return_output,
 CONST_SR_8_uxn_opcodes_h_l398_c31_3a62_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l400_c11_bd12_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_dce6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_dce6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l400_c7_dce6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_dce6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l404_c11_dabb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_e6ed_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_e6ed_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l404_c7_e6ed_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_e6ed_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l408_c11_5704_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_d383_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_d383_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l373_l358_DUPLICATE_1563_return_output,
 CONST_SR_8_uint16_t_uxn_opcodes_h_l390_l406_DUPLICATE_0fe0_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l348_c6_f089_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l348_c6_f089_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l348_c6_f089_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l348_c1_69e1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l348_c1_69e1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l348_c1_69e1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l348_c1_69e1_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l348_c2_62ca_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l348_c2_62ca_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l353_c7_9e10_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l348_c2_62ca_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l348_c2_62ca_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_62ca_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l350_c3_9f90 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_62ca_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_9e10_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_62ca_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_62ca_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_62ca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_62ca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_9e10_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_62ca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_62ca_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_62ca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_62ca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_9e10_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_62ca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_62ca_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_62ca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_62ca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_9e10_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_62ca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_62ca_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l348_c2_62ca_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l348_c2_62ca_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l353_c7_9e10_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l348_c2_62ca_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l348_c2_62ca_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_62ca_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_62ca_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_9e10_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_62ca_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_62ca_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l348_c2_62ca_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l348_c2_62ca_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l353_c7_9e10_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l348_c2_62ca_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l348_c2_62ca_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l349_c3_be6a_uxn_opcodes_h_l349_c3_be6a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_dc3d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_dc3d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_dc3d_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l353_c7_9e10_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l353_c7_9e10_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l356_c7_9d03_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l353_c7_9e10_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_9e10_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l354_c3_8246 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_9e10_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_9d03_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_9e10_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_9e10_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_9e10_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_9d03_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_9e10_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_9e10_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_9e10_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_9d03_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_9e10_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_9e10_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_9e10_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_9d03_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_9e10_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l353_c7_9e10_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l353_c7_9e10_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l356_c7_9d03_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l353_c7_9e10_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_9e10_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_9e10_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_9d03_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_9e10_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l353_c7_9e10_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l353_c7_9e10_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l356_c7_9d03_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l353_c7_9e10_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_c3eb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_c3eb_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_c3eb_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l356_c7_9d03_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l356_c7_9d03_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l361_c7_6eec_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l356_c7_9d03_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_9d03_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l359_c3_0b6b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_9d03_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_6eec_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_9d03_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_9d03_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_9d03_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_6eec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_9d03_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_9d03_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_9d03_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_6eec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_9d03_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_9d03_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_9d03_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_6eec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_9d03_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l356_c7_9d03_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l356_c7_9d03_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l361_c7_6eec_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l356_c7_9d03_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_9d03_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_9d03_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_6eec_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_9d03_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l356_c7_9d03_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l356_c7_9d03_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l361_c7_6eec_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l356_c7_9d03_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_4a8a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_4a8a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_4a8a_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l361_c7_6eec_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l361_c7_6eec_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l364_c7_c862_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l361_c7_6eec_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_6eec_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l362_c3_5ea0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_6eec_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_c862_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_6eec_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_6eec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_6eec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_c862_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_6eec_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_6eec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_6eec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_c862_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_6eec_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_6eec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_6eec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_c862_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_6eec_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l361_c7_6eec_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l361_c7_6eec_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l364_c7_c862_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l361_c7_6eec_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_6eec_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_6eec_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_c862_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_6eec_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l361_c7_6eec_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l361_c7_6eec_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l364_c7_c862_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l361_c7_6eec_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_7b3f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_7b3f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_7b3f_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l364_c7_c862_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l364_c7_c862_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l364_c7_c862_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_c862_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l366_c3_ab17 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_c862_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_5470_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_c862_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_c862_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_c862_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_5470_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_c862_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_c862_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_c862_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_5470_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_c862_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_c862_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_c862_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_5470_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_c862_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l364_c7_c862_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l364_c7_c862_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_5470_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l364_c7_c862_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_c862_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_c862_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_5470_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_c862_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l364_c7_c862_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l364_c7_c862_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l368_c7_5470_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l364_c7_c862_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l365_c3_ae74_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l365_c3_ae74_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l365_c3_ae74_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_9d32_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_9d32_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_9d32_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_5470_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l369_c3_1718 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_5470_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_9e90_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_5470_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_5470_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_5470_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_9e90_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_5470_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_5470_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_5470_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_9e90_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_5470_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_5470_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_5470_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_9e90_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_5470_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_5470_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_5470_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l371_c7_9e90_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_5470_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_5470_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_5470_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_9e90_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_5470_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l368_c7_5470_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l368_c7_5470_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l371_c7_9e90_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l368_c7_5470_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l371_c11_b3cb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l371_c11_b3cb_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l371_c11_b3cb_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_9e90_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l374_c3_833f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_9e90_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_8b04_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_9e90_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_9e90_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_9e90_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_8b04_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_9e90_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_9e90_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_9e90_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_8b04_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_9e90_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_9e90_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_9e90_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_8b04_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_9e90_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l371_c7_9e90_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l371_c7_9e90_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_8b04_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l371_c7_9e90_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_9e90_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_9e90_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_8b04_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_9e90_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l371_c7_9e90_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l371_c7_9e90_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l376_c7_8b04_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l371_c7_9e90_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_6afd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_6afd_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_6afd_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_8b04_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l377_c3_36d4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_8b04_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_91fd_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_8b04_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_8b04_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_8b04_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_91fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_8b04_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_8b04_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_8b04_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_91fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_8b04_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_8b04_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_8b04_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_91fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_8b04_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_8b04_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_8b04_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l379_c7_91fd_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_8b04_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_8b04_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_8b04_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_91fd_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_8b04_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l376_c7_8b04_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l376_c7_8b04_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l379_c7_91fd_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l376_c7_8b04_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l379_c11_321f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l379_c11_321f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l379_c11_321f_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_91fd_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l384_c3_bad7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_91fd_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_d352_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_91fd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_91fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_91fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_d352_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_91fd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_91fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_91fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_d352_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_91fd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_91fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_91fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_d352_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_91fd_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l379_c7_91fd_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l379_c7_91fd_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l387_c7_d352_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l379_c7_91fd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_91fd_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_91fd_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_91fd_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l379_c7_91fd_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l379_c7_91fd_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l379_c7_91fd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l380_c3_8fb5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l380_c3_8fb5_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l380_c3_8fb5_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l382_c30_e91a_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l382_c30_e91a_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l382_c30_e91a_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l382_c30_e91a_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l385_c21_7aee_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_2b34_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_2b34_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_2b34_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_d352_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l389_c3_15bb : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_d352_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_50f0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_d352_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_d352_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_d352_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_d352_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_d352_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_d352_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_50f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_d352_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_d352_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_d352_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_50f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_d352_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l387_c7_d352_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l387_c7_d352_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l392_c7_50f0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l387_c7_d352_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_59ff_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_59ff_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_59ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_50f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_50f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_9ee6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_50f0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_50f0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l393_c3_cbb9 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_50f0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_9ee6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_50f0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l392_c7_50f0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l392_c7_50f0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l396_c7_9ee6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l392_c7_50f0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_50f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_50f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_9ee6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_50f0_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l394_c21_4224_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l396_c11_7a01_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l396_c11_7a01_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l396_c11_7a01_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_9ee6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_9ee6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_dce6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_9ee6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_9ee6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l397_c3_3de2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_9ee6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_dce6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_9ee6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l396_c7_9ee6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l396_c7_9ee6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l400_c7_dce6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l396_c7_9ee6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_9ee6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_9ee6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_dce6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_9ee6_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l398_c31_3a62_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l398_c31_3a62_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l398_c21_54e9_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_bd12_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_bd12_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_bd12_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_dce6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_dce6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_e6ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_dce6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_dce6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l401_c3_ba0f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_dce6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_e6ed_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_dce6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l400_c7_dce6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l400_c7_dce6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l404_c7_e6ed_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l400_c7_dce6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_dce6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_dce6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_e6ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_dce6_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l402_c21_20cc_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l404_c11_dabb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l404_c11_dabb_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l404_c11_dabb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_e6ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_e6ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_d383_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_e6ed_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_e6ed_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l405_c3_4cd8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_e6ed_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l404_c7_e6ed_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_e6ed_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l404_c7_e6ed_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l404_c7_e6ed_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l404_c7_e6ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_e6ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_e6ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_d383_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_e6ed_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l408_c11_5704_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l408_c11_5704_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l408_c11_5704_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_d383_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_d383_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_d383_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_d383_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_d383_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_d383_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l376_l364_l371_l361_l368_l387_l356_l348_l353_DUPLICATE_cc49_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l392_l376_l408_l364_l400_l371_l361_l368_l387_l356_l396_l348_l404_l353_DUPLICATE_a051_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l376_l364_l371_l361_l368_l356_l348_l404_l353_DUPLICATE_2ffe_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l376_l364_l371_l361_l368_l379_l356_l348_l353_DUPLICATE_5738_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l392_l376_l408_l364_l400_l371_l361_l368_l379_l387_l356_l396_l404_l353_DUPLICATE_c49c_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l357_l365_l372_l380_DUPLICATE_9580_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l373_l358_DUPLICATE_1563_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l373_l358_DUPLICATE_1563_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l390_l406_DUPLICATE_0fe0_x : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l390_l406_DUPLICATE_0fe0_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l390_l406_DUPLICATE_f625_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l413_l344_DUPLICATE_1933_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l354_c3_8246 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_9e10_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l354_c3_8246;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l374_c3_833f := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_9e90_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l374_c3_833f;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l362_c3_5ea0 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_6eec_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l362_c3_5ea0;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l350_c3_9f90 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_62ca_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l350_c3_9f90;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_6afd_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_bd12_right := to_unsigned(12, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_dc3d_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l366_c3_ab17 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_c862_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l366_c3_ab17;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l371_c11_b3cb_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l379_c11_321f_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l408_c11_5704_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l348_c6_f089_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l405_c3_4cd8 := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_e6ed_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l405_c3_4cd8;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_d383_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_9d32_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l401_c3_ba0f := resize(to_unsigned(5, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_dce6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l401_c3_ba0f;
     VAR_sp_relative_shift_uxn_opcodes_h_l382_c30_e91a_y := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l359_c3_0b6b := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_9d03_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l359_c3_0b6b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_4a8a_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l397_c3_3de2 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_9ee6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l397_c3_3de2;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l369_c3_1718 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_5470_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l369_c3_1718;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_7b3f_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_59ff_right := to_unsigned(10, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_d383_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_2b34_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l377_c3_36d4 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_8b04_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l377_c3_36d4;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l389_c3_15bb := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_d352_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l389_c3_15bb;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l404_c11_dabb_right := to_unsigned(13, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_c3eb_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_91fd_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l382_c30_e91a_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_62ca_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l393_c3_cbb9 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_50f0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l393_c3_cbb9;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_91fd_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_d352_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l348_c1_69e1_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l396_c11_7a01_right := to_unsigned(11, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l384_c3_bad7 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_91fd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l384_c3_bad7;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l348_c1_69e1_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l382_c30_e91a_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l380_c3_8fb5_left := n16;
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l390_l406_DUPLICATE_0fe0_x := n16;
     VAR_n16_MUX_uxn_opcodes_h_l348_c2_62ca_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l353_c7_9e10_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l356_c7_9d03_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l361_c7_6eec_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l364_c7_c862_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l368_c7_5470_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l376_c7_8b04_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l379_c7_91fd_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l348_c6_f089_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_dc3d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_c3eb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_4a8a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_7b3f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_9d32_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l371_c11_b3cb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_6afd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l379_c11_321f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_2b34_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_59ff_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l396_c11_7a01_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_bd12_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l404_c11_dabb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l408_c11_5704_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l365_c3_ae74_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l398_c31_3a62_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l348_c2_62ca_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l353_c7_9e10_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l361_c7_6eec_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l364_c7_c862_iffalse := t16;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l394_c21_4224] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l394_c21_4224_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- BIN_OP_EQ[uxn_opcodes_h_l348_c6_f089] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l348_c6_f089_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l348_c6_f089_left;
     BIN_OP_EQ_uxn_opcodes_h_l348_c6_f089_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l348_c6_f089_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l348_c6_f089_return_output := BIN_OP_EQ_uxn_opcodes_h_l348_c6_f089_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l379_c11_321f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l379_c11_321f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l379_c11_321f_left;
     BIN_OP_EQ_uxn_opcodes_h_l379_c11_321f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l379_c11_321f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l379_c11_321f_return_output := BIN_OP_EQ_uxn_opcodes_h_l379_c11_321f_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l357_l365_l372_l380_DUPLICATE_9580 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l357_l365_l372_l380_DUPLICATE_9580_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l404_c11_dabb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l404_c11_dabb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l404_c11_dabb_left;
     BIN_OP_EQ_uxn_opcodes_h_l404_c11_dabb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l404_c11_dabb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l404_c11_dabb_return_output := BIN_OP_EQ_uxn_opcodes_h_l404_c11_dabb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l361_c11_4a8a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l361_c11_4a8a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_4a8a_left;
     BIN_OP_EQ_uxn_opcodes_h_l361_c11_4a8a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_4a8a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_4a8a_return_output := BIN_OP_EQ_uxn_opcodes_h_l361_c11_4a8a_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l376_l364_l371_l361_l368_l379_l356_l348_l353_DUPLICATE_5738 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l376_l364_l371_l361_l368_l379_l356_l348_l353_DUPLICATE_5738_return_output := result.sp_relative_shift;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l404_c7_e6ed] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l404_c7_e6ed_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l371_c11_b3cb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l371_c11_b3cb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l371_c11_b3cb_left;
     BIN_OP_EQ_uxn_opcodes_h_l371_c11_b3cb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l371_c11_b3cb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l371_c11_b3cb_return_output := BIN_OP_EQ_uxn_opcodes_h_l371_c11_b3cb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l400_c11_bd12] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l400_c11_bd12_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_bd12_left;
     BIN_OP_EQ_uxn_opcodes_h_l400_c11_bd12_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_bd12_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_bd12_return_output := BIN_OP_EQ_uxn_opcodes_h_l400_c11_bd12_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l392_l376_l408_l364_l400_l371_l361_l368_l387_l356_l396_l348_l404_l353_DUPLICATE_a051 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l392_l376_l408_l364_l400_l371_l361_l368_l387_l356_l396_l348_l404_l353_DUPLICATE_a051_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l376_l364_l371_l361_l368_l387_l356_l348_l353_DUPLICATE_cc49 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l376_l364_l371_l361_l368_l387_l356_l348_l353_DUPLICATE_cc49_return_output := result.is_sp_shift;

     -- CONST_SR_8_uint16_t_uxn_opcodes_h_l390_l406_DUPLICATE_0fe0 LATENCY=0
     -- Inputs
     CONST_SR_8_uint16_t_uxn_opcodes_h_l390_l406_DUPLICATE_0fe0_x <= VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l390_l406_DUPLICATE_0fe0_x;
     -- Outputs
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l390_l406_DUPLICATE_0fe0_return_output := CONST_SR_8_uint16_t_uxn_opcodes_h_l390_l406_DUPLICATE_0fe0_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l382_c30_e91a] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l382_c30_e91a_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l382_c30_e91a_ins;
     sp_relative_shift_uxn_opcodes_h_l382_c30_e91a_x <= VAR_sp_relative_shift_uxn_opcodes_h_l382_c30_e91a_x;
     sp_relative_shift_uxn_opcodes_h_l382_c30_e91a_y <= VAR_sp_relative_shift_uxn_opcodes_h_l382_c30_e91a_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l382_c30_e91a_return_output := sp_relative_shift_uxn_opcodes_h_l382_c30_e91a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l392_c11_59ff] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l392_c11_59ff_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_59ff_left;
     BIN_OP_EQ_uxn_opcodes_h_l392_c11_59ff_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_59ff_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_59ff_return_output := BIN_OP_EQ_uxn_opcodes_h_l392_c11_59ff_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l353_c11_dc3d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l353_c11_dc3d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_dc3d_left;
     BIN_OP_EQ_uxn_opcodes_h_l353_c11_dc3d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_dc3d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_dc3d_return_output := BIN_OP_EQ_uxn_opcodes_h_l353_c11_dc3d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l392_l376_l408_l364_l400_l371_l361_l368_l379_l387_l356_l396_l404_l353_DUPLICATE_c49c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l392_l376_l408_l364_l400_l371_l361_l368_l379_l387_l356_l396_l404_l353_DUPLICATE_c49c_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l376_c11_6afd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l376_c11_6afd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_6afd_left;
     BIN_OP_EQ_uxn_opcodes_h_l376_c11_6afd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_6afd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_6afd_return_output := BIN_OP_EQ_uxn_opcodes_h_l376_c11_6afd_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l402_c21_20cc] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l402_c21_20cc_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l376_l364_l371_l361_l368_l356_l348_l404_l353_DUPLICATE_2ffe LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l376_l364_l371_l361_l368_l356_l348_l404_l353_DUPLICATE_2ffe_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l396_c11_7a01] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l396_c11_7a01_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l396_c11_7a01_left;
     BIN_OP_EQ_uxn_opcodes_h_l396_c11_7a01_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l396_c11_7a01_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l396_c11_7a01_return_output := BIN_OP_EQ_uxn_opcodes_h_l396_c11_7a01_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l398_c31_3a62] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l398_c31_3a62_x <= VAR_CONST_SR_8_uxn_opcodes_h_l398_c31_3a62_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l398_c31_3a62_return_output := CONST_SR_8_uxn_opcodes_h_l398_c31_3a62_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l356_c11_c3eb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l356_c11_c3eb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_c3eb_left;
     BIN_OP_EQ_uxn_opcodes_h_l356_c11_c3eb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_c3eb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_c3eb_return_output := BIN_OP_EQ_uxn_opcodes_h_l356_c11_c3eb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l364_c11_7b3f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l364_c11_7b3f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_7b3f_left;
     BIN_OP_EQ_uxn_opcodes_h_l364_c11_7b3f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_7b3f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_7b3f_return_output := BIN_OP_EQ_uxn_opcodes_h_l364_c11_7b3f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l368_c11_9d32] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l368_c11_9d32_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_9d32_left;
     BIN_OP_EQ_uxn_opcodes_h_l368_c11_9d32_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_9d32_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_9d32_return_output := BIN_OP_EQ_uxn_opcodes_h_l368_c11_9d32_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l387_c11_2b34] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l387_c11_2b34_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_2b34_left;
     BIN_OP_EQ_uxn_opcodes_h_l387_c11_2b34_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_2b34_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_2b34_return_output := BIN_OP_EQ_uxn_opcodes_h_l387_c11_2b34_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l408_c11_5704] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l408_c11_5704_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l408_c11_5704_left;
     BIN_OP_EQ_uxn_opcodes_h_l408_c11_5704_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l408_c11_5704_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l408_c11_5704_return_output := BIN_OP_EQ_uxn_opcodes_h_l408_c11_5704_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l348_c1_69e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l348_c6_f089_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l348_c2_62ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l348_c6_f089_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_62ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l348_c6_f089_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_62ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l348_c6_f089_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_62ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l348_c6_f089_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_62ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l348_c6_f089_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_62ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l348_c6_f089_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l348_c2_62ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l348_c6_f089_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l348_c2_62ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l348_c6_f089_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l353_c7_9e10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_dc3d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_9e10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_dc3d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_9e10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_dc3d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_9e10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_dc3d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_9e10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_dc3d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_9e10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_dc3d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l353_c7_9e10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_dc3d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l353_c7_9e10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_dc3d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l356_c7_9d03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_c3eb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_9d03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_c3eb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_9d03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_c3eb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_9d03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_c3eb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_9d03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_c3eb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_9d03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_c3eb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l356_c7_9d03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_c3eb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l356_c7_9d03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_c3eb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l361_c7_6eec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_4a8a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_6eec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_4a8a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_6eec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_4a8a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_6eec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_4a8a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_6eec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_4a8a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_6eec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_4a8a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l361_c7_6eec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_4a8a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l361_c7_6eec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_4a8a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l364_c7_c862_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_7b3f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_c862_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_7b3f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_c862_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_7b3f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_c862_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_7b3f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_c862_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_7b3f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_c862_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_7b3f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l364_c7_c862_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_7b3f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l364_c7_c862_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_7b3f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l368_c7_5470_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_9d32_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_5470_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_9d32_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_5470_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_9d32_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_5470_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_9d32_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_5470_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_9d32_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_5470_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_9d32_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_5470_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_9d32_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l371_c7_9e90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l371_c11_b3cb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_9e90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l371_c11_b3cb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_9e90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l371_c11_b3cb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_9e90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l371_c11_b3cb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_9e90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l371_c11_b3cb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_9e90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l371_c11_b3cb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l371_c7_9e90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l371_c11_b3cb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l376_c7_8b04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_6afd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_8b04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_6afd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_8b04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_6afd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_8b04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_6afd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_8b04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_6afd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_8b04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_6afd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_8b04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_6afd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l379_c7_91fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l379_c11_321f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_91fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l379_c11_321f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_91fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l379_c11_321f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_91fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l379_c11_321f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_91fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l379_c11_321f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_91fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l379_c11_321f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l379_c7_91fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l379_c11_321f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_d352_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_2b34_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_d352_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_2b34_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_d352_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_2b34_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_d352_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_2b34_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l387_c7_d352_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c11_2b34_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_50f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_59ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_50f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_59ff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_50f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_59ff_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l392_c7_50f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l392_c11_59ff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_9ee6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l396_c11_7a01_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_9ee6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l396_c11_7a01_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_9ee6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l396_c11_7a01_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l396_c7_9ee6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l396_c11_7a01_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_dce6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_bd12_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_dce6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_bd12_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_dce6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_bd12_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l400_c7_dce6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_bd12_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_e6ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l404_c11_dabb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_e6ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l404_c11_dabb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_e6ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l404_c11_dabb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l404_c7_e6ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l404_c11_dabb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_d383_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l408_c11_5704_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_d383_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l408_c11_5704_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l365_c3_ae74_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l357_l365_l372_l380_DUPLICATE_9580_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l380_c3_8fb5_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l357_l365_l372_l380_DUPLICATE_9580_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l373_l358_DUPLICATE_1563_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l357_l365_l372_l380_DUPLICATE_9580_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l392_c7_50f0_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l394_c21_4224_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l400_c7_dce6_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l402_c21_20cc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_62ca_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l376_l364_l371_l361_l368_l379_l356_l348_l353_DUPLICATE_5738_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_9e10_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l376_l364_l371_l361_l368_l379_l356_l348_l353_DUPLICATE_5738_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_9d03_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l376_l364_l371_l361_l368_l379_l356_l348_l353_DUPLICATE_5738_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_6eec_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l376_l364_l371_l361_l368_l379_l356_l348_l353_DUPLICATE_5738_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_c862_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l376_l364_l371_l361_l368_l379_l356_l348_l353_DUPLICATE_5738_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_5470_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l376_l364_l371_l361_l368_l379_l356_l348_l353_DUPLICATE_5738_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_9e90_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l376_l364_l371_l361_l368_l379_l356_l348_l353_DUPLICATE_5738_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_8b04_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l376_l364_l371_l361_l368_l379_l356_l348_l353_DUPLICATE_5738_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_91fd_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l376_l364_l371_l361_l368_l379_l356_l348_l353_DUPLICATE_5738_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_9e10_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l392_l376_l408_l364_l400_l371_l361_l368_l379_l387_l356_l396_l404_l353_DUPLICATE_c49c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_9d03_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l392_l376_l408_l364_l400_l371_l361_l368_l379_l387_l356_l396_l404_l353_DUPLICATE_c49c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_6eec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l392_l376_l408_l364_l400_l371_l361_l368_l379_l387_l356_l396_l404_l353_DUPLICATE_c49c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_c862_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l392_l376_l408_l364_l400_l371_l361_l368_l379_l387_l356_l396_l404_l353_DUPLICATE_c49c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_5470_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l392_l376_l408_l364_l400_l371_l361_l368_l379_l387_l356_l396_l404_l353_DUPLICATE_c49c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_9e90_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l392_l376_l408_l364_l400_l371_l361_l368_l379_l387_l356_l396_l404_l353_DUPLICATE_c49c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_8b04_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l392_l376_l408_l364_l400_l371_l361_l368_l379_l387_l356_l396_l404_l353_DUPLICATE_c49c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_91fd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l392_l376_l408_l364_l400_l371_l361_l368_l379_l387_l356_l396_l404_l353_DUPLICATE_c49c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_d352_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l392_l376_l408_l364_l400_l371_l361_l368_l379_l387_l356_l396_l404_l353_DUPLICATE_c49c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_50f0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l392_l376_l408_l364_l400_l371_l361_l368_l379_l387_l356_l396_l404_l353_DUPLICATE_c49c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_9ee6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l392_l376_l408_l364_l400_l371_l361_l368_l379_l387_l356_l396_l404_l353_DUPLICATE_c49c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_dce6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l392_l376_l408_l364_l400_l371_l361_l368_l379_l387_l356_l396_l404_l353_DUPLICATE_c49c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_e6ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l392_l376_l408_l364_l400_l371_l361_l368_l379_l387_l356_l396_l404_l353_DUPLICATE_c49c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_d383_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l392_l376_l408_l364_l400_l371_l361_l368_l379_l387_l356_l396_l404_l353_DUPLICATE_c49c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_62ca_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l376_l364_l371_l361_l368_l387_l356_l348_l353_DUPLICATE_cc49_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_9e10_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l376_l364_l371_l361_l368_l387_l356_l348_l353_DUPLICATE_cc49_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_9d03_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l376_l364_l371_l361_l368_l387_l356_l348_l353_DUPLICATE_cc49_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_6eec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l376_l364_l371_l361_l368_l387_l356_l348_l353_DUPLICATE_cc49_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_c862_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l376_l364_l371_l361_l368_l387_l356_l348_l353_DUPLICATE_cc49_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_5470_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l376_l364_l371_l361_l368_l387_l356_l348_l353_DUPLICATE_cc49_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_9e90_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l376_l364_l371_l361_l368_l387_l356_l348_l353_DUPLICATE_cc49_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_8b04_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l376_l364_l371_l361_l368_l387_l356_l348_l353_DUPLICATE_cc49_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_d352_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l376_l364_l371_l361_l368_l387_l356_l348_l353_DUPLICATE_cc49_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_62ca_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l392_l376_l408_l364_l400_l371_l361_l368_l387_l356_l396_l348_l404_l353_DUPLICATE_a051_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_9e10_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l392_l376_l408_l364_l400_l371_l361_l368_l387_l356_l396_l348_l404_l353_DUPLICATE_a051_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_9d03_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l392_l376_l408_l364_l400_l371_l361_l368_l387_l356_l396_l348_l404_l353_DUPLICATE_a051_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_6eec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l392_l376_l408_l364_l400_l371_l361_l368_l387_l356_l396_l348_l404_l353_DUPLICATE_a051_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_c862_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l392_l376_l408_l364_l400_l371_l361_l368_l387_l356_l396_l348_l404_l353_DUPLICATE_a051_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_5470_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l392_l376_l408_l364_l400_l371_l361_l368_l387_l356_l396_l348_l404_l353_DUPLICATE_a051_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_9e90_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l392_l376_l408_l364_l400_l371_l361_l368_l387_l356_l396_l348_l404_l353_DUPLICATE_a051_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_8b04_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l392_l376_l408_l364_l400_l371_l361_l368_l387_l356_l396_l348_l404_l353_DUPLICATE_a051_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_d352_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l392_l376_l408_l364_l400_l371_l361_l368_l387_l356_l396_l348_l404_l353_DUPLICATE_a051_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_50f0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l392_l376_l408_l364_l400_l371_l361_l368_l387_l356_l396_l348_l404_l353_DUPLICATE_a051_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_9ee6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l392_l376_l408_l364_l400_l371_l361_l368_l387_l356_l396_l348_l404_l353_DUPLICATE_a051_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_dce6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l392_l376_l408_l364_l400_l371_l361_l368_l387_l356_l396_l348_l404_l353_DUPLICATE_a051_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_e6ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l392_l376_l408_l364_l400_l371_l361_l368_l387_l356_l396_l348_l404_l353_DUPLICATE_a051_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_d383_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l392_l376_l408_l364_l400_l371_l361_l368_l387_l356_l396_l348_l404_l353_DUPLICATE_a051_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l348_c2_62ca_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l376_l364_l371_l361_l368_l356_l348_l404_l353_DUPLICATE_2ffe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l353_c7_9e10_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l376_l364_l371_l361_l368_l356_l348_l404_l353_DUPLICATE_2ffe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l356_c7_9d03_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l376_l364_l371_l361_l368_l356_l348_l404_l353_DUPLICATE_2ffe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l361_c7_6eec_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l376_l364_l371_l361_l368_l356_l348_l404_l353_DUPLICATE_2ffe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l364_c7_c862_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l376_l364_l371_l361_l368_l356_l348_l404_l353_DUPLICATE_2ffe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_5470_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l376_l364_l371_l361_l368_l356_l348_l404_l353_DUPLICATE_2ffe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l371_c7_9e90_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l376_l364_l371_l361_l368_l356_l348_l404_l353_DUPLICATE_2ffe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_8b04_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l376_l364_l371_l361_l368_l356_l348_l404_l353_DUPLICATE_2ffe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l404_c7_e6ed_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l376_l364_l371_l361_l368_l356_l348_l404_l353_DUPLICATE_2ffe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_e6ed_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l404_c7_e6ed_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_91fd_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l382_c30_e91a_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l348_c1_69e1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l348_c1_69e1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l348_c1_69e1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l348_c1_69e1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l348_c1_69e1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l348_c1_69e1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l348_c1_69e1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l348_c1_69e1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l348_c1_69e1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l387_c7_d352] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_d352_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_d352_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_d352_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_d352_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_d352_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_d352_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_d352_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_d352_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l373_l358_DUPLICATE_1563 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l373_l358_DUPLICATE_1563_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l373_l358_DUPLICATE_1563_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l373_l358_DUPLICATE_1563_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l373_l358_DUPLICATE_1563_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l380_c3_8fb5] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l380_c3_8fb5_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l380_c3_8fb5_left;
     BIN_OP_OR_uxn_opcodes_h_l380_c3_8fb5_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l380_c3_8fb5_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l380_c3_8fb5_return_output := BIN_OP_OR_uxn_opcodes_h_l380_c3_8fb5_return_output;

     -- CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l390_l406_DUPLICATE_f625 LATENCY=0
     VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l390_l406_DUPLICATE_f625_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l390_l406_DUPLICATE_0fe0_return_output);

     -- CAST_TO_uint8_t[uxn_opcodes_h_l398_c21_54e9] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l398_c21_54e9_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l398_c31_3a62_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l408_c7_d383] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_d383_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_d383_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_d383_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_d383_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_d383_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_d383_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_d383_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_d383_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l365_c3_ae74] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l365_c3_ae74_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l365_c3_ae74_left;
     BIN_OP_OR_uxn_opcodes_h_l365_c3_ae74_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l365_c3_ae74_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l365_c3_ae74_return_output := BIN_OP_OR_uxn_opcodes_h_l365_c3_ae74_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l379_c7_91fd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_91fd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_91fd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_91fd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_91fd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_91fd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_91fd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_91fd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_91fd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l404_c7_e6ed] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_e6ed_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_e6ed_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_e6ed_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_e6ed_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_e6ed_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_e6ed_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_e6ed_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_e6ed_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l408_c7_d383] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_d383_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_d383_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_d383_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_d383_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_d383_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_d383_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_d383_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_d383_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l364_c7_c862_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l365_c3_ae74_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l379_c7_91fd_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l380_c3_8fb5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l396_c7_9ee6_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l398_c21_54e9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l387_c7_d352_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l390_l406_DUPLICATE_f625_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l404_c7_e6ed_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l390_l406_DUPLICATE_f625_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l371_c7_9e90_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l373_l358_DUPLICATE_1563_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l356_c7_9d03_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l373_l358_DUPLICATE_1563_return_output;
     VAR_printf_uxn_opcodes_h_l349_c3_be6a_uxn_opcodes_h_l349_c3_be6a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l348_c1_69e1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_e6ed_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_d383_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_91fd_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c7_d352_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_e6ed_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_d383_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_8b04_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_91fd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_dce6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_e6ed_return_output;
     -- printf_uxn_opcodes_h_l349_c3_be6a[uxn_opcodes_h_l349_c3_be6a] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l349_c3_be6a_uxn_opcodes_h_l349_c3_be6a_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l349_c3_be6a_uxn_opcodes_h_l349_c3_be6a_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l376_c7_8b04] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_8b04_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_8b04_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_8b04_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_8b04_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_8b04_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_8b04_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_8b04_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_8b04_return_output;

     -- t16_MUX[uxn_opcodes_h_l364_c7_c862] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l364_c7_c862_cond <= VAR_t16_MUX_uxn_opcodes_h_l364_c7_c862_cond;
     t16_MUX_uxn_opcodes_h_l364_c7_c862_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l364_c7_c862_iftrue;
     t16_MUX_uxn_opcodes_h_l364_c7_c862_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l364_c7_c862_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l364_c7_c862_return_output := t16_MUX_uxn_opcodes_h_l364_c7_c862_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l400_c7_dce6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_dce6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_dce6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_dce6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_dce6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_dce6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_dce6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_dce6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_dce6_return_output;

     -- n16_MUX[uxn_opcodes_h_l379_c7_91fd] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l379_c7_91fd_cond <= VAR_n16_MUX_uxn_opcodes_h_l379_c7_91fd_cond;
     n16_MUX_uxn_opcodes_h_l379_c7_91fd_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l379_c7_91fd_iftrue;
     n16_MUX_uxn_opcodes_h_l379_c7_91fd_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l379_c7_91fd_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l379_c7_91fd_return_output := n16_MUX_uxn_opcodes_h_l379_c7_91fd_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l379_c7_91fd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_91fd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_91fd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_91fd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_91fd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_91fd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_91fd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_91fd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_91fd_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l404_c7_e6ed] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l404_c7_e6ed_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l404_c7_e6ed_cond;
     result_u8_value_MUX_uxn_opcodes_h_l404_c7_e6ed_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l404_c7_e6ed_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l404_c7_e6ed_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l404_c7_e6ed_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l404_c7_e6ed_return_output := result_u8_value_MUX_uxn_opcodes_h_l404_c7_e6ed_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l404_c7_e6ed] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_e6ed_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_e6ed_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_e6ed_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_e6ed_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_e6ed_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_e6ed_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_e6ed_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_e6ed_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l385_c21_7aee] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l385_c21_7aee_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l380_c3_8fb5_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l404_c7_e6ed] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_e6ed_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_e6ed_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_e6ed_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_e6ed_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_e6ed_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_e6ed_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_e6ed_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_e6ed_return_output;

     -- Submodule level 3
     VAR_result_u8_value_MUX_uxn_opcodes_h_l379_c7_91fd_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l385_c21_7aee_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l376_c7_8b04_iffalse := VAR_n16_MUX_uxn_opcodes_h_l379_c7_91fd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_dce6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_e6ed_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_8b04_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_91fd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_dce6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_e6ed_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_9e90_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_8b04_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_9ee6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_dce6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l400_c7_dce6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l404_c7_e6ed_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l361_c7_6eec_iffalse := VAR_t16_MUX_uxn_opcodes_h_l364_c7_c862_return_output;
     -- n16_MUX[uxn_opcodes_h_l376_c7_8b04] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l376_c7_8b04_cond <= VAR_n16_MUX_uxn_opcodes_h_l376_c7_8b04_cond;
     n16_MUX_uxn_opcodes_h_l376_c7_8b04_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l376_c7_8b04_iftrue;
     n16_MUX_uxn_opcodes_h_l376_c7_8b04_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l376_c7_8b04_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l376_c7_8b04_return_output := n16_MUX_uxn_opcodes_h_l376_c7_8b04_return_output;

     -- t16_MUX[uxn_opcodes_h_l361_c7_6eec] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l361_c7_6eec_cond <= VAR_t16_MUX_uxn_opcodes_h_l361_c7_6eec_cond;
     t16_MUX_uxn_opcodes_h_l361_c7_6eec_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l361_c7_6eec_iftrue;
     t16_MUX_uxn_opcodes_h_l361_c7_6eec_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l361_c7_6eec_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l361_c7_6eec_return_output := t16_MUX_uxn_opcodes_h_l361_c7_6eec_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l396_c7_9ee6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_9ee6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_9ee6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_9ee6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_9ee6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_9ee6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_9ee6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_9ee6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_9ee6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l376_c7_8b04] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_8b04_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_8b04_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_8b04_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_8b04_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_8b04_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_8b04_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_8b04_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_8b04_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l400_c7_dce6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l400_c7_dce6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l400_c7_dce6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l400_c7_dce6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l400_c7_dce6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l400_c7_dce6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l400_c7_dce6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l400_c7_dce6_return_output := result_u8_value_MUX_uxn_opcodes_h_l400_c7_dce6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l400_c7_dce6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_dce6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_dce6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_dce6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_dce6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_dce6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_dce6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_dce6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_dce6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l371_c7_9e90] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_9e90_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_9e90_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_9e90_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_9e90_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_9e90_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_9e90_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_9e90_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_9e90_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l400_c7_dce6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_dce6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_dce6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_dce6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_dce6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_dce6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_dce6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_dce6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_dce6_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l371_c7_9e90_iffalse := VAR_n16_MUX_uxn_opcodes_h_l376_c7_8b04_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_9ee6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_dce6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_9e90_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_8b04_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_9ee6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_dce6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_5470_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_9e90_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_50f0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_9ee6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l396_c7_9ee6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l400_c7_dce6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l356_c7_9d03_iffalse := VAR_t16_MUX_uxn_opcodes_h_l361_c7_6eec_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l396_c7_9ee6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_9ee6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_9ee6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_9ee6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_9ee6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_9ee6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_9ee6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_9ee6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_9ee6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l396_c7_9ee6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_9ee6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_9ee6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_9ee6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_9ee6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_9ee6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_9ee6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_9ee6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_9ee6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l368_c7_5470] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_5470_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_5470_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_5470_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_5470_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_5470_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_5470_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_5470_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_5470_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l392_c7_50f0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_50f0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_50f0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_50f0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_50f0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_50f0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_50f0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_50f0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_50f0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l396_c7_9ee6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l396_c7_9ee6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l396_c7_9ee6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l396_c7_9ee6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l396_c7_9ee6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l396_c7_9ee6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l396_c7_9ee6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l396_c7_9ee6_return_output := result_u8_value_MUX_uxn_opcodes_h_l396_c7_9ee6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l371_c7_9e90] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_9e90_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_9e90_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_9e90_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_9e90_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_9e90_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_9e90_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_9e90_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_9e90_return_output;

     -- t16_MUX[uxn_opcodes_h_l356_c7_9d03] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l356_c7_9d03_cond <= VAR_t16_MUX_uxn_opcodes_h_l356_c7_9d03_cond;
     t16_MUX_uxn_opcodes_h_l356_c7_9d03_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l356_c7_9d03_iftrue;
     t16_MUX_uxn_opcodes_h_l356_c7_9d03_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l356_c7_9d03_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l356_c7_9d03_return_output := t16_MUX_uxn_opcodes_h_l356_c7_9d03_return_output;

     -- n16_MUX[uxn_opcodes_h_l371_c7_9e90] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l371_c7_9e90_cond <= VAR_n16_MUX_uxn_opcodes_h_l371_c7_9e90_cond;
     n16_MUX_uxn_opcodes_h_l371_c7_9e90_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l371_c7_9e90_iftrue;
     n16_MUX_uxn_opcodes_h_l371_c7_9e90_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l371_c7_9e90_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l371_c7_9e90_return_output := n16_MUX_uxn_opcodes_h_l371_c7_9e90_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l368_c7_5470_iffalse := VAR_n16_MUX_uxn_opcodes_h_l371_c7_9e90_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_50f0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_9ee6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_5470_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_9e90_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_50f0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_9ee6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_c862_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_5470_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_d352_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l392_c7_50f0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l392_c7_50f0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l396_c7_9ee6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l353_c7_9e10_iffalse := VAR_t16_MUX_uxn_opcodes_h_l356_c7_9d03_return_output;
     -- n16_MUX[uxn_opcodes_h_l368_c7_5470] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l368_c7_5470_cond <= VAR_n16_MUX_uxn_opcodes_h_l368_c7_5470_cond;
     n16_MUX_uxn_opcodes_h_l368_c7_5470_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l368_c7_5470_iftrue;
     n16_MUX_uxn_opcodes_h_l368_c7_5470_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l368_c7_5470_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l368_c7_5470_return_output := n16_MUX_uxn_opcodes_h_l368_c7_5470_return_output;

     -- t16_MUX[uxn_opcodes_h_l353_c7_9e10] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l353_c7_9e10_cond <= VAR_t16_MUX_uxn_opcodes_h_l353_c7_9e10_cond;
     t16_MUX_uxn_opcodes_h_l353_c7_9e10_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l353_c7_9e10_iftrue;
     t16_MUX_uxn_opcodes_h_l353_c7_9e10_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l353_c7_9e10_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l353_c7_9e10_return_output := t16_MUX_uxn_opcodes_h_l353_c7_9e10_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l368_c7_5470] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_5470_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_5470_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_5470_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_5470_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_5470_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_5470_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_5470_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_5470_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l392_c7_50f0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_50f0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_50f0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_50f0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_50f0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_50f0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_50f0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_50f0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_50f0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l392_c7_50f0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l392_c7_50f0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l392_c7_50f0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l392_c7_50f0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l392_c7_50f0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l392_c7_50f0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l392_c7_50f0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l392_c7_50f0_return_output := result_u8_value_MUX_uxn_opcodes_h_l392_c7_50f0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l364_c7_c862] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_c862_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_c862_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_c862_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_c862_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_c862_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_c862_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_c862_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_c862_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l387_c7_d352] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_d352_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_d352_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_d352_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_d352_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_d352_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_d352_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_d352_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_d352_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l392_c7_50f0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_50f0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_50f0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_50f0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_50f0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_50f0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_50f0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_50f0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_50f0_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l364_c7_c862_iffalse := VAR_n16_MUX_uxn_opcodes_h_l368_c7_5470_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_d352_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l392_c7_50f0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_c862_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_5470_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_d352_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l392_c7_50f0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_6eec_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_c862_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_91fd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c7_d352_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l387_c7_d352_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l392_c7_50f0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l348_c2_62ca_iffalse := VAR_t16_MUX_uxn_opcodes_h_l353_c7_9e10_return_output;
     -- n16_MUX[uxn_opcodes_h_l364_c7_c862] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l364_c7_c862_cond <= VAR_n16_MUX_uxn_opcodes_h_l364_c7_c862_cond;
     n16_MUX_uxn_opcodes_h_l364_c7_c862_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l364_c7_c862_iftrue;
     n16_MUX_uxn_opcodes_h_l364_c7_c862_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l364_c7_c862_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l364_c7_c862_return_output := n16_MUX_uxn_opcodes_h_l364_c7_c862_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l379_c7_91fd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_91fd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_91fd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_91fd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_91fd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_91fd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_91fd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_91fd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_91fd_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l387_c7_d352] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l387_c7_d352_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l387_c7_d352_cond;
     result_u8_value_MUX_uxn_opcodes_h_l387_c7_d352_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l387_c7_d352_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l387_c7_d352_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l387_c7_d352_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l387_c7_d352_return_output := result_u8_value_MUX_uxn_opcodes_h_l387_c7_d352_return_output;

     -- t16_MUX[uxn_opcodes_h_l348_c2_62ca] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l348_c2_62ca_cond <= VAR_t16_MUX_uxn_opcodes_h_l348_c2_62ca_cond;
     t16_MUX_uxn_opcodes_h_l348_c2_62ca_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l348_c2_62ca_iftrue;
     t16_MUX_uxn_opcodes_h_l348_c2_62ca_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l348_c2_62ca_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l348_c2_62ca_return_output := t16_MUX_uxn_opcodes_h_l348_c2_62ca_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l387_c7_d352] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_d352_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_d352_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_d352_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_d352_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_d352_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_d352_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_d352_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_d352_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l364_c7_c862] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_c862_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_c862_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_c862_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_c862_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_c862_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_c862_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_c862_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_c862_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l361_c7_6eec] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_6eec_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_6eec_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_6eec_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_6eec_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_6eec_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_6eec_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_6eec_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_6eec_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l387_c7_d352] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_d352_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_d352_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_d352_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_d352_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_d352_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_d352_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_d352_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_d352_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l361_c7_6eec_iffalse := VAR_n16_MUX_uxn_opcodes_h_l364_c7_c862_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_91fd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c7_d352_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_6eec_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_c862_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_91fd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c7_d352_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_9d03_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_6eec_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_8b04_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_91fd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l379_c7_91fd_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l387_c7_d352_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l348_c2_62ca_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l379_c7_91fd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_91fd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_91fd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_91fd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_91fd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_91fd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_91fd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_91fd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_91fd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l379_c7_91fd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_91fd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_91fd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_91fd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_91fd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_91fd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_91fd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_91fd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_91fd_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l361_c7_6eec] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_6eec_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_6eec_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_6eec_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_6eec_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_6eec_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_6eec_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_6eec_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_6eec_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l356_c7_9d03] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_9d03_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_9d03_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_9d03_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_9d03_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_9d03_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_9d03_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_9d03_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_9d03_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l376_c7_8b04] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_8b04_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_8b04_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_8b04_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_8b04_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_8b04_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_8b04_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_8b04_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_8b04_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l379_c7_91fd] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l379_c7_91fd_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l379_c7_91fd_cond;
     result_u8_value_MUX_uxn_opcodes_h_l379_c7_91fd_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l379_c7_91fd_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l379_c7_91fd_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l379_c7_91fd_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l379_c7_91fd_return_output := result_u8_value_MUX_uxn_opcodes_h_l379_c7_91fd_return_output;

     -- n16_MUX[uxn_opcodes_h_l361_c7_6eec] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l361_c7_6eec_cond <= VAR_n16_MUX_uxn_opcodes_h_l361_c7_6eec_cond;
     n16_MUX_uxn_opcodes_h_l361_c7_6eec_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l361_c7_6eec_iftrue;
     n16_MUX_uxn_opcodes_h_l361_c7_6eec_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l361_c7_6eec_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l361_c7_6eec_return_output := n16_MUX_uxn_opcodes_h_l361_c7_6eec_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l356_c7_9d03_iffalse := VAR_n16_MUX_uxn_opcodes_h_l361_c7_6eec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_8b04_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_91fd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_9d03_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_6eec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_8b04_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_91fd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_9e10_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_9d03_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_9e90_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_8b04_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_8b04_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l379_c7_91fd_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l371_c7_9e90] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_9e90_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_9e90_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_9e90_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_9e90_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_9e90_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_9e90_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_9e90_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_9e90_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l376_c7_8b04] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_8b04_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_8b04_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_8b04_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_8b04_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_8b04_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_8b04_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_8b04_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_8b04_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l356_c7_9d03] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_9d03_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_9d03_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_9d03_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_9d03_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_9d03_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_9d03_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_9d03_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_9d03_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l376_c7_8b04] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l376_c7_8b04_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_8b04_cond;
     result_u8_value_MUX_uxn_opcodes_h_l376_c7_8b04_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_8b04_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l376_c7_8b04_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_8b04_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_8b04_return_output := result_u8_value_MUX_uxn_opcodes_h_l376_c7_8b04_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l376_c7_8b04] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_8b04_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_8b04_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_8b04_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_8b04_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_8b04_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_8b04_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_8b04_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_8b04_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l353_c7_9e10] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_9e10_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_9e10_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_9e10_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_9e10_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_9e10_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_9e10_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_9e10_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_9e10_return_output;

     -- n16_MUX[uxn_opcodes_h_l356_c7_9d03] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l356_c7_9d03_cond <= VAR_n16_MUX_uxn_opcodes_h_l356_c7_9d03_cond;
     n16_MUX_uxn_opcodes_h_l356_c7_9d03_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l356_c7_9d03_iftrue;
     n16_MUX_uxn_opcodes_h_l356_c7_9d03_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l356_c7_9d03_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l356_c7_9d03_return_output := n16_MUX_uxn_opcodes_h_l356_c7_9d03_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l353_c7_9e10_iffalse := VAR_n16_MUX_uxn_opcodes_h_l356_c7_9d03_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_9e90_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_8b04_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_9e10_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_9d03_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_9e90_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_8b04_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_62ca_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_9e10_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_5470_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_9e90_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l371_c7_9e90_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_8b04_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l348_c2_62ca] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_62ca_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_62ca_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_62ca_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_62ca_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_62ca_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_62ca_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_62ca_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_62ca_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l368_c7_5470] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_5470_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_5470_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_5470_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_5470_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_5470_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_5470_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_5470_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_5470_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l371_c7_9e90] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l371_c7_9e90_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l371_c7_9e90_cond;
     result_u8_value_MUX_uxn_opcodes_h_l371_c7_9e90_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l371_c7_9e90_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l371_c7_9e90_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l371_c7_9e90_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l371_c7_9e90_return_output := result_u8_value_MUX_uxn_opcodes_h_l371_c7_9e90_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l353_c7_9e10] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_9e10_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_9e10_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_9e10_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_9e10_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_9e10_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_9e10_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_9e10_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_9e10_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l371_c7_9e90] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_9e90_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_9e90_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_9e90_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_9e90_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_9e90_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_9e90_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_9e90_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_9e90_return_output;

     -- n16_MUX[uxn_opcodes_h_l353_c7_9e10] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l353_c7_9e10_cond <= VAR_n16_MUX_uxn_opcodes_h_l353_c7_9e10_cond;
     n16_MUX_uxn_opcodes_h_l353_c7_9e10_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l353_c7_9e10_iftrue;
     n16_MUX_uxn_opcodes_h_l353_c7_9e10_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l353_c7_9e10_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l353_c7_9e10_return_output := n16_MUX_uxn_opcodes_h_l353_c7_9e10_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l371_c7_9e90] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_9e90_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_9e90_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_9e90_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_9e90_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_9e90_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_9e90_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_9e90_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_9e90_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l348_c2_62ca_iffalse := VAR_n16_MUX_uxn_opcodes_h_l353_c7_9e10_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_5470_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_9e90_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_62ca_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_9e10_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_5470_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_9e90_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_c862_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_5470_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_5470_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l371_c7_9e90_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l364_c7_c862] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_c862_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_c862_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_c862_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_c862_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_c862_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_c862_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_c862_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_c862_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l368_c7_5470] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_5470_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_5470_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_5470_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_5470_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_5470_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_5470_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_5470_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_5470_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l348_c2_62ca] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_62ca_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_62ca_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_62ca_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_62ca_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_62ca_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_62ca_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_62ca_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_62ca_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l368_c7_5470] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_5470_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_5470_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_5470_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_5470_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_5470_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_5470_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_5470_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_5470_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l368_c7_5470] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l368_c7_5470_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_5470_cond;
     result_u8_value_MUX_uxn_opcodes_h_l368_c7_5470_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_5470_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l368_c7_5470_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_5470_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_5470_return_output := result_u8_value_MUX_uxn_opcodes_h_l368_c7_5470_return_output;

     -- n16_MUX[uxn_opcodes_h_l348_c2_62ca] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l348_c2_62ca_cond <= VAR_n16_MUX_uxn_opcodes_h_l348_c2_62ca_cond;
     n16_MUX_uxn_opcodes_h_l348_c2_62ca_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l348_c2_62ca_iftrue;
     n16_MUX_uxn_opcodes_h_l348_c2_62ca_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l348_c2_62ca_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l348_c2_62ca_return_output := n16_MUX_uxn_opcodes_h_l348_c2_62ca_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l348_c2_62ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_c862_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_5470_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_c862_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_5470_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_6eec_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_c862_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l364_c7_c862_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_5470_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l364_c7_c862] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_c862_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_c862_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_c862_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_c862_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_c862_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_c862_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_c862_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_c862_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l361_c7_6eec] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_6eec_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_6eec_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_6eec_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_6eec_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_6eec_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_6eec_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_6eec_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_6eec_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l364_c7_c862] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_c862_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_c862_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_c862_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_c862_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_c862_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_c862_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_c862_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_c862_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l364_c7_c862] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l364_c7_c862_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l364_c7_c862_cond;
     result_u8_value_MUX_uxn_opcodes_h_l364_c7_c862_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l364_c7_c862_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l364_c7_c862_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l364_c7_c862_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l364_c7_c862_return_output := result_u8_value_MUX_uxn_opcodes_h_l364_c7_c862_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_6eec_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_c862_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_6eec_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_c862_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_9d03_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_6eec_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l361_c7_6eec_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l364_c7_c862_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l361_c7_6eec] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_6eec_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_6eec_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_6eec_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_6eec_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_6eec_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_6eec_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_6eec_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_6eec_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l356_c7_9d03] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_9d03_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_9d03_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_9d03_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_9d03_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_9d03_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_9d03_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_9d03_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_9d03_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l361_c7_6eec] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_6eec_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_6eec_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_6eec_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_6eec_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_6eec_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_6eec_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_6eec_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_6eec_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l361_c7_6eec] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l361_c7_6eec_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l361_c7_6eec_cond;
     result_u8_value_MUX_uxn_opcodes_h_l361_c7_6eec_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l361_c7_6eec_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l361_c7_6eec_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l361_c7_6eec_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l361_c7_6eec_return_output := result_u8_value_MUX_uxn_opcodes_h_l361_c7_6eec_return_output;

     -- Submodule level 13
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_9d03_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_6eec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_9d03_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_6eec_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_9e10_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_9d03_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l356_c7_9d03_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l361_c7_6eec_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l356_c7_9d03] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_9d03_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_9d03_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_9d03_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_9d03_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_9d03_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_9d03_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_9d03_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_9d03_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l353_c7_9e10] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_9e10_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_9e10_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_9e10_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_9e10_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_9e10_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_9e10_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_9e10_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_9e10_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l356_c7_9d03] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_9d03_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_9d03_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_9d03_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_9d03_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_9d03_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_9d03_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_9d03_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_9d03_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l356_c7_9d03] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l356_c7_9d03_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l356_c7_9d03_cond;
     result_u8_value_MUX_uxn_opcodes_h_l356_c7_9d03_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l356_c7_9d03_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l356_c7_9d03_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l356_c7_9d03_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l356_c7_9d03_return_output := result_u8_value_MUX_uxn_opcodes_h_l356_c7_9d03_return_output;

     -- Submodule level 14
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_9e10_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_9d03_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_9e10_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_9d03_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_62ca_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_9e10_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l353_c7_9e10_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l356_c7_9d03_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l353_c7_9e10] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_9e10_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_9e10_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_9e10_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_9e10_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_9e10_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_9e10_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_9e10_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_9e10_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l353_c7_9e10] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_9e10_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_9e10_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_9e10_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_9e10_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_9e10_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_9e10_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_9e10_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_9e10_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l353_c7_9e10] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l353_c7_9e10_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l353_c7_9e10_cond;
     result_u8_value_MUX_uxn_opcodes_h_l353_c7_9e10_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l353_c7_9e10_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l353_c7_9e10_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l353_c7_9e10_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l353_c7_9e10_return_output := result_u8_value_MUX_uxn_opcodes_h_l353_c7_9e10_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l348_c2_62ca] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_62ca_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_62ca_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_62ca_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_62ca_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_62ca_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_62ca_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_62ca_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_62ca_return_output;

     -- Submodule level 15
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_62ca_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_9e10_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_62ca_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_9e10_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l348_c2_62ca_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l353_c7_9e10_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l348_c2_62ca] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_62ca_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_62ca_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_62ca_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_62ca_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_62ca_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_62ca_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_62ca_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_62ca_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l348_c2_62ca] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l348_c2_62ca_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l348_c2_62ca_cond;
     result_u8_value_MUX_uxn_opcodes_h_l348_c2_62ca_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l348_c2_62ca_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l348_c2_62ca_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l348_c2_62ca_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l348_c2_62ca_return_output := result_u8_value_MUX_uxn_opcodes_h_l348_c2_62ca_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l348_c2_62ca] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_62ca_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_62ca_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_62ca_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_62ca_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_62ca_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_62ca_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_62ca_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_62ca_return_output;

     -- Submodule level 16
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l413_l344_DUPLICATE_1933 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l413_l344_DUPLICATE_1933_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_641b(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_62ca_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_62ca_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_62ca_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_62ca_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l348_c2_62ca_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_62ca_return_output);

     -- Submodule level 17
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l413_l344_DUPLICATE_1933_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l413_l344_DUPLICATE_1933_return_output;
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
