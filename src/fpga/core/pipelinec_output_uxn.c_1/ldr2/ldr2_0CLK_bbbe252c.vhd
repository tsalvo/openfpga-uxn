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
entity ldr2_0CLK_bbbe252c is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ldr2_0CLK_bbbe252c;
architecture arch of ldr2_0CLK_bbbe252c is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1833_c6_2646]
signal BIN_OP_EQ_uxn_opcodes_h_l1833_c6_2646_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1833_c6_2646_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1833_c6_2646_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1833_c1_97e8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1833_c1_97e8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1833_c1_97e8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1833_c1_97e8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1833_c1_97e8_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1833_c2_cfa8]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1833_c2_cfa8_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1833_c2_cfa8_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1833_c2_cfa8_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1833_c2_cfa8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1833_c2_cfa8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c2_cfa8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c2_cfa8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c2_cfa8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c2_cfa8_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1833_c2_cfa8]
signal result_stack_value_MUX_uxn_opcodes_h_l1833_c2_cfa8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1833_c2_cfa8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1833_c2_cfa8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1833_c2_cfa8_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1833_c2_cfa8]
signal result_ram_addr_MUX_uxn_opcodes_h_l1833_c2_cfa8_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1833_c2_cfa8_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1833_c2_cfa8_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1833_c2_cfa8_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1833_c2_cfa8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1833_c2_cfa8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1833_c2_cfa8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1833_c2_cfa8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1833_c2_cfa8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1833_c2_cfa8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1833_c2_cfa8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1833_c2_cfa8_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1833_c2_cfa8_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1833_c2_cfa8_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1833_c2_cfa8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1833_c2_cfa8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1833_c2_cfa8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1833_c2_cfa8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1833_c2_cfa8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1833_c2_cfa8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1833_c2_cfa8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1833_c2_cfa8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1833_c2_cfa8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1833_c2_cfa8_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1833_c2_cfa8]
signal t8_MUX_uxn_opcodes_h_l1833_c2_cfa8_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1833_c2_cfa8_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1833_c2_cfa8_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1833_c2_cfa8_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1833_c2_cfa8]
signal tmp16_MUX_uxn_opcodes_h_l1833_c2_cfa8_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1833_c2_cfa8_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1833_c2_cfa8_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1833_c2_cfa8_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1834_c3_49e6[uxn_opcodes_h_l1834_c3_49e6]
signal printf_uxn_opcodes_h_l1834_c3_49e6_uxn_opcodes_h_l1834_c3_49e6_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1839_c11_a5c7]
signal BIN_OP_EQ_uxn_opcodes_h_l1839_c11_a5c7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1839_c11_a5c7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1839_c11_a5c7_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1839_c7_5d29]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1839_c7_5d29_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1839_c7_5d29_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1839_c7_5d29_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1839_c7_5d29_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1839_c7_5d29]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1839_c7_5d29_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1839_c7_5d29_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1839_c7_5d29_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1839_c7_5d29_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1839_c7_5d29]
signal result_stack_value_MUX_uxn_opcodes_h_l1839_c7_5d29_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1839_c7_5d29_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1839_c7_5d29_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1839_c7_5d29_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1839_c7_5d29]
signal result_ram_addr_MUX_uxn_opcodes_h_l1839_c7_5d29_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1839_c7_5d29_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1839_c7_5d29_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1839_c7_5d29_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1839_c7_5d29]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1839_c7_5d29_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1839_c7_5d29_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1839_c7_5d29_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1839_c7_5d29_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1839_c7_5d29]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1839_c7_5d29_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1839_c7_5d29_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1839_c7_5d29_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1839_c7_5d29_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1839_c7_5d29]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1839_c7_5d29_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1839_c7_5d29_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1839_c7_5d29_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1839_c7_5d29_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1839_c7_5d29]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1839_c7_5d29_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1839_c7_5d29_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1839_c7_5d29_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1839_c7_5d29_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1839_c7_5d29]
signal t8_MUX_uxn_opcodes_h_l1839_c7_5d29_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1839_c7_5d29_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1839_c7_5d29_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1839_c7_5d29_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1839_c7_5d29]
signal tmp16_MUX_uxn_opcodes_h_l1839_c7_5d29_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1839_c7_5d29_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1839_c7_5d29_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1839_c7_5d29_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1842_c11_e406]
signal BIN_OP_EQ_uxn_opcodes_h_l1842_c11_e406_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1842_c11_e406_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1842_c11_e406_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1842_c7_8898]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1842_c7_8898_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1842_c7_8898_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1842_c7_8898_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1842_c7_8898_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1842_c7_8898]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1842_c7_8898_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1842_c7_8898_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1842_c7_8898_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1842_c7_8898_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1842_c7_8898]
signal result_stack_value_MUX_uxn_opcodes_h_l1842_c7_8898_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1842_c7_8898_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1842_c7_8898_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1842_c7_8898_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1842_c7_8898]
signal result_ram_addr_MUX_uxn_opcodes_h_l1842_c7_8898_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1842_c7_8898_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1842_c7_8898_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1842_c7_8898_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1842_c7_8898]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1842_c7_8898_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1842_c7_8898_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1842_c7_8898_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1842_c7_8898_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1842_c7_8898]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1842_c7_8898_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1842_c7_8898_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1842_c7_8898_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1842_c7_8898_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1842_c7_8898]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1842_c7_8898_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1842_c7_8898_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1842_c7_8898_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1842_c7_8898_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1842_c7_8898]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1842_c7_8898_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1842_c7_8898_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1842_c7_8898_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1842_c7_8898_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1842_c7_8898]
signal t8_MUX_uxn_opcodes_h_l1842_c7_8898_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1842_c7_8898_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1842_c7_8898_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1842_c7_8898_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1842_c7_8898]
signal tmp16_MUX_uxn_opcodes_h_l1842_c7_8898_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1842_c7_8898_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1842_c7_8898_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1842_c7_8898_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1846_c32_063a]
signal BIN_OP_AND_uxn_opcodes_h_l1846_c32_063a_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1846_c32_063a_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1846_c32_063a_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1846_c32_4068]
signal BIN_OP_GT_uxn_opcodes_h_l1846_c32_4068_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1846_c32_4068_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1846_c32_4068_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1846_c32_7f29]
signal MUX_uxn_opcodes_h_l1846_c32_7f29_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1846_c32_7f29_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1846_c32_7f29_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1846_c32_7f29_return_output : signed(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1847_c21_dff2]
signal BIN_OP_PLUS_uxn_opcodes_h_l1847_c21_dff2_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1847_c21_dff2_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1847_c21_dff2_return_output : signed(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1849_c11_ec20]
signal BIN_OP_EQ_uxn_opcodes_h_l1849_c11_ec20_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1849_c11_ec20_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1849_c11_ec20_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1849_c7_4a03]
signal result_ram_addr_MUX_uxn_opcodes_h_l1849_c7_4a03_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1849_c7_4a03_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1849_c7_4a03_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1849_c7_4a03_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1849_c7_4a03]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_4a03_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_4a03_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_4a03_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_4a03_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1849_c7_4a03]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_4a03_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_4a03_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_4a03_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_4a03_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1849_c7_4a03]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_4a03_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_4a03_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_4a03_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_4a03_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1849_c7_4a03]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_4a03_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_4a03_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_4a03_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_4a03_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1849_c7_4a03]
signal result_stack_value_MUX_uxn_opcodes_h_l1849_c7_4a03_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1849_c7_4a03_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1849_c7_4a03_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1849_c7_4a03_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1849_c7_4a03]
signal tmp16_MUX_uxn_opcodes_h_l1849_c7_4a03_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1849_c7_4a03_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1849_c7_4a03_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1849_c7_4a03_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1853_c11_4dbe]
signal BIN_OP_EQ_uxn_opcodes_h_l1853_c11_4dbe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1853_c11_4dbe_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1853_c11_4dbe_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1853_c7_2e95]
signal result_ram_addr_MUX_uxn_opcodes_h_l1853_c7_2e95_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1853_c7_2e95_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1853_c7_2e95_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1853_c7_2e95_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1853_c7_2e95]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_2e95_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_2e95_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_2e95_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_2e95_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1853_c7_2e95]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_2e95_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_2e95_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_2e95_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_2e95_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1853_c7_2e95]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_2e95_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_2e95_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_2e95_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_2e95_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1853_c7_2e95]
signal result_stack_value_MUX_uxn_opcodes_h_l1853_c7_2e95_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1853_c7_2e95_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1853_c7_2e95_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1853_c7_2e95_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1853_c7_2e95]
signal tmp16_MUX_uxn_opcodes_h_l1853_c7_2e95_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1853_c7_2e95_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1853_c7_2e95_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1853_c7_2e95_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1855_c3_1dce]
signal CONST_SL_8_uxn_opcodes_h_l1855_c3_1dce_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1855_c3_1dce_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1856_c21_429c]
signal BIN_OP_PLUS_uxn_opcodes_h_l1856_c21_429c_left : signed(17 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1856_c21_429c_right : signed(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1856_c21_429c_return_output : signed(18 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1858_c11_852d]
signal BIN_OP_EQ_uxn_opcodes_h_l1858_c11_852d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1858_c11_852d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1858_c11_852d_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1858_c7_d888]
signal result_ram_addr_MUX_uxn_opcodes_h_l1858_c7_d888_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1858_c7_d888_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1858_c7_d888_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1858_c7_d888_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1858_c7_d888]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_d888_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_d888_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_d888_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_d888_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1858_c7_d888]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_d888_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_d888_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_d888_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_d888_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1858_c7_d888]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_d888_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_d888_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_d888_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_d888_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1858_c7_d888]
signal result_stack_value_MUX_uxn_opcodes_h_l1858_c7_d888_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1858_c7_d888_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1858_c7_d888_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1858_c7_d888_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1858_c7_d888]
signal tmp16_MUX_uxn_opcodes_h_l1858_c7_d888_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1858_c7_d888_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1858_c7_d888_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1858_c7_d888_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1859_c21_bc2e]
signal BIN_OP_PLUS_uxn_opcodes_h_l1859_c21_bc2e_left : signed(17 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1859_c21_bc2e_right : signed(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1859_c21_bc2e_return_output : signed(18 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1861_c11_c1d0]
signal BIN_OP_EQ_uxn_opcodes_h_l1861_c11_c1d0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1861_c11_c1d0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1861_c11_c1d0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1861_c7_da31]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_da31_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_da31_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_da31_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_da31_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1861_c7_da31]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_da31_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_da31_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_da31_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_da31_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1861_c7_da31]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_da31_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_da31_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_da31_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_da31_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1861_c7_da31]
signal result_stack_value_MUX_uxn_opcodes_h_l1861_c7_da31_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1861_c7_da31_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1861_c7_da31_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1861_c7_da31_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1861_c7_da31]
signal tmp16_MUX_uxn_opcodes_h_l1861_c7_da31_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1861_c7_da31_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1861_c7_da31_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1861_c7_da31_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1862_c3_e4f8]
signal BIN_OP_OR_uxn_opcodes_h_l1862_c3_e4f8_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1862_c3_e4f8_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1862_c3_e4f8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1867_c11_5f08]
signal BIN_OP_EQ_uxn_opcodes_h_l1867_c11_5f08_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1867_c11_5f08_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1867_c11_5f08_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1867_c7_7473]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_7473_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_7473_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_7473_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_7473_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1867_c7_7473]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_7473_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_7473_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_7473_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_7473_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1867_c7_7473]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_7473_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_7473_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_7473_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_7473_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1867_c7_7473]
signal result_stack_value_MUX_uxn_opcodes_h_l1867_c7_7473_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1867_c7_7473_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1867_c7_7473_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1867_c7_7473_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1869_c34_a774]
signal CONST_SR_8_uxn_opcodes_h_l1869_c34_a774_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1869_c34_a774_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1871_c11_bc9f]
signal BIN_OP_EQ_uxn_opcodes_h_l1871_c11_bc9f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1871_c11_bc9f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1871_c11_bc9f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1871_c7_ca60]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_ca60_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_ca60_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_ca60_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_ca60_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1871_c7_ca60]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_ca60_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_ca60_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_ca60_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_ca60_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1859_l1856_l1851_DUPLICATE_228b
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1859_l1856_l1851_DUPLICATE_228b_left : signed(16 downto 0);
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1859_l1856_l1851_DUPLICATE_228b_right : signed(7 downto 0);
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1859_l1856_l1851_DUPLICATE_228b_return_output : signed(17 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_2155( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_read := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.stack_value := ref_toks_3;
      base.ram_addr := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_stack_write := ref_toks_7;
      base.is_opc_done := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1833_c6_2646
BIN_OP_EQ_uxn_opcodes_h_l1833_c6_2646 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1833_c6_2646_left,
BIN_OP_EQ_uxn_opcodes_h_l1833_c6_2646_right,
BIN_OP_EQ_uxn_opcodes_h_l1833_c6_2646_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1833_c1_97e8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1833_c1_97e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1833_c1_97e8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1833_c1_97e8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1833_c1_97e8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1833_c1_97e8_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1833_c2_cfa8
result_is_stack_read_MUX_uxn_opcodes_h_l1833_c2_cfa8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1833_c2_cfa8_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1833_c2_cfa8_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1833_c2_cfa8_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1833_c2_cfa8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c2_cfa8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c2_cfa8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c2_cfa8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c2_cfa8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c2_cfa8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c2_cfa8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1833_c2_cfa8
result_stack_value_MUX_uxn_opcodes_h_l1833_c2_cfa8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1833_c2_cfa8_cond,
result_stack_value_MUX_uxn_opcodes_h_l1833_c2_cfa8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1833_c2_cfa8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1833_c2_cfa8_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1833_c2_cfa8
result_ram_addr_MUX_uxn_opcodes_h_l1833_c2_cfa8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1833_c2_cfa8_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1833_c2_cfa8_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1833_c2_cfa8_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1833_c2_cfa8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1833_c2_cfa8
result_is_sp_shift_MUX_uxn_opcodes_h_l1833_c2_cfa8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1833_c2_cfa8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1833_c2_cfa8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1833_c2_cfa8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1833_c2_cfa8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1833_c2_cfa8
result_sp_relative_shift_MUX_uxn_opcodes_h_l1833_c2_cfa8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1833_c2_cfa8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1833_c2_cfa8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1833_c2_cfa8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1833_c2_cfa8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1833_c2_cfa8
result_is_stack_write_MUX_uxn_opcodes_h_l1833_c2_cfa8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1833_c2_cfa8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1833_c2_cfa8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1833_c2_cfa8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1833_c2_cfa8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1833_c2_cfa8
result_is_opc_done_MUX_uxn_opcodes_h_l1833_c2_cfa8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1833_c2_cfa8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1833_c2_cfa8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1833_c2_cfa8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1833_c2_cfa8_return_output);

-- t8_MUX_uxn_opcodes_h_l1833_c2_cfa8
t8_MUX_uxn_opcodes_h_l1833_c2_cfa8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1833_c2_cfa8_cond,
t8_MUX_uxn_opcodes_h_l1833_c2_cfa8_iftrue,
t8_MUX_uxn_opcodes_h_l1833_c2_cfa8_iffalse,
t8_MUX_uxn_opcodes_h_l1833_c2_cfa8_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1833_c2_cfa8
tmp16_MUX_uxn_opcodes_h_l1833_c2_cfa8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1833_c2_cfa8_cond,
tmp16_MUX_uxn_opcodes_h_l1833_c2_cfa8_iftrue,
tmp16_MUX_uxn_opcodes_h_l1833_c2_cfa8_iffalse,
tmp16_MUX_uxn_opcodes_h_l1833_c2_cfa8_return_output);

-- printf_uxn_opcodes_h_l1834_c3_49e6_uxn_opcodes_h_l1834_c3_49e6
printf_uxn_opcodes_h_l1834_c3_49e6_uxn_opcodes_h_l1834_c3_49e6 : entity work.printf_uxn_opcodes_h_l1834_c3_49e6_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1834_c3_49e6_uxn_opcodes_h_l1834_c3_49e6_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1839_c11_a5c7
BIN_OP_EQ_uxn_opcodes_h_l1839_c11_a5c7 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1839_c11_a5c7_left,
BIN_OP_EQ_uxn_opcodes_h_l1839_c11_a5c7_right,
BIN_OP_EQ_uxn_opcodes_h_l1839_c11_a5c7_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1839_c7_5d29
result_is_stack_read_MUX_uxn_opcodes_h_l1839_c7_5d29 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1839_c7_5d29_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1839_c7_5d29_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1839_c7_5d29_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1839_c7_5d29_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1839_c7_5d29
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1839_c7_5d29 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1839_c7_5d29_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1839_c7_5d29_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1839_c7_5d29_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1839_c7_5d29_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1839_c7_5d29
result_stack_value_MUX_uxn_opcodes_h_l1839_c7_5d29 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1839_c7_5d29_cond,
result_stack_value_MUX_uxn_opcodes_h_l1839_c7_5d29_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1839_c7_5d29_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1839_c7_5d29_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1839_c7_5d29
result_ram_addr_MUX_uxn_opcodes_h_l1839_c7_5d29 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1839_c7_5d29_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1839_c7_5d29_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1839_c7_5d29_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1839_c7_5d29_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1839_c7_5d29
result_is_sp_shift_MUX_uxn_opcodes_h_l1839_c7_5d29 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1839_c7_5d29_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1839_c7_5d29_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1839_c7_5d29_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1839_c7_5d29_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1839_c7_5d29
result_sp_relative_shift_MUX_uxn_opcodes_h_l1839_c7_5d29 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1839_c7_5d29_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1839_c7_5d29_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1839_c7_5d29_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1839_c7_5d29_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1839_c7_5d29
result_is_stack_write_MUX_uxn_opcodes_h_l1839_c7_5d29 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1839_c7_5d29_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1839_c7_5d29_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1839_c7_5d29_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1839_c7_5d29_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1839_c7_5d29
result_is_opc_done_MUX_uxn_opcodes_h_l1839_c7_5d29 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1839_c7_5d29_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1839_c7_5d29_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1839_c7_5d29_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1839_c7_5d29_return_output);

-- t8_MUX_uxn_opcodes_h_l1839_c7_5d29
t8_MUX_uxn_opcodes_h_l1839_c7_5d29 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1839_c7_5d29_cond,
t8_MUX_uxn_opcodes_h_l1839_c7_5d29_iftrue,
t8_MUX_uxn_opcodes_h_l1839_c7_5d29_iffalse,
t8_MUX_uxn_opcodes_h_l1839_c7_5d29_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1839_c7_5d29
tmp16_MUX_uxn_opcodes_h_l1839_c7_5d29 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1839_c7_5d29_cond,
tmp16_MUX_uxn_opcodes_h_l1839_c7_5d29_iftrue,
tmp16_MUX_uxn_opcodes_h_l1839_c7_5d29_iffalse,
tmp16_MUX_uxn_opcodes_h_l1839_c7_5d29_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1842_c11_e406
BIN_OP_EQ_uxn_opcodes_h_l1842_c11_e406 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1842_c11_e406_left,
BIN_OP_EQ_uxn_opcodes_h_l1842_c11_e406_right,
BIN_OP_EQ_uxn_opcodes_h_l1842_c11_e406_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1842_c7_8898
result_is_stack_read_MUX_uxn_opcodes_h_l1842_c7_8898 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1842_c7_8898_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1842_c7_8898_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1842_c7_8898_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1842_c7_8898_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1842_c7_8898
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1842_c7_8898 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1842_c7_8898_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1842_c7_8898_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1842_c7_8898_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1842_c7_8898_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1842_c7_8898
result_stack_value_MUX_uxn_opcodes_h_l1842_c7_8898 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1842_c7_8898_cond,
result_stack_value_MUX_uxn_opcodes_h_l1842_c7_8898_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1842_c7_8898_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1842_c7_8898_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1842_c7_8898
result_ram_addr_MUX_uxn_opcodes_h_l1842_c7_8898 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1842_c7_8898_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1842_c7_8898_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1842_c7_8898_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1842_c7_8898_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1842_c7_8898
result_is_sp_shift_MUX_uxn_opcodes_h_l1842_c7_8898 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1842_c7_8898_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1842_c7_8898_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1842_c7_8898_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1842_c7_8898_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1842_c7_8898
result_sp_relative_shift_MUX_uxn_opcodes_h_l1842_c7_8898 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1842_c7_8898_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1842_c7_8898_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1842_c7_8898_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1842_c7_8898_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1842_c7_8898
result_is_stack_write_MUX_uxn_opcodes_h_l1842_c7_8898 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1842_c7_8898_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1842_c7_8898_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1842_c7_8898_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1842_c7_8898_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1842_c7_8898
result_is_opc_done_MUX_uxn_opcodes_h_l1842_c7_8898 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1842_c7_8898_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1842_c7_8898_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1842_c7_8898_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1842_c7_8898_return_output);

-- t8_MUX_uxn_opcodes_h_l1842_c7_8898
t8_MUX_uxn_opcodes_h_l1842_c7_8898 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1842_c7_8898_cond,
t8_MUX_uxn_opcodes_h_l1842_c7_8898_iftrue,
t8_MUX_uxn_opcodes_h_l1842_c7_8898_iffalse,
t8_MUX_uxn_opcodes_h_l1842_c7_8898_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1842_c7_8898
tmp16_MUX_uxn_opcodes_h_l1842_c7_8898 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1842_c7_8898_cond,
tmp16_MUX_uxn_opcodes_h_l1842_c7_8898_iftrue,
tmp16_MUX_uxn_opcodes_h_l1842_c7_8898_iffalse,
tmp16_MUX_uxn_opcodes_h_l1842_c7_8898_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1846_c32_063a
BIN_OP_AND_uxn_opcodes_h_l1846_c32_063a : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1846_c32_063a_left,
BIN_OP_AND_uxn_opcodes_h_l1846_c32_063a_right,
BIN_OP_AND_uxn_opcodes_h_l1846_c32_063a_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1846_c32_4068
BIN_OP_GT_uxn_opcodes_h_l1846_c32_4068 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1846_c32_4068_left,
BIN_OP_GT_uxn_opcodes_h_l1846_c32_4068_right,
BIN_OP_GT_uxn_opcodes_h_l1846_c32_4068_return_output);

-- MUX_uxn_opcodes_h_l1846_c32_7f29
MUX_uxn_opcodes_h_l1846_c32_7f29 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1846_c32_7f29_cond,
MUX_uxn_opcodes_h_l1846_c32_7f29_iftrue,
MUX_uxn_opcodes_h_l1846_c32_7f29_iffalse,
MUX_uxn_opcodes_h_l1846_c32_7f29_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1847_c21_dff2
BIN_OP_PLUS_uxn_opcodes_h_l1847_c21_dff2 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1847_c21_dff2_left,
BIN_OP_PLUS_uxn_opcodes_h_l1847_c21_dff2_right,
BIN_OP_PLUS_uxn_opcodes_h_l1847_c21_dff2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1849_c11_ec20
BIN_OP_EQ_uxn_opcodes_h_l1849_c11_ec20 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1849_c11_ec20_left,
BIN_OP_EQ_uxn_opcodes_h_l1849_c11_ec20_right,
BIN_OP_EQ_uxn_opcodes_h_l1849_c11_ec20_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1849_c7_4a03
result_ram_addr_MUX_uxn_opcodes_h_l1849_c7_4a03 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1849_c7_4a03_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1849_c7_4a03_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1849_c7_4a03_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1849_c7_4a03_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_4a03
result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_4a03 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_4a03_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_4a03_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_4a03_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_4a03_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_4a03
result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_4a03 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_4a03_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_4a03_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_4a03_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_4a03_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_4a03
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_4a03 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_4a03_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_4a03_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_4a03_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_4a03_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_4a03
result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_4a03 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_4a03_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_4a03_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_4a03_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_4a03_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1849_c7_4a03
result_stack_value_MUX_uxn_opcodes_h_l1849_c7_4a03 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1849_c7_4a03_cond,
result_stack_value_MUX_uxn_opcodes_h_l1849_c7_4a03_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1849_c7_4a03_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1849_c7_4a03_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1849_c7_4a03
tmp16_MUX_uxn_opcodes_h_l1849_c7_4a03 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1849_c7_4a03_cond,
tmp16_MUX_uxn_opcodes_h_l1849_c7_4a03_iftrue,
tmp16_MUX_uxn_opcodes_h_l1849_c7_4a03_iffalse,
tmp16_MUX_uxn_opcodes_h_l1849_c7_4a03_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1853_c11_4dbe
BIN_OP_EQ_uxn_opcodes_h_l1853_c11_4dbe : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1853_c11_4dbe_left,
BIN_OP_EQ_uxn_opcodes_h_l1853_c11_4dbe_right,
BIN_OP_EQ_uxn_opcodes_h_l1853_c11_4dbe_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1853_c7_2e95
result_ram_addr_MUX_uxn_opcodes_h_l1853_c7_2e95 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1853_c7_2e95_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1853_c7_2e95_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1853_c7_2e95_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1853_c7_2e95_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_2e95
result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_2e95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_2e95_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_2e95_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_2e95_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_2e95_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_2e95
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_2e95 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_2e95_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_2e95_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_2e95_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_2e95_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_2e95
result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_2e95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_2e95_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_2e95_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_2e95_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_2e95_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1853_c7_2e95
result_stack_value_MUX_uxn_opcodes_h_l1853_c7_2e95 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1853_c7_2e95_cond,
result_stack_value_MUX_uxn_opcodes_h_l1853_c7_2e95_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1853_c7_2e95_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1853_c7_2e95_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1853_c7_2e95
tmp16_MUX_uxn_opcodes_h_l1853_c7_2e95 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1853_c7_2e95_cond,
tmp16_MUX_uxn_opcodes_h_l1853_c7_2e95_iftrue,
tmp16_MUX_uxn_opcodes_h_l1853_c7_2e95_iffalse,
tmp16_MUX_uxn_opcodes_h_l1853_c7_2e95_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1855_c3_1dce
CONST_SL_8_uxn_opcodes_h_l1855_c3_1dce : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1855_c3_1dce_x,
CONST_SL_8_uxn_opcodes_h_l1855_c3_1dce_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1856_c21_429c
BIN_OP_PLUS_uxn_opcodes_h_l1856_c21_429c : entity work.BIN_OP_PLUS_int18_t_int2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1856_c21_429c_left,
BIN_OP_PLUS_uxn_opcodes_h_l1856_c21_429c_right,
BIN_OP_PLUS_uxn_opcodes_h_l1856_c21_429c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1858_c11_852d
BIN_OP_EQ_uxn_opcodes_h_l1858_c11_852d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1858_c11_852d_left,
BIN_OP_EQ_uxn_opcodes_h_l1858_c11_852d_right,
BIN_OP_EQ_uxn_opcodes_h_l1858_c11_852d_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1858_c7_d888
result_ram_addr_MUX_uxn_opcodes_h_l1858_c7_d888 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1858_c7_d888_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1858_c7_d888_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1858_c7_d888_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1858_c7_d888_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_d888
result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_d888 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_d888_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_d888_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_d888_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_d888_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_d888
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_d888 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_d888_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_d888_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_d888_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_d888_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_d888
result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_d888 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_d888_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_d888_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_d888_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_d888_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1858_c7_d888
result_stack_value_MUX_uxn_opcodes_h_l1858_c7_d888 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1858_c7_d888_cond,
result_stack_value_MUX_uxn_opcodes_h_l1858_c7_d888_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1858_c7_d888_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1858_c7_d888_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1858_c7_d888
tmp16_MUX_uxn_opcodes_h_l1858_c7_d888 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1858_c7_d888_cond,
tmp16_MUX_uxn_opcodes_h_l1858_c7_d888_iftrue,
tmp16_MUX_uxn_opcodes_h_l1858_c7_d888_iffalse,
tmp16_MUX_uxn_opcodes_h_l1858_c7_d888_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1859_c21_bc2e
BIN_OP_PLUS_uxn_opcodes_h_l1859_c21_bc2e : entity work.BIN_OP_PLUS_int18_t_int2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1859_c21_bc2e_left,
BIN_OP_PLUS_uxn_opcodes_h_l1859_c21_bc2e_right,
BIN_OP_PLUS_uxn_opcodes_h_l1859_c21_bc2e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1861_c11_c1d0
BIN_OP_EQ_uxn_opcodes_h_l1861_c11_c1d0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1861_c11_c1d0_left,
BIN_OP_EQ_uxn_opcodes_h_l1861_c11_c1d0_right,
BIN_OP_EQ_uxn_opcodes_h_l1861_c11_c1d0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_da31
result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_da31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_da31_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_da31_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_da31_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_da31_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_da31
result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_da31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_da31_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_da31_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_da31_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_da31_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_da31
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_da31 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_da31_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_da31_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_da31_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_da31_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1861_c7_da31
result_stack_value_MUX_uxn_opcodes_h_l1861_c7_da31 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1861_c7_da31_cond,
result_stack_value_MUX_uxn_opcodes_h_l1861_c7_da31_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1861_c7_da31_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1861_c7_da31_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1861_c7_da31
tmp16_MUX_uxn_opcodes_h_l1861_c7_da31 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1861_c7_da31_cond,
tmp16_MUX_uxn_opcodes_h_l1861_c7_da31_iftrue,
tmp16_MUX_uxn_opcodes_h_l1861_c7_da31_iffalse,
tmp16_MUX_uxn_opcodes_h_l1861_c7_da31_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1862_c3_e4f8
BIN_OP_OR_uxn_opcodes_h_l1862_c3_e4f8 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1862_c3_e4f8_left,
BIN_OP_OR_uxn_opcodes_h_l1862_c3_e4f8_right,
BIN_OP_OR_uxn_opcodes_h_l1862_c3_e4f8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1867_c11_5f08
BIN_OP_EQ_uxn_opcodes_h_l1867_c11_5f08 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1867_c11_5f08_left,
BIN_OP_EQ_uxn_opcodes_h_l1867_c11_5f08_right,
BIN_OP_EQ_uxn_opcodes_h_l1867_c11_5f08_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_7473
result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_7473 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_7473_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_7473_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_7473_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_7473_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_7473
result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_7473 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_7473_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_7473_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_7473_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_7473_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_7473
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_7473 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_7473_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_7473_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_7473_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_7473_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1867_c7_7473
result_stack_value_MUX_uxn_opcodes_h_l1867_c7_7473 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1867_c7_7473_cond,
result_stack_value_MUX_uxn_opcodes_h_l1867_c7_7473_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1867_c7_7473_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1867_c7_7473_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1869_c34_a774
CONST_SR_8_uxn_opcodes_h_l1869_c34_a774 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1869_c34_a774_x,
CONST_SR_8_uxn_opcodes_h_l1869_c34_a774_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1871_c11_bc9f
BIN_OP_EQ_uxn_opcodes_h_l1871_c11_bc9f : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1871_c11_bc9f_left,
BIN_OP_EQ_uxn_opcodes_h_l1871_c11_bc9f_right,
BIN_OP_EQ_uxn_opcodes_h_l1871_c11_bc9f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_ca60
result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_ca60 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_ca60_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_ca60_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_ca60_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_ca60_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_ca60
result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_ca60 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_ca60_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_ca60_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_ca60_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_ca60_return_output);

-- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1859_l1856_l1851_DUPLICATE_228b
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1859_l1856_l1851_DUPLICATE_228b : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1859_l1856_l1851_DUPLICATE_228b_left,
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1859_l1856_l1851_DUPLICATE_228b_right,
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1859_l1856_l1851_DUPLICATE_228b_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 t8,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1833_c6_2646_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1833_c1_97e8_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1833_c2_cfa8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c2_cfa8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1833_c2_cfa8_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1833_c2_cfa8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1833_c2_cfa8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1833_c2_cfa8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1833_c2_cfa8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1833_c2_cfa8_return_output,
 t8_MUX_uxn_opcodes_h_l1833_c2_cfa8_return_output,
 tmp16_MUX_uxn_opcodes_h_l1833_c2_cfa8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1839_c11_a5c7_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1839_c7_5d29_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1839_c7_5d29_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1839_c7_5d29_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1839_c7_5d29_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1839_c7_5d29_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1839_c7_5d29_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1839_c7_5d29_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1839_c7_5d29_return_output,
 t8_MUX_uxn_opcodes_h_l1839_c7_5d29_return_output,
 tmp16_MUX_uxn_opcodes_h_l1839_c7_5d29_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1842_c11_e406_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1842_c7_8898_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1842_c7_8898_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1842_c7_8898_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1842_c7_8898_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1842_c7_8898_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1842_c7_8898_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1842_c7_8898_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1842_c7_8898_return_output,
 t8_MUX_uxn_opcodes_h_l1842_c7_8898_return_output,
 tmp16_MUX_uxn_opcodes_h_l1842_c7_8898_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1846_c32_063a_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1846_c32_4068_return_output,
 MUX_uxn_opcodes_h_l1846_c32_7f29_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1847_c21_dff2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1849_c11_ec20_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1849_c7_4a03_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_4a03_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_4a03_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_4a03_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_4a03_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1849_c7_4a03_return_output,
 tmp16_MUX_uxn_opcodes_h_l1849_c7_4a03_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1853_c11_4dbe_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1853_c7_2e95_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_2e95_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_2e95_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_2e95_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1853_c7_2e95_return_output,
 tmp16_MUX_uxn_opcodes_h_l1853_c7_2e95_return_output,
 CONST_SL_8_uxn_opcodes_h_l1855_c3_1dce_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1856_c21_429c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1858_c11_852d_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1858_c7_d888_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_d888_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_d888_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_d888_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1858_c7_d888_return_output,
 tmp16_MUX_uxn_opcodes_h_l1858_c7_d888_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1859_c21_bc2e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1861_c11_c1d0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_da31_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_da31_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_da31_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1861_c7_da31_return_output,
 tmp16_MUX_uxn_opcodes_h_l1861_c7_da31_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1862_c3_e4f8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1867_c11_5f08_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_7473_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_7473_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_7473_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1867_c7_7473_return_output,
 CONST_SR_8_uxn_opcodes_h_l1869_c34_a774_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1871_c11_bc9f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_ca60_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_ca60_return_output,
 BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1859_l1856_l1851_DUPLICATE_228b_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1833_c6_2646_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1833_c6_2646_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1833_c6_2646_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1833_c1_97e8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1833_c1_97e8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1833_c1_97e8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1833_c1_97e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1833_c2_cfa8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1833_c2_cfa8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1839_c7_5d29_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1833_c2_cfa8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1833_c2_cfa8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c2_cfa8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1836_c3_a8a9 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c2_cfa8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1839_c7_5d29_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c2_cfa8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c2_cfa8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1833_c2_cfa8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1833_c2_cfa8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1839_c7_5d29_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1833_c2_cfa8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1833_c2_cfa8_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1833_c2_cfa8_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1833_c2_cfa8_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1839_c7_5d29_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1833_c2_cfa8_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1833_c2_cfa8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1833_c2_cfa8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1833_c2_cfa8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1839_c7_5d29_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1833_c2_cfa8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1833_c2_cfa8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1833_c2_cfa8_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1833_c2_cfa8_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1839_c7_5d29_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1833_c2_cfa8_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1833_c2_cfa8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1833_c2_cfa8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1833_c2_cfa8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1839_c7_5d29_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1833_c2_cfa8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1833_c2_cfa8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1833_c2_cfa8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1833_c2_cfa8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1839_c7_5d29_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1833_c2_cfa8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1833_c2_cfa8_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1833_c2_cfa8_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1833_c2_cfa8_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1839_c7_5d29_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1833_c2_cfa8_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1833_c2_cfa8_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1833_c2_cfa8_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1833_c2_cfa8_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1839_c7_5d29_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1833_c2_cfa8_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1833_c2_cfa8_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1834_c3_49e6_uxn_opcodes_h_l1834_c3_49e6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1839_c11_a5c7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1839_c11_a5c7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1839_c11_a5c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1839_c7_5d29_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1839_c7_5d29_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1842_c7_8898_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1839_c7_5d29_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1839_c7_5d29_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1840_c3_5ce5 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1839_c7_5d29_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1842_c7_8898_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1839_c7_5d29_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1839_c7_5d29_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1839_c7_5d29_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1842_c7_8898_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1839_c7_5d29_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1839_c7_5d29_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1839_c7_5d29_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1842_c7_8898_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1839_c7_5d29_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1839_c7_5d29_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1839_c7_5d29_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1842_c7_8898_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1839_c7_5d29_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1839_c7_5d29_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1839_c7_5d29_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1842_c7_8898_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1839_c7_5d29_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1839_c7_5d29_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1839_c7_5d29_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1842_c7_8898_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1839_c7_5d29_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1839_c7_5d29_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1839_c7_5d29_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1842_c7_8898_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1839_c7_5d29_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1839_c7_5d29_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1839_c7_5d29_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1842_c7_8898_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1839_c7_5d29_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1839_c7_5d29_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1839_c7_5d29_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1842_c7_8898_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1839_c7_5d29_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1842_c11_e406_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1842_c11_e406_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1842_c11_e406_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1842_c7_8898_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1842_c7_8898_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1842_c7_8898_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1842_c7_8898_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1842_c7_8898_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_4a03_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1842_c7_8898_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1842_c7_8898_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1842_c7_8898_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1849_c7_4a03_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1842_c7_8898_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1842_c7_8898_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l1847_c3_1464 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1842_c7_8898_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1849_c7_4a03_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1842_c7_8898_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1842_c7_8898_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1842_c7_8898_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_4a03_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1842_c7_8898_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1842_c7_8898_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1842_c7_8898_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1842_c7_8898_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1842_c7_8898_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1842_c7_8898_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_4a03_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1842_c7_8898_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1842_c7_8898_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1842_c7_8898_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_4a03_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1842_c7_8898_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1842_c7_8898_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1842_c7_8898_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1842_c7_8898_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1842_c7_8898_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1842_c7_8898_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1849_c7_4a03_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1842_c7_8898_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1846_c32_7f29_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1846_c32_7f29_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1846_c32_7f29_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1846_c32_063a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1846_c32_063a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1846_c32_063a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1846_c32_4068_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1846_c32_4068_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1846_c32_4068_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1846_c32_7f29_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1847_c21_dff2_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1847_c26_5c92_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1847_c21_dff2_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1847_c21_dff2_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_ec20_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_ec20_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_ec20_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1849_c7_4a03_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l1851_c3_f6e1 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1849_c7_4a03_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1853_c7_2e95_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1849_c7_4a03_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_4a03_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_4a03_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_4a03_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_4a03_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_4a03_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_2e95_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_4a03_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_4a03_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_4a03_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_2e95_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_4a03_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_4a03_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_4a03_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_2e95_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_4a03_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1849_c7_4a03_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1849_c7_4a03_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1853_c7_2e95_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1849_c7_4a03_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1849_c7_4a03_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1849_c7_4a03_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1853_c7_2e95_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1849_c7_4a03_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_4dbe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_4dbe_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_4dbe_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1853_c7_2e95_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l1856_c3_7b67 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1853_c7_2e95_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1858_c7_d888_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1853_c7_2e95_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_2e95_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_2e95_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_d888_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_2e95_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_2e95_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_2e95_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_d888_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_2e95_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_2e95_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_2e95_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_d888_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_2e95_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1853_c7_2e95_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1853_c7_2e95_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1858_c7_d888_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1853_c7_2e95_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1853_c7_2e95_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1853_c7_2e95_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1858_c7_d888_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1853_c7_2e95_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1855_c3_1dce_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1855_c3_1dce_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1856_c21_429c_left : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1856_c21_429c_right : signed(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1856_c21_429c_return_output : signed(18 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_852d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_852d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_852d_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1858_c7_d888_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l1859_c3_5094 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1858_c7_d888_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1858_c7_d888_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_d888_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_d888_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_da31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_d888_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_d888_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_d888_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_da31_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_d888_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_d888_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_d888_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_da31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_d888_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1858_c7_d888_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1858_c7_d888_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1861_c7_da31_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1858_c7_d888_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1858_c7_d888_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1858_c7_d888_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1861_c7_da31_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1858_c7_d888_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1859_c21_bc2e_left : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1859_c21_bc2e_right : signed(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1859_c21_bc2e_return_output : signed(18 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_c1d0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_c1d0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_c1d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_da31_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_da31_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_7473_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_da31_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_da31_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_da31_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_7473_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_da31_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_da31_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1864_c3_84e0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_da31_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_7473_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_da31_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1861_c7_da31_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1861_c7_da31_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1867_c7_7473_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1861_c7_da31_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1861_c7_da31_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1861_c7_da31_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1861_c7_da31_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1862_c3_e4f8_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1862_c3_e4f8_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1862_c3_e4f8_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1865_c24_9bf1_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_5f08_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_5f08_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_5f08_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_7473_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_7473_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_ca60_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_7473_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_7473_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_7473_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_ca60_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_7473_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_7473_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1868_c3_4741 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_7473_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_7473_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1867_c7_7473_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1867_c7_7473_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1867_c7_7473_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1869_c34_a774_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1869_c34_a774_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1869_c24_8f85_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_bc9f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_bc9f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_bc9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_ca60_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_ca60_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_ca60_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_ca60_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_ca60_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_ca60_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1867_l1833_l1858_l1853_l1849_l1842_l1839_DUPLICATE_e652_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1858_l1833_l1839_DUPLICATE_38a7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1833_l1849_l1839_DUPLICATE_7f82_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1842_l1833_l1839_DUPLICATE_b691_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1867_l1833_l1858_l1853_l1849_l1842_l1871_l1839_DUPLICATE_a53e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1842_l1839_DUPLICATE_0263_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1867_l1861_l1858_l1853_l1849_l1842_l1871_l1839_DUPLICATE_f4c0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1867_l1858_l1853_l1849_l1842_DUPLICATE_5b59_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1859_l1856_l1851_DUPLICATE_bc09_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1859_l1856_l1851_DUPLICATE_228b_left : signed(16 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1859_l1856_l1851_DUPLICATE_228b_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1859_l1856_l1851_DUPLICATE_228b_return_output : signed(17 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1862_l1854_DUPLICATE_0f8e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2155_uxn_opcodes_h_l1876_l1828_DUPLICATE_d2de_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1833_c2_cfa8_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1856_c21_429c_right := signed(std_logic_vector(resize(to_unsigned(1, 1), 2)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_ca60_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1840_c3_5ce5 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1839_c7_5d29_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1840_c3_5ce5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1839_c11_a5c7_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1842_c7_8898_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1833_c1_97e8_iffalse := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1833_c2_cfa8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_bc9f_right := to_unsigned(8, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_da31_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_ca60_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1868_c3_4741 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_7473_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1868_c3_4741;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_4dbe_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_5f08_right := to_unsigned(7, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1842_c7_8898_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1846_c32_7f29_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1836_c3_a8a9 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c2_cfa8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1836_c3_a8a9;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1859_c21_bc2e_right := signed(std_logic_vector(resize(to_unsigned(1, 1), 2)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_4a03_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_ec20_right := to_unsigned(3, 2);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1846_c32_063a_right := to_unsigned(128, 8);
     VAR_MUX_uxn_opcodes_h_l1846_c32_7f29_iffalse := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_c1d0_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_852d_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1833_c6_2646_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1864_c3_84e0 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_da31_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1864_c3_84e0;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1846_c32_4068_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1842_c11_e406_right := to_unsigned(2, 2);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_pc := pc;
     VAR_previous_stack_read := previous_stack_read;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1833_c1_97e8_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1846_c32_063a_left := VAR_ins;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1847_c21_dff2_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1859_l1856_l1851_DUPLICATE_228b_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1833_c6_2646_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1839_c11_a5c7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1842_c11_e406_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_ec20_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_4dbe_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_852d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_c1d0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_5f08_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_bc9f_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l1842_c7_8898_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1833_c2_cfa8_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1839_c7_5d29_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1842_c7_8898_iffalse := t8;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1862_c3_e4f8_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1869_c34_a774_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1833_c2_cfa8_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1839_c7_5d29_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1842_c7_8898_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1849_c7_4a03_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1858_c7_d888_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1861_c7_da31_iffalse := tmp16;
     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1867_l1858_l1853_l1849_l1842_DUPLICATE_5b59 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1867_l1858_l1853_l1849_l1842_DUPLICATE_5b59_return_output := result.stack_address_sp_offset;

     -- CAST_TO_int8_t[uxn_opcodes_h_l1847_c26_5c92] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1847_c26_5c92_return_output := CAST_TO_int8_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1867_c11_5f08] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1867_c11_5f08_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_5f08_left;
     BIN_OP_EQ_uxn_opcodes_h_l1867_c11_5f08_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_5f08_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_5f08_return_output := BIN_OP_EQ_uxn_opcodes_h_l1867_c11_5f08_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1833_c6_2646] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1833_c6_2646_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1833_c6_2646_left;
     BIN_OP_EQ_uxn_opcodes_h_l1833_c6_2646_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1833_c6_2646_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1833_c6_2646_return_output := BIN_OP_EQ_uxn_opcodes_h_l1833_c6_2646_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1867_l1833_l1858_l1853_l1849_l1842_l1871_l1839_DUPLICATE_a53e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1867_l1833_l1858_l1853_l1849_l1842_l1871_l1839_DUPLICATE_a53e_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1849_c11_ec20] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1849_c11_ec20_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_ec20_left;
     BIN_OP_EQ_uxn_opcodes_h_l1849_c11_ec20_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_ec20_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_ec20_return_output := BIN_OP_EQ_uxn_opcodes_h_l1849_c11_ec20_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1867_l1861_l1858_l1853_l1849_l1842_l1871_l1839_DUPLICATE_f4c0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1867_l1861_l1858_l1853_l1849_l1842_l1871_l1839_DUPLICATE_f4c0_return_output := result.is_opc_done;

     -- CONST_SR_8[uxn_opcodes_h_l1869_c34_a774] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1869_c34_a774_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1869_c34_a774_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1869_c34_a774_return_output := CONST_SR_8_uxn_opcodes_h_l1869_c34_a774_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1839_c11_a5c7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1839_c11_a5c7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1839_c11_a5c7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1839_c11_a5c7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1839_c11_a5c7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1839_c11_a5c7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1839_c11_a5c7_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1842_l1839_DUPLICATE_0263 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1842_l1839_DUPLICATE_0263_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1858_c11_852d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1858_c11_852d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_852d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1858_c11_852d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_852d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_852d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1858_c11_852d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1871_c11_bc9f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1871_c11_bc9f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_bc9f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1871_c11_bc9f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_bc9f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_bc9f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1871_c11_bc9f_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1867_l1833_l1858_l1853_l1849_l1842_l1839_DUPLICATE_e652 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1867_l1833_l1858_l1853_l1849_l1842_l1839_DUPLICATE_e652_return_output := result.stack_value;

     -- BIN_OP_AND[uxn_opcodes_h_l1846_c32_063a] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1846_c32_063a_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1846_c32_063a_left;
     BIN_OP_AND_uxn_opcodes_h_l1846_c32_063a_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1846_c32_063a_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1846_c32_063a_return_output := BIN_OP_AND_uxn_opcodes_h_l1846_c32_063a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1861_c11_c1d0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1861_c11_c1d0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_c1d0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1861_c11_c1d0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_c1d0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_c1d0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1861_c11_c1d0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1842_c11_e406] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1842_c11_e406_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1842_c11_e406_left;
     BIN_OP_EQ_uxn_opcodes_h_l1842_c11_e406_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1842_c11_e406_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1842_c11_e406_return_output := BIN_OP_EQ_uxn_opcodes_h_l1842_c11_e406_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1858_l1833_l1839_DUPLICATE_38a7 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1858_l1833_l1839_DUPLICATE_38a7_return_output := result.ram_addr;

     -- CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1859_l1856_l1851_DUPLICATE_bc09 LATENCY=0
     VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1859_l1856_l1851_DUPLICATE_bc09_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- BIN_OP_EQ[uxn_opcodes_h_l1853_c11_4dbe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1853_c11_4dbe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_4dbe_left;
     BIN_OP_EQ_uxn_opcodes_h_l1853_c11_4dbe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_4dbe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_4dbe_return_output := BIN_OP_EQ_uxn_opcodes_h_l1853_c11_4dbe_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1862_l1854_DUPLICATE_0f8e LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1862_l1854_DUPLICATE_0f8e_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1842_l1833_l1839_DUPLICATE_b691 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1842_l1833_l1839_DUPLICATE_b691_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1833_l1849_l1839_DUPLICATE_7f82 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1833_l1849_l1839_DUPLICATE_7f82_return_output := result.is_sp_shift;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1846_c32_4068_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1846_c32_063a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1833_c1_97e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1833_c6_2646_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1833_c2_cfa8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1833_c6_2646_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1833_c2_cfa8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1833_c6_2646_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1833_c2_cfa8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1833_c6_2646_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1833_c2_cfa8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1833_c6_2646_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1833_c2_cfa8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1833_c6_2646_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1833_c2_cfa8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1833_c6_2646_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c2_cfa8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1833_c6_2646_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1833_c2_cfa8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1833_c6_2646_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1833_c2_cfa8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1833_c6_2646_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1833_c2_cfa8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1833_c6_2646_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1839_c7_5d29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1839_c11_a5c7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1839_c7_5d29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1839_c11_a5c7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1839_c7_5d29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1839_c11_a5c7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1839_c7_5d29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1839_c11_a5c7_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1839_c7_5d29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1839_c11_a5c7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1839_c7_5d29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1839_c11_a5c7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1839_c7_5d29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1839_c11_a5c7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1839_c7_5d29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1839_c11_a5c7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1839_c7_5d29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1839_c11_a5c7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1839_c7_5d29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1839_c11_a5c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1842_c7_8898_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1842_c11_e406_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1842_c7_8898_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1842_c11_e406_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1842_c7_8898_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1842_c11_e406_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1842_c7_8898_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1842_c11_e406_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1842_c7_8898_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1842_c11_e406_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1842_c7_8898_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1842_c11_e406_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1842_c7_8898_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1842_c11_e406_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1842_c7_8898_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1842_c11_e406_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1842_c7_8898_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1842_c11_e406_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1842_c7_8898_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1842_c11_e406_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_4a03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_ec20_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_4a03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_ec20_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_4a03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_ec20_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1849_c7_4a03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_ec20_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_4a03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_ec20_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1849_c7_4a03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_ec20_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1849_c7_4a03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_ec20_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_2e95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_4dbe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_2e95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_4dbe_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1853_c7_2e95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_4dbe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_2e95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_4dbe_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1853_c7_2e95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_4dbe_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1853_c7_2e95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_4dbe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_d888_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_852d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_d888_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_852d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1858_c7_d888_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_852d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_d888_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_852d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1858_c7_d888_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_852d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1858_c7_d888_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_852d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_da31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_c1d0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_da31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_c1d0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_da31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_c1d0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1861_c7_da31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_c1d0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1861_c7_da31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_c1d0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_7473_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_5f08_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_7473_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_5f08_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_7473_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_5f08_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1867_c7_7473_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_5f08_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_ca60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_bc9f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_ca60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_bc9f_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1847_c21_dff2_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1847_c26_5c92_return_output;
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1859_l1856_l1851_DUPLICATE_228b_right := VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1859_l1856_l1851_DUPLICATE_bc09_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1862_c3_e4f8_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1862_l1854_DUPLICATE_0f8e_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1855_c3_1dce_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1862_l1854_DUPLICATE_0f8e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1833_c2_cfa8_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1842_l1833_l1839_DUPLICATE_b691_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1839_c7_5d29_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1842_l1833_l1839_DUPLICATE_b691_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1842_c7_8898_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1842_l1833_l1839_DUPLICATE_b691_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1833_c2_cfa8_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1858_l1833_l1839_DUPLICATE_38a7_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1839_c7_5d29_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1858_l1833_l1839_DUPLICATE_38a7_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1858_c7_d888_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1858_l1833_l1839_DUPLICATE_38a7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1839_c7_5d29_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1867_l1861_l1858_l1853_l1849_l1842_l1871_l1839_DUPLICATE_f4c0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1842_c7_8898_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1867_l1861_l1858_l1853_l1849_l1842_l1871_l1839_DUPLICATE_f4c0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_4a03_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1867_l1861_l1858_l1853_l1849_l1842_l1871_l1839_DUPLICATE_f4c0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_2e95_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1867_l1861_l1858_l1853_l1849_l1842_l1871_l1839_DUPLICATE_f4c0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_d888_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1867_l1861_l1858_l1853_l1849_l1842_l1871_l1839_DUPLICATE_f4c0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_da31_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1867_l1861_l1858_l1853_l1849_l1842_l1871_l1839_DUPLICATE_f4c0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_7473_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1867_l1861_l1858_l1853_l1849_l1842_l1871_l1839_DUPLICATE_f4c0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_ca60_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1867_l1861_l1858_l1853_l1849_l1842_l1871_l1839_DUPLICATE_f4c0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1833_c2_cfa8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1833_l1849_l1839_DUPLICATE_7f82_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1839_c7_5d29_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1833_l1849_l1839_DUPLICATE_7f82_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_4a03_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1833_l1849_l1839_DUPLICATE_7f82_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1839_c7_5d29_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1842_l1839_DUPLICATE_0263_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1842_c7_8898_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1842_l1839_DUPLICATE_0263_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1833_c2_cfa8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1867_l1833_l1858_l1853_l1849_l1842_l1871_l1839_DUPLICATE_a53e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1839_c7_5d29_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1867_l1833_l1858_l1853_l1849_l1842_l1871_l1839_DUPLICATE_a53e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1842_c7_8898_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1867_l1833_l1858_l1853_l1849_l1842_l1871_l1839_DUPLICATE_a53e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_4a03_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1867_l1833_l1858_l1853_l1849_l1842_l1871_l1839_DUPLICATE_a53e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_2e95_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1867_l1833_l1858_l1853_l1849_l1842_l1871_l1839_DUPLICATE_a53e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_d888_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1867_l1833_l1858_l1853_l1849_l1842_l1871_l1839_DUPLICATE_a53e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_7473_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1867_l1833_l1858_l1853_l1849_l1842_l1871_l1839_DUPLICATE_a53e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_ca60_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1867_l1833_l1858_l1853_l1849_l1842_l1871_l1839_DUPLICATE_a53e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1842_c7_8898_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1867_l1858_l1853_l1849_l1842_DUPLICATE_5b59_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_4a03_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1867_l1858_l1853_l1849_l1842_DUPLICATE_5b59_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_2e95_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1867_l1858_l1853_l1849_l1842_DUPLICATE_5b59_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_d888_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1867_l1858_l1853_l1849_l1842_DUPLICATE_5b59_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_7473_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1867_l1858_l1853_l1849_l1842_DUPLICATE_5b59_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1833_c2_cfa8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1867_l1833_l1858_l1853_l1849_l1842_l1839_DUPLICATE_e652_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1839_c7_5d29_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1867_l1833_l1858_l1853_l1849_l1842_l1839_DUPLICATE_e652_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1842_c7_8898_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1867_l1833_l1858_l1853_l1849_l1842_l1839_DUPLICATE_e652_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1849_c7_4a03_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1867_l1833_l1858_l1853_l1849_l1842_l1839_DUPLICATE_e652_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1853_c7_2e95_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1867_l1833_l1858_l1853_l1849_l1842_l1839_DUPLICATE_e652_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1858_c7_d888_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1867_l1833_l1858_l1853_l1849_l1842_l1839_DUPLICATE_e652_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1867_c7_7473_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1867_l1833_l1858_l1853_l1849_l1842_l1839_DUPLICATE_e652_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1871_c7_ca60] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_ca60_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_ca60_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_ca60_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_ca60_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_ca60_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_ca60_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_ca60_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_ca60_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1833_c1_97e8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1833_c1_97e8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1833_c1_97e8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1833_c1_97e8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1833_c1_97e8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1833_c1_97e8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1833_c1_97e8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1833_c1_97e8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1833_c1_97e8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1849_c7_4a03] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_4a03_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_4a03_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_4a03_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_4a03_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_4a03_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_4a03_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_4a03_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_4a03_return_output;

     -- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1859_l1856_l1851_DUPLICATE_228b LATENCY=0
     -- Inputs
     BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1859_l1856_l1851_DUPLICATE_228b_left <= VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1859_l1856_l1851_DUPLICATE_228b_left;
     BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1859_l1856_l1851_DUPLICATE_228b_right <= VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1859_l1856_l1851_DUPLICATE_228b_right;
     -- Outputs
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1859_l1856_l1851_DUPLICATE_228b_return_output := BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1859_l1856_l1851_DUPLICATE_228b_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1846_c32_4068] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1846_c32_4068_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1846_c32_4068_left;
     BIN_OP_GT_uxn_opcodes_h_l1846_c32_4068_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1846_c32_4068_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1846_c32_4068_return_output := BIN_OP_GT_uxn_opcodes_h_l1846_c32_4068_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1842_c7_8898] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1842_c7_8898_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1842_c7_8898_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1842_c7_8898_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1842_c7_8898_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1842_c7_8898_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1842_c7_8898_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1842_c7_8898_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1842_c7_8898_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1869_c24_8f85] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1869_c24_8f85_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1869_c34_a774_return_output);

     -- CONST_SL_8[uxn_opcodes_h_l1855_c3_1dce] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1855_c3_1dce_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1855_c3_1dce_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1855_c3_1dce_return_output := CONST_SL_8_uxn_opcodes_h_l1855_c3_1dce_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1867_c7_7473] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_7473_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_7473_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_7473_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_7473_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_7473_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_7473_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_7473_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_7473_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1862_c3_e4f8] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1862_c3_e4f8_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1862_c3_e4f8_left;
     BIN_OP_OR_uxn_opcodes_h_l1862_c3_e4f8_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1862_c3_e4f8_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1862_c3_e4f8_return_output := BIN_OP_OR_uxn_opcodes_h_l1862_c3_e4f8_return_output;

     -- t8_MUX[uxn_opcodes_h_l1842_c7_8898] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1842_c7_8898_cond <= VAR_t8_MUX_uxn_opcodes_h_l1842_c7_8898_cond;
     t8_MUX_uxn_opcodes_h_l1842_c7_8898_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1842_c7_8898_iftrue;
     t8_MUX_uxn_opcodes_h_l1842_c7_8898_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1842_c7_8898_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1842_c7_8898_return_output := t8_MUX_uxn_opcodes_h_l1842_c7_8898_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1847_c21_dff2] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1847_c21_dff2_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1847_c21_dff2_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1847_c21_dff2_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1847_c21_dff2_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1847_c21_dff2_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1847_c21_dff2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1871_c7_ca60] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_ca60_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_ca60_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_ca60_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_ca60_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_ca60_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_ca60_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_ca60_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_ca60_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1846_c32_7f29_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1846_c32_4068_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1861_c7_da31_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1862_c3_e4f8_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l1847_c3_1464 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1847_c21_dff2_return_output)),16);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1856_c21_429c_left := VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1859_l1856_l1851_DUPLICATE_228b_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1859_c21_bc2e_left := VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1859_l1856_l1851_DUPLICATE_228b_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l1851_c3_f6e1 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1859_l1856_l1851_DUPLICATE_228b_return_output)),16);
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1867_c7_7473_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1869_c24_8f85_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1853_c7_2e95_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1855_c3_1dce_return_output;
     VAR_printf_uxn_opcodes_h_l1834_c3_49e6_uxn_opcodes_h_l1834_c3_49e6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1833_c1_97e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_7473_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_ca60_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1842_c7_8898_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_4a03_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1839_c7_5d29_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1842_c7_8898_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_7473_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_ca60_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_da31_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_7473_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1839_c7_5d29_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1842_c7_8898_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1842_c7_8898_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l1847_c3_1464;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1849_c7_4a03_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l1851_c3_f6e1;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l1865_c24_9bf1] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1865_c24_9bf1_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l1862_c3_e4f8_return_output);

     -- tmp16_MUX[uxn_opcodes_h_l1861_c7_da31] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1861_c7_da31_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1861_c7_da31_cond;
     tmp16_MUX_uxn_opcodes_h_l1861_c7_da31_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1861_c7_da31_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1861_c7_da31_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1861_c7_da31_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1861_c7_da31_return_output := tmp16_MUX_uxn_opcodes_h_l1861_c7_da31_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1842_c7_8898] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1842_c7_8898_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1842_c7_8898_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1842_c7_8898_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1842_c7_8898_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1842_c7_8898_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1842_c7_8898_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1842_c7_8898_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1842_c7_8898_return_output;

     -- t8_MUX[uxn_opcodes_h_l1839_c7_5d29] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1839_c7_5d29_cond <= VAR_t8_MUX_uxn_opcodes_h_l1839_c7_5d29_cond;
     t8_MUX_uxn_opcodes_h_l1839_c7_5d29_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1839_c7_5d29_iftrue;
     t8_MUX_uxn_opcodes_h_l1839_c7_5d29_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1839_c7_5d29_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1839_c7_5d29_return_output := t8_MUX_uxn_opcodes_h_l1839_c7_5d29_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1867_c7_7473] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_7473_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_7473_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_7473_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_7473_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_7473_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_7473_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_7473_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_7473_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1867_c7_7473] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_7473_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_7473_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_7473_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_7473_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_7473_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_7473_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_7473_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_7473_return_output;

     -- MUX[uxn_opcodes_h_l1846_c32_7f29] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1846_c32_7f29_cond <= VAR_MUX_uxn_opcodes_h_l1846_c32_7f29_cond;
     MUX_uxn_opcodes_h_l1846_c32_7f29_iftrue <= VAR_MUX_uxn_opcodes_h_l1846_c32_7f29_iftrue;
     MUX_uxn_opcodes_h_l1846_c32_7f29_iffalse <= VAR_MUX_uxn_opcodes_h_l1846_c32_7f29_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1846_c32_7f29_return_output := MUX_uxn_opcodes_h_l1846_c32_7f29_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1859_c21_bc2e] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1859_c21_bc2e_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1859_c21_bc2e_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1859_c21_bc2e_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1859_c21_bc2e_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1859_c21_bc2e_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1859_c21_bc2e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1867_c7_7473] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1867_c7_7473_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1867_c7_7473_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1867_c7_7473_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1867_c7_7473_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1867_c7_7473_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1867_c7_7473_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1867_c7_7473_return_output := result_stack_value_MUX_uxn_opcodes_h_l1867_c7_7473_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1856_c21_429c] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1856_c21_429c_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1856_c21_429c_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1856_c21_429c_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1856_c21_429c_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1856_c21_429c_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1856_c21_429c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1839_c7_5d29] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1839_c7_5d29_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1839_c7_5d29_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1839_c7_5d29_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1839_c7_5d29_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1839_c7_5d29_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1839_c7_5d29_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1839_c7_5d29_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1839_c7_5d29_return_output;

     -- printf_uxn_opcodes_h_l1834_c3_49e6[uxn_opcodes_h_l1834_c3_49e6] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1834_c3_49e6_uxn_opcodes_h_l1834_c3_49e6_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1834_c3_49e6_uxn_opcodes_h_l1834_c3_49e6_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1861_c7_da31] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_da31_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_da31_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_da31_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_da31_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_da31_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_da31_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_da31_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_da31_return_output;

     -- Submodule level 3
     VAR_result_ram_addr_uxn_opcodes_h_l1856_c3_7b67 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1856_c21_429c_return_output)),16);
     VAR_result_ram_addr_uxn_opcodes_h_l1859_c3_5094 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1859_c21_bc2e_return_output)),16);
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1861_c7_da31_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1865_c24_9bf1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1842_c7_8898_iftrue := VAR_MUX_uxn_opcodes_h_l1846_c32_7f29_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_da31_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_7473_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1839_c7_5d29_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1842_c7_8898_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1833_c2_cfa8_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1839_c7_5d29_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_da31_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_7473_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_d888_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_da31_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1861_c7_da31_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1867_c7_7473_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1833_c2_cfa8_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1839_c7_5d29_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1858_c7_d888_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1861_c7_da31_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1853_c7_2e95_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l1856_c3_7b67;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1858_c7_d888_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l1859_c3_5094;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1858_c7_d888] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_d888_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_d888_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_d888_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_d888_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_d888_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_d888_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_d888_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_d888_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1861_c7_da31] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_da31_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_da31_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_da31_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_da31_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_da31_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_da31_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_da31_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_da31_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1861_c7_da31] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_da31_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_da31_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_da31_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_da31_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_da31_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_da31_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_da31_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_da31_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1858_c7_d888] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1858_c7_d888_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1858_c7_d888_cond;
     tmp16_MUX_uxn_opcodes_h_l1858_c7_d888_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1858_c7_d888_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1858_c7_d888_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1858_c7_d888_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1858_c7_d888_return_output := tmp16_MUX_uxn_opcodes_h_l1858_c7_d888_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1842_c7_8898] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1842_c7_8898_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1842_c7_8898_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1842_c7_8898_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1842_c7_8898_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1842_c7_8898_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1842_c7_8898_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1842_c7_8898_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1842_c7_8898_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1861_c7_da31] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1861_c7_da31_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1861_c7_da31_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1861_c7_da31_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1861_c7_da31_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1861_c7_da31_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1861_c7_da31_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1861_c7_da31_return_output := result_stack_value_MUX_uxn_opcodes_h_l1861_c7_da31_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1833_c2_cfa8] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1833_c2_cfa8_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1833_c2_cfa8_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1833_c2_cfa8_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1833_c2_cfa8_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1833_c2_cfa8_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1833_c2_cfa8_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1833_c2_cfa8_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1833_c2_cfa8_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1858_c7_d888] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1858_c7_d888_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1858_c7_d888_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1858_c7_d888_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1858_c7_d888_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1858_c7_d888_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1858_c7_d888_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1858_c7_d888_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1858_c7_d888_return_output;

     -- t8_MUX[uxn_opcodes_h_l1833_c2_cfa8] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1833_c2_cfa8_cond <= VAR_t8_MUX_uxn_opcodes_h_l1833_c2_cfa8_cond;
     t8_MUX_uxn_opcodes_h_l1833_c2_cfa8_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1833_c2_cfa8_iftrue;
     t8_MUX_uxn_opcodes_h_l1833_c2_cfa8_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1833_c2_cfa8_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1833_c2_cfa8_return_output := t8_MUX_uxn_opcodes_h_l1833_c2_cfa8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1839_c7_5d29] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1839_c7_5d29_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1839_c7_5d29_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1839_c7_5d29_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1839_c7_5d29_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1839_c7_5d29_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1839_c7_5d29_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1839_c7_5d29_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1839_c7_5d29_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_d888_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_da31_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1833_c2_cfa8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1839_c7_5d29_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_d888_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_da31_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1853_c7_2e95_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1858_c7_d888_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1839_c7_5d29_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1842_c7_8898_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_2e95_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_d888_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1858_c7_d888_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1861_c7_da31_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1833_c2_cfa8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1853_c7_2e95_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1858_c7_d888_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1858_c7_d888] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_d888_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_d888_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_d888_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_d888_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_d888_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_d888_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_d888_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_d888_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1853_c7_2e95] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1853_c7_2e95_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1853_c7_2e95_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1853_c7_2e95_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1853_c7_2e95_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1853_c7_2e95_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1853_c7_2e95_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1853_c7_2e95_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1853_c7_2e95_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1839_c7_5d29] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1839_c7_5d29_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1839_c7_5d29_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1839_c7_5d29_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1839_c7_5d29_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1839_c7_5d29_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1839_c7_5d29_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1839_c7_5d29_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1839_c7_5d29_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1853_c7_2e95] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_2e95_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_2e95_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_2e95_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_2e95_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_2e95_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_2e95_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_2e95_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_2e95_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1853_c7_2e95] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1853_c7_2e95_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1853_c7_2e95_cond;
     tmp16_MUX_uxn_opcodes_h_l1853_c7_2e95_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1853_c7_2e95_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1853_c7_2e95_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1853_c7_2e95_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1853_c7_2e95_return_output := tmp16_MUX_uxn_opcodes_h_l1853_c7_2e95_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1858_c7_d888] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_d888_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_d888_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_d888_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_d888_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_d888_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_d888_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_d888_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_d888_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1858_c7_d888] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1858_c7_d888_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1858_c7_d888_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1858_c7_d888_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1858_c7_d888_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1858_c7_d888_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1858_c7_d888_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1858_c7_d888_return_output := result_stack_value_MUX_uxn_opcodes_h_l1858_c7_d888_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1833_c2_cfa8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1833_c2_cfa8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1833_c2_cfa8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1833_c2_cfa8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1833_c2_cfa8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1833_c2_cfa8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1833_c2_cfa8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1833_c2_cfa8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1833_c2_cfa8_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_2e95_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_d888_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_2e95_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_d888_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1849_c7_4a03_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1853_c7_2e95_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1833_c2_cfa8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1839_c7_5d29_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_4a03_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_2e95_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1853_c7_2e95_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1858_c7_d888_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1849_c7_4a03_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1853_c7_2e95_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1853_c7_2e95] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_2e95_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_2e95_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_2e95_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_2e95_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_2e95_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_2e95_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_2e95_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_2e95_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1849_c7_4a03] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1849_c7_4a03_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1849_c7_4a03_cond;
     tmp16_MUX_uxn_opcodes_h_l1849_c7_4a03_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1849_c7_4a03_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1849_c7_4a03_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1849_c7_4a03_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1849_c7_4a03_return_output := tmp16_MUX_uxn_opcodes_h_l1849_c7_4a03_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1853_c7_2e95] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1853_c7_2e95_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1853_c7_2e95_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1853_c7_2e95_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1853_c7_2e95_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1853_c7_2e95_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1853_c7_2e95_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1853_c7_2e95_return_output := result_stack_value_MUX_uxn_opcodes_h_l1853_c7_2e95_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1849_c7_4a03] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1849_c7_4a03_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1849_c7_4a03_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1849_c7_4a03_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1849_c7_4a03_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1849_c7_4a03_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1849_c7_4a03_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1849_c7_4a03_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1849_c7_4a03_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1833_c2_cfa8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1833_c2_cfa8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1833_c2_cfa8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1833_c2_cfa8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1833_c2_cfa8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1833_c2_cfa8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1833_c2_cfa8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1833_c2_cfa8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1833_c2_cfa8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1849_c7_4a03] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_4a03_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_4a03_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_4a03_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_4a03_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_4a03_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_4a03_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_4a03_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_4a03_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1853_c7_2e95] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_2e95_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_2e95_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_2e95_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_2e95_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_2e95_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_2e95_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_2e95_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_2e95_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_4a03_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_2e95_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_4a03_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_2e95_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1842_c7_8898_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1849_c7_4a03_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1842_c7_8898_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_4a03_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1849_c7_4a03_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1853_c7_2e95_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1842_c7_8898_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1849_c7_4a03_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1842_c7_8898] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1842_c7_8898_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1842_c7_8898_cond;
     tmp16_MUX_uxn_opcodes_h_l1842_c7_8898_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1842_c7_8898_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1842_c7_8898_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1842_c7_8898_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1842_c7_8898_return_output := tmp16_MUX_uxn_opcodes_h_l1842_c7_8898_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1849_c7_4a03] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_4a03_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_4a03_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_4a03_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_4a03_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_4a03_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_4a03_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_4a03_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_4a03_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1842_c7_8898] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1842_c7_8898_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1842_c7_8898_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1842_c7_8898_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1842_c7_8898_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1842_c7_8898_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1842_c7_8898_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1842_c7_8898_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1842_c7_8898_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1842_c7_8898] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1842_c7_8898_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1842_c7_8898_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1842_c7_8898_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1842_c7_8898_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1842_c7_8898_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1842_c7_8898_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1842_c7_8898_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1842_c7_8898_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1849_c7_4a03] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_4a03_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_4a03_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_4a03_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_4a03_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_4a03_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_4a03_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_4a03_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_4a03_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1849_c7_4a03] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1849_c7_4a03_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1849_c7_4a03_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1849_c7_4a03_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1849_c7_4a03_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1849_c7_4a03_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1849_c7_4a03_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1849_c7_4a03_return_output := result_stack_value_MUX_uxn_opcodes_h_l1849_c7_4a03_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1842_c7_8898_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_4a03_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1842_c7_8898_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_4a03_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1839_c7_5d29_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1842_c7_8898_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1839_c7_5d29_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1842_c7_8898_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1842_c7_8898_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1849_c7_4a03_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1839_c7_5d29_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1842_c7_8898_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l1839_c7_5d29] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1839_c7_5d29_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1839_c7_5d29_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1839_c7_5d29_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1839_c7_5d29_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1839_c7_5d29_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1839_c7_5d29_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1839_c7_5d29_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1839_c7_5d29_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1839_c7_5d29] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1839_c7_5d29_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1839_c7_5d29_cond;
     tmp16_MUX_uxn_opcodes_h_l1839_c7_5d29_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1839_c7_5d29_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1839_c7_5d29_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1839_c7_5d29_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1839_c7_5d29_return_output := tmp16_MUX_uxn_opcodes_h_l1839_c7_5d29_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1842_c7_8898] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1842_c7_8898_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1842_c7_8898_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1842_c7_8898_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1842_c7_8898_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1842_c7_8898_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1842_c7_8898_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1842_c7_8898_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1842_c7_8898_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1842_c7_8898] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1842_c7_8898_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1842_c7_8898_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1842_c7_8898_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1842_c7_8898_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1842_c7_8898_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1842_c7_8898_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1842_c7_8898_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1842_c7_8898_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1839_c7_5d29] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1839_c7_5d29_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1839_c7_5d29_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1839_c7_5d29_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1839_c7_5d29_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1839_c7_5d29_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1839_c7_5d29_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1839_c7_5d29_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1839_c7_5d29_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1842_c7_8898] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1842_c7_8898_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1842_c7_8898_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1842_c7_8898_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1842_c7_8898_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1842_c7_8898_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1842_c7_8898_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1842_c7_8898_return_output := result_stack_value_MUX_uxn_opcodes_h_l1842_c7_8898_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1839_c7_5d29_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1842_c7_8898_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1839_c7_5d29_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1842_c7_8898_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1833_c2_cfa8_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1839_c7_5d29_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c2_cfa8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1839_c7_5d29_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1839_c7_5d29_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1842_c7_8898_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1833_c2_cfa8_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1839_c7_5d29_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1839_c7_5d29] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1839_c7_5d29_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1839_c7_5d29_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1839_c7_5d29_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1839_c7_5d29_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1839_c7_5d29_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1839_c7_5d29_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1839_c7_5d29_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1839_c7_5d29_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1833_c2_cfa8] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1833_c2_cfa8_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1833_c2_cfa8_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1833_c2_cfa8_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1833_c2_cfa8_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1833_c2_cfa8_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1833_c2_cfa8_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1833_c2_cfa8_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1833_c2_cfa8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1833_c2_cfa8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c2_cfa8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c2_cfa8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c2_cfa8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c2_cfa8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c2_cfa8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c2_cfa8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c2_cfa8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c2_cfa8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1839_c7_5d29] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1839_c7_5d29_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1839_c7_5d29_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1839_c7_5d29_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1839_c7_5d29_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1839_c7_5d29_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1839_c7_5d29_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1839_c7_5d29_return_output := result_stack_value_MUX_uxn_opcodes_h_l1839_c7_5d29_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1833_c2_cfa8] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1833_c2_cfa8_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1833_c2_cfa8_cond;
     tmp16_MUX_uxn_opcodes_h_l1833_c2_cfa8_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1833_c2_cfa8_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1833_c2_cfa8_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1833_c2_cfa8_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1833_c2_cfa8_return_output := tmp16_MUX_uxn_opcodes_h_l1833_c2_cfa8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1839_c7_5d29] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1839_c7_5d29_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1839_c7_5d29_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1839_c7_5d29_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1839_c7_5d29_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1839_c7_5d29_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1839_c7_5d29_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1839_c7_5d29_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1839_c7_5d29_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1833_c2_cfa8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1839_c7_5d29_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1833_c2_cfa8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1839_c7_5d29_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1833_c2_cfa8_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1839_c7_5d29_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1833_c2_cfa8_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1833_c2_cfa8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1833_c2_cfa8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1833_c2_cfa8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1833_c2_cfa8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1833_c2_cfa8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1833_c2_cfa8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1833_c2_cfa8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1833_c2_cfa8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1833_c2_cfa8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1833_c2_cfa8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1833_c2_cfa8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1833_c2_cfa8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1833_c2_cfa8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1833_c2_cfa8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1833_c2_cfa8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1833_c2_cfa8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1833_c2_cfa8_return_output := result_stack_value_MUX_uxn_opcodes_h_l1833_c2_cfa8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1833_c2_cfa8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1833_c2_cfa8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1833_c2_cfa8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1833_c2_cfa8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1833_c2_cfa8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1833_c2_cfa8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1833_c2_cfa8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1833_c2_cfa8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1833_c2_cfa8_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_2155_uxn_opcodes_h_l1876_l1828_DUPLICATE_d2de LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2155_uxn_opcodes_h_l1876_l1828_DUPLICATE_d2de_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_2155(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1833_c2_cfa8_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c2_cfa8_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1833_c2_cfa8_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1833_c2_cfa8_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1833_c2_cfa8_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1833_c2_cfa8_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1833_c2_cfa8_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1833_c2_cfa8_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2155_uxn_opcodes_h_l1876_l1828_DUPLICATE_d2de_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2155_uxn_opcodes_h_l1876_l1828_DUPLICATE_d2de_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
