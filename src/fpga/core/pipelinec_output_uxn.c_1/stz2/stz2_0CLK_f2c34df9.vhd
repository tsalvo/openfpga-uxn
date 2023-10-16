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
-- Submodules: 87
entity stz2_0CLK_f2c34df9 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end stz2_0CLK_f2c34df9;
architecture arch of stz2_0CLK_f2c34df9 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1641_c6_9960]
signal BIN_OP_EQ_uxn_opcodes_h_l1641_c6_9960_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1641_c6_9960_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1641_c6_9960_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1641_c1_7a5b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1641_c1_7a5b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1641_c1_7a5b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1641_c1_7a5b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1641_c1_7a5b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1641_c2_3875]
signal n16_MUX_uxn_opcodes_h_l1641_c2_3875_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1641_c2_3875_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1641_c2_3875_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1641_c2_3875_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1641_c2_3875]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c2_3875_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c2_3875_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c2_3875_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c2_3875_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1641_c2_3875]
signal result_u16_value_MUX_uxn_opcodes_h_l1641_c2_3875_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1641_c2_3875_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1641_c2_3875_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1641_c2_3875_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1641_c2_3875]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c2_3875_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c2_3875_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c2_3875_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c2_3875_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1641_c2_3875]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c2_3875_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c2_3875_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c2_3875_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c2_3875_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1641_c2_3875]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1641_c2_3875_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1641_c2_3875_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1641_c2_3875_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1641_c2_3875_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1641_c2_3875]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1641_c2_3875_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1641_c2_3875_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1641_c2_3875_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1641_c2_3875_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1641_c2_3875]
signal result_u8_value_MUX_uxn_opcodes_h_l1641_c2_3875_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1641_c2_3875_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1641_c2_3875_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1641_c2_3875_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1641_c2_3875]
signal t8_MUX_uxn_opcodes_h_l1641_c2_3875_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1641_c2_3875_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1641_c2_3875_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1641_c2_3875_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l1642_c3_f005[uxn_opcodes_h_l1642_c3_f005]
signal printf_uxn_opcodes_h_l1642_c3_f005_uxn_opcodes_h_l1642_c3_f005_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1646_c11_3459]
signal BIN_OP_EQ_uxn_opcodes_h_l1646_c11_3459_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1646_c11_3459_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1646_c11_3459_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1646_c7_3f54]
signal n16_MUX_uxn_opcodes_h_l1646_c7_3f54_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1646_c7_3f54_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1646_c7_3f54_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1646_c7_3f54_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1646_c7_3f54]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_3f54_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_3f54_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_3f54_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_3f54_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1646_c7_3f54]
signal result_u16_value_MUX_uxn_opcodes_h_l1646_c7_3f54_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1646_c7_3f54_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1646_c7_3f54_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1646_c7_3f54_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1646_c7_3f54]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_3f54_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_3f54_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_3f54_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_3f54_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1646_c7_3f54]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_3f54_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_3f54_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_3f54_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_3f54_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1646_c7_3f54]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_3f54_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_3f54_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_3f54_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_3f54_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1646_c7_3f54]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1646_c7_3f54_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1646_c7_3f54_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1646_c7_3f54_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1646_c7_3f54_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1646_c7_3f54]
signal result_u8_value_MUX_uxn_opcodes_h_l1646_c7_3f54_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1646_c7_3f54_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1646_c7_3f54_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1646_c7_3f54_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1646_c7_3f54]
signal t8_MUX_uxn_opcodes_h_l1646_c7_3f54_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1646_c7_3f54_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1646_c7_3f54_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1646_c7_3f54_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1649_c11_3d6a]
signal BIN_OP_EQ_uxn_opcodes_h_l1649_c11_3d6a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1649_c11_3d6a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1649_c11_3d6a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1649_c7_c3d4]
signal n16_MUX_uxn_opcodes_h_l1649_c7_c3d4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1649_c7_c3d4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1649_c7_c3d4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1649_c7_c3d4_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1649_c7_c3d4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_c3d4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_c3d4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_c3d4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_c3d4_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1649_c7_c3d4]
signal result_u16_value_MUX_uxn_opcodes_h_l1649_c7_c3d4_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1649_c7_c3d4_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1649_c7_c3d4_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1649_c7_c3d4_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1649_c7_c3d4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1649_c7_c3d4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1649_c7_c3d4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1649_c7_c3d4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1649_c7_c3d4_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1649_c7_c3d4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_c3d4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_c3d4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_c3d4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_c3d4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1649_c7_c3d4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_c3d4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_c3d4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_c3d4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_c3d4_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1649_c7_c3d4]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_c3d4_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_c3d4_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_c3d4_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_c3d4_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1649_c7_c3d4]
signal result_u8_value_MUX_uxn_opcodes_h_l1649_c7_c3d4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1649_c7_c3d4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1649_c7_c3d4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1649_c7_c3d4_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1649_c7_c3d4]
signal t8_MUX_uxn_opcodes_h_l1649_c7_c3d4_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1649_c7_c3d4_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1649_c7_c3d4_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1649_c7_c3d4_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1653_c11_4fd7]
signal BIN_OP_EQ_uxn_opcodes_h_l1653_c11_4fd7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1653_c11_4fd7_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1653_c11_4fd7_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1653_c7_3401]
signal n16_MUX_uxn_opcodes_h_l1653_c7_3401_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1653_c7_3401_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1653_c7_3401_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1653_c7_3401_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1653_c7_3401]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_3401_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_3401_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_3401_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_3401_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1653_c7_3401]
signal result_u16_value_MUX_uxn_opcodes_h_l1653_c7_3401_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1653_c7_3401_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1653_c7_3401_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1653_c7_3401_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1653_c7_3401]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1653_c7_3401_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1653_c7_3401_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1653_c7_3401_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1653_c7_3401_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1653_c7_3401]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_3401_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_3401_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_3401_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_3401_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1653_c7_3401]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_3401_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_3401_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_3401_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_3401_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1653_c7_3401]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_3401_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_3401_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_3401_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_3401_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1653_c7_3401]
signal result_u8_value_MUX_uxn_opcodes_h_l1653_c7_3401_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1653_c7_3401_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1653_c7_3401_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1653_c7_3401_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1656_c11_3519]
signal BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3519_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3519_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3519_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1656_c7_8fff]
signal n16_MUX_uxn_opcodes_h_l1656_c7_8fff_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1656_c7_8fff_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1656_c7_8fff_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1656_c7_8fff_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1656_c7_8fff]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_8fff_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_8fff_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_8fff_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_8fff_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1656_c7_8fff]
signal result_u16_value_MUX_uxn_opcodes_h_l1656_c7_8fff_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1656_c7_8fff_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1656_c7_8fff_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1656_c7_8fff_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1656_c7_8fff]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_8fff_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_8fff_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_8fff_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_8fff_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1656_c7_8fff]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_8fff_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_8fff_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_8fff_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_8fff_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1656_c7_8fff]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_8fff_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_8fff_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_8fff_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_8fff_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1656_c7_8fff]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1656_c7_8fff_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1656_c7_8fff_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1656_c7_8fff_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1656_c7_8fff_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1656_c7_8fff]
signal result_u8_value_MUX_uxn_opcodes_h_l1656_c7_8fff_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1656_c7_8fff_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1656_c7_8fff_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1656_c7_8fff_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1658_c3_df01]
signal CONST_SL_8_uxn_opcodes_h_l1658_c3_df01_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1658_c3_df01_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1661_c11_d37a]
signal BIN_OP_EQ_uxn_opcodes_h_l1661_c11_d37a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1661_c11_d37a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1661_c11_d37a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1661_c7_5220]
signal n16_MUX_uxn_opcodes_h_l1661_c7_5220_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1661_c7_5220_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1661_c7_5220_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1661_c7_5220_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1661_c7_5220]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c7_5220_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c7_5220_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c7_5220_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c7_5220_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1661_c7_5220]
signal result_u16_value_MUX_uxn_opcodes_h_l1661_c7_5220_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1661_c7_5220_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1661_c7_5220_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1661_c7_5220_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1661_c7_5220]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c7_5220_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c7_5220_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c7_5220_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c7_5220_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1661_c7_5220]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_5220_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_5220_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_5220_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_5220_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1661_c7_5220]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_5220_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_5220_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_5220_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_5220_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1661_c7_5220]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_5220_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_5220_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_5220_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_5220_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1661_c7_5220]
signal result_u8_value_MUX_uxn_opcodes_h_l1661_c7_5220_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1661_c7_5220_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1661_c7_5220_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1661_c7_5220_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1664_c11_f8ce]
signal BIN_OP_EQ_uxn_opcodes_h_l1664_c11_f8ce_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1664_c11_f8ce_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1664_c11_f8ce_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1664_c7_90b9]
signal n16_MUX_uxn_opcodes_h_l1664_c7_90b9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1664_c7_90b9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1664_c7_90b9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1664_c7_90b9_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1664_c7_90b9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1664_c7_90b9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1664_c7_90b9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1664_c7_90b9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1664_c7_90b9_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1664_c7_90b9]
signal result_u16_value_MUX_uxn_opcodes_h_l1664_c7_90b9_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1664_c7_90b9_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1664_c7_90b9_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1664_c7_90b9_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1664_c7_90b9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1664_c7_90b9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1664_c7_90b9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1664_c7_90b9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1664_c7_90b9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1664_c7_90b9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_90b9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_90b9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_90b9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_90b9_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1664_c7_90b9]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1664_c7_90b9_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1664_c7_90b9_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1664_c7_90b9_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1664_c7_90b9_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1664_c7_90b9]
signal result_u8_value_MUX_uxn_opcodes_h_l1664_c7_90b9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1664_c7_90b9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1664_c7_90b9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1664_c7_90b9_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1665_c3_7ba7]
signal BIN_OP_OR_uxn_opcodes_h_l1665_c3_7ba7_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1665_c3_7ba7_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1665_c3_7ba7_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1667_c30_5ddc]
signal sp_relative_shift_uxn_opcodes_h_l1667_c30_5ddc_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1667_c30_5ddc_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1667_c30_5ddc_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1667_c30_5ddc_return_output : signed(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1670_c31_969a]
signal CONST_SR_8_uxn_opcodes_h_l1670_c31_969a_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1670_c31_969a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1672_c11_855c]
signal BIN_OP_EQ_uxn_opcodes_h_l1672_c11_855c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1672_c11_855c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1672_c11_855c_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1672_c7_9bff]
signal result_u16_value_MUX_uxn_opcodes_h_l1672_c7_9bff_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1672_c7_9bff_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1672_c7_9bff_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1672_c7_9bff_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1672_c7_9bff]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1672_c7_9bff_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1672_c7_9bff_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1672_c7_9bff_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1672_c7_9bff_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1672_c7_9bff]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_9bff_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_9bff_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_9bff_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_9bff_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1672_c7_9bff]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1672_c7_9bff_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1672_c7_9bff_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1672_c7_9bff_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1672_c7_9bff_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1672_c7_9bff]
signal result_u8_value_MUX_uxn_opcodes_h_l1672_c7_9bff_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1672_c7_9bff_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1672_c7_9bff_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1672_c7_9bff_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1674_c33_a4fa]
signal BIN_OP_PLUS_uxn_opcodes_h_l1674_c33_a4fa_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1674_c33_a4fa_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1674_c33_a4fa_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1677_c11_5875]
signal BIN_OP_EQ_uxn_opcodes_h_l1677_c11_5875_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1677_c11_5875_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1677_c11_5875_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1677_c7_1451]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_1451_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_1451_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_1451_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_1451_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1677_c7_1451]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_1451_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_1451_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_1451_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_1451_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CAST_TO_uint16_t_uint9_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(8 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_0ba7( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.u16_value := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.is_ram_write := ref_toks_6;
      base.u8_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1641_c6_9960
BIN_OP_EQ_uxn_opcodes_h_l1641_c6_9960 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1641_c6_9960_left,
BIN_OP_EQ_uxn_opcodes_h_l1641_c6_9960_right,
BIN_OP_EQ_uxn_opcodes_h_l1641_c6_9960_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1641_c1_7a5b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1641_c1_7a5b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1641_c1_7a5b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1641_c1_7a5b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1641_c1_7a5b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1641_c1_7a5b_return_output);

-- n16_MUX_uxn_opcodes_h_l1641_c2_3875
n16_MUX_uxn_opcodes_h_l1641_c2_3875 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1641_c2_3875_cond,
n16_MUX_uxn_opcodes_h_l1641_c2_3875_iftrue,
n16_MUX_uxn_opcodes_h_l1641_c2_3875_iffalse,
n16_MUX_uxn_opcodes_h_l1641_c2_3875_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c2_3875
result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c2_3875 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c2_3875_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c2_3875_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c2_3875_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c2_3875_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1641_c2_3875
result_u16_value_MUX_uxn_opcodes_h_l1641_c2_3875 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1641_c2_3875_cond,
result_u16_value_MUX_uxn_opcodes_h_l1641_c2_3875_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1641_c2_3875_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1641_c2_3875_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c2_3875
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c2_3875 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c2_3875_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c2_3875_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c2_3875_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c2_3875_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c2_3875
result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c2_3875 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c2_3875_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c2_3875_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c2_3875_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c2_3875_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1641_c2_3875
result_is_opc_done_MUX_uxn_opcodes_h_l1641_c2_3875 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1641_c2_3875_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1641_c2_3875_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1641_c2_3875_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1641_c2_3875_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1641_c2_3875
result_is_ram_write_MUX_uxn_opcodes_h_l1641_c2_3875 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1641_c2_3875_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1641_c2_3875_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1641_c2_3875_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1641_c2_3875_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1641_c2_3875
result_u8_value_MUX_uxn_opcodes_h_l1641_c2_3875 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1641_c2_3875_cond,
result_u8_value_MUX_uxn_opcodes_h_l1641_c2_3875_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1641_c2_3875_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1641_c2_3875_return_output);

-- t8_MUX_uxn_opcodes_h_l1641_c2_3875
t8_MUX_uxn_opcodes_h_l1641_c2_3875 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1641_c2_3875_cond,
t8_MUX_uxn_opcodes_h_l1641_c2_3875_iftrue,
t8_MUX_uxn_opcodes_h_l1641_c2_3875_iffalse,
t8_MUX_uxn_opcodes_h_l1641_c2_3875_return_output);

-- printf_uxn_opcodes_h_l1642_c3_f005_uxn_opcodes_h_l1642_c3_f005
printf_uxn_opcodes_h_l1642_c3_f005_uxn_opcodes_h_l1642_c3_f005 : entity work.printf_uxn_opcodes_h_l1642_c3_f005_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1642_c3_f005_uxn_opcodes_h_l1642_c3_f005_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1646_c11_3459
BIN_OP_EQ_uxn_opcodes_h_l1646_c11_3459 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1646_c11_3459_left,
BIN_OP_EQ_uxn_opcodes_h_l1646_c11_3459_right,
BIN_OP_EQ_uxn_opcodes_h_l1646_c11_3459_return_output);

-- n16_MUX_uxn_opcodes_h_l1646_c7_3f54
n16_MUX_uxn_opcodes_h_l1646_c7_3f54 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1646_c7_3f54_cond,
n16_MUX_uxn_opcodes_h_l1646_c7_3f54_iftrue,
n16_MUX_uxn_opcodes_h_l1646_c7_3f54_iffalse,
n16_MUX_uxn_opcodes_h_l1646_c7_3f54_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_3f54
result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_3f54 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_3f54_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_3f54_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_3f54_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_3f54_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1646_c7_3f54
result_u16_value_MUX_uxn_opcodes_h_l1646_c7_3f54 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1646_c7_3f54_cond,
result_u16_value_MUX_uxn_opcodes_h_l1646_c7_3f54_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1646_c7_3f54_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1646_c7_3f54_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_3f54
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_3f54 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_3f54_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_3f54_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_3f54_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_3f54_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_3f54
result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_3f54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_3f54_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_3f54_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_3f54_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_3f54_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_3f54
result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_3f54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_3f54_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_3f54_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_3f54_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_3f54_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1646_c7_3f54
result_is_ram_write_MUX_uxn_opcodes_h_l1646_c7_3f54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1646_c7_3f54_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1646_c7_3f54_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1646_c7_3f54_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1646_c7_3f54_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1646_c7_3f54
result_u8_value_MUX_uxn_opcodes_h_l1646_c7_3f54 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1646_c7_3f54_cond,
result_u8_value_MUX_uxn_opcodes_h_l1646_c7_3f54_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1646_c7_3f54_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1646_c7_3f54_return_output);

-- t8_MUX_uxn_opcodes_h_l1646_c7_3f54
t8_MUX_uxn_opcodes_h_l1646_c7_3f54 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1646_c7_3f54_cond,
t8_MUX_uxn_opcodes_h_l1646_c7_3f54_iftrue,
t8_MUX_uxn_opcodes_h_l1646_c7_3f54_iffalse,
t8_MUX_uxn_opcodes_h_l1646_c7_3f54_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1649_c11_3d6a
BIN_OP_EQ_uxn_opcodes_h_l1649_c11_3d6a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1649_c11_3d6a_left,
BIN_OP_EQ_uxn_opcodes_h_l1649_c11_3d6a_right,
BIN_OP_EQ_uxn_opcodes_h_l1649_c11_3d6a_return_output);

-- n16_MUX_uxn_opcodes_h_l1649_c7_c3d4
n16_MUX_uxn_opcodes_h_l1649_c7_c3d4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1649_c7_c3d4_cond,
n16_MUX_uxn_opcodes_h_l1649_c7_c3d4_iftrue,
n16_MUX_uxn_opcodes_h_l1649_c7_c3d4_iffalse,
n16_MUX_uxn_opcodes_h_l1649_c7_c3d4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_c3d4
result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_c3d4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_c3d4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_c3d4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_c3d4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_c3d4_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1649_c7_c3d4
result_u16_value_MUX_uxn_opcodes_h_l1649_c7_c3d4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1649_c7_c3d4_cond,
result_u16_value_MUX_uxn_opcodes_h_l1649_c7_c3d4_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1649_c7_c3d4_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1649_c7_c3d4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1649_c7_c3d4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1649_c7_c3d4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1649_c7_c3d4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1649_c7_c3d4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1649_c7_c3d4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1649_c7_c3d4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_c3d4
result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_c3d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_c3d4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_c3d4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_c3d4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_c3d4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_c3d4
result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_c3d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_c3d4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_c3d4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_c3d4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_c3d4_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_c3d4
result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_c3d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_c3d4_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_c3d4_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_c3d4_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_c3d4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1649_c7_c3d4
result_u8_value_MUX_uxn_opcodes_h_l1649_c7_c3d4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1649_c7_c3d4_cond,
result_u8_value_MUX_uxn_opcodes_h_l1649_c7_c3d4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1649_c7_c3d4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1649_c7_c3d4_return_output);

-- t8_MUX_uxn_opcodes_h_l1649_c7_c3d4
t8_MUX_uxn_opcodes_h_l1649_c7_c3d4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1649_c7_c3d4_cond,
t8_MUX_uxn_opcodes_h_l1649_c7_c3d4_iftrue,
t8_MUX_uxn_opcodes_h_l1649_c7_c3d4_iffalse,
t8_MUX_uxn_opcodes_h_l1649_c7_c3d4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1653_c11_4fd7
BIN_OP_EQ_uxn_opcodes_h_l1653_c11_4fd7 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1653_c11_4fd7_left,
BIN_OP_EQ_uxn_opcodes_h_l1653_c11_4fd7_right,
BIN_OP_EQ_uxn_opcodes_h_l1653_c11_4fd7_return_output);

-- n16_MUX_uxn_opcodes_h_l1653_c7_3401
n16_MUX_uxn_opcodes_h_l1653_c7_3401 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1653_c7_3401_cond,
n16_MUX_uxn_opcodes_h_l1653_c7_3401_iftrue,
n16_MUX_uxn_opcodes_h_l1653_c7_3401_iffalse,
n16_MUX_uxn_opcodes_h_l1653_c7_3401_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_3401
result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_3401 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_3401_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_3401_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_3401_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_3401_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1653_c7_3401
result_u16_value_MUX_uxn_opcodes_h_l1653_c7_3401 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1653_c7_3401_cond,
result_u16_value_MUX_uxn_opcodes_h_l1653_c7_3401_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1653_c7_3401_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1653_c7_3401_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1653_c7_3401
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1653_c7_3401 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1653_c7_3401_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1653_c7_3401_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1653_c7_3401_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1653_c7_3401_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_3401
result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_3401 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_3401_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_3401_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_3401_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_3401_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_3401
result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_3401 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_3401_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_3401_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_3401_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_3401_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_3401
result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_3401 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_3401_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_3401_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_3401_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_3401_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1653_c7_3401
result_u8_value_MUX_uxn_opcodes_h_l1653_c7_3401 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1653_c7_3401_cond,
result_u8_value_MUX_uxn_opcodes_h_l1653_c7_3401_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1653_c7_3401_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1653_c7_3401_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3519
BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3519 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3519_left,
BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3519_right,
BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3519_return_output);

-- n16_MUX_uxn_opcodes_h_l1656_c7_8fff
n16_MUX_uxn_opcodes_h_l1656_c7_8fff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1656_c7_8fff_cond,
n16_MUX_uxn_opcodes_h_l1656_c7_8fff_iftrue,
n16_MUX_uxn_opcodes_h_l1656_c7_8fff_iffalse,
n16_MUX_uxn_opcodes_h_l1656_c7_8fff_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_8fff
result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_8fff : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_8fff_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_8fff_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_8fff_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_8fff_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1656_c7_8fff
result_u16_value_MUX_uxn_opcodes_h_l1656_c7_8fff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1656_c7_8fff_cond,
result_u16_value_MUX_uxn_opcodes_h_l1656_c7_8fff_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1656_c7_8fff_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1656_c7_8fff_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_8fff
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_8fff : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_8fff_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_8fff_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_8fff_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_8fff_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_8fff
result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_8fff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_8fff_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_8fff_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_8fff_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_8fff_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_8fff
result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_8fff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_8fff_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_8fff_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_8fff_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_8fff_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1656_c7_8fff
result_is_ram_write_MUX_uxn_opcodes_h_l1656_c7_8fff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1656_c7_8fff_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1656_c7_8fff_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1656_c7_8fff_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1656_c7_8fff_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1656_c7_8fff
result_u8_value_MUX_uxn_opcodes_h_l1656_c7_8fff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1656_c7_8fff_cond,
result_u8_value_MUX_uxn_opcodes_h_l1656_c7_8fff_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1656_c7_8fff_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1656_c7_8fff_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1658_c3_df01
CONST_SL_8_uxn_opcodes_h_l1658_c3_df01 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1658_c3_df01_x,
CONST_SL_8_uxn_opcodes_h_l1658_c3_df01_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1661_c11_d37a
BIN_OP_EQ_uxn_opcodes_h_l1661_c11_d37a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1661_c11_d37a_left,
BIN_OP_EQ_uxn_opcodes_h_l1661_c11_d37a_right,
BIN_OP_EQ_uxn_opcodes_h_l1661_c11_d37a_return_output);

-- n16_MUX_uxn_opcodes_h_l1661_c7_5220
n16_MUX_uxn_opcodes_h_l1661_c7_5220 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1661_c7_5220_cond,
n16_MUX_uxn_opcodes_h_l1661_c7_5220_iftrue,
n16_MUX_uxn_opcodes_h_l1661_c7_5220_iffalse,
n16_MUX_uxn_opcodes_h_l1661_c7_5220_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c7_5220
result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c7_5220 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c7_5220_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c7_5220_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c7_5220_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c7_5220_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1661_c7_5220
result_u16_value_MUX_uxn_opcodes_h_l1661_c7_5220 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1661_c7_5220_cond,
result_u16_value_MUX_uxn_opcodes_h_l1661_c7_5220_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1661_c7_5220_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1661_c7_5220_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c7_5220
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c7_5220 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c7_5220_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c7_5220_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c7_5220_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c7_5220_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_5220
result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_5220 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_5220_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_5220_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_5220_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_5220_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_5220
result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_5220 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_5220_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_5220_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_5220_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_5220_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_5220
result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_5220 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_5220_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_5220_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_5220_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_5220_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1661_c7_5220
result_u8_value_MUX_uxn_opcodes_h_l1661_c7_5220 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1661_c7_5220_cond,
result_u8_value_MUX_uxn_opcodes_h_l1661_c7_5220_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1661_c7_5220_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1661_c7_5220_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1664_c11_f8ce
BIN_OP_EQ_uxn_opcodes_h_l1664_c11_f8ce : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1664_c11_f8ce_left,
BIN_OP_EQ_uxn_opcodes_h_l1664_c11_f8ce_right,
BIN_OP_EQ_uxn_opcodes_h_l1664_c11_f8ce_return_output);

-- n16_MUX_uxn_opcodes_h_l1664_c7_90b9
n16_MUX_uxn_opcodes_h_l1664_c7_90b9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1664_c7_90b9_cond,
n16_MUX_uxn_opcodes_h_l1664_c7_90b9_iftrue,
n16_MUX_uxn_opcodes_h_l1664_c7_90b9_iffalse,
n16_MUX_uxn_opcodes_h_l1664_c7_90b9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1664_c7_90b9
result_sp_relative_shift_MUX_uxn_opcodes_h_l1664_c7_90b9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1664_c7_90b9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1664_c7_90b9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1664_c7_90b9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1664_c7_90b9_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1664_c7_90b9
result_u16_value_MUX_uxn_opcodes_h_l1664_c7_90b9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1664_c7_90b9_cond,
result_u16_value_MUX_uxn_opcodes_h_l1664_c7_90b9_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1664_c7_90b9_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1664_c7_90b9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1664_c7_90b9
result_is_sp_shift_MUX_uxn_opcodes_h_l1664_c7_90b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1664_c7_90b9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1664_c7_90b9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1664_c7_90b9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1664_c7_90b9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_90b9
result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_90b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_90b9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_90b9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_90b9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_90b9_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1664_c7_90b9
result_is_ram_write_MUX_uxn_opcodes_h_l1664_c7_90b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1664_c7_90b9_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1664_c7_90b9_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1664_c7_90b9_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1664_c7_90b9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1664_c7_90b9
result_u8_value_MUX_uxn_opcodes_h_l1664_c7_90b9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1664_c7_90b9_cond,
result_u8_value_MUX_uxn_opcodes_h_l1664_c7_90b9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1664_c7_90b9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1664_c7_90b9_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1665_c3_7ba7
BIN_OP_OR_uxn_opcodes_h_l1665_c3_7ba7 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1665_c3_7ba7_left,
BIN_OP_OR_uxn_opcodes_h_l1665_c3_7ba7_right,
BIN_OP_OR_uxn_opcodes_h_l1665_c3_7ba7_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1667_c30_5ddc
sp_relative_shift_uxn_opcodes_h_l1667_c30_5ddc : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1667_c30_5ddc_ins,
sp_relative_shift_uxn_opcodes_h_l1667_c30_5ddc_x,
sp_relative_shift_uxn_opcodes_h_l1667_c30_5ddc_y,
sp_relative_shift_uxn_opcodes_h_l1667_c30_5ddc_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1670_c31_969a
CONST_SR_8_uxn_opcodes_h_l1670_c31_969a : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1670_c31_969a_x,
CONST_SR_8_uxn_opcodes_h_l1670_c31_969a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1672_c11_855c
BIN_OP_EQ_uxn_opcodes_h_l1672_c11_855c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1672_c11_855c_left,
BIN_OP_EQ_uxn_opcodes_h_l1672_c11_855c_right,
BIN_OP_EQ_uxn_opcodes_h_l1672_c11_855c_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1672_c7_9bff
result_u16_value_MUX_uxn_opcodes_h_l1672_c7_9bff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1672_c7_9bff_cond,
result_u16_value_MUX_uxn_opcodes_h_l1672_c7_9bff_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1672_c7_9bff_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1672_c7_9bff_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1672_c7_9bff
result_is_sp_shift_MUX_uxn_opcodes_h_l1672_c7_9bff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1672_c7_9bff_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1672_c7_9bff_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1672_c7_9bff_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1672_c7_9bff_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_9bff
result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_9bff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_9bff_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_9bff_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_9bff_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_9bff_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1672_c7_9bff
result_is_ram_write_MUX_uxn_opcodes_h_l1672_c7_9bff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1672_c7_9bff_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1672_c7_9bff_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1672_c7_9bff_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1672_c7_9bff_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1672_c7_9bff
result_u8_value_MUX_uxn_opcodes_h_l1672_c7_9bff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1672_c7_9bff_cond,
result_u8_value_MUX_uxn_opcodes_h_l1672_c7_9bff_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1672_c7_9bff_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1672_c7_9bff_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1674_c33_a4fa
BIN_OP_PLUS_uxn_opcodes_h_l1674_c33_a4fa : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1674_c33_a4fa_left,
BIN_OP_PLUS_uxn_opcodes_h_l1674_c33_a4fa_right,
BIN_OP_PLUS_uxn_opcodes_h_l1674_c33_a4fa_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1677_c11_5875
BIN_OP_EQ_uxn_opcodes_h_l1677_c11_5875 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1677_c11_5875_left,
BIN_OP_EQ_uxn_opcodes_h_l1677_c11_5875_right,
BIN_OP_EQ_uxn_opcodes_h_l1677_c11_5875_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_1451
result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_1451 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_1451_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_1451_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_1451_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_1451_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_1451
result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_1451 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_1451_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_1451_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_1451_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_1451_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 n16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1641_c6_9960_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1641_c1_7a5b_return_output,
 n16_MUX_uxn_opcodes_h_l1641_c2_3875_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c2_3875_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1641_c2_3875_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c2_3875_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c2_3875_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1641_c2_3875_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1641_c2_3875_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1641_c2_3875_return_output,
 t8_MUX_uxn_opcodes_h_l1641_c2_3875_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1646_c11_3459_return_output,
 n16_MUX_uxn_opcodes_h_l1646_c7_3f54_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_3f54_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1646_c7_3f54_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_3f54_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_3f54_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_3f54_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1646_c7_3f54_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1646_c7_3f54_return_output,
 t8_MUX_uxn_opcodes_h_l1646_c7_3f54_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1649_c11_3d6a_return_output,
 n16_MUX_uxn_opcodes_h_l1649_c7_c3d4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_c3d4_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1649_c7_c3d4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1649_c7_c3d4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_c3d4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_c3d4_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_c3d4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1649_c7_c3d4_return_output,
 t8_MUX_uxn_opcodes_h_l1649_c7_c3d4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1653_c11_4fd7_return_output,
 n16_MUX_uxn_opcodes_h_l1653_c7_3401_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_3401_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1653_c7_3401_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1653_c7_3401_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_3401_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_3401_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_3401_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1653_c7_3401_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3519_return_output,
 n16_MUX_uxn_opcodes_h_l1656_c7_8fff_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_8fff_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1656_c7_8fff_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_8fff_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_8fff_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_8fff_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1656_c7_8fff_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1656_c7_8fff_return_output,
 CONST_SL_8_uxn_opcodes_h_l1658_c3_df01_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1661_c11_d37a_return_output,
 n16_MUX_uxn_opcodes_h_l1661_c7_5220_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c7_5220_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1661_c7_5220_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c7_5220_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_5220_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_5220_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_5220_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1661_c7_5220_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1664_c11_f8ce_return_output,
 n16_MUX_uxn_opcodes_h_l1664_c7_90b9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1664_c7_90b9_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1664_c7_90b9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1664_c7_90b9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_90b9_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1664_c7_90b9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1664_c7_90b9_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1665_c3_7ba7_return_output,
 sp_relative_shift_uxn_opcodes_h_l1667_c30_5ddc_return_output,
 CONST_SR_8_uxn_opcodes_h_l1670_c31_969a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1672_c11_855c_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1672_c7_9bff_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1672_c7_9bff_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_9bff_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1672_c7_9bff_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1672_c7_9bff_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1674_c33_a4fa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1677_c11_5875_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_1451_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_1451_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c6_9960_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c6_9960_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c6_9960_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1641_c1_7a5b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1641_c1_7a5b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1641_c1_7a5b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1641_c1_7a5b_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1641_c2_3875_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1641_c2_3875_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1646_c7_3f54_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1641_c2_3875_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1641_c2_3875_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c2_3875_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c2_3875_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_3f54_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c2_3875_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c2_3875_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1641_c2_3875_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1641_c2_3875_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1646_c7_3f54_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1641_c2_3875_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1641_c2_3875_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c2_3875_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1643_c3_2a2c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c2_3875_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_3f54_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c2_3875_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c2_3875_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c2_3875_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c2_3875_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_3f54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c2_3875_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c2_3875_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1641_c2_3875_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1641_c2_3875_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_3f54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1641_c2_3875_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1641_c2_3875_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1641_c2_3875_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1641_c2_3875_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1646_c7_3f54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1641_c2_3875_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1641_c2_3875_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1641_c2_3875_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1641_c2_3875_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1646_c7_3f54_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1641_c2_3875_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1641_c2_3875_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1641_c2_3875_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1641_c2_3875_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1646_c7_3f54_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1641_c2_3875_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1641_c2_3875_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1642_c3_f005_uxn_opcodes_h_l1642_c3_f005_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_3459_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_3459_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_3459_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1646_c7_3f54_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1646_c7_3f54_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1649_c7_c3d4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1646_c7_3f54_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_3f54_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_3f54_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_c3d4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_3f54_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1646_c7_3f54_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1646_c7_3f54_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_c3d4_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1646_c7_3f54_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_3f54_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1647_c3_0528 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_3f54_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1649_c7_c3d4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_3f54_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_3f54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_3f54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_c3d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_3f54_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_3f54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_3f54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_c3d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_3f54_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1646_c7_3f54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1646_c7_3f54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_c3d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1646_c7_3f54_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1646_c7_3f54_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1646_c7_3f54_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_c3d4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1646_c7_3f54_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1646_c7_3f54_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1646_c7_3f54_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1649_c7_c3d4_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1646_c7_3f54_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_3d6a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_3d6a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_3d6a_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1649_c7_c3d4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1649_c7_c3d4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1653_c7_3401_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1649_c7_c3d4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_c3d4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_c3d4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_3401_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_c3d4_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_c3d4_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_c3d4_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_3401_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_c3d4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1649_c7_c3d4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1651_c3_f996 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1649_c7_c3d4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1653_c7_3401_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1649_c7_c3d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_c3d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_c3d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_3401_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_c3d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_c3d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_c3d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_3401_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_c3d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_c3d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_c3d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_3401_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_c3d4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_c3d4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_c3d4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_3401_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_c3d4_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1649_c7_c3d4_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1649_c7_c3d4_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1649_c7_c3d4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_4fd7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_4fd7_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_4fd7_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1653_c7_3401_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1653_c7_3401_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1656_c7_8fff_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1653_c7_3401_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_3401_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_3401_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_8fff_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_3401_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_3401_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_3401_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1656_c7_8fff_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_3401_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1653_c7_3401_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1654_c3_d6b9 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1653_c7_3401_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_8fff_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1653_c7_3401_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_3401_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_3401_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_8fff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_3401_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_3401_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_3401_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_8fff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_3401_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_3401_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_3401_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1656_c7_8fff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_3401_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_3401_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_3401_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1656_c7_8fff_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_3401_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3519_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3519_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3519_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1656_c7_8fff_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1656_c7_8fff_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1661_c7_5220_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1656_c7_8fff_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_8fff_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_8fff_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c7_5220_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_8fff_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1656_c7_8fff_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1656_c7_8fff_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_5220_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1656_c7_8fff_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_8fff_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1659_c3_1db5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_8fff_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c7_5220_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_8fff_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_8fff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_8fff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_5220_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_8fff_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_8fff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_8fff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_5220_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_8fff_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1656_c7_8fff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1656_c7_8fff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_5220_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1656_c7_8fff_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1656_c7_8fff_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1656_c7_8fff_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_5220_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1656_c7_8fff_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1658_c3_df01_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1658_c3_df01_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_d37a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_d37a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_d37a_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1661_c7_5220_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1661_c7_5220_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1664_c7_90b9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1661_c7_5220_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c7_5220_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c7_5220_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1664_c7_90b9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c7_5220_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_5220_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_5220_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1664_c7_90b9_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_5220_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c7_5220_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1662_c3_13b9 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c7_5220_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1661_c7_5220_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c7_5220_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_5220_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_5220_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1664_c7_90b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_5220_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_5220_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_5220_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_90b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_5220_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_5220_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_5220_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1664_c7_90b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_5220_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_5220_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_5220_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1664_c7_90b9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_5220_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1664_c11_f8ce_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1664_c11_f8ce_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1664_c11_f8ce_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1664_c7_90b9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1664_c7_90b9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1664_c7_90b9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1664_c7_90b9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1664_c7_90b9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1664_c7_90b9_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1664_c7_90b9_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1664_c7_90b9_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1672_c7_9bff_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1664_c7_90b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1664_c7_90b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1664_c7_90b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1672_c7_9bff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1664_c7_90b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_90b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_90b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_9bff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_90b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1664_c7_90b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1664_c7_90b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1672_c7_9bff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1664_c7_90b9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1664_c7_90b9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1664_c7_90b9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1672_c7_9bff_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1664_c7_90b9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1665_c3_7ba7_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1665_c3_7ba7_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1665_c3_7ba7_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1667_c30_5ddc_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1667_c30_5ddc_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1667_c30_5ddc_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1667_c30_5ddc_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1669_c22_7b01_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1670_c31_969a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1670_c31_969a_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1670_c21_fa51_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1672_c11_855c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1672_c11_855c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1672_c11_855c_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1672_c7_9bff_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1672_c7_9bff_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1672_c7_9bff_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1672_c7_9bff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1672_c7_9bff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1672_c7_9bff_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_9bff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_9bff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_1451_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_9bff_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1672_c7_9bff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1672_c7_9bff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_1451_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1672_c7_9bff_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1672_c7_9bff_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1672_c7_9bff_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1672_c7_9bff_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1674_c33_a4fa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1674_c33_a4fa_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1674_c33_a4fa_return_output : unsigned(8 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1674_c22_21b6_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1675_c21_eb67_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_5875_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_5875_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_5875_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_1451_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_1451_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_1451_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_1451_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_1451_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_1451_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1653_l1649_l1646_l1641_l1664_l1661_l1656_DUPLICATE_ef8a_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1653_l1649_l1646_l1672_l1641_l1661_l1656_DUPLICATE_062b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1653_l1649_l1646_l1672_l1641_l1661_l1656_DUPLICATE_3744_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1653_l1649_l1677_l1646_l1672_l1641_l1661_l1656_DUPLICATE_e234_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1653_l1649_l1646_l1672_l1641_l1661_l1656_DUPLICATE_1394_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1653_l1649_l1677_l1646_l1672_l1664_l1661_l1656_DUPLICATE_4c48_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1665_l1657_DUPLICATE_a1ef_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_0ba7_uxn_opcodes_h_l1682_l1635_DUPLICATE_f82f_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n16 := n16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1654_c3_d6b9 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1653_c7_3401_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1654_c3_d6b9;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1641_c1_7a5b_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_3d6a_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_4fd7_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1651_c3_f996 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1649_c7_c3d4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1651_c3_f996;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1643_c3_2a2c := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c2_3875_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1643_c3_2a2c;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1672_c7_9bff_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1674_c33_a4fa_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1667_c30_5ddc_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1662_c3_13b9 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c7_5220_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1662_c3_13b9;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1664_c7_90b9_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1672_c11_855c_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_5875_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1659_c3_1db5 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_8fff_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1659_c3_1db5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1664_c11_f8ce_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_3459_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1667_c30_5ddc_y := resize(to_signed(-3, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3519_right := to_unsigned(4, 3);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_1451_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1664_c7_90b9_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1641_c2_3875_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c6_9960_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_1451_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_d37a_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1647_c3_0528 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_3f54_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1647_c3_0528;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1641_c1_7a5b_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1667_c30_5ddc_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1665_c3_7ba7_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1641_c2_3875_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1646_c7_3f54_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1649_c7_c3d4_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1653_c7_3401_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1661_c7_5220_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1664_c7_90b9_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c6_9960_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_3459_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_3d6a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_4fd7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3519_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_d37a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1664_c11_f8ce_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1672_c11_855c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_5875_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l1649_c7_c3d4_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1674_c33_a4fa_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1641_c2_3875_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1646_c7_3f54_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1649_c7_c3d4_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1653_l1649_l1646_l1672_l1641_l1661_l1656_DUPLICATE_3744 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1653_l1649_l1646_l1672_l1641_l1661_l1656_DUPLICATE_3744_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1653_l1649_l1677_l1646_l1672_l1641_l1661_l1656_DUPLICATE_e234 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1653_l1649_l1677_l1646_l1672_l1641_l1661_l1656_DUPLICATE_e234_return_output := result.is_ram_write;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1669_c22_7b01] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1669_c22_7b01_return_output := CAST_TO_uint16_t_uint8_t(
     t8);

     -- BIN_OP_EQ[uxn_opcodes_h_l1646_c11_3459] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1646_c11_3459_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_3459_left;
     BIN_OP_EQ_uxn_opcodes_h_l1646_c11_3459_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_3459_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_3459_return_output := BIN_OP_EQ_uxn_opcodes_h_l1646_c11_3459_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1653_l1649_l1646_l1672_l1641_l1661_l1656_DUPLICATE_1394 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1653_l1649_l1646_l1672_l1641_l1661_l1656_DUPLICATE_1394_return_output := result.u8_value;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1674_c33_a4fa] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1674_c33_a4fa_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1674_c33_a4fa_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1674_c33_a4fa_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1674_c33_a4fa_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1674_c33_a4fa_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1674_c33_a4fa_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1649_c11_3d6a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1649_c11_3d6a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_3d6a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1649_c11_3d6a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_3d6a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_3d6a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1649_c11_3d6a_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1653_l1649_l1646_l1641_l1664_l1661_l1656_DUPLICATE_ef8a LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1653_l1649_l1646_l1641_l1664_l1661_l1656_DUPLICATE_ef8a_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1641_c6_9960] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1641_c6_9960_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c6_9960_left;
     BIN_OP_EQ_uxn_opcodes_h_l1641_c6_9960_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c6_9960_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c6_9960_return_output := BIN_OP_EQ_uxn_opcodes_h_l1641_c6_9960_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1653_l1649_l1646_l1672_l1641_l1661_l1656_DUPLICATE_062b LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1653_l1649_l1646_l1672_l1641_l1661_l1656_DUPLICATE_062b_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1677_c11_5875] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1677_c11_5875_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_5875_left;
     BIN_OP_EQ_uxn_opcodes_h_l1677_c11_5875_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_5875_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_5875_return_output := BIN_OP_EQ_uxn_opcodes_h_l1677_c11_5875_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1661_c11_d37a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1661_c11_d37a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_d37a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1661_c11_d37a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_d37a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_d37a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1661_c11_d37a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1656_c11_3519] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3519_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3519_left;
     BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3519_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3519_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3519_return_output := BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3519_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1653_l1649_l1677_l1646_l1672_l1664_l1661_l1656_DUPLICATE_4c48 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1653_l1649_l1677_l1646_l1672_l1664_l1661_l1656_DUPLICATE_4c48_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1653_c11_4fd7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1653_c11_4fd7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_4fd7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1653_c11_4fd7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_4fd7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_4fd7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1653_c11_4fd7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1672_c11_855c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1672_c11_855c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1672_c11_855c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1672_c11_855c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1672_c11_855c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1672_c11_855c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1672_c11_855c_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1667_c30_5ddc] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1667_c30_5ddc_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1667_c30_5ddc_ins;
     sp_relative_shift_uxn_opcodes_h_l1667_c30_5ddc_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1667_c30_5ddc_x;
     sp_relative_shift_uxn_opcodes_h_l1667_c30_5ddc_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1667_c30_5ddc_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1667_c30_5ddc_return_output := sp_relative_shift_uxn_opcodes_h_l1667_c30_5ddc_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1665_l1657_DUPLICATE_a1ef LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1665_l1657_DUPLICATE_a1ef_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1661_c7_5220] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1661_c7_5220_return_output := result.stack_address_sp_offset;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1675_c21_eb67] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1675_c21_eb67_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- BIN_OP_EQ[uxn_opcodes_h_l1664_c11_f8ce] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1664_c11_f8ce_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1664_c11_f8ce_left;
     BIN_OP_EQ_uxn_opcodes_h_l1664_c11_f8ce_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1664_c11_f8ce_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1664_c11_f8ce_return_output := BIN_OP_EQ_uxn_opcodes_h_l1664_c11_f8ce_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1641_c1_7a5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c6_9960_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1641_c2_3875_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c6_9960_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1641_c2_3875_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c6_9960_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1641_c2_3875_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c6_9960_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c2_3875_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c6_9960_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c2_3875_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c6_9960_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c2_3875_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c6_9960_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1641_c2_3875_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c6_9960_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1641_c2_3875_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c6_9960_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1641_c2_3875_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c6_9960_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1646_c7_3f54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_3459_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_3f54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_3459_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1646_c7_3f54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_3459_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_3f54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_3459_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_3f54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_3459_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_3f54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_3459_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1646_c7_3f54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_3459_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1646_c7_3f54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_3459_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1646_c7_3f54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_3459_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1649_c7_c3d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_3d6a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_c3d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_3d6a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_c3d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_3d6a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_c3d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_3d6a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_c3d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_3d6a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1649_c7_c3d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_3d6a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_c3d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_3d6a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_c3d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_3d6a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1649_c7_c3d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_3d6a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1653_c7_3401_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_4fd7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_3401_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_4fd7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_3401_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_4fd7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_3401_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_4fd7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_3401_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_4fd7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1653_c7_3401_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_4fd7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_3401_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_4fd7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_3401_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_4fd7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1656_c7_8fff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3519_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_8fff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3519_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1656_c7_8fff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3519_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_8fff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3519_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_8fff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3519_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_8fff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3519_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1656_c7_8fff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3519_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1656_c7_8fff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3519_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1661_c7_5220_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_d37a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_5220_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_d37a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_5220_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_d37a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_5220_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_d37a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c7_5220_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_d37a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c7_5220_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_d37a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_5220_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_d37a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_5220_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_d37a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1664_c7_90b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1664_c11_f8ce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_90b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1664_c11_f8ce_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1664_c7_90b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1664_c11_f8ce_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1664_c7_90b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1664_c11_f8ce_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1664_c7_90b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1664_c11_f8ce_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1664_c7_90b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1664_c11_f8ce_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1664_c7_90b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1664_c11_f8ce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_9bff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1672_c11_855c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1672_c7_9bff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1672_c11_855c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1672_c7_9bff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1672_c11_855c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1672_c7_9bff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1672_c11_855c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1672_c7_9bff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1672_c11_855c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_1451_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_5875_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_1451_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_5875_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1664_c7_90b9_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1669_c22_7b01_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1665_c3_7ba7_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1665_l1657_DUPLICATE_a1ef_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1658_c3_df01_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1665_l1657_DUPLICATE_a1ef_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1672_c7_9bff_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1675_c21_eb67_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c2_3875_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1653_l1649_l1646_l1641_l1664_l1661_l1656_DUPLICATE_ef8a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_3f54_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1653_l1649_l1646_l1641_l1664_l1661_l1656_DUPLICATE_ef8a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_c3d4_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1653_l1649_l1646_l1641_l1664_l1661_l1656_DUPLICATE_ef8a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_3401_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1653_l1649_l1646_l1641_l1664_l1661_l1656_DUPLICATE_ef8a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_8fff_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1653_l1649_l1646_l1641_l1664_l1661_l1656_DUPLICATE_ef8a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c7_5220_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1653_l1649_l1646_l1641_l1664_l1661_l1656_DUPLICATE_ef8a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1664_c7_90b9_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1653_l1649_l1646_l1641_l1664_l1661_l1656_DUPLICATE_ef8a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1641_c2_3875_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1653_l1649_l1646_l1672_l1641_l1661_l1656_DUPLICATE_062b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1646_c7_3f54_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1653_l1649_l1646_l1672_l1641_l1661_l1656_DUPLICATE_062b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_c3d4_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1653_l1649_l1646_l1672_l1641_l1661_l1656_DUPLICATE_062b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_3401_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1653_l1649_l1646_l1672_l1641_l1661_l1656_DUPLICATE_062b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1656_c7_8fff_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1653_l1649_l1646_l1672_l1641_l1661_l1656_DUPLICATE_062b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_5220_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1653_l1649_l1646_l1672_l1641_l1661_l1656_DUPLICATE_062b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1672_c7_9bff_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1653_l1649_l1646_l1672_l1641_l1661_l1656_DUPLICATE_062b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_3f54_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1653_l1649_l1677_l1646_l1672_l1664_l1661_l1656_DUPLICATE_4c48_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_c3d4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1653_l1649_l1677_l1646_l1672_l1664_l1661_l1656_DUPLICATE_4c48_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_3401_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1653_l1649_l1677_l1646_l1672_l1664_l1661_l1656_DUPLICATE_4c48_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_8fff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1653_l1649_l1677_l1646_l1672_l1664_l1661_l1656_DUPLICATE_4c48_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_5220_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1653_l1649_l1677_l1646_l1672_l1664_l1661_l1656_DUPLICATE_4c48_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_90b9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1653_l1649_l1677_l1646_l1672_l1664_l1661_l1656_DUPLICATE_4c48_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_9bff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1653_l1649_l1677_l1646_l1672_l1664_l1661_l1656_DUPLICATE_4c48_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_1451_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1653_l1649_l1677_l1646_l1672_l1664_l1661_l1656_DUPLICATE_4c48_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1641_c2_3875_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1653_l1649_l1677_l1646_l1672_l1641_l1661_l1656_DUPLICATE_e234_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1646_c7_3f54_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1653_l1649_l1677_l1646_l1672_l1641_l1661_l1656_DUPLICATE_e234_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_c3d4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1653_l1649_l1677_l1646_l1672_l1641_l1661_l1656_DUPLICATE_e234_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_3401_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1653_l1649_l1677_l1646_l1672_l1641_l1661_l1656_DUPLICATE_e234_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1656_c7_8fff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1653_l1649_l1677_l1646_l1672_l1641_l1661_l1656_DUPLICATE_e234_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_5220_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1653_l1649_l1677_l1646_l1672_l1641_l1661_l1656_DUPLICATE_e234_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1672_c7_9bff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1653_l1649_l1677_l1646_l1672_l1641_l1661_l1656_DUPLICATE_e234_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_1451_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1653_l1649_l1677_l1646_l1672_l1641_l1661_l1656_DUPLICATE_e234_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c2_3875_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1653_l1649_l1646_l1672_l1641_l1661_l1656_DUPLICATE_3744_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_3f54_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1653_l1649_l1646_l1672_l1641_l1661_l1656_DUPLICATE_3744_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_c3d4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1653_l1649_l1646_l1672_l1641_l1661_l1656_DUPLICATE_3744_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_3401_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1653_l1649_l1646_l1672_l1641_l1661_l1656_DUPLICATE_3744_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_8fff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1653_l1649_l1646_l1672_l1641_l1661_l1656_DUPLICATE_3744_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_5220_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1653_l1649_l1646_l1672_l1641_l1661_l1656_DUPLICATE_3744_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1672_c7_9bff_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1653_l1649_l1646_l1672_l1641_l1661_l1656_DUPLICATE_3744_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1641_c2_3875_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1653_l1649_l1646_l1672_l1641_l1661_l1656_DUPLICATE_1394_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1646_c7_3f54_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1653_l1649_l1646_l1672_l1641_l1661_l1656_DUPLICATE_1394_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_c3d4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1653_l1649_l1646_l1672_l1641_l1661_l1656_DUPLICATE_1394_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_3401_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1653_l1649_l1646_l1672_l1641_l1661_l1656_DUPLICATE_1394_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1656_c7_8fff_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1653_l1649_l1646_l1672_l1641_l1661_l1656_DUPLICATE_1394_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_5220_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1653_l1649_l1646_l1672_l1641_l1661_l1656_DUPLICATE_1394_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1672_c7_9bff_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1653_l1649_l1646_l1672_l1641_l1661_l1656_DUPLICATE_1394_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c7_5220_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1661_c7_5220_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1664_c7_90b9_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1667_c30_5ddc_return_output;
     -- CONST_SL_8[uxn_opcodes_h_l1658_c3_df01] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1658_c3_df01_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1658_c3_df01_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1658_c3_df01_return_output := CONST_SL_8_uxn_opcodes_h_l1658_c3_df01_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1664_c7_90b9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1664_c7_90b9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1664_c7_90b9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1664_c7_90b9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1664_c7_90b9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1664_c7_90b9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1664_c7_90b9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1664_c7_90b9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1664_c7_90b9_return_output;

     -- t8_MUX[uxn_opcodes_h_l1649_c7_c3d4] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1649_c7_c3d4_cond <= VAR_t8_MUX_uxn_opcodes_h_l1649_c7_c3d4_cond;
     t8_MUX_uxn_opcodes_h_l1649_c7_c3d4_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1649_c7_c3d4_iftrue;
     t8_MUX_uxn_opcodes_h_l1649_c7_c3d4_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1649_c7_c3d4_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1649_c7_c3d4_return_output := t8_MUX_uxn_opcodes_h_l1649_c7_c3d4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1672_c7_9bff] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1672_c7_9bff_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1672_c7_9bff_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1672_c7_9bff_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1672_c7_9bff_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1672_c7_9bff_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1672_c7_9bff_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1672_c7_9bff_return_output := result_u8_value_MUX_uxn_opcodes_h_l1672_c7_9bff_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1672_c7_9bff] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1672_c7_9bff_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1672_c7_9bff_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1672_c7_9bff_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1672_c7_9bff_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1672_c7_9bff_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1672_c7_9bff_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1672_c7_9bff_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1672_c7_9bff_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1677_c7_1451] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_1451_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_1451_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_1451_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_1451_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_1451_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_1451_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_1451_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_1451_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1674_c22_21b6] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1674_c22_21b6_return_output := CAST_TO_uint16_t_uint9_t(
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1674_c33_a4fa_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1661_c7_5220] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c7_5220_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c7_5220_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c7_5220_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c7_5220_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c7_5220_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c7_5220_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c7_5220_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c7_5220_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1665_c3_7ba7] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1665_c3_7ba7_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1665_c3_7ba7_left;
     BIN_OP_OR_uxn_opcodes_h_l1665_c3_7ba7_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1665_c3_7ba7_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1665_c3_7ba7_return_output := BIN_OP_OR_uxn_opcodes_h_l1665_c3_7ba7_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1641_c1_7a5b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1641_c1_7a5b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1641_c1_7a5b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1641_c1_7a5b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1641_c1_7a5b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1641_c1_7a5b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1641_c1_7a5b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1641_c1_7a5b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1641_c1_7a5b_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1677_c7_1451] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_1451_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_1451_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_1451_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_1451_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_1451_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_1451_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_1451_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_1451_return_output;

     -- Submodule level 2
     VAR_CONST_SR_8_uxn_opcodes_h_l1670_c31_969a_x := VAR_BIN_OP_OR_uxn_opcodes_h_l1665_c3_7ba7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1664_c7_90b9_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1665_c3_7ba7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1672_c7_9bff_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1674_c22_21b6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1656_c7_8fff_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1658_c3_df01_return_output;
     VAR_printf_uxn_opcodes_h_l1642_c3_f005_uxn_opcodes_h_l1642_c3_f005_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1641_c1_7a5b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_9bff_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_1451_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1672_c7_9bff_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_1451_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1664_c7_90b9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1672_c7_9bff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c7_5220_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1664_c7_90b9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_8fff_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c7_5220_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1664_c7_90b9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1672_c7_9bff_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1646_c7_3f54_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1649_c7_c3d4_return_output;
     -- t8_MUX[uxn_opcodes_h_l1646_c7_3f54] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1646_c7_3f54_cond <= VAR_t8_MUX_uxn_opcodes_h_l1646_c7_3f54_cond;
     t8_MUX_uxn_opcodes_h_l1646_c7_3f54_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1646_c7_3f54_iftrue;
     t8_MUX_uxn_opcodes_h_l1646_c7_3f54_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1646_c7_3f54_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1646_c7_3f54_return_output := t8_MUX_uxn_opcodes_h_l1646_c7_3f54_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1664_c7_90b9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1664_c7_90b9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1664_c7_90b9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1664_c7_90b9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1664_c7_90b9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1664_c7_90b9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1664_c7_90b9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1664_c7_90b9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1664_c7_90b9_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1672_c7_9bff] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1672_c7_9bff_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1672_c7_9bff_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1672_c7_9bff_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1672_c7_9bff_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1672_c7_9bff_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1672_c7_9bff_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1672_c7_9bff_return_output := result_u16_value_MUX_uxn_opcodes_h_l1672_c7_9bff_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1670_c31_969a] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1670_c31_969a_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1670_c31_969a_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1670_c31_969a_return_output := CONST_SR_8_uxn_opcodes_h_l1670_c31_969a_return_output;

     -- n16_MUX[uxn_opcodes_h_l1664_c7_90b9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1664_c7_90b9_cond <= VAR_n16_MUX_uxn_opcodes_h_l1664_c7_90b9_cond;
     n16_MUX_uxn_opcodes_h_l1664_c7_90b9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1664_c7_90b9_iftrue;
     n16_MUX_uxn_opcodes_h_l1664_c7_90b9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1664_c7_90b9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1664_c7_90b9_return_output := n16_MUX_uxn_opcodes_h_l1664_c7_90b9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1672_c7_9bff] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_9bff_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_9bff_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_9bff_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_9bff_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_9bff_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_9bff_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_9bff_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_9bff_return_output;

     -- printf_uxn_opcodes_h_l1642_c3_f005[uxn_opcodes_h_l1642_c3_f005] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1642_c3_f005_uxn_opcodes_h_l1642_c3_f005_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1642_c3_f005_uxn_opcodes_h_l1642_c3_f005_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1656_c7_8fff] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_8fff_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_8fff_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_8fff_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_8fff_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_8fff_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_8fff_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_8fff_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_8fff_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1672_c7_9bff] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1672_c7_9bff_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1672_c7_9bff_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1672_c7_9bff_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1672_c7_9bff_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1672_c7_9bff_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1672_c7_9bff_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1672_c7_9bff_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1672_c7_9bff_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1661_c7_5220] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c7_5220_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c7_5220_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c7_5220_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c7_5220_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c7_5220_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c7_5220_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c7_5220_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c7_5220_return_output;

     -- Submodule level 3
     VAR_n16_MUX_uxn_opcodes_h_l1661_c7_5220_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1664_c7_90b9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_90b9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_9bff_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1664_c7_90b9_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1672_c7_9bff_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_5220_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1664_c7_90b9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_8fff_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c7_5220_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1653_c7_3401_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_8fff_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1664_c7_90b9_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1672_c7_9bff_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1641_c2_3875_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1646_c7_3f54_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1664_c7_90b9] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1664_c7_90b9_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1664_c7_90b9_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1664_c7_90b9_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1664_c7_90b9_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1664_c7_90b9_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1664_c7_90b9_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1664_c7_90b9_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1664_c7_90b9_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1664_c7_90b9] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1664_c7_90b9_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1664_c7_90b9_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1664_c7_90b9_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1664_c7_90b9_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1664_c7_90b9_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1664_c7_90b9_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1664_c7_90b9_return_output := result_u16_value_MUX_uxn_opcodes_h_l1664_c7_90b9_return_output;

     -- t8_MUX[uxn_opcodes_h_l1641_c2_3875] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1641_c2_3875_cond <= VAR_t8_MUX_uxn_opcodes_h_l1641_c2_3875_cond;
     t8_MUX_uxn_opcodes_h_l1641_c2_3875_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1641_c2_3875_iftrue;
     t8_MUX_uxn_opcodes_h_l1641_c2_3875_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1641_c2_3875_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1641_c2_3875_return_output := t8_MUX_uxn_opcodes_h_l1641_c2_3875_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1661_c7_5220] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_5220_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_5220_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_5220_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_5220_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_5220_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_5220_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_5220_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_5220_return_output;

     -- n16_MUX[uxn_opcodes_h_l1661_c7_5220] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1661_c7_5220_cond <= VAR_n16_MUX_uxn_opcodes_h_l1661_c7_5220_cond;
     n16_MUX_uxn_opcodes_h_l1661_c7_5220_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1661_c7_5220_iftrue;
     n16_MUX_uxn_opcodes_h_l1661_c7_5220_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1661_c7_5220_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1661_c7_5220_return_output := n16_MUX_uxn_opcodes_h_l1661_c7_5220_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1653_c7_3401] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1653_c7_3401_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1653_c7_3401_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1653_c7_3401_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1653_c7_3401_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1653_c7_3401_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1653_c7_3401_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1653_c7_3401_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1653_c7_3401_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1656_c7_8fff] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_8fff_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_8fff_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_8fff_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_8fff_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_8fff_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_8fff_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_8fff_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_8fff_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1670_c21_fa51] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1670_c21_fa51_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1670_c31_969a_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1664_c7_90b9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_90b9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_90b9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_90b9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_90b9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_90b9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_90b9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_90b9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_90b9_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1664_c7_90b9_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1670_c21_fa51_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1656_c7_8fff_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1661_c7_5220_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_5220_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_90b9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_5220_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1664_c7_90b9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_8fff_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_5220_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_3401_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_8fff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1649_c7_c3d4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1653_c7_3401_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_5220_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1664_c7_90b9_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1641_c2_3875_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1653_c7_3401] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_3401_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_3401_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_3401_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_3401_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_3401_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_3401_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_3401_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_3401_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1649_c7_c3d4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1649_c7_c3d4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1649_c7_c3d4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1649_c7_c3d4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1649_c7_c3d4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1649_c7_c3d4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1649_c7_c3d4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1649_c7_c3d4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1649_c7_c3d4_return_output;

     -- n16_MUX[uxn_opcodes_h_l1656_c7_8fff] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1656_c7_8fff_cond <= VAR_n16_MUX_uxn_opcodes_h_l1656_c7_8fff_cond;
     n16_MUX_uxn_opcodes_h_l1656_c7_8fff_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1656_c7_8fff_iftrue;
     n16_MUX_uxn_opcodes_h_l1656_c7_8fff_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1656_c7_8fff_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1656_c7_8fff_return_output := n16_MUX_uxn_opcodes_h_l1656_c7_8fff_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1661_c7_5220] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_5220_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_5220_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_5220_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_5220_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_5220_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_5220_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_5220_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_5220_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1661_c7_5220] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1661_c7_5220_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_5220_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1661_c7_5220_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_5220_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1661_c7_5220_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_5220_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_5220_return_output := result_u16_value_MUX_uxn_opcodes_h_l1661_c7_5220_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1656_c7_8fff] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_8fff_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_8fff_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_8fff_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_8fff_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_8fff_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_8fff_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_8fff_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_8fff_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1664_c7_90b9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1664_c7_90b9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1664_c7_90b9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1664_c7_90b9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1664_c7_90b9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1664_c7_90b9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1664_c7_90b9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1664_c7_90b9_return_output := result_u8_value_MUX_uxn_opcodes_h_l1664_c7_90b9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1661_c7_5220] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_5220_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_5220_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_5220_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_5220_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_5220_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_5220_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_5220_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_5220_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1653_c7_3401_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1656_c7_8fff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_8fff_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_5220_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1656_c7_8fff_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_5220_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_3401_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_8fff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_c3d4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_3401_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_3f54_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1649_c7_c3d4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1656_c7_8fff_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_5220_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_5220_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1664_c7_90b9_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1649_c7_c3d4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_c3d4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_c3d4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_c3d4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_c3d4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_c3d4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_c3d4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_c3d4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_c3d4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1661_c7_5220] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1661_c7_5220_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_5220_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1661_c7_5220_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_5220_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1661_c7_5220_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_5220_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_5220_return_output := result_u8_value_MUX_uxn_opcodes_h_l1661_c7_5220_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1656_c7_8fff] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1656_c7_8fff_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1656_c7_8fff_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1656_c7_8fff_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1656_c7_8fff_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1656_c7_8fff_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1656_c7_8fff_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1656_c7_8fff_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1656_c7_8fff_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1656_c7_8fff] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1656_c7_8fff_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1656_c7_8fff_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1656_c7_8fff_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1656_c7_8fff_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1656_c7_8fff_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1656_c7_8fff_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1656_c7_8fff_return_output := result_u16_value_MUX_uxn_opcodes_h_l1656_c7_8fff_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1653_c7_3401] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_3401_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_3401_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_3401_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_3401_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_3401_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_3401_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_3401_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_3401_return_output;

     -- n16_MUX[uxn_opcodes_h_l1653_c7_3401] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1653_c7_3401_cond <= VAR_n16_MUX_uxn_opcodes_h_l1653_c7_3401_cond;
     n16_MUX_uxn_opcodes_h_l1653_c7_3401_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1653_c7_3401_iftrue;
     n16_MUX_uxn_opcodes_h_l1653_c7_3401_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1653_c7_3401_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1653_c7_3401_return_output := n16_MUX_uxn_opcodes_h_l1653_c7_3401_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1656_c7_8fff] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_8fff_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_8fff_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_8fff_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_8fff_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_8fff_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_8fff_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_8fff_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_8fff_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1646_c7_3f54] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_3f54_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_3f54_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_3f54_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_3f54_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_3f54_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_3f54_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_3f54_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_3f54_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1649_c7_c3d4_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1653_c7_3401_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_3401_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_8fff_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_3401_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1656_c7_8fff_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_c3d4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_3401_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_3f54_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_c3d4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c2_3875_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_3f54_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_3401_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1656_c7_8fff_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1656_c7_8fff_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_5220_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1656_c7_8fff] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1656_c7_8fff_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1656_c7_8fff_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1656_c7_8fff_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1656_c7_8fff_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1656_c7_8fff_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1656_c7_8fff_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1656_c7_8fff_return_output := result_u8_value_MUX_uxn_opcodes_h_l1656_c7_8fff_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1641_c2_3875] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c2_3875_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c2_3875_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c2_3875_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c2_3875_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c2_3875_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c2_3875_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c2_3875_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c2_3875_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1653_c7_3401] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_3401_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_3401_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_3401_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_3401_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_3401_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_3401_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_3401_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_3401_return_output;

     -- n16_MUX[uxn_opcodes_h_l1649_c7_c3d4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1649_c7_c3d4_cond <= VAR_n16_MUX_uxn_opcodes_h_l1649_c7_c3d4_cond;
     n16_MUX_uxn_opcodes_h_l1649_c7_c3d4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1649_c7_c3d4_iftrue;
     n16_MUX_uxn_opcodes_h_l1649_c7_c3d4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1649_c7_c3d4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1649_c7_c3d4_return_output := n16_MUX_uxn_opcodes_h_l1649_c7_c3d4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1646_c7_3f54] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_3f54_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_3f54_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_3f54_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_3f54_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_3f54_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_3f54_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_3f54_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_3f54_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1649_c7_c3d4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_c3d4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_c3d4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_c3d4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_c3d4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_c3d4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_c3d4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_c3d4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_c3d4_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1653_c7_3401] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1653_c7_3401_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_3401_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1653_c7_3401_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_3401_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1653_c7_3401_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_3401_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_3401_return_output := result_u16_value_MUX_uxn_opcodes_h_l1653_c7_3401_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1653_c7_3401] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_3401_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_3401_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_3401_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_3401_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_3401_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_3401_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_3401_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_3401_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1646_c7_3f54_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1649_c7_c3d4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_c3d4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_3401_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_c3d4_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_3401_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_3f54_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_c3d4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c2_3875_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_3f54_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_c3d4_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_3401_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_3401_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1656_c7_8fff_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1641_c2_3875] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c2_3875_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c2_3875_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c2_3875_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c2_3875_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c2_3875_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c2_3875_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c2_3875_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c2_3875_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1646_c7_3f54] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_3f54_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_3f54_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_3f54_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_3f54_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_3f54_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_3f54_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_3f54_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_3f54_return_output;

     -- n16_MUX[uxn_opcodes_h_l1646_c7_3f54] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1646_c7_3f54_cond <= VAR_n16_MUX_uxn_opcodes_h_l1646_c7_3f54_cond;
     n16_MUX_uxn_opcodes_h_l1646_c7_3f54_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1646_c7_3f54_iftrue;
     n16_MUX_uxn_opcodes_h_l1646_c7_3f54_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1646_c7_3f54_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1646_c7_3f54_return_output := n16_MUX_uxn_opcodes_h_l1646_c7_3f54_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1653_c7_3401] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1653_c7_3401_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_3401_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1653_c7_3401_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_3401_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1653_c7_3401_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_3401_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_3401_return_output := result_u8_value_MUX_uxn_opcodes_h_l1653_c7_3401_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1649_c7_c3d4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_c3d4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_c3d4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_c3d4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_c3d4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_c3d4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_c3d4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_c3d4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_c3d4_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1649_c7_c3d4] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1649_c7_c3d4_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_c3d4_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1649_c7_c3d4_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_c3d4_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1649_c7_c3d4_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_c3d4_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_c3d4_return_output := result_u16_value_MUX_uxn_opcodes_h_l1649_c7_c3d4_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1649_c7_c3d4] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_c3d4_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_c3d4_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_c3d4_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_c3d4_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_c3d4_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_c3d4_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_c3d4_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_c3d4_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1641_c2_3875_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1646_c7_3f54_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_3f54_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_c3d4_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1646_c7_3f54_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_c3d4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c2_3875_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_3f54_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1646_c7_3f54_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_c3d4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_c3d4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_3401_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1641_c2_3875] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c2_3875_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c2_3875_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c2_3875_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c2_3875_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c2_3875_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c2_3875_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c2_3875_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c2_3875_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1646_c7_3f54] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1646_c7_3f54_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1646_c7_3f54_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1646_c7_3f54_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1646_c7_3f54_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1646_c7_3f54_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1646_c7_3f54_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1646_c7_3f54_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1646_c7_3f54_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1646_c7_3f54] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1646_c7_3f54_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1646_c7_3f54_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1646_c7_3f54_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1646_c7_3f54_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1646_c7_3f54_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1646_c7_3f54_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1646_c7_3f54_return_output := result_u16_value_MUX_uxn_opcodes_h_l1646_c7_3f54_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1649_c7_c3d4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1649_c7_c3d4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_c3d4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1649_c7_c3d4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_c3d4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1649_c7_c3d4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_c3d4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_c3d4_return_output := result_u8_value_MUX_uxn_opcodes_h_l1649_c7_c3d4_return_output;

     -- n16_MUX[uxn_opcodes_h_l1641_c2_3875] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1641_c2_3875_cond <= VAR_n16_MUX_uxn_opcodes_h_l1641_c2_3875_cond;
     n16_MUX_uxn_opcodes_h_l1641_c2_3875_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1641_c2_3875_iftrue;
     n16_MUX_uxn_opcodes_h_l1641_c2_3875_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1641_c2_3875_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1641_c2_3875_return_output := n16_MUX_uxn_opcodes_h_l1641_c2_3875_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1646_c7_3f54] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_3f54_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_3f54_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_3f54_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_3f54_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_3f54_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_3f54_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_3f54_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_3f54_return_output;

     -- Submodule level 9
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1641_c2_3875_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1641_c2_3875_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_3f54_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1641_c2_3875_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1646_c7_3f54_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1641_c2_3875_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1646_c7_3f54_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1646_c7_3f54_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_c3d4_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1641_c2_3875] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1641_c2_3875_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1641_c2_3875_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1641_c2_3875_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1641_c2_3875_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1641_c2_3875_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1641_c2_3875_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1641_c2_3875_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1641_c2_3875_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1641_c2_3875] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1641_c2_3875_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1641_c2_3875_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1641_c2_3875_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1641_c2_3875_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1641_c2_3875_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1641_c2_3875_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1641_c2_3875_return_output := result_u16_value_MUX_uxn_opcodes_h_l1641_c2_3875_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1641_c2_3875] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1641_c2_3875_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1641_c2_3875_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1641_c2_3875_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1641_c2_3875_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1641_c2_3875_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1641_c2_3875_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1641_c2_3875_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1641_c2_3875_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1646_c7_3f54] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1646_c7_3f54_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1646_c7_3f54_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1646_c7_3f54_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1646_c7_3f54_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1646_c7_3f54_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1646_c7_3f54_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1646_c7_3f54_return_output := result_u8_value_MUX_uxn_opcodes_h_l1646_c7_3f54_return_output;

     -- Submodule level 10
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1641_c2_3875_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1646_c7_3f54_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1641_c2_3875] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1641_c2_3875_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1641_c2_3875_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1641_c2_3875_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1641_c2_3875_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1641_c2_3875_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1641_c2_3875_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1641_c2_3875_return_output := result_u8_value_MUX_uxn_opcodes_h_l1641_c2_3875_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_0ba7_uxn_opcodes_h_l1682_l1635_DUPLICATE_f82f LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_0ba7_uxn_opcodes_h_l1682_l1635_DUPLICATE_f82f_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_0ba7(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c2_3875_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1641_c2_3875_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c2_3875_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c2_3875_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1641_c2_3875_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1641_c2_3875_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1641_c2_3875_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_0ba7_uxn_opcodes_h_l1682_l1635_DUPLICATE_f82f_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_0ba7_uxn_opcodes_h_l1682_l1635_DUPLICATE_f82f_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n16 <= REG_COMB_n16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
