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
-- Submodules: 56
entity stz_0CLK_75b4bee3 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end stz_0CLK_75b4bee3;
architecture arch of stz_0CLK_75b4bee3 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1603_c6_1dae]
signal BIN_OP_EQ_uxn_opcodes_h_l1603_c6_1dae_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1603_c6_1dae_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1603_c6_1dae_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1603_c1_78e6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1603_c1_78e6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1603_c1_78e6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1603_c1_78e6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1603_c1_78e6_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1603_c2_87d7]
signal n8_MUX_uxn_opcodes_h_l1603_c2_87d7_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1603_c2_87d7_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1603_c2_87d7_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1603_c2_87d7_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1603_c2_87d7]
signal t8_MUX_uxn_opcodes_h_l1603_c2_87d7_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1603_c2_87d7_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1603_c2_87d7_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1603_c2_87d7_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1603_c2_87d7]
signal result_u8_value_MUX_uxn_opcodes_h_l1603_c2_87d7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1603_c2_87d7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1603_c2_87d7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1603_c2_87d7_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1603_c2_87d7]
signal result_u16_value_MUX_uxn_opcodes_h_l1603_c2_87d7_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1603_c2_87d7_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1603_c2_87d7_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1603_c2_87d7_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1603_c2_87d7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1603_c2_87d7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1603_c2_87d7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1603_c2_87d7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1603_c2_87d7_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1603_c2_87d7]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1603_c2_87d7_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1603_c2_87d7_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1603_c2_87d7_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1603_c2_87d7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1603_c2_87d7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1603_c2_87d7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1603_c2_87d7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1603_c2_87d7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1603_c2_87d7_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1603_c2_87d7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1603_c2_87d7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1603_c2_87d7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1603_c2_87d7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1603_c2_87d7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1603_c2_87d7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1603_c2_87d7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1603_c2_87d7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1603_c2_87d7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1603_c2_87d7_return_output : unsigned(3 downto 0);

-- printf_uxn_opcodes_h_l1604_c3_e616[uxn_opcodes_h_l1604_c3_e616]
signal printf_uxn_opcodes_h_l1604_c3_e616_uxn_opcodes_h_l1604_c3_e616_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1608_c11_71be]
signal BIN_OP_EQ_uxn_opcodes_h_l1608_c11_71be_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1608_c11_71be_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1608_c11_71be_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1608_c7_cbeb]
signal n8_MUX_uxn_opcodes_h_l1608_c7_cbeb_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1608_c7_cbeb_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1608_c7_cbeb_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1608_c7_cbeb_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1608_c7_cbeb]
signal t8_MUX_uxn_opcodes_h_l1608_c7_cbeb_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1608_c7_cbeb_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1608_c7_cbeb_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1608_c7_cbeb_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1608_c7_cbeb]
signal result_u8_value_MUX_uxn_opcodes_h_l1608_c7_cbeb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1608_c7_cbeb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1608_c7_cbeb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1608_c7_cbeb_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1608_c7_cbeb]
signal result_u16_value_MUX_uxn_opcodes_h_l1608_c7_cbeb_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1608_c7_cbeb_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1608_c7_cbeb_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1608_c7_cbeb_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1608_c7_cbeb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_cbeb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_cbeb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_cbeb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_cbeb_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1608_c7_cbeb]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1608_c7_cbeb_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1608_c7_cbeb_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1608_c7_cbeb_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1608_c7_cbeb_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1608_c7_cbeb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1608_c7_cbeb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1608_c7_cbeb_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1608_c7_cbeb_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1608_c7_cbeb_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1608_c7_cbeb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_cbeb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_cbeb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_cbeb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_cbeb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1608_c7_cbeb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_cbeb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_cbeb_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_cbeb_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_cbeb_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1611_c11_8428]
signal BIN_OP_EQ_uxn_opcodes_h_l1611_c11_8428_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1611_c11_8428_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1611_c11_8428_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1611_c7_9256]
signal n8_MUX_uxn_opcodes_h_l1611_c7_9256_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1611_c7_9256_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1611_c7_9256_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1611_c7_9256_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1611_c7_9256]
signal t8_MUX_uxn_opcodes_h_l1611_c7_9256_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1611_c7_9256_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1611_c7_9256_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1611_c7_9256_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1611_c7_9256]
signal result_u8_value_MUX_uxn_opcodes_h_l1611_c7_9256_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1611_c7_9256_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1611_c7_9256_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1611_c7_9256_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1611_c7_9256]
signal result_u16_value_MUX_uxn_opcodes_h_l1611_c7_9256_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1611_c7_9256_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1611_c7_9256_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1611_c7_9256_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1611_c7_9256]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1611_c7_9256_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1611_c7_9256_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1611_c7_9256_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1611_c7_9256_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1611_c7_9256]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1611_c7_9256_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1611_c7_9256_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1611_c7_9256_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1611_c7_9256_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1611_c7_9256]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1611_c7_9256_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1611_c7_9256_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1611_c7_9256_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1611_c7_9256_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1611_c7_9256]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1611_c7_9256_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1611_c7_9256_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1611_c7_9256_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1611_c7_9256_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1611_c7_9256]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1611_c7_9256_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1611_c7_9256_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1611_c7_9256_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1611_c7_9256_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1615_c11_0b69]
signal BIN_OP_EQ_uxn_opcodes_h_l1615_c11_0b69_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1615_c11_0b69_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1615_c11_0b69_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1615_c7_2751]
signal n8_MUX_uxn_opcodes_h_l1615_c7_2751_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1615_c7_2751_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1615_c7_2751_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1615_c7_2751_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1615_c7_2751]
signal result_u8_value_MUX_uxn_opcodes_h_l1615_c7_2751_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1615_c7_2751_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1615_c7_2751_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1615_c7_2751_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1615_c7_2751]
signal result_u16_value_MUX_uxn_opcodes_h_l1615_c7_2751_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1615_c7_2751_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1615_c7_2751_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1615_c7_2751_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1615_c7_2751]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1615_c7_2751_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1615_c7_2751_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1615_c7_2751_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1615_c7_2751_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1615_c7_2751]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1615_c7_2751_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1615_c7_2751_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1615_c7_2751_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1615_c7_2751_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1615_c7_2751]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c7_2751_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c7_2751_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c7_2751_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c7_2751_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1615_c7_2751]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c7_2751_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c7_2751_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c7_2751_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c7_2751_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1615_c7_2751]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c7_2751_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c7_2751_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c7_2751_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c7_2751_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1618_c11_fe70]
signal BIN_OP_EQ_uxn_opcodes_h_l1618_c11_fe70_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1618_c11_fe70_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1618_c11_fe70_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1618_c7_7df6]
signal n8_MUX_uxn_opcodes_h_l1618_c7_7df6_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1618_c7_7df6_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1618_c7_7df6_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1618_c7_7df6_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1618_c7_7df6]
signal result_u8_value_MUX_uxn_opcodes_h_l1618_c7_7df6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1618_c7_7df6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1618_c7_7df6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1618_c7_7df6_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1618_c7_7df6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_7df6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_7df6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_7df6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_7df6_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1618_c7_7df6]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_7df6_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_7df6_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_7df6_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_7df6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1618_c7_7df6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_7df6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_7df6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_7df6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_7df6_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1618_c7_7df6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_7df6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_7df6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_7df6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_7df6_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1618_c7_7df6]
signal result_u16_value_MUX_uxn_opcodes_h_l1618_c7_7df6_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1618_c7_7df6_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1618_c7_7df6_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1618_c7_7df6_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1621_c30_8d7c]
signal sp_relative_shift_uxn_opcodes_h_l1621_c30_8d7c_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1621_c30_8d7c_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1621_c30_8d7c_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1621_c30_8d7c_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1626_c11_6774]
signal BIN_OP_EQ_uxn_opcodes_h_l1626_c11_6774_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1626_c11_6774_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1626_c11_6774_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1626_c7_7092]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1626_c7_7092_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1626_c7_7092_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1626_c7_7092_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1626_c7_7092_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1626_c7_7092]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_7092_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_7092_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_7092_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_7092_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1626_c7_7092]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1626_c7_7092_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1626_c7_7092_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1626_c7_7092_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1626_c7_7092_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_643c( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.u16_value := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.is_ram_write := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_sp_shift := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1603_c6_1dae
BIN_OP_EQ_uxn_opcodes_h_l1603_c6_1dae : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1603_c6_1dae_left,
BIN_OP_EQ_uxn_opcodes_h_l1603_c6_1dae_right,
BIN_OP_EQ_uxn_opcodes_h_l1603_c6_1dae_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1603_c1_78e6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1603_c1_78e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1603_c1_78e6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1603_c1_78e6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1603_c1_78e6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1603_c1_78e6_return_output);

-- n8_MUX_uxn_opcodes_h_l1603_c2_87d7
n8_MUX_uxn_opcodes_h_l1603_c2_87d7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1603_c2_87d7_cond,
n8_MUX_uxn_opcodes_h_l1603_c2_87d7_iftrue,
n8_MUX_uxn_opcodes_h_l1603_c2_87d7_iffalse,
n8_MUX_uxn_opcodes_h_l1603_c2_87d7_return_output);

-- t8_MUX_uxn_opcodes_h_l1603_c2_87d7
t8_MUX_uxn_opcodes_h_l1603_c2_87d7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1603_c2_87d7_cond,
t8_MUX_uxn_opcodes_h_l1603_c2_87d7_iftrue,
t8_MUX_uxn_opcodes_h_l1603_c2_87d7_iffalse,
t8_MUX_uxn_opcodes_h_l1603_c2_87d7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1603_c2_87d7
result_u8_value_MUX_uxn_opcodes_h_l1603_c2_87d7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1603_c2_87d7_cond,
result_u8_value_MUX_uxn_opcodes_h_l1603_c2_87d7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1603_c2_87d7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1603_c2_87d7_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1603_c2_87d7
result_u16_value_MUX_uxn_opcodes_h_l1603_c2_87d7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1603_c2_87d7_cond,
result_u16_value_MUX_uxn_opcodes_h_l1603_c2_87d7_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1603_c2_87d7_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1603_c2_87d7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1603_c2_87d7
result_is_opc_done_MUX_uxn_opcodes_h_l1603_c2_87d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1603_c2_87d7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1603_c2_87d7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1603_c2_87d7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1603_c2_87d7_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1603_c2_87d7
result_is_ram_write_MUX_uxn_opcodes_h_l1603_c2_87d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1603_c2_87d7_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1603_c2_87d7_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1603_c2_87d7_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1603_c2_87d7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1603_c2_87d7
result_sp_relative_shift_MUX_uxn_opcodes_h_l1603_c2_87d7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1603_c2_87d7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1603_c2_87d7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1603_c2_87d7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1603_c2_87d7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1603_c2_87d7
result_is_sp_shift_MUX_uxn_opcodes_h_l1603_c2_87d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1603_c2_87d7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1603_c2_87d7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1603_c2_87d7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1603_c2_87d7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1603_c2_87d7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1603_c2_87d7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1603_c2_87d7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1603_c2_87d7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1603_c2_87d7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1603_c2_87d7_return_output);

-- printf_uxn_opcodes_h_l1604_c3_e616_uxn_opcodes_h_l1604_c3_e616
printf_uxn_opcodes_h_l1604_c3_e616_uxn_opcodes_h_l1604_c3_e616 : entity work.printf_uxn_opcodes_h_l1604_c3_e616_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1604_c3_e616_uxn_opcodes_h_l1604_c3_e616_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1608_c11_71be
BIN_OP_EQ_uxn_opcodes_h_l1608_c11_71be : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1608_c11_71be_left,
BIN_OP_EQ_uxn_opcodes_h_l1608_c11_71be_right,
BIN_OP_EQ_uxn_opcodes_h_l1608_c11_71be_return_output);

-- n8_MUX_uxn_opcodes_h_l1608_c7_cbeb
n8_MUX_uxn_opcodes_h_l1608_c7_cbeb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1608_c7_cbeb_cond,
n8_MUX_uxn_opcodes_h_l1608_c7_cbeb_iftrue,
n8_MUX_uxn_opcodes_h_l1608_c7_cbeb_iffalse,
n8_MUX_uxn_opcodes_h_l1608_c7_cbeb_return_output);

-- t8_MUX_uxn_opcodes_h_l1608_c7_cbeb
t8_MUX_uxn_opcodes_h_l1608_c7_cbeb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1608_c7_cbeb_cond,
t8_MUX_uxn_opcodes_h_l1608_c7_cbeb_iftrue,
t8_MUX_uxn_opcodes_h_l1608_c7_cbeb_iffalse,
t8_MUX_uxn_opcodes_h_l1608_c7_cbeb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1608_c7_cbeb
result_u8_value_MUX_uxn_opcodes_h_l1608_c7_cbeb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1608_c7_cbeb_cond,
result_u8_value_MUX_uxn_opcodes_h_l1608_c7_cbeb_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1608_c7_cbeb_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1608_c7_cbeb_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1608_c7_cbeb
result_u16_value_MUX_uxn_opcodes_h_l1608_c7_cbeb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1608_c7_cbeb_cond,
result_u16_value_MUX_uxn_opcodes_h_l1608_c7_cbeb_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1608_c7_cbeb_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1608_c7_cbeb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_cbeb
result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_cbeb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_cbeb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_cbeb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_cbeb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_cbeb_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1608_c7_cbeb
result_is_ram_write_MUX_uxn_opcodes_h_l1608_c7_cbeb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1608_c7_cbeb_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1608_c7_cbeb_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1608_c7_cbeb_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1608_c7_cbeb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1608_c7_cbeb
result_sp_relative_shift_MUX_uxn_opcodes_h_l1608_c7_cbeb : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1608_c7_cbeb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1608_c7_cbeb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1608_c7_cbeb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1608_c7_cbeb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_cbeb
result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_cbeb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_cbeb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_cbeb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_cbeb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_cbeb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_cbeb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_cbeb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_cbeb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_cbeb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_cbeb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_cbeb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1611_c11_8428
BIN_OP_EQ_uxn_opcodes_h_l1611_c11_8428 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1611_c11_8428_left,
BIN_OP_EQ_uxn_opcodes_h_l1611_c11_8428_right,
BIN_OP_EQ_uxn_opcodes_h_l1611_c11_8428_return_output);

-- n8_MUX_uxn_opcodes_h_l1611_c7_9256
n8_MUX_uxn_opcodes_h_l1611_c7_9256 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1611_c7_9256_cond,
n8_MUX_uxn_opcodes_h_l1611_c7_9256_iftrue,
n8_MUX_uxn_opcodes_h_l1611_c7_9256_iffalse,
n8_MUX_uxn_opcodes_h_l1611_c7_9256_return_output);

-- t8_MUX_uxn_opcodes_h_l1611_c7_9256
t8_MUX_uxn_opcodes_h_l1611_c7_9256 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1611_c7_9256_cond,
t8_MUX_uxn_opcodes_h_l1611_c7_9256_iftrue,
t8_MUX_uxn_opcodes_h_l1611_c7_9256_iffalse,
t8_MUX_uxn_opcodes_h_l1611_c7_9256_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1611_c7_9256
result_u8_value_MUX_uxn_opcodes_h_l1611_c7_9256 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1611_c7_9256_cond,
result_u8_value_MUX_uxn_opcodes_h_l1611_c7_9256_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1611_c7_9256_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1611_c7_9256_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1611_c7_9256
result_u16_value_MUX_uxn_opcodes_h_l1611_c7_9256 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1611_c7_9256_cond,
result_u16_value_MUX_uxn_opcodes_h_l1611_c7_9256_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1611_c7_9256_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1611_c7_9256_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1611_c7_9256
result_is_opc_done_MUX_uxn_opcodes_h_l1611_c7_9256 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1611_c7_9256_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1611_c7_9256_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1611_c7_9256_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1611_c7_9256_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1611_c7_9256
result_is_ram_write_MUX_uxn_opcodes_h_l1611_c7_9256 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1611_c7_9256_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1611_c7_9256_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1611_c7_9256_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1611_c7_9256_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1611_c7_9256
result_sp_relative_shift_MUX_uxn_opcodes_h_l1611_c7_9256 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1611_c7_9256_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1611_c7_9256_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1611_c7_9256_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1611_c7_9256_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1611_c7_9256
result_is_sp_shift_MUX_uxn_opcodes_h_l1611_c7_9256 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1611_c7_9256_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1611_c7_9256_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1611_c7_9256_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1611_c7_9256_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1611_c7_9256
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1611_c7_9256 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1611_c7_9256_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1611_c7_9256_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1611_c7_9256_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1611_c7_9256_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1615_c11_0b69
BIN_OP_EQ_uxn_opcodes_h_l1615_c11_0b69 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1615_c11_0b69_left,
BIN_OP_EQ_uxn_opcodes_h_l1615_c11_0b69_right,
BIN_OP_EQ_uxn_opcodes_h_l1615_c11_0b69_return_output);

-- n8_MUX_uxn_opcodes_h_l1615_c7_2751
n8_MUX_uxn_opcodes_h_l1615_c7_2751 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1615_c7_2751_cond,
n8_MUX_uxn_opcodes_h_l1615_c7_2751_iftrue,
n8_MUX_uxn_opcodes_h_l1615_c7_2751_iffalse,
n8_MUX_uxn_opcodes_h_l1615_c7_2751_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1615_c7_2751
result_u8_value_MUX_uxn_opcodes_h_l1615_c7_2751 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1615_c7_2751_cond,
result_u8_value_MUX_uxn_opcodes_h_l1615_c7_2751_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1615_c7_2751_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1615_c7_2751_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1615_c7_2751
result_u16_value_MUX_uxn_opcodes_h_l1615_c7_2751 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1615_c7_2751_cond,
result_u16_value_MUX_uxn_opcodes_h_l1615_c7_2751_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1615_c7_2751_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1615_c7_2751_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1615_c7_2751
result_is_opc_done_MUX_uxn_opcodes_h_l1615_c7_2751 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1615_c7_2751_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1615_c7_2751_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1615_c7_2751_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1615_c7_2751_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1615_c7_2751
result_is_ram_write_MUX_uxn_opcodes_h_l1615_c7_2751 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1615_c7_2751_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1615_c7_2751_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1615_c7_2751_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1615_c7_2751_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c7_2751
result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c7_2751 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c7_2751_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c7_2751_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c7_2751_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c7_2751_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c7_2751
result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c7_2751 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c7_2751_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c7_2751_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c7_2751_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c7_2751_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c7_2751
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c7_2751 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c7_2751_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c7_2751_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c7_2751_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c7_2751_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1618_c11_fe70
BIN_OP_EQ_uxn_opcodes_h_l1618_c11_fe70 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1618_c11_fe70_left,
BIN_OP_EQ_uxn_opcodes_h_l1618_c11_fe70_right,
BIN_OP_EQ_uxn_opcodes_h_l1618_c11_fe70_return_output);

-- n8_MUX_uxn_opcodes_h_l1618_c7_7df6
n8_MUX_uxn_opcodes_h_l1618_c7_7df6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1618_c7_7df6_cond,
n8_MUX_uxn_opcodes_h_l1618_c7_7df6_iftrue,
n8_MUX_uxn_opcodes_h_l1618_c7_7df6_iffalse,
n8_MUX_uxn_opcodes_h_l1618_c7_7df6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1618_c7_7df6
result_u8_value_MUX_uxn_opcodes_h_l1618_c7_7df6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1618_c7_7df6_cond,
result_u8_value_MUX_uxn_opcodes_h_l1618_c7_7df6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1618_c7_7df6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1618_c7_7df6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_7df6
result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_7df6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_7df6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_7df6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_7df6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_7df6_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_7df6
result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_7df6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_7df6_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_7df6_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_7df6_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_7df6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_7df6
result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_7df6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_7df6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_7df6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_7df6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_7df6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_7df6
result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_7df6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_7df6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_7df6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_7df6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_7df6_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1618_c7_7df6
result_u16_value_MUX_uxn_opcodes_h_l1618_c7_7df6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1618_c7_7df6_cond,
result_u16_value_MUX_uxn_opcodes_h_l1618_c7_7df6_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1618_c7_7df6_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1618_c7_7df6_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1621_c30_8d7c
sp_relative_shift_uxn_opcodes_h_l1621_c30_8d7c : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1621_c30_8d7c_ins,
sp_relative_shift_uxn_opcodes_h_l1621_c30_8d7c_x,
sp_relative_shift_uxn_opcodes_h_l1621_c30_8d7c_y,
sp_relative_shift_uxn_opcodes_h_l1621_c30_8d7c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1626_c11_6774
BIN_OP_EQ_uxn_opcodes_h_l1626_c11_6774 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1626_c11_6774_left,
BIN_OP_EQ_uxn_opcodes_h_l1626_c11_6774_right,
BIN_OP_EQ_uxn_opcodes_h_l1626_c11_6774_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1626_c7_7092
result_is_sp_shift_MUX_uxn_opcodes_h_l1626_c7_7092 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1626_c7_7092_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1626_c7_7092_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1626_c7_7092_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1626_c7_7092_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_7092
result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_7092 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_7092_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_7092_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_7092_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_7092_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1626_c7_7092
result_is_ram_write_MUX_uxn_opcodes_h_l1626_c7_7092 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1626_c7_7092_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1626_c7_7092_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1626_c7_7092_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1626_c7_7092_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1603_c6_1dae_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1603_c1_78e6_return_output,
 n8_MUX_uxn_opcodes_h_l1603_c2_87d7_return_output,
 t8_MUX_uxn_opcodes_h_l1603_c2_87d7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1603_c2_87d7_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1603_c2_87d7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1603_c2_87d7_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1603_c2_87d7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1603_c2_87d7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1603_c2_87d7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1603_c2_87d7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1608_c11_71be_return_output,
 n8_MUX_uxn_opcodes_h_l1608_c7_cbeb_return_output,
 t8_MUX_uxn_opcodes_h_l1608_c7_cbeb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1608_c7_cbeb_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1608_c7_cbeb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_cbeb_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1608_c7_cbeb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1608_c7_cbeb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_cbeb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_cbeb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1611_c11_8428_return_output,
 n8_MUX_uxn_opcodes_h_l1611_c7_9256_return_output,
 t8_MUX_uxn_opcodes_h_l1611_c7_9256_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1611_c7_9256_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1611_c7_9256_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1611_c7_9256_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1611_c7_9256_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1611_c7_9256_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1611_c7_9256_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1611_c7_9256_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1615_c11_0b69_return_output,
 n8_MUX_uxn_opcodes_h_l1615_c7_2751_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1615_c7_2751_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1615_c7_2751_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1615_c7_2751_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1615_c7_2751_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c7_2751_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c7_2751_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c7_2751_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1618_c11_fe70_return_output,
 n8_MUX_uxn_opcodes_h_l1618_c7_7df6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1618_c7_7df6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_7df6_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_7df6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_7df6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_7df6_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1618_c7_7df6_return_output,
 sp_relative_shift_uxn_opcodes_h_l1621_c30_8d7c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1626_c11_6774_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1626_c7_7092_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_7092_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1626_c7_7092_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1603_c6_1dae_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1603_c6_1dae_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1603_c6_1dae_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1603_c1_78e6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1603_c1_78e6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1603_c1_78e6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1603_c1_78e6_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1603_c2_87d7_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1603_c2_87d7_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1608_c7_cbeb_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1603_c2_87d7_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1603_c2_87d7_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1603_c2_87d7_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1603_c2_87d7_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1608_c7_cbeb_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1603_c2_87d7_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1603_c2_87d7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1603_c2_87d7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1603_c2_87d7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1608_c7_cbeb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1603_c2_87d7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1603_c2_87d7_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1603_c2_87d7_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1603_c2_87d7_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1608_c7_cbeb_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1603_c2_87d7_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1603_c2_87d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1603_c2_87d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1603_c2_87d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_cbeb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1603_c2_87d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1603_c2_87d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1603_c2_87d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1603_c2_87d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1608_c7_cbeb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1603_c2_87d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1603_c2_87d7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1603_c2_87d7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1603_c2_87d7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1608_c7_cbeb_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1603_c2_87d7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1603_c2_87d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1603_c2_87d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1603_c2_87d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_cbeb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1603_c2_87d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1603_c2_87d7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1603_c2_87d7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1605_c3_40f4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1603_c2_87d7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_cbeb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1603_c2_87d7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1603_c2_87d7_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1604_c3_e616_uxn_opcodes_h_l1604_c3_e616_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c11_71be_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c11_71be_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c11_71be_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1608_c7_cbeb_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1608_c7_cbeb_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1611_c7_9256_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1608_c7_cbeb_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1608_c7_cbeb_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1608_c7_cbeb_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1611_c7_9256_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1608_c7_cbeb_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1608_c7_cbeb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1608_c7_cbeb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1611_c7_9256_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1608_c7_cbeb_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1608_c7_cbeb_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1608_c7_cbeb_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1611_c7_9256_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1608_c7_cbeb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_cbeb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_cbeb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1611_c7_9256_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_cbeb_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1608_c7_cbeb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1608_c7_cbeb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1611_c7_9256_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1608_c7_cbeb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1608_c7_cbeb_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1608_c7_cbeb_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1611_c7_9256_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1608_c7_cbeb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_cbeb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_cbeb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1611_c7_9256_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_cbeb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_cbeb_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1609_c3_4b5f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_cbeb_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1611_c7_9256_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_cbeb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1611_c11_8428_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1611_c11_8428_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1611_c11_8428_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1611_c7_9256_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1611_c7_9256_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1615_c7_2751_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1611_c7_9256_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1611_c7_9256_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1611_c7_9256_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1611_c7_9256_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1611_c7_9256_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1611_c7_9256_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1615_c7_2751_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1611_c7_9256_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1611_c7_9256_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1611_c7_9256_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1615_c7_2751_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1611_c7_9256_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1611_c7_9256_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1611_c7_9256_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1615_c7_2751_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1611_c7_9256_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1611_c7_9256_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1611_c7_9256_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1615_c7_2751_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1611_c7_9256_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1611_c7_9256_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1611_c7_9256_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c7_2751_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1611_c7_9256_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1611_c7_9256_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1611_c7_9256_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c7_2751_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1611_c7_9256_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1611_c7_9256_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1613_c3_c9df : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1611_c7_9256_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c7_2751_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1611_c7_9256_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c11_0b69_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c11_0b69_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c11_0b69_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1615_c7_2751_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1615_c7_2751_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1618_c7_7df6_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1615_c7_2751_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1615_c7_2751_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1615_c7_2751_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1618_c7_7df6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1615_c7_2751_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1615_c7_2751_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1615_c7_2751_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1618_c7_7df6_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1615_c7_2751_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1615_c7_2751_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1615_c7_2751_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_7df6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1615_c7_2751_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1615_c7_2751_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1615_c7_2751_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_7df6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1615_c7_2751_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c7_2751_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c7_2751_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_7df6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c7_2751_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c7_2751_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c7_2751_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_7df6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c7_2751_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c7_2751_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1616_c3_9493 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c7_2751_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1615_c7_2751_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c7_2751_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_fe70_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_fe70_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_fe70_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1618_c7_7df6_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1618_c7_7df6_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1618_c7_7df6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1618_c7_7df6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1618_c7_7df6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1618_c7_7df6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_7df6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_7df6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_7092_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_7df6_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_7df6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_7df6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1626_c7_7092_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_7df6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_7df6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_7df6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_7df6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_7df6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_7df6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1626_c7_7092_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_7df6_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1618_c7_7df6_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1618_c7_7df6_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1618_c7_7df6_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1621_c30_8d7c_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1621_c30_8d7c_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1621_c30_8d7c_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1621_c30_8d7c_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1623_c22_13e7_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_6774_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_6774_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_6774_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1626_c7_7092_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1626_c7_7092_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1626_c7_7092_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_7092_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_7092_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_7092_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1626_c7_7092_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1626_c7_7092_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1626_c7_7092_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1615_l1611_l1608_l1603_l1618_DUPLICATE_baa4_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1615_l1611_l1608_l1603_l1618_DUPLICATE_c255_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1615_l1611_l1608_l1603_l1626_DUPLICATE_083a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1615_l1611_l1608_l1603_l1618_DUPLICATE_8c5c_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1615_l1611_l1608_l1603_l1626_DUPLICATE_6b07_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1615_l1611_l1608_l1626_l1618_DUPLICATE_006e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_643c_uxn_opcodes_h_l1599_l1632_DUPLICATE_5ac4_return_output : opcode_result_t;
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
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1626_c7_7092_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1611_c11_8428_right := to_unsigned(2, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1603_c1_78e6_iffalse := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_7df6_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c11_0b69_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1616_c3_9493 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c7_2751_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1616_c3_9493;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1626_c7_7092_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_fe70_right := to_unsigned(4, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l1621_c30_8d7c_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c11_71be_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_6774_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1603_c2_87d7_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1609_c3_4b5f := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_cbeb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1609_c3_4b5f;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1605_c3_40f4 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1603_c2_87d7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1605_c3_40f4;
     VAR_sp_relative_shift_uxn_opcodes_h_l1621_c30_8d7c_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_7092_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1603_c6_1dae_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1613_c3_c9df := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1611_c7_9256_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1613_c3_c9df;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_7df6_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1603_c1_78e6_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1621_c30_8d7c_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l1603_c2_87d7_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1608_c7_cbeb_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1611_c7_9256_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1615_c7_2751_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1618_c7_7df6_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1603_c6_1dae_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c11_71be_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1611_c11_8428_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c11_0b69_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_fe70_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_6774_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1618_c7_7df6_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1618_c7_7df6_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1611_c7_9256_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1603_c2_87d7_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1608_c7_cbeb_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1611_c7_9256_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1618_c11_fe70] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1618_c11_fe70_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_fe70_left;
     BIN_OP_EQ_uxn_opcodes_h_l1618_c11_fe70_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_fe70_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_fe70_return_output := BIN_OP_EQ_uxn_opcodes_h_l1618_c11_fe70_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1615_l1611_l1608_l1603_l1626_DUPLICATE_083a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1615_l1611_l1608_l1603_l1626_DUPLICATE_083a_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1615_l1611_l1608_l1603_l1618_DUPLICATE_baa4 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1615_l1611_l1608_l1603_l1618_DUPLICATE_baa4_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1611_c11_8428] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1611_c11_8428_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1611_c11_8428_left;
     BIN_OP_EQ_uxn_opcodes_h_l1611_c11_8428_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1611_c11_8428_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1611_c11_8428_return_output := BIN_OP_EQ_uxn_opcodes_h_l1611_c11_8428_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1623_c22_13e7] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1623_c22_13e7_return_output := CAST_TO_uint16_t_uint8_t(
     t8);

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1615_c7_2751] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1615_c7_2751_return_output := result.stack_address_sp_offset;

     -- sp_relative_shift[uxn_opcodes_h_l1621_c30_8d7c] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1621_c30_8d7c_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1621_c30_8d7c_ins;
     sp_relative_shift_uxn_opcodes_h_l1621_c30_8d7c_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1621_c30_8d7c_x;
     sp_relative_shift_uxn_opcodes_h_l1621_c30_8d7c_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1621_c30_8d7c_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1621_c30_8d7c_return_output := sp_relative_shift_uxn_opcodes_h_l1621_c30_8d7c_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1615_l1611_l1608_l1603_l1618_DUPLICATE_c255 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1615_l1611_l1608_l1603_l1618_DUPLICATE_c255_return_output := result.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1615_l1611_l1608_l1603_l1626_DUPLICATE_6b07 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1615_l1611_l1608_l1603_l1626_DUPLICATE_6b07_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1615_l1611_l1608_l1626_l1618_DUPLICATE_006e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1615_l1611_l1608_l1626_l1618_DUPLICATE_006e_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1608_c11_71be] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1608_c11_71be_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c11_71be_left;
     BIN_OP_EQ_uxn_opcodes_h_l1608_c11_71be_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c11_71be_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c11_71be_return_output := BIN_OP_EQ_uxn_opcodes_h_l1608_c11_71be_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1615_l1611_l1608_l1603_l1618_DUPLICATE_8c5c LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1615_l1611_l1608_l1603_l1618_DUPLICATE_8c5c_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1615_c11_0b69] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1615_c11_0b69_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c11_0b69_left;
     BIN_OP_EQ_uxn_opcodes_h_l1615_c11_0b69_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c11_0b69_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c11_0b69_return_output := BIN_OP_EQ_uxn_opcodes_h_l1615_c11_0b69_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1626_c11_6774] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1626_c11_6774_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_6774_left;
     BIN_OP_EQ_uxn_opcodes_h_l1626_c11_6774_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_6774_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_6774_return_output := BIN_OP_EQ_uxn_opcodes_h_l1626_c11_6774_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1603_c6_1dae] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1603_c6_1dae_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1603_c6_1dae_left;
     BIN_OP_EQ_uxn_opcodes_h_l1603_c6_1dae_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1603_c6_1dae_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1603_c6_1dae_return_output := BIN_OP_EQ_uxn_opcodes_h_l1603_c6_1dae_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1603_c1_78e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1603_c6_1dae_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1603_c2_87d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1603_c6_1dae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1603_c2_87d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1603_c6_1dae_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1603_c2_87d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1603_c6_1dae_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1603_c2_87d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1603_c6_1dae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1603_c2_87d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1603_c6_1dae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1603_c2_87d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1603_c6_1dae_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1603_c2_87d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1603_c6_1dae_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1603_c2_87d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1603_c6_1dae_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1603_c2_87d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1603_c6_1dae_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1608_c7_cbeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c11_71be_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_cbeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c11_71be_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1608_c7_cbeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c11_71be_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_cbeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c11_71be_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1608_c7_cbeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c11_71be_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_cbeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c11_71be_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1608_c7_cbeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c11_71be_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1608_c7_cbeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c11_71be_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1608_c7_cbeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c11_71be_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1611_c7_9256_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1611_c11_8428_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1611_c7_9256_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1611_c11_8428_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1611_c7_9256_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1611_c11_8428_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1611_c7_9256_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1611_c11_8428_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1611_c7_9256_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1611_c11_8428_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1611_c7_9256_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1611_c11_8428_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1611_c7_9256_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1611_c11_8428_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1611_c7_9256_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1611_c11_8428_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1611_c7_9256_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1611_c11_8428_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1615_c7_2751_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c11_0b69_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1615_c7_2751_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c11_0b69_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1615_c7_2751_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c11_0b69_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c7_2751_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c11_0b69_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c7_2751_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c11_0b69_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c7_2751_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c11_0b69_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1615_c7_2751_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c11_0b69_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1615_c7_2751_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c11_0b69_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1618_c7_7df6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_fe70_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_7df6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_fe70_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_7df6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_fe70_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_7df6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_fe70_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_7df6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_fe70_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1618_c7_7df6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_fe70_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1618_c7_7df6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_fe70_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_7092_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_6774_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1626_c7_7092_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_6774_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1626_c7_7092_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_6774_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1618_c7_7df6_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1623_c22_13e7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1603_c2_87d7_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1615_l1611_l1608_l1603_l1618_DUPLICATE_8c5c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1608_c7_cbeb_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1615_l1611_l1608_l1603_l1618_DUPLICATE_8c5c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1611_c7_9256_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1615_l1611_l1608_l1603_l1618_DUPLICATE_8c5c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c7_2751_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1615_l1611_l1608_l1603_l1618_DUPLICATE_8c5c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_7df6_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1615_l1611_l1608_l1603_l1618_DUPLICATE_8c5c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1603_c2_87d7_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1615_l1611_l1608_l1603_l1618_DUPLICATE_c255_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1608_c7_cbeb_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1615_l1611_l1608_l1603_l1618_DUPLICATE_c255_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1611_c7_9256_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1615_l1611_l1608_l1603_l1618_DUPLICATE_c255_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1615_c7_2751_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1615_l1611_l1608_l1603_l1618_DUPLICATE_c255_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1618_c7_7df6_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1615_l1611_l1608_l1603_l1618_DUPLICATE_c255_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_cbeb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1615_l1611_l1608_l1626_l1618_DUPLICATE_006e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1611_c7_9256_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1615_l1611_l1608_l1626_l1618_DUPLICATE_006e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1615_c7_2751_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1615_l1611_l1608_l1626_l1618_DUPLICATE_006e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_7df6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1615_l1611_l1608_l1626_l1618_DUPLICATE_006e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_7092_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1615_l1611_l1608_l1626_l1618_DUPLICATE_006e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1603_c2_87d7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1615_l1611_l1608_l1603_l1626_DUPLICATE_083a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1608_c7_cbeb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1615_l1611_l1608_l1603_l1626_DUPLICATE_083a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1611_c7_9256_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1615_l1611_l1608_l1603_l1626_DUPLICATE_083a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1615_c7_2751_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1615_l1611_l1608_l1603_l1626_DUPLICATE_083a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1626_c7_7092_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1615_l1611_l1608_l1603_l1626_DUPLICATE_083a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1603_c2_87d7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1615_l1611_l1608_l1603_l1626_DUPLICATE_6b07_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_cbeb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1615_l1611_l1608_l1603_l1626_DUPLICATE_6b07_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1611_c7_9256_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1615_l1611_l1608_l1603_l1626_DUPLICATE_6b07_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c7_2751_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1615_l1611_l1608_l1603_l1626_DUPLICATE_6b07_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1626_c7_7092_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1615_l1611_l1608_l1603_l1626_DUPLICATE_6b07_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1603_c2_87d7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1615_l1611_l1608_l1603_l1618_DUPLICATE_baa4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1608_c7_cbeb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1615_l1611_l1608_l1603_l1618_DUPLICATE_baa4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1611_c7_9256_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1615_l1611_l1608_l1603_l1618_DUPLICATE_baa4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1615_c7_2751_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1615_l1611_l1608_l1603_l1618_DUPLICATE_baa4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1618_c7_7df6_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1615_l1611_l1608_l1603_l1618_DUPLICATE_baa4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c7_2751_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1615_c7_2751_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_7df6_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1621_c30_8d7c_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1626_c7_7092] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1626_c7_7092_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1626_c7_7092_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1626_c7_7092_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1626_c7_7092_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1626_c7_7092_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1626_c7_7092_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1626_c7_7092_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1626_c7_7092_return_output;

     -- t8_MUX[uxn_opcodes_h_l1611_c7_9256] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1611_c7_9256_cond <= VAR_t8_MUX_uxn_opcodes_h_l1611_c7_9256_cond;
     t8_MUX_uxn_opcodes_h_l1611_c7_9256_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1611_c7_9256_iftrue;
     t8_MUX_uxn_opcodes_h_l1611_c7_9256_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1611_c7_9256_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1611_c7_9256_return_output := t8_MUX_uxn_opcodes_h_l1611_c7_9256_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1618_c7_7df6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_7df6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_7df6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_7df6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_7df6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_7df6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_7df6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_7df6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_7df6_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1618_c7_7df6] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1618_c7_7df6_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1618_c7_7df6_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1618_c7_7df6_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1618_c7_7df6_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1618_c7_7df6_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1618_c7_7df6_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1618_c7_7df6_return_output := result_u16_value_MUX_uxn_opcodes_h_l1618_c7_7df6_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1626_c7_7092] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1626_c7_7092_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1626_c7_7092_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1626_c7_7092_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1626_c7_7092_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1626_c7_7092_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1626_c7_7092_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1626_c7_7092_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1626_c7_7092_return_output;

     -- n8_MUX[uxn_opcodes_h_l1618_c7_7df6] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1618_c7_7df6_cond <= VAR_n8_MUX_uxn_opcodes_h_l1618_c7_7df6_cond;
     n8_MUX_uxn_opcodes_h_l1618_c7_7df6_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1618_c7_7df6_iftrue;
     n8_MUX_uxn_opcodes_h_l1618_c7_7df6_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1618_c7_7df6_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1618_c7_7df6_return_output := n8_MUX_uxn_opcodes_h_l1618_c7_7df6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1618_c7_7df6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1618_c7_7df6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1618_c7_7df6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1618_c7_7df6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1618_c7_7df6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1618_c7_7df6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1618_c7_7df6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1618_c7_7df6_return_output := result_u8_value_MUX_uxn_opcodes_h_l1618_c7_7df6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1626_c7_7092] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_7092_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_7092_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_7092_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_7092_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_7092_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_7092_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_7092_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_7092_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1603_c1_78e6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1603_c1_78e6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1603_c1_78e6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1603_c1_78e6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1603_c1_78e6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1603_c1_78e6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1603_c1_78e6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1603_c1_78e6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1603_c1_78e6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1615_c7_2751] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c7_2751_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c7_2751_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c7_2751_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c7_2751_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c7_2751_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c7_2751_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c7_2751_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c7_2751_return_output;

     -- Submodule level 2
     VAR_printf_uxn_opcodes_h_l1604_c3_e616_uxn_opcodes_h_l1604_c3_e616_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1603_c1_78e6_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1615_c7_2751_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1618_c7_7df6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_7df6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_7092_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_7df6_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1626_c7_7092_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_7df6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1626_c7_7092_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c7_2751_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_7df6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1611_c7_9256_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c7_2751_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1615_c7_2751_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1618_c7_7df6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1615_c7_2751_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1618_c7_7df6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1608_c7_cbeb_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1611_c7_9256_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1615_c7_2751] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1615_c7_2751_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1615_c7_2751_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1615_c7_2751_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1615_c7_2751_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1615_c7_2751_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1615_c7_2751_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1615_c7_2751_return_output := result_u16_value_MUX_uxn_opcodes_h_l1615_c7_2751_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1618_c7_7df6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_7df6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_7df6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_7df6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_7df6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_7df6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_7df6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_7df6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_7df6_return_output;

     -- t8_MUX[uxn_opcodes_h_l1608_c7_cbeb] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1608_c7_cbeb_cond <= VAR_t8_MUX_uxn_opcodes_h_l1608_c7_cbeb_cond;
     t8_MUX_uxn_opcodes_h_l1608_c7_cbeb_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1608_c7_cbeb_iftrue;
     t8_MUX_uxn_opcodes_h_l1608_c7_cbeb_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1608_c7_cbeb_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1608_c7_cbeb_return_output := t8_MUX_uxn_opcodes_h_l1608_c7_cbeb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1618_c7_7df6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_7df6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_7df6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_7df6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_7df6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_7df6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_7df6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_7df6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_7df6_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1618_c7_7df6] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_7df6_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_7df6_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_7df6_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_7df6_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_7df6_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_7df6_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_7df6_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_7df6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1615_c7_2751] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1615_c7_2751_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1615_c7_2751_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1615_c7_2751_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1615_c7_2751_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1615_c7_2751_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1615_c7_2751_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1615_c7_2751_return_output := result_u8_value_MUX_uxn_opcodes_h_l1615_c7_2751_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1611_c7_9256] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1611_c7_9256_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1611_c7_9256_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1611_c7_9256_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1611_c7_9256_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1611_c7_9256_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1611_c7_9256_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1611_c7_9256_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1611_c7_9256_return_output;

     -- n8_MUX[uxn_opcodes_h_l1615_c7_2751] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1615_c7_2751_cond <= VAR_n8_MUX_uxn_opcodes_h_l1615_c7_2751_cond;
     n8_MUX_uxn_opcodes_h_l1615_c7_2751_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1615_c7_2751_iftrue;
     n8_MUX_uxn_opcodes_h_l1615_c7_2751_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1615_c7_2751_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1615_c7_2751_return_output := n8_MUX_uxn_opcodes_h_l1615_c7_2751_return_output;

     -- printf_uxn_opcodes_h_l1604_c3_e616[uxn_opcodes_h_l1604_c3_e616] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1604_c3_e616_uxn_opcodes_h_l1604_c3_e616_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1604_c3_e616_uxn_opcodes_h_l1604_c3_e616_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1615_c7_2751] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c7_2751_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c7_2751_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c7_2751_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c7_2751_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c7_2751_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c7_2751_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c7_2751_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c7_2751_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l1611_c7_9256_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1615_c7_2751_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1615_c7_2751_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_7df6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1615_c7_2751_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_7df6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c7_2751_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_7df6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1611_c7_9256_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c7_2751_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_cbeb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1611_c7_9256_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1611_c7_9256_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1615_c7_2751_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1611_c7_9256_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1615_c7_2751_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1603_c2_87d7_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1608_c7_cbeb_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1611_c7_9256] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1611_c7_9256_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1611_c7_9256_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1611_c7_9256_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1611_c7_9256_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1611_c7_9256_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1611_c7_9256_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1611_c7_9256_return_output := result_u16_value_MUX_uxn_opcodes_h_l1611_c7_9256_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1608_c7_cbeb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_cbeb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_cbeb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_cbeb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_cbeb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_cbeb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_cbeb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_cbeb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_cbeb_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1615_c7_2751] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1615_c7_2751_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1615_c7_2751_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1615_c7_2751_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1615_c7_2751_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1615_c7_2751_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1615_c7_2751_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1615_c7_2751_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1615_c7_2751_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1615_c7_2751] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c7_2751_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c7_2751_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c7_2751_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c7_2751_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c7_2751_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c7_2751_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c7_2751_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c7_2751_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1615_c7_2751] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1615_c7_2751_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1615_c7_2751_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1615_c7_2751_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1615_c7_2751_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1615_c7_2751_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1615_c7_2751_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1615_c7_2751_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1615_c7_2751_return_output;

     -- t8_MUX[uxn_opcodes_h_l1603_c2_87d7] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1603_c2_87d7_cond <= VAR_t8_MUX_uxn_opcodes_h_l1603_c2_87d7_cond;
     t8_MUX_uxn_opcodes_h_l1603_c2_87d7_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1603_c2_87d7_iftrue;
     t8_MUX_uxn_opcodes_h_l1603_c2_87d7_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1603_c2_87d7_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1603_c2_87d7_return_output := t8_MUX_uxn_opcodes_h_l1603_c2_87d7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1611_c7_9256] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1611_c7_9256_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1611_c7_9256_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1611_c7_9256_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1611_c7_9256_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1611_c7_9256_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1611_c7_9256_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1611_c7_9256_return_output := result_u8_value_MUX_uxn_opcodes_h_l1611_c7_9256_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1611_c7_9256] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1611_c7_9256_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1611_c7_9256_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1611_c7_9256_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1611_c7_9256_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1611_c7_9256_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1611_c7_9256_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1611_c7_9256_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1611_c7_9256_return_output;

     -- n8_MUX[uxn_opcodes_h_l1611_c7_9256] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1611_c7_9256_cond <= VAR_n8_MUX_uxn_opcodes_h_l1611_c7_9256_cond;
     n8_MUX_uxn_opcodes_h_l1611_c7_9256_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1611_c7_9256_iftrue;
     n8_MUX_uxn_opcodes_h_l1611_c7_9256_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1611_c7_9256_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1611_c7_9256_return_output := n8_MUX_uxn_opcodes_h_l1611_c7_9256_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1608_c7_cbeb_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1611_c7_9256_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1611_c7_9256_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1615_c7_2751_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1611_c7_9256_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1615_c7_2751_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1611_c7_9256_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c7_2751_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1608_c7_cbeb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1611_c7_9256_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1603_c2_87d7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_cbeb_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1608_c7_cbeb_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1611_c7_9256_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1608_c7_cbeb_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1611_c7_9256_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1603_c2_87d7_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1611_c7_9256] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1611_c7_9256_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1611_c7_9256_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1611_c7_9256_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1611_c7_9256_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1611_c7_9256_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1611_c7_9256_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1611_c7_9256_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1611_c7_9256_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1608_c7_cbeb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1608_c7_cbeb_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1608_c7_cbeb_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1608_c7_cbeb_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1608_c7_cbeb_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1608_c7_cbeb_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1608_c7_cbeb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1608_c7_cbeb_return_output := result_u8_value_MUX_uxn_opcodes_h_l1608_c7_cbeb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1611_c7_9256] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1611_c7_9256_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1611_c7_9256_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1611_c7_9256_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1611_c7_9256_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1611_c7_9256_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1611_c7_9256_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1611_c7_9256_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1611_c7_9256_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1611_c7_9256] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1611_c7_9256_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1611_c7_9256_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1611_c7_9256_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1611_c7_9256_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1611_c7_9256_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1611_c7_9256_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1611_c7_9256_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1611_c7_9256_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1608_c7_cbeb] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1608_c7_cbeb_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1608_c7_cbeb_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1608_c7_cbeb_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1608_c7_cbeb_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1608_c7_cbeb_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1608_c7_cbeb_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1608_c7_cbeb_return_output := result_u16_value_MUX_uxn_opcodes_h_l1608_c7_cbeb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1603_c2_87d7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1603_c2_87d7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1603_c2_87d7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1603_c2_87d7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1603_c2_87d7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1603_c2_87d7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1603_c2_87d7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1603_c2_87d7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1603_c2_87d7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1608_c7_cbeb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1608_c7_cbeb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1608_c7_cbeb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1608_c7_cbeb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1608_c7_cbeb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1608_c7_cbeb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1608_c7_cbeb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1608_c7_cbeb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1608_c7_cbeb_return_output;

     -- n8_MUX[uxn_opcodes_h_l1608_c7_cbeb] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1608_c7_cbeb_cond <= VAR_n8_MUX_uxn_opcodes_h_l1608_c7_cbeb_cond;
     n8_MUX_uxn_opcodes_h_l1608_c7_cbeb_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1608_c7_cbeb_iftrue;
     n8_MUX_uxn_opcodes_h_l1608_c7_cbeb_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1608_c7_cbeb_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1608_c7_cbeb_return_output := n8_MUX_uxn_opcodes_h_l1608_c7_cbeb_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l1603_c2_87d7_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1608_c7_cbeb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_cbeb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1611_c7_9256_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1608_c7_cbeb_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1611_c7_9256_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_cbeb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1611_c7_9256_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1603_c2_87d7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1608_c7_cbeb_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1603_c2_87d7_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1608_c7_cbeb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1603_c2_87d7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1608_c7_cbeb_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1608_c7_cbeb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_cbeb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_cbeb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_cbeb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_cbeb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_cbeb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_cbeb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_cbeb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_cbeb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1608_c7_cbeb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_cbeb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_cbeb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_cbeb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_cbeb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_cbeb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_cbeb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_cbeb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_cbeb_return_output;

     -- n8_MUX[uxn_opcodes_h_l1603_c2_87d7] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1603_c2_87d7_cond <= VAR_n8_MUX_uxn_opcodes_h_l1603_c2_87d7_cond;
     n8_MUX_uxn_opcodes_h_l1603_c2_87d7_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1603_c2_87d7_iftrue;
     n8_MUX_uxn_opcodes_h_l1603_c2_87d7_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1603_c2_87d7_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1603_c2_87d7_return_output := n8_MUX_uxn_opcodes_h_l1603_c2_87d7_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1608_c7_cbeb] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1608_c7_cbeb_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1608_c7_cbeb_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1608_c7_cbeb_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1608_c7_cbeb_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1608_c7_cbeb_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1608_c7_cbeb_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1608_c7_cbeb_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1608_c7_cbeb_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1603_c2_87d7] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1603_c2_87d7_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1603_c2_87d7_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1603_c2_87d7_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1603_c2_87d7_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1603_c2_87d7_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1603_c2_87d7_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1603_c2_87d7_return_output := result_u16_value_MUX_uxn_opcodes_h_l1603_c2_87d7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1603_c2_87d7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1603_c2_87d7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1603_c2_87d7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1603_c2_87d7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1603_c2_87d7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1603_c2_87d7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1603_c2_87d7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1603_c2_87d7_return_output := result_u8_value_MUX_uxn_opcodes_h_l1603_c2_87d7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1603_c2_87d7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1603_c2_87d7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1603_c2_87d7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1603_c2_87d7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1603_c2_87d7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1603_c2_87d7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1603_c2_87d7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1603_c2_87d7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1603_c2_87d7_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1603_c2_87d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1603_c2_87d7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_cbeb_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1603_c2_87d7_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1608_c7_cbeb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1603_c2_87d7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_cbeb_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1603_c2_87d7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1603_c2_87d7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1603_c2_87d7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1603_c2_87d7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1603_c2_87d7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1603_c2_87d7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1603_c2_87d7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1603_c2_87d7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1603_c2_87d7_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1603_c2_87d7] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1603_c2_87d7_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1603_c2_87d7_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1603_c2_87d7_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1603_c2_87d7_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1603_c2_87d7_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1603_c2_87d7_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1603_c2_87d7_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1603_c2_87d7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1603_c2_87d7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1603_c2_87d7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1603_c2_87d7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1603_c2_87d7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1603_c2_87d7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1603_c2_87d7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1603_c2_87d7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1603_c2_87d7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1603_c2_87d7_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_643c_uxn_opcodes_h_l1599_l1632_DUPLICATE_5ac4 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_643c_uxn_opcodes_h_l1599_l1632_DUPLICATE_5ac4_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_643c(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1603_c2_87d7_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1603_c2_87d7_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1603_c2_87d7_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1603_c2_87d7_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1603_c2_87d7_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1603_c2_87d7_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1603_c2_87d7_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_643c_uxn_opcodes_h_l1599_l1632_DUPLICATE_5ac4_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_643c_uxn_opcodes_h_l1599_l1632_DUPLICATE_5ac4_return_output;
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
