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
entity stz2_0CLK_4f993427 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end stz2_0CLK_4f993427;
architecture arch of stz2_0CLK_4f993427 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1475_c6_e37a]
signal BIN_OP_EQ_uxn_opcodes_h_l1475_c6_e37a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1475_c6_e37a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1475_c6_e37a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1475_c1_89c2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1475_c1_89c2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1475_c1_89c2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1475_c1_89c2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1475_c1_89c2_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1475_c2_caa1]
signal n16_MUX_uxn_opcodes_h_l1475_c2_caa1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1475_c2_caa1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1475_c2_caa1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1475_c2_caa1_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l1475_c2_caa1]
signal t8_MUX_uxn_opcodes_h_l1475_c2_caa1_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1475_c2_caa1_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1475_c2_caa1_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1475_c2_caa1_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1475_c2_caa1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1475_c2_caa1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1475_c2_caa1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1475_c2_caa1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1475_c2_caa1_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1475_c2_caa1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1475_c2_caa1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1475_c2_caa1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1475_c2_caa1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1475_c2_caa1_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1475_c2_caa1]
signal result_u8_value_MUX_uxn_opcodes_h_l1475_c2_caa1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1475_c2_caa1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1475_c2_caa1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1475_c2_caa1_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1475_c2_caa1]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1475_c2_caa1_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1475_c2_caa1_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1475_c2_caa1_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1475_c2_caa1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1475_c2_caa1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1475_c2_caa1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1475_c2_caa1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1475_c2_caa1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1475_c2_caa1_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1475_c2_caa1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1475_c2_caa1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1475_c2_caa1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1475_c2_caa1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1475_c2_caa1_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1475_c2_caa1]
signal result_u16_value_MUX_uxn_opcodes_h_l1475_c2_caa1_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1475_c2_caa1_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1475_c2_caa1_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1475_c2_caa1_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1476_c3_84a9[uxn_opcodes_h_l1476_c3_84a9]
signal printf_uxn_opcodes_h_l1476_c3_84a9_uxn_opcodes_h_l1476_c3_84a9_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1480_c11_141c]
signal BIN_OP_EQ_uxn_opcodes_h_l1480_c11_141c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1480_c11_141c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1480_c11_141c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1480_c7_851f]
signal n16_MUX_uxn_opcodes_h_l1480_c7_851f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1480_c7_851f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1480_c7_851f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1480_c7_851f_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l1480_c7_851f]
signal t8_MUX_uxn_opcodes_h_l1480_c7_851f_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1480_c7_851f_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1480_c7_851f_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1480_c7_851f_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1480_c7_851f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1480_c7_851f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1480_c7_851f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1480_c7_851f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1480_c7_851f_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1480_c7_851f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1480_c7_851f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1480_c7_851f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1480_c7_851f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1480_c7_851f_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1480_c7_851f]
signal result_u8_value_MUX_uxn_opcodes_h_l1480_c7_851f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1480_c7_851f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1480_c7_851f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1480_c7_851f_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1480_c7_851f]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1480_c7_851f_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1480_c7_851f_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1480_c7_851f_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1480_c7_851f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1480_c7_851f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1480_c7_851f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1480_c7_851f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1480_c7_851f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1480_c7_851f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1480_c7_851f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1480_c7_851f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1480_c7_851f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1480_c7_851f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1480_c7_851f_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1480_c7_851f]
signal result_u16_value_MUX_uxn_opcodes_h_l1480_c7_851f_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1480_c7_851f_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1480_c7_851f_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1480_c7_851f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1483_c11_72ae]
signal BIN_OP_EQ_uxn_opcodes_h_l1483_c11_72ae_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1483_c11_72ae_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1483_c11_72ae_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1483_c7_7d40]
signal n16_MUX_uxn_opcodes_h_l1483_c7_7d40_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1483_c7_7d40_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1483_c7_7d40_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1483_c7_7d40_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l1483_c7_7d40]
signal t8_MUX_uxn_opcodes_h_l1483_c7_7d40_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1483_c7_7d40_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1483_c7_7d40_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1483_c7_7d40_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1483_c7_7d40]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c7_7d40_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c7_7d40_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c7_7d40_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c7_7d40_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1483_c7_7d40]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c7_7d40_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c7_7d40_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c7_7d40_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c7_7d40_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1483_c7_7d40]
signal result_u8_value_MUX_uxn_opcodes_h_l1483_c7_7d40_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1483_c7_7d40_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1483_c7_7d40_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1483_c7_7d40_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1483_c7_7d40]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1483_c7_7d40_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1483_c7_7d40_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1483_c7_7d40_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1483_c7_7d40_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1483_c7_7d40]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1483_c7_7d40_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1483_c7_7d40_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1483_c7_7d40_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1483_c7_7d40_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1483_c7_7d40]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c7_7d40_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c7_7d40_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c7_7d40_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c7_7d40_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1483_c7_7d40]
signal result_u16_value_MUX_uxn_opcodes_h_l1483_c7_7d40_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1483_c7_7d40_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1483_c7_7d40_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1483_c7_7d40_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1487_c11_5803]
signal BIN_OP_EQ_uxn_opcodes_h_l1487_c11_5803_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1487_c11_5803_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1487_c11_5803_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1487_c7_dc65]
signal n16_MUX_uxn_opcodes_h_l1487_c7_dc65_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1487_c7_dc65_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1487_c7_dc65_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1487_c7_dc65_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1487_c7_dc65]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_dc65_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_dc65_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_dc65_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_dc65_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1487_c7_dc65]
signal result_u8_value_MUX_uxn_opcodes_h_l1487_c7_dc65_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1487_c7_dc65_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1487_c7_dc65_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1487_c7_dc65_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1487_c7_dc65]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1487_c7_dc65_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1487_c7_dc65_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1487_c7_dc65_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1487_c7_dc65_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1487_c7_dc65]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_dc65_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_dc65_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_dc65_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_dc65_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1487_c7_dc65]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_dc65_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_dc65_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_dc65_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_dc65_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1487_c7_dc65]
signal result_u16_value_MUX_uxn_opcodes_h_l1487_c7_dc65_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1487_c7_dc65_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1487_c7_dc65_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1487_c7_dc65_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1489_c3_b644]
signal CONST_SL_8_uxn_opcodes_h_l1489_c3_b644_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1489_c3_b644_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1491_c11_e089]
signal BIN_OP_EQ_uxn_opcodes_h_l1491_c11_e089_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1491_c11_e089_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1491_c11_e089_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1491_c7_79d5]
signal n16_MUX_uxn_opcodes_h_l1491_c7_79d5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1491_c7_79d5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1491_c7_79d5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1491_c7_79d5_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1491_c7_79d5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_79d5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_79d5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_79d5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_79d5_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1491_c7_79d5]
signal result_u8_value_MUX_uxn_opcodes_h_l1491_c7_79d5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1491_c7_79d5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1491_c7_79d5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1491_c7_79d5_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1491_c7_79d5]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_79d5_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_79d5_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_79d5_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_79d5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1491_c7_79d5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_79d5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_79d5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_79d5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_79d5_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1491_c7_79d5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_79d5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_79d5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_79d5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_79d5_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1491_c7_79d5]
signal result_u16_value_MUX_uxn_opcodes_h_l1491_c7_79d5_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1491_c7_79d5_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1491_c7_79d5_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1491_c7_79d5_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1492_c3_39a0]
signal BIN_OP_OR_uxn_opcodes_h_l1492_c3_39a0_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1492_c3_39a0_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1492_c3_39a0_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1494_c30_b1b7]
signal sp_relative_shift_uxn_opcodes_h_l1494_c30_b1b7_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1494_c30_b1b7_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1494_c30_b1b7_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1494_c30_b1b7_return_output : signed(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1497_c31_1aa1]
signal CONST_SR_8_uxn_opcodes_h_l1497_c31_1aa1_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1497_c31_1aa1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1499_c11_cfdf]
signal BIN_OP_EQ_uxn_opcodes_h_l1499_c11_cfdf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1499_c11_cfdf_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1499_c11_cfdf_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1499_c7_63dd]
signal result_u8_value_MUX_uxn_opcodes_h_l1499_c7_63dd_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1499_c7_63dd_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1499_c7_63dd_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1499_c7_63dd_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1499_c7_63dd]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_63dd_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_63dd_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_63dd_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_63dd_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1499_c7_63dd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_63dd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_63dd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_63dd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_63dd_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1499_c7_63dd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_63dd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_63dd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_63dd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_63dd_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1499_c7_63dd]
signal result_u16_value_MUX_uxn_opcodes_h_l1499_c7_63dd_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1499_c7_63dd_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1499_c7_63dd_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1499_c7_63dd_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1501_c33_f05b]
signal BIN_OP_PLUS_uxn_opcodes_h_l1501_c33_f05b_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1501_c33_f05b_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1501_c33_f05b_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1504_c11_e867]
signal BIN_OP_EQ_uxn_opcodes_h_l1504_c11_e867_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1504_c11_e867_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1504_c11_e867_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1504_c7_cc9f]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1504_c7_cc9f_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1504_c7_cc9f_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1504_c7_cc9f_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1504_c7_cc9f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1504_c7_cc9f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1504_c7_cc9f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1504_c7_cc9f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1504_c7_cc9f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1504_c7_cc9f_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_18d1( ref_toks_0 : opcode_result_t;
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
      base.stack_address_sp_offset := ref_toks_1;
      base.sp_relative_shift := ref_toks_2;
      base.u8_value := ref_toks_3;
      base.is_ram_write := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.is_sp_shift := ref_toks_6;
      base.u16_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1475_c6_e37a
BIN_OP_EQ_uxn_opcodes_h_l1475_c6_e37a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1475_c6_e37a_left,
BIN_OP_EQ_uxn_opcodes_h_l1475_c6_e37a_right,
BIN_OP_EQ_uxn_opcodes_h_l1475_c6_e37a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1475_c1_89c2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1475_c1_89c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1475_c1_89c2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1475_c1_89c2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1475_c1_89c2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1475_c1_89c2_return_output);

-- n16_MUX_uxn_opcodes_h_l1475_c2_caa1
n16_MUX_uxn_opcodes_h_l1475_c2_caa1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1475_c2_caa1_cond,
n16_MUX_uxn_opcodes_h_l1475_c2_caa1_iftrue,
n16_MUX_uxn_opcodes_h_l1475_c2_caa1_iffalse,
n16_MUX_uxn_opcodes_h_l1475_c2_caa1_return_output);

-- t8_MUX_uxn_opcodes_h_l1475_c2_caa1
t8_MUX_uxn_opcodes_h_l1475_c2_caa1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1475_c2_caa1_cond,
t8_MUX_uxn_opcodes_h_l1475_c2_caa1_iftrue,
t8_MUX_uxn_opcodes_h_l1475_c2_caa1_iffalse,
t8_MUX_uxn_opcodes_h_l1475_c2_caa1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1475_c2_caa1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1475_c2_caa1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1475_c2_caa1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1475_c2_caa1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1475_c2_caa1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1475_c2_caa1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1475_c2_caa1
result_sp_relative_shift_MUX_uxn_opcodes_h_l1475_c2_caa1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1475_c2_caa1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1475_c2_caa1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1475_c2_caa1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1475_c2_caa1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1475_c2_caa1
result_u8_value_MUX_uxn_opcodes_h_l1475_c2_caa1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1475_c2_caa1_cond,
result_u8_value_MUX_uxn_opcodes_h_l1475_c2_caa1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1475_c2_caa1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1475_c2_caa1_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1475_c2_caa1
result_is_ram_write_MUX_uxn_opcodes_h_l1475_c2_caa1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1475_c2_caa1_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1475_c2_caa1_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1475_c2_caa1_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1475_c2_caa1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1475_c2_caa1
result_is_opc_done_MUX_uxn_opcodes_h_l1475_c2_caa1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1475_c2_caa1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1475_c2_caa1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1475_c2_caa1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1475_c2_caa1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1475_c2_caa1
result_is_sp_shift_MUX_uxn_opcodes_h_l1475_c2_caa1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1475_c2_caa1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1475_c2_caa1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1475_c2_caa1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1475_c2_caa1_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1475_c2_caa1
result_u16_value_MUX_uxn_opcodes_h_l1475_c2_caa1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1475_c2_caa1_cond,
result_u16_value_MUX_uxn_opcodes_h_l1475_c2_caa1_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1475_c2_caa1_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1475_c2_caa1_return_output);

-- printf_uxn_opcodes_h_l1476_c3_84a9_uxn_opcodes_h_l1476_c3_84a9
printf_uxn_opcodes_h_l1476_c3_84a9_uxn_opcodes_h_l1476_c3_84a9 : entity work.printf_uxn_opcodes_h_l1476_c3_84a9_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1476_c3_84a9_uxn_opcodes_h_l1476_c3_84a9_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1480_c11_141c
BIN_OP_EQ_uxn_opcodes_h_l1480_c11_141c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1480_c11_141c_left,
BIN_OP_EQ_uxn_opcodes_h_l1480_c11_141c_right,
BIN_OP_EQ_uxn_opcodes_h_l1480_c11_141c_return_output);

-- n16_MUX_uxn_opcodes_h_l1480_c7_851f
n16_MUX_uxn_opcodes_h_l1480_c7_851f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1480_c7_851f_cond,
n16_MUX_uxn_opcodes_h_l1480_c7_851f_iftrue,
n16_MUX_uxn_opcodes_h_l1480_c7_851f_iffalse,
n16_MUX_uxn_opcodes_h_l1480_c7_851f_return_output);

-- t8_MUX_uxn_opcodes_h_l1480_c7_851f
t8_MUX_uxn_opcodes_h_l1480_c7_851f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1480_c7_851f_cond,
t8_MUX_uxn_opcodes_h_l1480_c7_851f_iftrue,
t8_MUX_uxn_opcodes_h_l1480_c7_851f_iffalse,
t8_MUX_uxn_opcodes_h_l1480_c7_851f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1480_c7_851f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1480_c7_851f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1480_c7_851f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1480_c7_851f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1480_c7_851f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1480_c7_851f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1480_c7_851f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1480_c7_851f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1480_c7_851f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1480_c7_851f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1480_c7_851f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1480_c7_851f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1480_c7_851f
result_u8_value_MUX_uxn_opcodes_h_l1480_c7_851f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1480_c7_851f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1480_c7_851f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1480_c7_851f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1480_c7_851f_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1480_c7_851f
result_is_ram_write_MUX_uxn_opcodes_h_l1480_c7_851f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1480_c7_851f_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1480_c7_851f_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1480_c7_851f_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1480_c7_851f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1480_c7_851f
result_is_opc_done_MUX_uxn_opcodes_h_l1480_c7_851f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1480_c7_851f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1480_c7_851f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1480_c7_851f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1480_c7_851f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1480_c7_851f
result_is_sp_shift_MUX_uxn_opcodes_h_l1480_c7_851f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1480_c7_851f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1480_c7_851f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1480_c7_851f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1480_c7_851f_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1480_c7_851f
result_u16_value_MUX_uxn_opcodes_h_l1480_c7_851f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1480_c7_851f_cond,
result_u16_value_MUX_uxn_opcodes_h_l1480_c7_851f_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1480_c7_851f_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1480_c7_851f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1483_c11_72ae
BIN_OP_EQ_uxn_opcodes_h_l1483_c11_72ae : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1483_c11_72ae_left,
BIN_OP_EQ_uxn_opcodes_h_l1483_c11_72ae_right,
BIN_OP_EQ_uxn_opcodes_h_l1483_c11_72ae_return_output);

-- n16_MUX_uxn_opcodes_h_l1483_c7_7d40
n16_MUX_uxn_opcodes_h_l1483_c7_7d40 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1483_c7_7d40_cond,
n16_MUX_uxn_opcodes_h_l1483_c7_7d40_iftrue,
n16_MUX_uxn_opcodes_h_l1483_c7_7d40_iffalse,
n16_MUX_uxn_opcodes_h_l1483_c7_7d40_return_output);

-- t8_MUX_uxn_opcodes_h_l1483_c7_7d40
t8_MUX_uxn_opcodes_h_l1483_c7_7d40 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1483_c7_7d40_cond,
t8_MUX_uxn_opcodes_h_l1483_c7_7d40_iftrue,
t8_MUX_uxn_opcodes_h_l1483_c7_7d40_iffalse,
t8_MUX_uxn_opcodes_h_l1483_c7_7d40_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c7_7d40
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c7_7d40 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c7_7d40_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c7_7d40_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c7_7d40_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c7_7d40_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c7_7d40
result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c7_7d40 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c7_7d40_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c7_7d40_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c7_7d40_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c7_7d40_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1483_c7_7d40
result_u8_value_MUX_uxn_opcodes_h_l1483_c7_7d40 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1483_c7_7d40_cond,
result_u8_value_MUX_uxn_opcodes_h_l1483_c7_7d40_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1483_c7_7d40_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1483_c7_7d40_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1483_c7_7d40
result_is_ram_write_MUX_uxn_opcodes_h_l1483_c7_7d40 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1483_c7_7d40_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1483_c7_7d40_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1483_c7_7d40_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1483_c7_7d40_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1483_c7_7d40
result_is_opc_done_MUX_uxn_opcodes_h_l1483_c7_7d40 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1483_c7_7d40_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1483_c7_7d40_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1483_c7_7d40_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1483_c7_7d40_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c7_7d40
result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c7_7d40 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c7_7d40_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c7_7d40_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c7_7d40_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c7_7d40_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1483_c7_7d40
result_u16_value_MUX_uxn_opcodes_h_l1483_c7_7d40 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1483_c7_7d40_cond,
result_u16_value_MUX_uxn_opcodes_h_l1483_c7_7d40_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1483_c7_7d40_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1483_c7_7d40_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1487_c11_5803
BIN_OP_EQ_uxn_opcodes_h_l1487_c11_5803 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1487_c11_5803_left,
BIN_OP_EQ_uxn_opcodes_h_l1487_c11_5803_right,
BIN_OP_EQ_uxn_opcodes_h_l1487_c11_5803_return_output);

-- n16_MUX_uxn_opcodes_h_l1487_c7_dc65
n16_MUX_uxn_opcodes_h_l1487_c7_dc65 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1487_c7_dc65_cond,
n16_MUX_uxn_opcodes_h_l1487_c7_dc65_iftrue,
n16_MUX_uxn_opcodes_h_l1487_c7_dc65_iffalse,
n16_MUX_uxn_opcodes_h_l1487_c7_dc65_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_dc65
result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_dc65 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_dc65_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_dc65_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_dc65_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_dc65_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1487_c7_dc65
result_u8_value_MUX_uxn_opcodes_h_l1487_c7_dc65 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1487_c7_dc65_cond,
result_u8_value_MUX_uxn_opcodes_h_l1487_c7_dc65_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1487_c7_dc65_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1487_c7_dc65_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1487_c7_dc65
result_is_ram_write_MUX_uxn_opcodes_h_l1487_c7_dc65 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1487_c7_dc65_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1487_c7_dc65_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1487_c7_dc65_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1487_c7_dc65_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_dc65
result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_dc65 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_dc65_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_dc65_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_dc65_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_dc65_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_dc65
result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_dc65 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_dc65_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_dc65_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_dc65_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_dc65_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1487_c7_dc65
result_u16_value_MUX_uxn_opcodes_h_l1487_c7_dc65 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1487_c7_dc65_cond,
result_u16_value_MUX_uxn_opcodes_h_l1487_c7_dc65_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1487_c7_dc65_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1487_c7_dc65_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1489_c3_b644
CONST_SL_8_uxn_opcodes_h_l1489_c3_b644 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1489_c3_b644_x,
CONST_SL_8_uxn_opcodes_h_l1489_c3_b644_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1491_c11_e089
BIN_OP_EQ_uxn_opcodes_h_l1491_c11_e089 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1491_c11_e089_left,
BIN_OP_EQ_uxn_opcodes_h_l1491_c11_e089_right,
BIN_OP_EQ_uxn_opcodes_h_l1491_c11_e089_return_output);

-- n16_MUX_uxn_opcodes_h_l1491_c7_79d5
n16_MUX_uxn_opcodes_h_l1491_c7_79d5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1491_c7_79d5_cond,
n16_MUX_uxn_opcodes_h_l1491_c7_79d5_iftrue,
n16_MUX_uxn_opcodes_h_l1491_c7_79d5_iffalse,
n16_MUX_uxn_opcodes_h_l1491_c7_79d5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_79d5
result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_79d5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_79d5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_79d5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_79d5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_79d5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1491_c7_79d5
result_u8_value_MUX_uxn_opcodes_h_l1491_c7_79d5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1491_c7_79d5_cond,
result_u8_value_MUX_uxn_opcodes_h_l1491_c7_79d5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1491_c7_79d5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1491_c7_79d5_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_79d5
result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_79d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_79d5_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_79d5_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_79d5_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_79d5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_79d5
result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_79d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_79d5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_79d5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_79d5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_79d5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_79d5
result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_79d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_79d5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_79d5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_79d5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_79d5_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1491_c7_79d5
result_u16_value_MUX_uxn_opcodes_h_l1491_c7_79d5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1491_c7_79d5_cond,
result_u16_value_MUX_uxn_opcodes_h_l1491_c7_79d5_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1491_c7_79d5_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1491_c7_79d5_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1492_c3_39a0
BIN_OP_OR_uxn_opcodes_h_l1492_c3_39a0 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1492_c3_39a0_left,
BIN_OP_OR_uxn_opcodes_h_l1492_c3_39a0_right,
BIN_OP_OR_uxn_opcodes_h_l1492_c3_39a0_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1494_c30_b1b7
sp_relative_shift_uxn_opcodes_h_l1494_c30_b1b7 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1494_c30_b1b7_ins,
sp_relative_shift_uxn_opcodes_h_l1494_c30_b1b7_x,
sp_relative_shift_uxn_opcodes_h_l1494_c30_b1b7_y,
sp_relative_shift_uxn_opcodes_h_l1494_c30_b1b7_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1497_c31_1aa1
CONST_SR_8_uxn_opcodes_h_l1497_c31_1aa1 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1497_c31_1aa1_x,
CONST_SR_8_uxn_opcodes_h_l1497_c31_1aa1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1499_c11_cfdf
BIN_OP_EQ_uxn_opcodes_h_l1499_c11_cfdf : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1499_c11_cfdf_left,
BIN_OP_EQ_uxn_opcodes_h_l1499_c11_cfdf_right,
BIN_OP_EQ_uxn_opcodes_h_l1499_c11_cfdf_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1499_c7_63dd
result_u8_value_MUX_uxn_opcodes_h_l1499_c7_63dd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1499_c7_63dd_cond,
result_u8_value_MUX_uxn_opcodes_h_l1499_c7_63dd_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1499_c7_63dd_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1499_c7_63dd_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_63dd
result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_63dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_63dd_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_63dd_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_63dd_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_63dd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_63dd
result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_63dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_63dd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_63dd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_63dd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_63dd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_63dd
result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_63dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_63dd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_63dd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_63dd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_63dd_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1499_c7_63dd
result_u16_value_MUX_uxn_opcodes_h_l1499_c7_63dd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1499_c7_63dd_cond,
result_u16_value_MUX_uxn_opcodes_h_l1499_c7_63dd_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1499_c7_63dd_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1499_c7_63dd_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1501_c33_f05b
BIN_OP_PLUS_uxn_opcodes_h_l1501_c33_f05b : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1501_c33_f05b_left,
BIN_OP_PLUS_uxn_opcodes_h_l1501_c33_f05b_right,
BIN_OP_PLUS_uxn_opcodes_h_l1501_c33_f05b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1504_c11_e867
BIN_OP_EQ_uxn_opcodes_h_l1504_c11_e867 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1504_c11_e867_left,
BIN_OP_EQ_uxn_opcodes_h_l1504_c11_e867_right,
BIN_OP_EQ_uxn_opcodes_h_l1504_c11_e867_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1504_c7_cc9f
result_is_ram_write_MUX_uxn_opcodes_h_l1504_c7_cc9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1504_c7_cc9f_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1504_c7_cc9f_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1504_c7_cc9f_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1504_c7_cc9f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1504_c7_cc9f
result_is_opc_done_MUX_uxn_opcodes_h_l1504_c7_cc9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1504_c7_cc9f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1504_c7_cc9f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1504_c7_cc9f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1504_c7_cc9f_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1475_c6_e37a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1475_c1_89c2_return_output,
 n16_MUX_uxn_opcodes_h_l1475_c2_caa1_return_output,
 t8_MUX_uxn_opcodes_h_l1475_c2_caa1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1475_c2_caa1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1475_c2_caa1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1475_c2_caa1_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1475_c2_caa1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1475_c2_caa1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1475_c2_caa1_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1475_c2_caa1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1480_c11_141c_return_output,
 n16_MUX_uxn_opcodes_h_l1480_c7_851f_return_output,
 t8_MUX_uxn_opcodes_h_l1480_c7_851f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1480_c7_851f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1480_c7_851f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1480_c7_851f_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1480_c7_851f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1480_c7_851f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1480_c7_851f_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1480_c7_851f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1483_c11_72ae_return_output,
 n16_MUX_uxn_opcodes_h_l1483_c7_7d40_return_output,
 t8_MUX_uxn_opcodes_h_l1483_c7_7d40_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c7_7d40_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c7_7d40_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1483_c7_7d40_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1483_c7_7d40_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1483_c7_7d40_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c7_7d40_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1483_c7_7d40_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1487_c11_5803_return_output,
 n16_MUX_uxn_opcodes_h_l1487_c7_dc65_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_dc65_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1487_c7_dc65_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1487_c7_dc65_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_dc65_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_dc65_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1487_c7_dc65_return_output,
 CONST_SL_8_uxn_opcodes_h_l1489_c3_b644_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1491_c11_e089_return_output,
 n16_MUX_uxn_opcodes_h_l1491_c7_79d5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_79d5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1491_c7_79d5_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_79d5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_79d5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_79d5_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1491_c7_79d5_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1492_c3_39a0_return_output,
 sp_relative_shift_uxn_opcodes_h_l1494_c30_b1b7_return_output,
 CONST_SR_8_uxn_opcodes_h_l1497_c31_1aa1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1499_c11_cfdf_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1499_c7_63dd_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_63dd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_63dd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_63dd_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1499_c7_63dd_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1501_c33_f05b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1504_c11_e867_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1504_c7_cc9f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1504_c7_cc9f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1475_c6_e37a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1475_c6_e37a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1475_c6_e37a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1475_c1_89c2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1475_c1_89c2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1475_c1_89c2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1475_c1_89c2_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1475_c2_caa1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1475_c2_caa1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1480_c7_851f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1475_c2_caa1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1475_c2_caa1_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1475_c2_caa1_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1475_c2_caa1_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1480_c7_851f_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1475_c2_caa1_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1475_c2_caa1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1475_c2_caa1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1477_c3_ba1a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1475_c2_caa1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1480_c7_851f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1475_c2_caa1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1475_c2_caa1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1475_c2_caa1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1475_c2_caa1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1480_c7_851f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1475_c2_caa1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1475_c2_caa1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1475_c2_caa1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1475_c2_caa1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1480_c7_851f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1475_c2_caa1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1475_c2_caa1_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1475_c2_caa1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1475_c2_caa1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1480_c7_851f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1475_c2_caa1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1475_c2_caa1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1475_c2_caa1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1475_c2_caa1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1480_c7_851f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1475_c2_caa1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1475_c2_caa1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1475_c2_caa1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1475_c2_caa1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1480_c7_851f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1475_c2_caa1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1475_c2_caa1_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1475_c2_caa1_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1475_c2_caa1_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1480_c7_851f_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1475_c2_caa1_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1475_c2_caa1_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1476_c3_84a9_uxn_opcodes_h_l1476_c3_84a9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1480_c11_141c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1480_c11_141c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1480_c11_141c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1480_c7_851f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1480_c7_851f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1483_c7_7d40_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1480_c7_851f_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1480_c7_851f_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1480_c7_851f_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1483_c7_7d40_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1480_c7_851f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1480_c7_851f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1481_c3_6104 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1480_c7_851f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c7_7d40_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1480_c7_851f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1480_c7_851f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1480_c7_851f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c7_7d40_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1480_c7_851f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1480_c7_851f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1480_c7_851f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1483_c7_7d40_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1480_c7_851f_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1480_c7_851f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1480_c7_851f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1483_c7_7d40_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1480_c7_851f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1480_c7_851f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1480_c7_851f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1483_c7_7d40_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1480_c7_851f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1480_c7_851f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1480_c7_851f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c7_7d40_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1480_c7_851f_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1480_c7_851f_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1480_c7_851f_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1483_c7_7d40_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1480_c7_851f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c11_72ae_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c11_72ae_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c11_72ae_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1483_c7_7d40_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1483_c7_7d40_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1487_c7_dc65_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1483_c7_7d40_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1483_c7_7d40_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1483_c7_7d40_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1483_c7_7d40_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c7_7d40_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1485_c3_a61c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c7_7d40_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1483_c7_7d40_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c7_7d40_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c7_7d40_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c7_7d40_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_dc65_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c7_7d40_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1483_c7_7d40_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1483_c7_7d40_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1487_c7_dc65_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1483_c7_7d40_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1483_c7_7d40_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1483_c7_7d40_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1487_c7_dc65_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1483_c7_7d40_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1483_c7_7d40_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1483_c7_7d40_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_dc65_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1483_c7_7d40_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c7_7d40_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c7_7d40_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_dc65_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c7_7d40_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1483_c7_7d40_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1483_c7_7d40_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1487_c7_dc65_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1483_c7_7d40_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1487_c11_5803_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1487_c11_5803_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1487_c11_5803_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1487_c7_dc65_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1487_c7_dc65_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1491_c7_79d5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1487_c7_dc65_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_dc65_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_dc65_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_79d5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_dc65_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1487_c7_dc65_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1487_c7_dc65_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1491_c7_79d5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1487_c7_dc65_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1487_c7_dc65_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1487_c7_dc65_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_79d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1487_c7_dc65_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_dc65_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_dc65_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_79d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_dc65_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_dc65_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_dc65_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_79d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_dc65_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1487_c7_dc65_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1487_c7_dc65_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1491_c7_79d5_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1487_c7_dc65_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1489_c3_b644_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1489_c3_b644_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1491_c11_e089_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1491_c11_e089_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1491_c11_e089_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1491_c7_79d5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1491_c7_79d5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1491_c7_79d5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_79d5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_79d5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_79d5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1491_c7_79d5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1491_c7_79d5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c7_63dd_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1491_c7_79d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_79d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_79d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_63dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_79d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_79d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_79d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_63dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_79d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_79d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_79d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_63dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_79d5_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1491_c7_79d5_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1491_c7_79d5_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c7_63dd_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1491_c7_79d5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1492_c3_39a0_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1492_c3_39a0_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1492_c3_39a0_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1494_c30_b1b7_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1494_c30_b1b7_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1494_c30_b1b7_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1494_c30_b1b7_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1496_c22_5a59_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1497_c31_1aa1_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1497_c31_1aa1_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1497_c21_f254_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_cfdf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_cfdf_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_cfdf_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c7_63dd_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c7_63dd_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c7_63dd_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_63dd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_63dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1504_c7_cc9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_63dd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_63dd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_63dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1504_c7_cc9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_63dd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_63dd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_63dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_63dd_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c7_63dd_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c7_63dd_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c7_63dd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1501_c33_f05b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1501_c33_f05b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1501_c33_f05b_return_output : unsigned(8 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1501_c22_28e6_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1502_c21_de72_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1504_c11_e867_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1504_c11_e867_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1504_c11_e867_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1504_c7_cc9f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1504_c7_cc9f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1504_c7_cc9f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1504_c7_cc9f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1504_c7_cc9f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1504_c7_cc9f_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1487_l1483_l1480_l1475_l1491_DUPLICATE_d3bb_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1487_l1483_l1480_l1475_l1499_DUPLICATE_ce2e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1487_l1483_l1480_l1475_l1504_l1499_DUPLICATE_12b1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1487_l1483_l1480_l1475_l1499_DUPLICATE_2ef0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1487_l1483_l1480_l1475_l1499_DUPLICATE_4e8c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1487_l1483_l1480_l1504_l1499_l1491_DUPLICATE_f945_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1492_l1488_DUPLICATE_2e79_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_18d1_uxn_opcodes_h_l1509_l1469_DUPLICATE_aa8d_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1487_c11_5803_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1475_c6_e37a_right := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_79d5_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_63dd_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_79d5_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1477_c3_ba1a := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1475_c2_caa1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1477_c3_ba1a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c11_72ae_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1480_c11_141c_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1475_c2_caa1_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1494_c30_b1b7_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1491_c11_e089_right := to_unsigned(4, 3);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1504_c7_cc9f_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1481_c3_6104 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1480_c7_851f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1481_c3_6104;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1504_c7_cc9f_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1501_c33_f05b_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1494_c30_b1b7_y := resize(to_signed(-3, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1504_c11_e867_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1485_c3_a61c := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c7_7d40_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1485_c3_a61c;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1475_c1_89c2_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_cfdf_right := to_unsigned(5, 3);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1475_c1_89c2_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1494_c30_b1b7_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1492_c3_39a0_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1475_c2_caa1_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1480_c7_851f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1483_c7_7d40_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1491_c7_79d5_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1475_c6_e37a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1480_c11_141c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c11_72ae_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1487_c11_5803_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1491_c11_e089_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_cfdf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1504_c11_e867_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l1483_c7_7d40_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1501_c33_f05b_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1475_c2_caa1_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1480_c7_851f_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1483_c7_7d40_iffalse := t8;
     -- sp_relative_shift[uxn_opcodes_h_l1494_c30_b1b7] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1494_c30_b1b7_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1494_c30_b1b7_ins;
     sp_relative_shift_uxn_opcodes_h_l1494_c30_b1b7_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1494_c30_b1b7_x;
     sp_relative_shift_uxn_opcodes_h_l1494_c30_b1b7_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1494_c30_b1b7_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1494_c30_b1b7_return_output := sp_relative_shift_uxn_opcodes_h_l1494_c30_b1b7_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1487_l1483_l1480_l1475_l1499_DUPLICATE_4e8c LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1487_l1483_l1480_l1475_l1499_DUPLICATE_4e8c_return_output := result.u16_value;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1501_c33_f05b] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1501_c33_f05b_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1501_c33_f05b_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1501_c33_f05b_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1501_c33_f05b_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1501_c33_f05b_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1501_c33_f05b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1480_c11_141c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1480_c11_141c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1480_c11_141c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1480_c11_141c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1480_c11_141c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1480_c11_141c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1480_c11_141c_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1492_l1488_DUPLICATE_2e79 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1492_l1488_DUPLICATE_2e79_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1487_l1483_l1480_l1475_l1499_DUPLICATE_2ef0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1487_l1483_l1480_l1475_l1499_DUPLICATE_2ef0_return_output := result.is_sp_shift;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1487_l1483_l1480_l1475_l1491_DUPLICATE_d3bb LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1487_l1483_l1480_l1475_l1491_DUPLICATE_d3bb_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1475_c6_e37a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1475_c6_e37a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1475_c6_e37a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1475_c6_e37a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1475_c6_e37a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1475_c6_e37a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1475_c6_e37a_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1496_c22_5a59] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1496_c22_5a59_return_output := CAST_TO_uint16_t_uint8_t(
     t8);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1487_l1483_l1480_l1504_l1499_l1491_DUPLICATE_f945 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1487_l1483_l1480_l1504_l1499_l1491_DUPLICATE_f945_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1499_c11_cfdf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1499_c11_cfdf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_cfdf_left;
     BIN_OP_EQ_uxn_opcodes_h_l1499_c11_cfdf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_cfdf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_cfdf_return_output := BIN_OP_EQ_uxn_opcodes_h_l1499_c11_cfdf_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1487_l1483_l1480_l1475_l1499_DUPLICATE_ce2e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1487_l1483_l1480_l1475_l1499_DUPLICATE_ce2e_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1504_c11_e867] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1504_c11_e867_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1504_c11_e867_left;
     BIN_OP_EQ_uxn_opcodes_h_l1504_c11_e867_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1504_c11_e867_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1504_c11_e867_return_output := BIN_OP_EQ_uxn_opcodes_h_l1504_c11_e867_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1487_l1483_l1480_l1475_l1504_l1499_DUPLICATE_12b1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1487_l1483_l1480_l1475_l1504_l1499_DUPLICATE_12b1_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1483_c11_72ae] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1483_c11_72ae_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c11_72ae_left;
     BIN_OP_EQ_uxn_opcodes_h_l1483_c11_72ae_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c11_72ae_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c11_72ae_return_output := BIN_OP_EQ_uxn_opcodes_h_l1483_c11_72ae_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1487_c11_5803] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1487_c11_5803_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1487_c11_5803_left;
     BIN_OP_EQ_uxn_opcodes_h_l1487_c11_5803_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1487_c11_5803_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1487_c11_5803_return_output := BIN_OP_EQ_uxn_opcodes_h_l1487_c11_5803_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1502_c21_de72] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1502_c21_de72_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- BIN_OP_EQ[uxn_opcodes_h_l1491_c11_e089] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1491_c11_e089_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1491_c11_e089_left;
     BIN_OP_EQ_uxn_opcodes_h_l1491_c11_e089_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1491_c11_e089_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1491_c11_e089_return_output := BIN_OP_EQ_uxn_opcodes_h_l1491_c11_e089_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1483_c7_7d40] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1483_c7_7d40_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1475_c1_89c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1475_c6_e37a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1475_c2_caa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1475_c6_e37a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1475_c2_caa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1475_c6_e37a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1475_c2_caa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1475_c6_e37a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1475_c2_caa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1475_c6_e37a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1475_c2_caa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1475_c6_e37a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1475_c2_caa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1475_c6_e37a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1475_c2_caa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1475_c6_e37a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1475_c2_caa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1475_c6_e37a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1475_c2_caa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1475_c6_e37a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1480_c7_851f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1480_c11_141c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1480_c7_851f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1480_c11_141c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1480_c7_851f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1480_c11_141c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1480_c7_851f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1480_c11_141c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1480_c7_851f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1480_c11_141c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1480_c7_851f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1480_c11_141c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1480_c7_851f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1480_c11_141c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1480_c7_851f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1480_c11_141c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1480_c7_851f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1480_c11_141c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1483_c7_7d40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c11_72ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1483_c7_7d40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c11_72ae_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1483_c7_7d40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c11_72ae_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c7_7d40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c11_72ae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c7_7d40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c11_72ae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c7_7d40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c11_72ae_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1483_c7_7d40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c11_72ae_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1483_c7_7d40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c11_72ae_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1483_c7_7d40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c11_72ae_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1487_c7_dc65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1487_c11_5803_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_dc65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1487_c11_5803_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1487_c7_dc65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1487_c11_5803_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_dc65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1487_c11_5803_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_dc65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1487_c11_5803_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1487_c7_dc65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1487_c11_5803_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1487_c7_dc65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1487_c11_5803_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1491_c7_79d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1491_c11_e089_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_79d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1491_c11_e089_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_79d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1491_c11_e089_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_79d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1491_c11_e089_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_79d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1491_c11_e089_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1491_c7_79d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1491_c11_e089_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1491_c7_79d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1491_c11_e089_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_63dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_cfdf_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_63dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_cfdf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_63dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_cfdf_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c7_63dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_cfdf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c7_63dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_cfdf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1504_c7_cc9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1504_c11_e867_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1504_c7_cc9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1504_c11_e867_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1491_c7_79d5_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1496_c22_5a59_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1492_c3_39a0_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1492_l1488_DUPLICATE_2e79_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1489_c3_b644_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1492_l1488_DUPLICATE_2e79_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c7_63dd_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1502_c21_de72_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1475_c2_caa1_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1487_l1483_l1480_l1475_l1491_DUPLICATE_d3bb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1480_c7_851f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1487_l1483_l1480_l1475_l1491_DUPLICATE_d3bb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c7_7d40_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1487_l1483_l1480_l1475_l1491_DUPLICATE_d3bb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_dc65_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1487_l1483_l1480_l1475_l1491_DUPLICATE_d3bb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_79d5_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1487_l1483_l1480_l1475_l1491_DUPLICATE_d3bb_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1475_c2_caa1_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1487_l1483_l1480_l1475_l1499_DUPLICATE_4e8c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1480_c7_851f_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1487_l1483_l1480_l1475_l1499_DUPLICATE_4e8c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1483_c7_7d40_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1487_l1483_l1480_l1475_l1499_DUPLICATE_4e8c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1487_c7_dc65_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1487_l1483_l1480_l1475_l1499_DUPLICATE_4e8c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c7_63dd_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1487_l1483_l1480_l1475_l1499_DUPLICATE_4e8c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1480_c7_851f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1487_l1483_l1480_l1504_l1499_l1491_DUPLICATE_f945_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1483_c7_7d40_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1487_l1483_l1480_l1504_l1499_l1491_DUPLICATE_f945_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_dc65_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1487_l1483_l1480_l1504_l1499_l1491_DUPLICATE_f945_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_79d5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1487_l1483_l1480_l1504_l1499_l1491_DUPLICATE_f945_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_63dd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1487_l1483_l1480_l1504_l1499_l1491_DUPLICATE_f945_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1504_c7_cc9f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1487_l1483_l1480_l1504_l1499_l1491_DUPLICATE_f945_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1475_c2_caa1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1487_l1483_l1480_l1475_l1504_l1499_DUPLICATE_12b1_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1480_c7_851f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1487_l1483_l1480_l1475_l1504_l1499_DUPLICATE_12b1_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1483_c7_7d40_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1487_l1483_l1480_l1475_l1504_l1499_DUPLICATE_12b1_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1487_c7_dc65_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1487_l1483_l1480_l1475_l1504_l1499_DUPLICATE_12b1_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_63dd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1487_l1483_l1480_l1475_l1504_l1499_DUPLICATE_12b1_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1504_c7_cc9f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1487_l1483_l1480_l1475_l1504_l1499_DUPLICATE_12b1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1475_c2_caa1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1487_l1483_l1480_l1475_l1499_DUPLICATE_2ef0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1480_c7_851f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1487_l1483_l1480_l1475_l1499_DUPLICATE_2ef0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c7_7d40_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1487_l1483_l1480_l1475_l1499_DUPLICATE_2ef0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_dc65_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1487_l1483_l1480_l1475_l1499_DUPLICATE_2ef0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_63dd_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1487_l1483_l1480_l1475_l1499_DUPLICATE_2ef0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1475_c2_caa1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1487_l1483_l1480_l1475_l1499_DUPLICATE_ce2e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1480_c7_851f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1487_l1483_l1480_l1475_l1499_DUPLICATE_ce2e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1483_c7_7d40_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1487_l1483_l1480_l1475_l1499_DUPLICATE_ce2e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1487_c7_dc65_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1487_l1483_l1480_l1475_l1499_DUPLICATE_ce2e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c7_63dd_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1487_l1483_l1480_l1475_l1499_DUPLICATE_ce2e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c7_7d40_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1483_c7_7d40_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_79d5_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1494_c30_b1b7_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1491_c7_79d5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_79d5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_79d5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_79d5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_79d5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_79d5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_79d5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_79d5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_79d5_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1489_c3_b644] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1489_c3_b644_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1489_c3_b644_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1489_c3_b644_return_output := CONST_SL_8_uxn_opcodes_h_l1489_c3_b644_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1492_c3_39a0] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1492_c3_39a0_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1492_c3_39a0_left;
     BIN_OP_OR_uxn_opcodes_h_l1492_c3_39a0_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1492_c3_39a0_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1492_c3_39a0_return_output := BIN_OP_OR_uxn_opcodes_h_l1492_c3_39a0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1499_c7_63dd] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1499_c7_63dd_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c7_63dd_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1499_c7_63dd_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c7_63dd_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1499_c7_63dd_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c7_63dd_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c7_63dd_return_output := result_u8_value_MUX_uxn_opcodes_h_l1499_c7_63dd_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1475_c1_89c2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1475_c1_89c2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1475_c1_89c2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1475_c1_89c2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1475_c1_89c2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1475_c1_89c2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1475_c1_89c2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1475_c1_89c2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1475_c1_89c2_return_output;

     -- t8_MUX[uxn_opcodes_h_l1483_c7_7d40] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1483_c7_7d40_cond <= VAR_t8_MUX_uxn_opcodes_h_l1483_c7_7d40_cond;
     t8_MUX_uxn_opcodes_h_l1483_c7_7d40_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1483_c7_7d40_iftrue;
     t8_MUX_uxn_opcodes_h_l1483_c7_7d40_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1483_c7_7d40_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1483_c7_7d40_return_output := t8_MUX_uxn_opcodes_h_l1483_c7_7d40_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1504_c7_cc9f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1504_c7_cc9f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1504_c7_cc9f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1504_c7_cc9f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1504_c7_cc9f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1504_c7_cc9f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1504_c7_cc9f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1504_c7_cc9f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1504_c7_cc9f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1499_c7_63dd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_63dd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_63dd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_63dd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_63dd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_63dd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_63dd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_63dd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_63dd_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1504_c7_cc9f] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1504_c7_cc9f_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1504_c7_cc9f_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1504_c7_cc9f_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1504_c7_cc9f_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1504_c7_cc9f_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1504_c7_cc9f_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1504_c7_cc9f_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1504_c7_cc9f_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1501_c22_28e6] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1501_c22_28e6_return_output := CAST_TO_uint16_t_uint9_t(
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1501_c33_f05b_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1483_c7_7d40] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c7_7d40_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c7_7d40_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c7_7d40_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c7_7d40_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c7_7d40_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c7_7d40_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c7_7d40_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c7_7d40_return_output;

     -- Submodule level 2
     VAR_CONST_SR_8_uxn_opcodes_h_l1497_c31_1aa1_x := VAR_BIN_OP_OR_uxn_opcodes_h_l1492_c3_39a0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1491_c7_79d5_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1492_c3_39a0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c7_63dd_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1501_c22_28e6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1487_c7_dc65_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1489_c3_b644_return_output;
     VAR_printf_uxn_opcodes_h_l1476_c3_84a9_uxn_opcodes_h_l1476_c3_84a9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1475_c1_89c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_63dd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1504_c7_cc9f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_63dd_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1504_c7_cc9f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_79d5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_63dd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_dc65_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_79d5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1480_c7_851f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c7_7d40_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1491_c7_79d5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c7_63dd_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1480_c7_851f_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1483_c7_7d40_return_output;
     -- CONST_SR_8[uxn_opcodes_h_l1497_c31_1aa1] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1497_c31_1aa1_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1497_c31_1aa1_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1497_c31_1aa1_return_output := CONST_SR_8_uxn_opcodes_h_l1497_c31_1aa1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1487_c7_dc65] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_dc65_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_dc65_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_dc65_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_dc65_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_dc65_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_dc65_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_dc65_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_dc65_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1499_c7_63dd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_63dd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_63dd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_63dd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_63dd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_63dd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_63dd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_63dd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_63dd_return_output;

     -- n16_MUX[uxn_opcodes_h_l1491_c7_79d5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1491_c7_79d5_cond <= VAR_n16_MUX_uxn_opcodes_h_l1491_c7_79d5_cond;
     n16_MUX_uxn_opcodes_h_l1491_c7_79d5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1491_c7_79d5_iftrue;
     n16_MUX_uxn_opcodes_h_l1491_c7_79d5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1491_c7_79d5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1491_c7_79d5_return_output := n16_MUX_uxn_opcodes_h_l1491_c7_79d5_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1499_c7_63dd] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_63dd_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_63dd_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_63dd_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_63dd_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_63dd_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_63dd_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_63dd_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_63dd_return_output;

     -- printf_uxn_opcodes_h_l1476_c3_84a9[uxn_opcodes_h_l1476_c3_84a9] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1476_c3_84a9_uxn_opcodes_h_l1476_c3_84a9_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1476_c3_84a9_uxn_opcodes_h_l1476_c3_84a9_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1480_c7_851f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1480_c7_851f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1480_c7_851f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1480_c7_851f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1480_c7_851f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1480_c7_851f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1480_c7_851f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1480_c7_851f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1480_c7_851f_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1499_c7_63dd] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1499_c7_63dd_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c7_63dd_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1499_c7_63dd_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c7_63dd_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1499_c7_63dd_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c7_63dd_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c7_63dd_return_output := result_u16_value_MUX_uxn_opcodes_h_l1499_c7_63dd_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1491_c7_79d5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_79d5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_79d5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_79d5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_79d5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_79d5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_79d5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_79d5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_79d5_return_output;

     -- t8_MUX[uxn_opcodes_h_l1480_c7_851f] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1480_c7_851f_cond <= VAR_t8_MUX_uxn_opcodes_h_l1480_c7_851f_cond;
     t8_MUX_uxn_opcodes_h_l1480_c7_851f_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1480_c7_851f_iftrue;
     t8_MUX_uxn_opcodes_h_l1480_c7_851f_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1480_c7_851f_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1480_c7_851f_return_output := t8_MUX_uxn_opcodes_h_l1480_c7_851f_return_output;

     -- Submodule level 3
     VAR_n16_MUX_uxn_opcodes_h_l1487_c7_dc65_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1491_c7_79d5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_79d5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_63dd_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_79d5_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_63dd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_dc65_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_79d5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c7_7d40_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_dc65_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1475_c2_caa1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1480_c7_851f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1491_c7_79d5_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c7_63dd_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1475_c2_caa1_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1480_c7_851f_return_output;
     -- n16_MUX[uxn_opcodes_h_l1487_c7_dc65] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1487_c7_dc65_cond <= VAR_n16_MUX_uxn_opcodes_h_l1487_c7_dc65_cond;
     n16_MUX_uxn_opcodes_h_l1487_c7_dc65_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1487_c7_dc65_iftrue;
     n16_MUX_uxn_opcodes_h_l1487_c7_dc65_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1487_c7_dc65_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1487_c7_dc65_return_output := n16_MUX_uxn_opcodes_h_l1487_c7_dc65_return_output;

     -- t8_MUX[uxn_opcodes_h_l1475_c2_caa1] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1475_c2_caa1_cond <= VAR_t8_MUX_uxn_opcodes_h_l1475_c2_caa1_cond;
     t8_MUX_uxn_opcodes_h_l1475_c2_caa1_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1475_c2_caa1_iftrue;
     t8_MUX_uxn_opcodes_h_l1475_c2_caa1_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1475_c2_caa1_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1475_c2_caa1_return_output := t8_MUX_uxn_opcodes_h_l1475_c2_caa1_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1491_c7_79d5] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_79d5_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_79d5_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_79d5_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_79d5_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_79d5_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_79d5_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_79d5_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_79d5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1475_c2_caa1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1475_c2_caa1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1475_c2_caa1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1475_c2_caa1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1475_c2_caa1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1475_c2_caa1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1475_c2_caa1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1475_c2_caa1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1475_c2_caa1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1487_c7_dc65] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_dc65_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_dc65_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_dc65_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_dc65_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_dc65_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_dc65_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_dc65_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_dc65_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1497_c21_f254] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1497_c21_f254_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1497_c31_1aa1_return_output);

     -- result_u16_value_MUX[uxn_opcodes_h_l1491_c7_79d5] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1491_c7_79d5_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1491_c7_79d5_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1491_c7_79d5_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1491_c7_79d5_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1491_c7_79d5_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1491_c7_79d5_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1491_c7_79d5_return_output := result_u16_value_MUX_uxn_opcodes_h_l1491_c7_79d5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1491_c7_79d5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_79d5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_79d5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_79d5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_79d5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_79d5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_79d5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_79d5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_79d5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1483_c7_7d40] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c7_7d40_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c7_7d40_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c7_7d40_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c7_7d40_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c7_7d40_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c7_7d40_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c7_7d40_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c7_7d40_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1491_c7_79d5_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1497_c21_f254_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1483_c7_7d40_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1487_c7_dc65_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_dc65_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_79d5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1487_c7_dc65_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_79d5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c7_7d40_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_dc65_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1480_c7_851f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c7_7d40_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1487_c7_dc65_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1491_c7_79d5_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1475_c2_caa1_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1487_c7_dc65] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1487_c7_dc65_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1487_c7_dc65_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1487_c7_dc65_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1487_c7_dc65_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1487_c7_dc65_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1487_c7_dc65_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1487_c7_dc65_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1487_c7_dc65_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1480_c7_851f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1480_c7_851f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1480_c7_851f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1480_c7_851f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1480_c7_851f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1480_c7_851f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1480_c7_851f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1480_c7_851f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1480_c7_851f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1487_c7_dc65] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_dc65_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_dc65_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_dc65_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_dc65_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_dc65_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_dc65_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_dc65_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_dc65_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1483_c7_7d40] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c7_7d40_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c7_7d40_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c7_7d40_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c7_7d40_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c7_7d40_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c7_7d40_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c7_7d40_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c7_7d40_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1487_c7_dc65] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1487_c7_dc65_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1487_c7_dc65_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1487_c7_dc65_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1487_c7_dc65_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1487_c7_dc65_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1487_c7_dc65_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1487_c7_dc65_return_output := result_u16_value_MUX_uxn_opcodes_h_l1487_c7_dc65_return_output;

     -- n16_MUX[uxn_opcodes_h_l1483_c7_7d40] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1483_c7_7d40_cond <= VAR_n16_MUX_uxn_opcodes_h_l1483_c7_7d40_cond;
     n16_MUX_uxn_opcodes_h_l1483_c7_7d40_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1483_c7_7d40_iftrue;
     n16_MUX_uxn_opcodes_h_l1483_c7_7d40_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1483_c7_7d40_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1483_c7_7d40_return_output := n16_MUX_uxn_opcodes_h_l1483_c7_7d40_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1491_c7_79d5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1491_c7_79d5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1491_c7_79d5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1491_c7_79d5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1491_c7_79d5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1491_c7_79d5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1491_c7_79d5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1491_c7_79d5_return_output := result_u8_value_MUX_uxn_opcodes_h_l1491_c7_79d5_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1480_c7_851f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1483_c7_7d40_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1483_c7_7d40_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_dc65_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1483_c7_7d40_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1487_c7_dc65_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1480_c7_851f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c7_7d40_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1475_c2_caa1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1480_c7_851f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1483_c7_7d40_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1487_c7_dc65_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1487_c7_dc65_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1491_c7_79d5_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1483_c7_7d40] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1483_c7_7d40_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1483_c7_7d40_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1483_c7_7d40_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1483_c7_7d40_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1483_c7_7d40_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1483_c7_7d40_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1483_c7_7d40_return_output := result_u16_value_MUX_uxn_opcodes_h_l1483_c7_7d40_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1487_c7_dc65] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1487_c7_dc65_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1487_c7_dc65_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1487_c7_dc65_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1487_c7_dc65_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1487_c7_dc65_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1487_c7_dc65_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1487_c7_dc65_return_output := result_u8_value_MUX_uxn_opcodes_h_l1487_c7_dc65_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1483_c7_7d40] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1483_c7_7d40_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1483_c7_7d40_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1483_c7_7d40_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1483_c7_7d40_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1483_c7_7d40_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1483_c7_7d40_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1483_c7_7d40_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1483_c7_7d40_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1475_c2_caa1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1475_c2_caa1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1475_c2_caa1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1475_c2_caa1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1475_c2_caa1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1475_c2_caa1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1475_c2_caa1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1475_c2_caa1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1475_c2_caa1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1480_c7_851f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1480_c7_851f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1480_c7_851f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1480_c7_851f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1480_c7_851f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1480_c7_851f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1480_c7_851f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1480_c7_851f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1480_c7_851f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1483_c7_7d40] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1483_c7_7d40_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1483_c7_7d40_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1483_c7_7d40_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1483_c7_7d40_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1483_c7_7d40_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1483_c7_7d40_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1483_c7_7d40_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1483_c7_7d40_return_output;

     -- n16_MUX[uxn_opcodes_h_l1480_c7_851f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1480_c7_851f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1480_c7_851f_cond;
     n16_MUX_uxn_opcodes_h_l1480_c7_851f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1480_c7_851f_iftrue;
     n16_MUX_uxn_opcodes_h_l1480_c7_851f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1480_c7_851f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1480_c7_851f_return_output := n16_MUX_uxn_opcodes_h_l1480_c7_851f_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1475_c2_caa1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1480_c7_851f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1480_c7_851f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1483_c7_7d40_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1480_c7_851f_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1483_c7_7d40_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1475_c2_caa1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1480_c7_851f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1480_c7_851f_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1483_c7_7d40_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1483_c7_7d40_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1487_c7_dc65_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1480_c7_851f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1480_c7_851f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1480_c7_851f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1480_c7_851f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1480_c7_851f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1480_c7_851f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1480_c7_851f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1480_c7_851f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1480_c7_851f_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1480_c7_851f] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1480_c7_851f_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1480_c7_851f_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1480_c7_851f_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1480_c7_851f_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1480_c7_851f_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1480_c7_851f_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1480_c7_851f_return_output := result_u16_value_MUX_uxn_opcodes_h_l1480_c7_851f_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1480_c7_851f] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1480_c7_851f_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1480_c7_851f_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1480_c7_851f_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1480_c7_851f_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1480_c7_851f_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1480_c7_851f_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1480_c7_851f_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1480_c7_851f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1483_c7_7d40] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1483_c7_7d40_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1483_c7_7d40_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1483_c7_7d40_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1483_c7_7d40_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1483_c7_7d40_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1483_c7_7d40_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1483_c7_7d40_return_output := result_u8_value_MUX_uxn_opcodes_h_l1483_c7_7d40_return_output;

     -- n16_MUX[uxn_opcodes_h_l1475_c2_caa1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1475_c2_caa1_cond <= VAR_n16_MUX_uxn_opcodes_h_l1475_c2_caa1_cond;
     n16_MUX_uxn_opcodes_h_l1475_c2_caa1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1475_c2_caa1_iftrue;
     n16_MUX_uxn_opcodes_h_l1475_c2_caa1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1475_c2_caa1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1475_c2_caa1_return_output := n16_MUX_uxn_opcodes_h_l1475_c2_caa1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1475_c2_caa1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1475_c2_caa1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1475_c2_caa1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1475_c2_caa1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1475_c2_caa1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1475_c2_caa1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1475_c2_caa1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1475_c2_caa1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1475_c2_caa1_return_output;

     -- Submodule level 7
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1475_c2_caa1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1475_c2_caa1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1480_c7_851f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1475_c2_caa1_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1480_c7_851f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1475_c2_caa1_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1480_c7_851f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1480_c7_851f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1483_c7_7d40_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1475_c2_caa1] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1475_c2_caa1_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1475_c2_caa1_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1475_c2_caa1_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1475_c2_caa1_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1475_c2_caa1_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1475_c2_caa1_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1475_c2_caa1_return_output := result_u16_value_MUX_uxn_opcodes_h_l1475_c2_caa1_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1475_c2_caa1] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1475_c2_caa1_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1475_c2_caa1_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1475_c2_caa1_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1475_c2_caa1_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1475_c2_caa1_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1475_c2_caa1_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1475_c2_caa1_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1475_c2_caa1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1480_c7_851f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1480_c7_851f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1480_c7_851f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1480_c7_851f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1480_c7_851f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1480_c7_851f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1480_c7_851f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1480_c7_851f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1480_c7_851f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1475_c2_caa1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1475_c2_caa1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1475_c2_caa1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1475_c2_caa1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1475_c2_caa1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1475_c2_caa1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1475_c2_caa1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1475_c2_caa1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1475_c2_caa1_return_output;

     -- Submodule level 8
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1475_c2_caa1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1480_c7_851f_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1475_c2_caa1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1475_c2_caa1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1475_c2_caa1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1475_c2_caa1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1475_c2_caa1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1475_c2_caa1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1475_c2_caa1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1475_c2_caa1_return_output := result_u8_value_MUX_uxn_opcodes_h_l1475_c2_caa1_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_18d1_uxn_opcodes_h_l1509_l1469_DUPLICATE_aa8d LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_18d1_uxn_opcodes_h_l1509_l1469_DUPLICATE_aa8d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_18d1(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1475_c2_caa1_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1475_c2_caa1_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1475_c2_caa1_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1475_c2_caa1_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1475_c2_caa1_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1475_c2_caa1_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1475_c2_caa1_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_18d1_uxn_opcodes_h_l1509_l1469_DUPLICATE_aa8d_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_18d1_uxn_opcodes_h_l1509_l1469_DUPLICATE_aa8d_return_output;
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
