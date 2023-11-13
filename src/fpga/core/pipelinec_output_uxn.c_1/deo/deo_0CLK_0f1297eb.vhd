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
-- Submodules: 67
entity deo_0CLK_0f1297eb is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end deo_0CLK_0f1297eb;
architecture arch of deo_0CLK_0f1297eb is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal device_out_result : device_out_result_t := device_out_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;
signal REG_COMB_device_out_result : device_out_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l495_c6_128f]
signal BIN_OP_EQ_uxn_opcodes_h_l495_c6_128f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l495_c6_128f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l495_c6_128f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l495_c1_b1ba]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_b1ba_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_b1ba_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_b1ba_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_b1ba_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l500_c7_195b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_195b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_195b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_195b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_195b_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l495_c2_e694]
signal t8_MUX_uxn_opcodes_h_l495_c2_e694_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l495_c2_e694_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l495_c2_e694_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l495_c2_e694_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l495_c2_e694]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_e694_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_e694_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_e694_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_e694_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l495_c2_e694]
signal result_u16_value_MUX_uxn_opcodes_h_l495_c2_e694_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l495_c2_e694_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l495_c2_e694_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l495_c2_e694_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l495_c2_e694]
signal result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_e694_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_e694_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_e694_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_e694_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l495_c2_e694]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_e694_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_e694_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_e694_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_e694_return_output : unsigned(3 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l495_c2_e694]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_e694_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_e694_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_e694_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_e694_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l495_c2_e694]
signal result_vram_address_MUX_uxn_opcodes_h_l495_c2_e694_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l495_c2_e694_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l495_c2_e694_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l495_c2_e694_return_output : unsigned(31 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l495_c2_e694]
signal result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_e694_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_e694_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_e694_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_e694_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l495_c2_e694]
signal result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_e694_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_e694_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_e694_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_e694_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l495_c2_e694]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_e694_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_e694_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_e694_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_e694_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l495_c2_e694]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_e694_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_e694_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_e694_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_e694_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l495_c2_e694]
signal result_u8_value_MUX_uxn_opcodes_h_l495_c2_e694_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l495_c2_e694_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l495_c2_e694_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l495_c2_e694_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l495_c2_e694]
signal n8_MUX_uxn_opcodes_h_l495_c2_e694_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l495_c2_e694_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l495_c2_e694_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l495_c2_e694_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l495_c2_e694]
signal device_out_result_MUX_uxn_opcodes_h_l495_c2_e694_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l495_c2_e694_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l495_c2_e694_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l495_c2_e694_return_output : device_out_result_t;

-- printf_uxn_opcodes_h_l496_c3_c39b[uxn_opcodes_h_l496_c3_c39b]
signal printf_uxn_opcodes_h_l496_c3_c39b_uxn_opcodes_h_l496_c3_c39b_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l500_c11_011c]
signal BIN_OP_EQ_uxn_opcodes_h_l500_c11_011c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l500_c11_011c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l500_c11_011c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l503_c7_dc27]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_dc27_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_dc27_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l500_c7_195b]
signal t8_MUX_uxn_opcodes_h_l500_c7_195b_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l500_c7_195b_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l500_c7_195b_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l500_c7_195b_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l500_c7_195b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_195b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_195b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_195b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_195b_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l500_c7_195b]
signal result_u16_value_MUX_uxn_opcodes_h_l500_c7_195b_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l500_c7_195b_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l500_c7_195b_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l500_c7_195b_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l500_c7_195b]
signal result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_195b_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_195b_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_195b_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_195b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l500_c7_195b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_195b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_195b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_195b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_195b_return_output : unsigned(3 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l500_c7_195b]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_195b_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_195b_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_195b_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_195b_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l500_c7_195b]
signal result_vram_address_MUX_uxn_opcodes_h_l500_c7_195b_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l500_c7_195b_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l500_c7_195b_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l500_c7_195b_return_output : unsigned(31 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l500_c7_195b]
signal result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_195b_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_195b_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_195b_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_195b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l500_c7_195b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_195b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_195b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_195b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_195b_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l500_c7_195b]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_195b_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_195b_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_195b_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_195b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l500_c7_195b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_195b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_195b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_195b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_195b_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l500_c7_195b]
signal result_u8_value_MUX_uxn_opcodes_h_l500_c7_195b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l500_c7_195b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l500_c7_195b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l500_c7_195b_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l500_c7_195b]
signal n8_MUX_uxn_opcodes_h_l500_c7_195b_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l500_c7_195b_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l500_c7_195b_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l500_c7_195b_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l500_c7_195b]
signal device_out_result_MUX_uxn_opcodes_h_l500_c7_195b_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l500_c7_195b_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l500_c7_195b_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l500_c7_195b_return_output : device_out_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l503_c11_da53]
signal BIN_OP_EQ_uxn_opcodes_h_l503_c11_da53_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l503_c11_da53_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l503_c11_da53_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l506_c7_b781]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_b781_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_b781_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_b781_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_b781_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l503_c7_dc27]
signal t8_MUX_uxn_opcodes_h_l503_c7_dc27_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l503_c7_dc27_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l503_c7_dc27]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_dc27_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_dc27_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l503_c7_dc27]
signal result_u16_value_MUX_uxn_opcodes_h_l503_c7_dc27_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l503_c7_dc27_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l503_c7_dc27]
signal result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_dc27_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_dc27_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l503_c7_dc27]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_dc27_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_dc27_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l503_c7_dc27]
signal result_vram_address_MUX_uxn_opcodes_h_l503_c7_dc27_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l503_c7_dc27_return_output : unsigned(31 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l503_c7_dc27]
signal result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_dc27_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_dc27_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l503_c7_dc27]
signal result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_dc27_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_dc27_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l503_c7_dc27]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_dc27_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_dc27_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l503_c7_dc27]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_dc27_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_dc27_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l503_c7_dc27]
signal result_u8_value_MUX_uxn_opcodes_h_l503_c7_dc27_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l503_c7_dc27_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l503_c7_dc27]
signal n8_MUX_uxn_opcodes_h_l503_c7_dc27_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l503_c7_dc27_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l503_c7_dc27]
signal device_out_result_MUX_uxn_opcodes_h_l503_c7_dc27_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l503_c7_dc27_return_output : device_out_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l506_c11_9470]
signal BIN_OP_EQ_uxn_opcodes_h_l506_c11_9470_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l506_c11_9470_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l506_c11_9470_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l511_c1_2c71]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_2c71_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_2c71_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_2c71_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_2c71_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l506_c7_b781]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_b781_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_b781_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_b781_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_b781_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l506_c7_b781]
signal result_u16_value_MUX_uxn_opcodes_h_l506_c7_b781_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l506_c7_b781_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l506_c7_b781_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l506_c7_b781_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l506_c7_b781]
signal result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_b781_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_b781_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_b781_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_b781_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l506_c7_b781]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_b781_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_b781_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_b781_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_b781_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l506_c7_b781]
signal result_vram_address_MUX_uxn_opcodes_h_l506_c7_b781_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l506_c7_b781_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l506_c7_b781_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l506_c7_b781_return_output : unsigned(31 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l506_c7_b781]
signal result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_b781_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_b781_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_b781_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_b781_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l506_c7_b781]
signal result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_b781_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_b781_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_b781_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_b781_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l506_c7_b781]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_b781_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_b781_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_b781_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_b781_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l506_c7_b781]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_b781_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_b781_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_b781_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_b781_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l506_c7_b781]
signal result_u8_value_MUX_uxn_opcodes_h_l506_c7_b781_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l506_c7_b781_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l506_c7_b781_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l506_c7_b781_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l506_c7_b781]
signal n8_MUX_uxn_opcodes_h_l506_c7_b781_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l506_c7_b781_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l506_c7_b781_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l506_c7_b781_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l506_c7_b781]
signal device_out_result_MUX_uxn_opcodes_h_l506_c7_b781_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l506_c7_b781_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l506_c7_b781_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l506_c7_b781_return_output : device_out_result_t;

-- sp_relative_shift[uxn_opcodes_h_l509_c30_ed2c]
signal sp_relative_shift_uxn_opcodes_h_l509_c30_ed2c_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l509_c30_ed2c_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l509_c30_ed2c_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l509_c30_ed2c_return_output : signed(3 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l513_c42_92d4]
signal BIN_OP_MINUS_uxn_opcodes_h_l513_c42_92d4_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l513_c42_92d4_right : unsigned(2 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l513_c42_92d4_return_output : unsigned(7 downto 0);

-- device_out[uxn_opcodes_h_l513_c23_7ce0]
signal device_out_uxn_opcodes_h_l513_c23_7ce0_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_out_uxn_opcodes_h_l513_c23_7ce0_device_address : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l513_c23_7ce0_value : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l513_c23_7ce0_phase : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l513_c23_7ce0_previous_device_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l513_c23_7ce0_previous_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l513_c23_7ce0_return_output : device_out_result_t;

function CONST_REF_RD_opcode_result_t_opcode_result_t_e309( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : signed;
 ref_toks_11 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_sp_shift := ref_toks_1;
      base.u16_value := ref_toks_2;
      base.is_vram_write := ref_toks_3;
      base.stack_address_sp_offset := ref_toks_4;
      base.vram_write_layer := ref_toks_5;
      base.vram_address := ref_toks_6;
      base.device_ram_address := ref_toks_7;
      base.is_opc_done := ref_toks_8;
      base.is_device_ram_write := ref_toks_9;
      base.sp_relative_shift := ref_toks_10;
      base.u8_value := ref_toks_11;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l495_c6_128f
BIN_OP_EQ_uxn_opcodes_h_l495_c6_128f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l495_c6_128f_left,
BIN_OP_EQ_uxn_opcodes_h_l495_c6_128f_right,
BIN_OP_EQ_uxn_opcodes_h_l495_c6_128f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_b1ba
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_b1ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_b1ba_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_b1ba_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_b1ba_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_b1ba_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_195b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_195b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_195b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_195b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_195b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_195b_return_output);

-- t8_MUX_uxn_opcodes_h_l495_c2_e694
t8_MUX_uxn_opcodes_h_l495_c2_e694 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l495_c2_e694_cond,
t8_MUX_uxn_opcodes_h_l495_c2_e694_iftrue,
t8_MUX_uxn_opcodes_h_l495_c2_e694_iffalse,
t8_MUX_uxn_opcodes_h_l495_c2_e694_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_e694
result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_e694 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_e694_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_e694_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_e694_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_e694_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l495_c2_e694
result_u16_value_MUX_uxn_opcodes_h_l495_c2_e694 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l495_c2_e694_cond,
result_u16_value_MUX_uxn_opcodes_h_l495_c2_e694_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l495_c2_e694_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l495_c2_e694_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_e694
result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_e694 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_e694_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_e694_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_e694_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_e694_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_e694
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_e694 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_e694_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_e694_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_e694_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_e694_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_e694
result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_e694 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_e694_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_e694_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_e694_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_e694_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l495_c2_e694
result_vram_address_MUX_uxn_opcodes_h_l495_c2_e694 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l495_c2_e694_cond,
result_vram_address_MUX_uxn_opcodes_h_l495_c2_e694_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l495_c2_e694_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l495_c2_e694_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_e694
result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_e694 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_e694_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_e694_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_e694_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_e694_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_e694
result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_e694 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_e694_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_e694_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_e694_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_e694_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_e694
result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_e694 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_e694_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_e694_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_e694_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_e694_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_e694
result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_e694 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_e694_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_e694_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_e694_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_e694_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l495_c2_e694
result_u8_value_MUX_uxn_opcodes_h_l495_c2_e694 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l495_c2_e694_cond,
result_u8_value_MUX_uxn_opcodes_h_l495_c2_e694_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l495_c2_e694_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l495_c2_e694_return_output);

-- n8_MUX_uxn_opcodes_h_l495_c2_e694
n8_MUX_uxn_opcodes_h_l495_c2_e694 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l495_c2_e694_cond,
n8_MUX_uxn_opcodes_h_l495_c2_e694_iftrue,
n8_MUX_uxn_opcodes_h_l495_c2_e694_iffalse,
n8_MUX_uxn_opcodes_h_l495_c2_e694_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l495_c2_e694
device_out_result_MUX_uxn_opcodes_h_l495_c2_e694 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l495_c2_e694_cond,
device_out_result_MUX_uxn_opcodes_h_l495_c2_e694_iftrue,
device_out_result_MUX_uxn_opcodes_h_l495_c2_e694_iffalse,
device_out_result_MUX_uxn_opcodes_h_l495_c2_e694_return_output);

-- printf_uxn_opcodes_h_l496_c3_c39b_uxn_opcodes_h_l496_c3_c39b
printf_uxn_opcodes_h_l496_c3_c39b_uxn_opcodes_h_l496_c3_c39b : entity work.printf_uxn_opcodes_h_l496_c3_c39b_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l496_c3_c39b_uxn_opcodes_h_l496_c3_c39b_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l500_c11_011c
BIN_OP_EQ_uxn_opcodes_h_l500_c11_011c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l500_c11_011c_left,
BIN_OP_EQ_uxn_opcodes_h_l500_c11_011c_right,
BIN_OP_EQ_uxn_opcodes_h_l500_c11_011c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_dc27
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_dc27 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_dc27_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_dc27_return_output);

-- t8_MUX_uxn_opcodes_h_l500_c7_195b
t8_MUX_uxn_opcodes_h_l500_c7_195b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l500_c7_195b_cond,
t8_MUX_uxn_opcodes_h_l500_c7_195b_iftrue,
t8_MUX_uxn_opcodes_h_l500_c7_195b_iffalse,
t8_MUX_uxn_opcodes_h_l500_c7_195b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_195b
result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_195b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_195b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_195b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_195b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_195b_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l500_c7_195b
result_u16_value_MUX_uxn_opcodes_h_l500_c7_195b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l500_c7_195b_cond,
result_u16_value_MUX_uxn_opcodes_h_l500_c7_195b_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l500_c7_195b_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l500_c7_195b_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_195b
result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_195b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_195b_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_195b_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_195b_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_195b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_195b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_195b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_195b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_195b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_195b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_195b_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_195b
result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_195b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_195b_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_195b_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_195b_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_195b_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l500_c7_195b
result_vram_address_MUX_uxn_opcodes_h_l500_c7_195b : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l500_c7_195b_cond,
result_vram_address_MUX_uxn_opcodes_h_l500_c7_195b_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l500_c7_195b_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l500_c7_195b_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_195b
result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_195b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_195b_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_195b_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_195b_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_195b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_195b
result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_195b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_195b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_195b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_195b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_195b_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_195b
result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_195b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_195b_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_195b_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_195b_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_195b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_195b
result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_195b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_195b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_195b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_195b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_195b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l500_c7_195b
result_u8_value_MUX_uxn_opcodes_h_l500_c7_195b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l500_c7_195b_cond,
result_u8_value_MUX_uxn_opcodes_h_l500_c7_195b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l500_c7_195b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l500_c7_195b_return_output);

-- n8_MUX_uxn_opcodes_h_l500_c7_195b
n8_MUX_uxn_opcodes_h_l500_c7_195b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l500_c7_195b_cond,
n8_MUX_uxn_opcodes_h_l500_c7_195b_iftrue,
n8_MUX_uxn_opcodes_h_l500_c7_195b_iffalse,
n8_MUX_uxn_opcodes_h_l500_c7_195b_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l500_c7_195b
device_out_result_MUX_uxn_opcodes_h_l500_c7_195b : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l500_c7_195b_cond,
device_out_result_MUX_uxn_opcodes_h_l500_c7_195b_iftrue,
device_out_result_MUX_uxn_opcodes_h_l500_c7_195b_iffalse,
device_out_result_MUX_uxn_opcodes_h_l500_c7_195b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l503_c11_da53
BIN_OP_EQ_uxn_opcodes_h_l503_c11_da53 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l503_c11_da53_left,
BIN_OP_EQ_uxn_opcodes_h_l503_c11_da53_right,
BIN_OP_EQ_uxn_opcodes_h_l503_c11_da53_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_b781
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_b781 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_b781_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_b781_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_b781_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_b781_return_output);

-- t8_MUX_uxn_opcodes_h_l503_c7_dc27
t8_MUX_uxn_opcodes_h_l503_c7_dc27 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l503_c7_dc27_cond,
t8_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue,
t8_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse,
t8_MUX_uxn_opcodes_h_l503_c7_dc27_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_dc27
result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_dc27 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_dc27_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_dc27_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l503_c7_dc27
result_u16_value_MUX_uxn_opcodes_h_l503_c7_dc27 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l503_c7_dc27_cond,
result_u16_value_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l503_c7_dc27_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_dc27
result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_dc27 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_dc27_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_dc27_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_dc27
result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_dc27 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_dc27_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_dc27_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l503_c7_dc27
result_vram_address_MUX_uxn_opcodes_h_l503_c7_dc27 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l503_c7_dc27_cond,
result_vram_address_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l503_c7_dc27_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_dc27
result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_dc27 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_dc27_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_dc27_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_dc27
result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_dc27 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_dc27_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_dc27_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_dc27
result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_dc27 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_dc27_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_dc27_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_dc27
result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_dc27 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_dc27_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_dc27_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l503_c7_dc27
result_u8_value_MUX_uxn_opcodes_h_l503_c7_dc27 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l503_c7_dc27_cond,
result_u8_value_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l503_c7_dc27_return_output);

-- n8_MUX_uxn_opcodes_h_l503_c7_dc27
n8_MUX_uxn_opcodes_h_l503_c7_dc27 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l503_c7_dc27_cond,
n8_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue,
n8_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse,
n8_MUX_uxn_opcodes_h_l503_c7_dc27_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l503_c7_dc27
device_out_result_MUX_uxn_opcodes_h_l503_c7_dc27 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l503_c7_dc27_cond,
device_out_result_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue,
device_out_result_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse,
device_out_result_MUX_uxn_opcodes_h_l503_c7_dc27_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l506_c11_9470
BIN_OP_EQ_uxn_opcodes_h_l506_c11_9470 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l506_c11_9470_left,
BIN_OP_EQ_uxn_opcodes_h_l506_c11_9470_right,
BIN_OP_EQ_uxn_opcodes_h_l506_c11_9470_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_2c71
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_2c71 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_2c71_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_2c71_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_2c71_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_2c71_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_b781
result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_b781 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_b781_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_b781_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_b781_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_b781_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l506_c7_b781
result_u16_value_MUX_uxn_opcodes_h_l506_c7_b781 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l506_c7_b781_cond,
result_u16_value_MUX_uxn_opcodes_h_l506_c7_b781_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l506_c7_b781_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l506_c7_b781_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_b781
result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_b781 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_b781_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_b781_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_b781_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_b781_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_b781
result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_b781 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_b781_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_b781_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_b781_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_b781_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l506_c7_b781
result_vram_address_MUX_uxn_opcodes_h_l506_c7_b781 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l506_c7_b781_cond,
result_vram_address_MUX_uxn_opcodes_h_l506_c7_b781_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l506_c7_b781_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l506_c7_b781_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_b781
result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_b781 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_b781_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_b781_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_b781_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_b781_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_b781
result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_b781 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_b781_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_b781_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_b781_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_b781_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_b781
result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_b781 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_b781_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_b781_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_b781_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_b781_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_b781
result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_b781 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_b781_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_b781_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_b781_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_b781_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l506_c7_b781
result_u8_value_MUX_uxn_opcodes_h_l506_c7_b781 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l506_c7_b781_cond,
result_u8_value_MUX_uxn_opcodes_h_l506_c7_b781_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l506_c7_b781_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l506_c7_b781_return_output);

-- n8_MUX_uxn_opcodes_h_l506_c7_b781
n8_MUX_uxn_opcodes_h_l506_c7_b781 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l506_c7_b781_cond,
n8_MUX_uxn_opcodes_h_l506_c7_b781_iftrue,
n8_MUX_uxn_opcodes_h_l506_c7_b781_iffalse,
n8_MUX_uxn_opcodes_h_l506_c7_b781_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l506_c7_b781
device_out_result_MUX_uxn_opcodes_h_l506_c7_b781 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l506_c7_b781_cond,
device_out_result_MUX_uxn_opcodes_h_l506_c7_b781_iftrue,
device_out_result_MUX_uxn_opcodes_h_l506_c7_b781_iffalse,
device_out_result_MUX_uxn_opcodes_h_l506_c7_b781_return_output);

-- sp_relative_shift_uxn_opcodes_h_l509_c30_ed2c
sp_relative_shift_uxn_opcodes_h_l509_c30_ed2c : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l509_c30_ed2c_ins,
sp_relative_shift_uxn_opcodes_h_l509_c30_ed2c_x,
sp_relative_shift_uxn_opcodes_h_l509_c30_ed2c_y,
sp_relative_shift_uxn_opcodes_h_l509_c30_ed2c_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l513_c42_92d4
BIN_OP_MINUS_uxn_opcodes_h_l513_c42_92d4 : entity work.BIN_OP_MINUS_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l513_c42_92d4_left,
BIN_OP_MINUS_uxn_opcodes_h_l513_c42_92d4_right,
BIN_OP_MINUS_uxn_opcodes_h_l513_c42_92d4_return_output);

-- device_out_uxn_opcodes_h_l513_c23_7ce0
device_out_uxn_opcodes_h_l513_c23_7ce0 : entity work.device_out_0CLK_f5486376 port map (
clk,
device_out_uxn_opcodes_h_l513_c23_7ce0_CLOCK_ENABLE,
device_out_uxn_opcodes_h_l513_c23_7ce0_device_address,
device_out_uxn_opcodes_h_l513_c23_7ce0_value,
device_out_uxn_opcodes_h_l513_c23_7ce0_phase,
device_out_uxn_opcodes_h_l513_c23_7ce0_previous_device_ram_read,
device_out_uxn_opcodes_h_l513_c23_7ce0_previous_ram_read,
device_out_uxn_opcodes_h_l513_c23_7ce0_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 previous_device_ram_read,
 previous_ram_read,
 -- Registers
 t8,
 n8,
 result,
 device_out_result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l495_c6_128f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_b1ba_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_195b_return_output,
 t8_MUX_uxn_opcodes_h_l495_c2_e694_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_e694_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l495_c2_e694_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_e694_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_e694_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_e694_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l495_c2_e694_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_e694_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_e694_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_e694_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_e694_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l495_c2_e694_return_output,
 n8_MUX_uxn_opcodes_h_l495_c2_e694_return_output,
 device_out_result_MUX_uxn_opcodes_h_l495_c2_e694_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l500_c11_011c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_dc27_return_output,
 t8_MUX_uxn_opcodes_h_l500_c7_195b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_195b_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l500_c7_195b_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_195b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_195b_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_195b_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l500_c7_195b_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_195b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_195b_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_195b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_195b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l500_c7_195b_return_output,
 n8_MUX_uxn_opcodes_h_l500_c7_195b_return_output,
 device_out_result_MUX_uxn_opcodes_h_l500_c7_195b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l503_c11_da53_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_b781_return_output,
 t8_MUX_uxn_opcodes_h_l503_c7_dc27_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_dc27_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l503_c7_dc27_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_dc27_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_dc27_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l503_c7_dc27_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_dc27_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_dc27_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_dc27_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_dc27_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l503_c7_dc27_return_output,
 n8_MUX_uxn_opcodes_h_l503_c7_dc27_return_output,
 device_out_result_MUX_uxn_opcodes_h_l503_c7_dc27_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l506_c11_9470_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_2c71_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_b781_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l506_c7_b781_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_b781_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_b781_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l506_c7_b781_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_b781_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_b781_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_b781_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_b781_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l506_c7_b781_return_output,
 n8_MUX_uxn_opcodes_h_l506_c7_b781_return_output,
 device_out_result_MUX_uxn_opcodes_h_l506_c7_b781_return_output,
 sp_relative_shift_uxn_opcodes_h_l509_c30_ed2c_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l513_c42_92d4_return_output,
 device_out_uxn_opcodes_h_l513_c23_7ce0_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_128f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_128f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_128f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_b1ba_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_b1ba_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_b1ba_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_b1ba_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_195b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_195b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_195b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_195b_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l495_c2_e694_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l495_c2_e694_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l500_c7_195b_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l495_c2_e694_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l495_c2_e694_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_e694_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_e694_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_195b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_e694_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_e694_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l495_c2_e694_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l495_c2_e694_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l500_c7_195b_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l495_c2_e694_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l495_c2_e694_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_e694_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_e694_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_195b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_e694_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_e694_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_e694_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l497_c3_5bce : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_e694_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_195b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_e694_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_e694_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_e694_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_e694_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_195b_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_e694_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_e694_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c2_e694_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c2_e694_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_195b_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c2_e694_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c2_e694_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_e694_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_e694_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_195b_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_e694_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_e694_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_e694_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_e694_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_195b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_e694_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_e694_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_e694_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_e694_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_195b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_e694_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_e694_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_e694_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_e694_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_195b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_e694_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_e694_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c2_e694_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c2_e694_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c7_195b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c2_e694_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c2_e694_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l495_c2_e694_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l495_c2_e694_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l500_c7_195b_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l495_c2_e694_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l495_c2_e694_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l495_c2_e694_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l495_c2_e694_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_195b_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l495_c2_e694_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l495_c2_e694_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l496_c3_c39b_uxn_opcodes_h_l496_c3_c39b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_011c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_011c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_011c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_dc27_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_dc27_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l500_c7_195b_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l500_c7_195b_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l503_c7_dc27_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l500_c7_195b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_195b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_195b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_dc27_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_195b_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l500_c7_195b_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l500_c7_195b_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l503_c7_dc27_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l500_c7_195b_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_195b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_195b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_dc27_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_195b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_195b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l501_c3_f2c6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_195b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l500_c7_195b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_195b_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_195b_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_195b_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_dc27_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_195b_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_195b_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_195b_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l503_c7_dc27_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_195b_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_195b_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_195b_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_dc27_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_195b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_195b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_195b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_dc27_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_195b_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_195b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_195b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_dc27_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_195b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_195b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_195b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_dc27_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_195b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c7_195b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c7_195b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l503_c7_dc27_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c7_195b_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l500_c7_195b_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l500_c7_195b_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l503_c7_dc27_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l500_c7_195b_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_195b_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_195b_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l503_c7_dc27_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_195b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_da53_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_da53_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_da53_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_b781_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_b781_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_b781_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_b781_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l503_c7_dc27_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_b781_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_dc27_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l506_c7_b781_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l503_c7_dc27_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_b781_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_dc27_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_b781_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_dc27_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l506_c7_b781_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l503_c7_dc27_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_b781_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_dc27_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_b781_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_dc27_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_b781_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_dc27_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_b781_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_dc27_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l506_c7_b781_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l503_c7_dc27_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l506_c7_b781_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l503_c7_dc27_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l506_c7_b781_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l503_c7_dc27_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_9470_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_9470_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_9470_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_2c71_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_2c71_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_2c71_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_2c71_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_b781_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_b781_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_b781_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l506_c7_b781_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l506_c7_b781_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l506_c7_b781_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_b781_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_b781_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_b781_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_b781_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_b781_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_b781_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l506_c7_b781_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l506_c7_b781_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l506_c7_b781_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_b781_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_b781_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_b781_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_b781_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_b781_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_b781_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_b781_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_b781_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_b781_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_b781_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_b781_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_b781_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l506_c7_b781_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l506_c7_b781_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l506_c7_b781_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l506_c7_b781_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l506_c7_b781_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l506_c7_b781_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l506_c7_b781_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l506_c7_b781_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l506_c7_b781_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l509_c30_ed2c_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l509_c30_ed2c_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l509_c30_ed2c_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l509_c30_ed2c_return_output : signed(3 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l513_c23_7ce0_device_address : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l513_c23_7ce0_value : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l513_c23_7ce0_phase : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l513_c23_7ce0_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l513_c23_7ce0_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l513_c42_92d4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l513_c42_92d4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l513_c42_92d4_return_output : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l513_c23_7ce0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l513_c23_7ce0_return_output : device_out_result_t;
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l514_c32_7285_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l515_c31_801b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l516_c21_eef4_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_device_out_result_t_ram_address_d41d_uxn_opcodes_h_l517_c22_7454_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l518_c26_8e5c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l519_c29_754b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l520_c25_dcf3_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l521_c24_fc8e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l503_l495_l500_DUPLICATE_dfd1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l503_l495_l500_l506_DUPLICATE_556e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l503_l495_l500_l506_DUPLICATE_28f2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l503_l495_l500_l506_DUPLICATE_507d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l503_l495_l500_l506_DUPLICATE_f55f_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l503_l495_l500_l506_DUPLICATE_9b54_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l503_l495_l500_l506_DUPLICATE_a3da_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l503_l495_l500_l506_DUPLICATE_23b3_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l503_l495_l500_l506_DUPLICATE_70d7_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l503_l506_l500_DUPLICATE_2965_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e309_uxn_opcodes_h_l524_l490_DUPLICATE_acd6_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
variable REG_VAR_device_out_result : device_out_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
  REG_VAR_device_out_result := device_out_result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_sp_relative_shift_uxn_opcodes_h_l509_c30_ed2c_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_011c_right := to_unsigned(1, 1);
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l513_c42_92d4_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_da53_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l497_c3_5bce := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_e694_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l497_c3_5bce;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_b781_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_b781_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_9470_right := to_unsigned(3, 2);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_195b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_b1ba_iffalse := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_b781_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_128f_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_2c71_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_e694_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l501_c3_f2c6 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_195b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l501_c3_f2c6;
     VAR_sp_relative_shift_uxn_opcodes_h_l509_c30_ed2c_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));

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
     VAR_previous_device_ram_read := previous_device_ram_read;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_195b_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_b1ba_iftrue := VAR_CLOCK_ENABLE;
     VAR_device_out_result_MUX_uxn_opcodes_h_l495_c2_e694_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_195b_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l506_c7_b781_iftrue := device_out_result;
     VAR_sp_relative_shift_uxn_opcodes_h_l509_c30_ed2c_ins := VAR_ins;
     VAR_device_out_uxn_opcodes_h_l513_c23_7ce0_value := n8;
     VAR_n8_MUX_uxn_opcodes_h_l495_c2_e694_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l500_c7_195b_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l506_c7_b781_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_128f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_011c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_da53_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_9470_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l513_c42_92d4_left := VAR_phase;
     VAR_device_out_uxn_opcodes_h_l513_c23_7ce0_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_device_out_uxn_opcodes_h_l513_c23_7ce0_previous_ram_read := VAR_previous_ram_read;
     VAR_n8_MUX_uxn_opcodes_h_l506_c7_b781_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue := VAR_previous_stack_read;
     VAR_device_out_uxn_opcodes_h_l513_c23_7ce0_device_address := t8;
     VAR_t8_MUX_uxn_opcodes_h_l495_c2_e694_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l500_c7_195b_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l500_c11_011c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l500_c11_011c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_011c_left;
     BIN_OP_EQ_uxn_opcodes_h_l500_c11_011c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_011c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_011c_return_output := BIN_OP_EQ_uxn_opcodes_h_l500_c11_011c_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l503_l495_l500_l506_DUPLICATE_70d7 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l503_l495_l500_l506_DUPLICATE_70d7_return_output := result.u8_value;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l503_l495_l500_l506_DUPLICATE_556e LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l503_l495_l500_l506_DUPLICATE_556e_return_output := result.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l503_l495_l500_l506_DUPLICATE_28f2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l503_l495_l500_l506_DUPLICATE_28f2_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l503_l495_l500_DUPLICATE_dfd1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l503_l495_l500_DUPLICATE_dfd1_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l506_c11_9470] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l506_c11_9470_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_9470_left;
     BIN_OP_EQ_uxn_opcodes_h_l506_c11_9470_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_9470_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_9470_return_output := BIN_OP_EQ_uxn_opcodes_h_l506_c11_9470_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l509_c30_ed2c] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l509_c30_ed2c_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l509_c30_ed2c_ins;
     sp_relative_shift_uxn_opcodes_h_l509_c30_ed2c_x <= VAR_sp_relative_shift_uxn_opcodes_h_l509_c30_ed2c_x;
     sp_relative_shift_uxn_opcodes_h_l509_c30_ed2c_y <= VAR_sp_relative_shift_uxn_opcodes_h_l509_c30_ed2c_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l509_c30_ed2c_return_output := sp_relative_shift_uxn_opcodes_h_l509_c30_ed2c_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l503_l495_l500_l506_DUPLICATE_9b54 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l503_l495_l500_l506_DUPLICATE_9b54_return_output := result.device_ram_address;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l503_l495_l500_l506_DUPLICATE_a3da LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l503_l495_l500_l506_DUPLICATE_a3da_return_output := result.is_device_ram_write;

     -- CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l503_l495_l500_l506_DUPLICATE_f55f LATENCY=0
     VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l503_l495_l500_l506_DUPLICATE_f55f_return_output := result.vram_address;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l503_l495_l500_l506_DUPLICATE_23b3 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l503_l495_l500_l506_DUPLICATE_23b3_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l503_c11_da53] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l503_c11_da53_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_da53_left;
     BIN_OP_EQ_uxn_opcodes_h_l503_c11_da53_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_da53_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_da53_return_output := BIN_OP_EQ_uxn_opcodes_h_l503_c11_da53_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l503_l495_l500_l506_DUPLICATE_507d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l503_l495_l500_l506_DUPLICATE_507d_return_output := result.vram_write_layer;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l500_c7_195b] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l500_c7_195b_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l495_c6_128f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l495_c6_128f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_128f_left;
     BIN_OP_EQ_uxn_opcodes_h_l495_c6_128f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_128f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_128f_return_output := BIN_OP_EQ_uxn_opcodes_h_l495_c6_128f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l503_l506_l500_DUPLICATE_2965 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l503_l506_l500_DUPLICATE_2965_return_output := result.is_opc_done;

     -- BIN_OP_MINUS[uxn_opcodes_h_l513_c42_92d4] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l513_c42_92d4_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l513_c42_92d4_left;
     BIN_OP_MINUS_uxn_opcodes_h_l513_c42_92d4_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l513_c42_92d4_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l513_c42_92d4_return_output := BIN_OP_MINUS_uxn_opcodes_h_l513_c42_92d4_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_195b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_128f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_b1ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_128f_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l495_c2_e694_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_128f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l495_c2_e694_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_128f_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_e694_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_128f_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_e694_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_128f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_e694_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_128f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_e694_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_128f_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_e694_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_128f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_e694_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_128f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_e694_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_128f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l495_c2_e694_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_128f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c2_e694_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_128f_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c2_e694_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_128f_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_e694_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_128f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l495_c2_e694_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_128f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_dc27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_011c_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_195b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_011c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l500_c7_195b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_011c_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_195b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_011c_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_195b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_011c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_195b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_011c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_195b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_011c_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_195b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_011c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_195b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_011c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_195b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_011c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l500_c7_195b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_011c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c7_195b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_011c_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_195b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_011c_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_195b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_011c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l500_c7_195b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_011c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_b781_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_da53_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l503_c7_dc27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_da53_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l503_c7_dc27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_da53_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_dc27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_da53_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_dc27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_da53_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_dc27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_da53_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_dc27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_da53_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_dc27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_da53_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_dc27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_da53_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l503_c7_dc27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_da53_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l503_c7_dc27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_da53_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l503_c7_dc27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_da53_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_dc27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_da53_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l503_c7_dc27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_da53_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_2c71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_9470_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l506_c7_b781_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_9470_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l506_c7_b781_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_9470_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_b781_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_9470_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_b781_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_9470_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_b781_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_9470_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_b781_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_9470_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_b781_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_9470_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_b781_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_9470_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l506_c7_b781_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_9470_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l506_c7_b781_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_9470_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l506_c7_b781_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_9470_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_b781_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_9470_return_output;
     VAR_device_out_uxn_opcodes_h_l513_c23_7ce0_phase := VAR_BIN_OP_MINUS_uxn_opcodes_h_l513_c42_92d4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_e694_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l503_l495_l500_l506_DUPLICATE_23b3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_195b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l503_l495_l500_l506_DUPLICATE_23b3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l503_l495_l500_l506_DUPLICATE_23b3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_b781_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l503_l495_l500_l506_DUPLICATE_23b3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l495_c2_e694_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l503_l495_l500_l506_DUPLICATE_556e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l500_c7_195b_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l503_l495_l500_l506_DUPLICATE_556e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l503_l495_l500_l506_DUPLICATE_556e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l506_c7_b781_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l503_l495_l500_l506_DUPLICATE_556e_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_e694_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l503_l495_l500_l506_DUPLICATE_a3da_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_195b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l503_l495_l500_l506_DUPLICATE_a3da_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l503_l495_l500_l506_DUPLICATE_a3da_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_b781_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l503_l495_l500_l506_DUPLICATE_a3da_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_195b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l503_l506_l500_DUPLICATE_2965_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l503_l506_l500_DUPLICATE_2965_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_b781_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l503_l506_l500_DUPLICATE_2965_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_e694_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l503_l495_l500_DUPLICATE_dfd1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_195b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l503_l495_l500_DUPLICATE_dfd1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l503_l495_l500_DUPLICATE_dfd1_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_e694_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l503_l495_l500_l506_DUPLICATE_28f2_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_195b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l503_l495_l500_l506_DUPLICATE_28f2_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l503_l495_l500_l506_DUPLICATE_28f2_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_b781_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l503_l495_l500_l506_DUPLICATE_28f2_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_e694_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l503_l495_l500_l506_DUPLICATE_507d_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_195b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l503_l495_l500_l506_DUPLICATE_507d_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l503_l495_l500_l506_DUPLICATE_507d_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_b781_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l503_l495_l500_l506_DUPLICATE_507d_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c2_e694_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l503_l495_l500_l506_DUPLICATE_f55f_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_195b_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l503_l495_l500_l506_DUPLICATE_f55f_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l503_l495_l500_l506_DUPLICATE_f55f_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l506_c7_b781_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l503_l495_l500_l506_DUPLICATE_f55f_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_e694_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l503_l495_l500_l506_DUPLICATE_9b54_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_195b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l503_l495_l500_l506_DUPLICATE_9b54_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l503_l495_l500_l506_DUPLICATE_9b54_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_b781_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l503_l495_l500_l506_DUPLICATE_9b54_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c2_e694_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l503_l495_l500_l506_DUPLICATE_70d7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c7_195b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l503_l495_l500_l506_DUPLICATE_70d7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l503_l495_l500_l506_DUPLICATE_70d7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l506_c7_b781_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l503_l495_l500_l506_DUPLICATE_70d7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_195b_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l500_c7_195b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_b781_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l509_c30_ed2c_return_output;
     -- t8_MUX[uxn_opcodes_h_l503_c7_dc27] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l503_c7_dc27_cond <= VAR_t8_MUX_uxn_opcodes_h_l503_c7_dc27_cond;
     t8_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue;
     t8_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l503_c7_dc27_return_output := t8_MUX_uxn_opcodes_h_l503_c7_dc27_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l500_c7_195b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_195b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_195b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_195b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_195b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_195b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_195b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_195b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_195b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l495_c1_b1ba] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_b1ba_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_b1ba_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_b1ba_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_b1ba_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_b1ba_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_b1ba_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_b1ba_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_b1ba_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l500_c7_195b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_195b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_195b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_195b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_195b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_195b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_195b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_195b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_195b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l506_c7_b781] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_b781_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_b781_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_b781_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_b781_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_b781_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_b781_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_b781_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_b781_return_output;

     -- n8_MUX[uxn_opcodes_h_l506_c7_b781] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l506_c7_b781_cond <= VAR_n8_MUX_uxn_opcodes_h_l506_c7_b781_cond;
     n8_MUX_uxn_opcodes_h_l506_c7_b781_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l506_c7_b781_iftrue;
     n8_MUX_uxn_opcodes_h_l506_c7_b781_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l506_c7_b781_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l506_c7_b781_return_output := n8_MUX_uxn_opcodes_h_l506_c7_b781_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l506_c7_b781] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_b781_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_b781_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_b781_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_b781_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_b781_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_b781_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_b781_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_b781_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_195b_return_output;
     VAR_printf_uxn_opcodes_h_l496_c3_c39b_uxn_opcodes_h_l496_c3_c39b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_b1ba_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse := VAR_n8_MUX_uxn_opcodes_h_l506_c7_b781_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_b781_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_b781_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_e694_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_195b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l500_c7_195b_iffalse := VAR_t8_MUX_uxn_opcodes_h_l503_c7_dc27_return_output;
     -- n8_MUX[uxn_opcodes_h_l503_c7_dc27] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l503_c7_dc27_cond <= VAR_n8_MUX_uxn_opcodes_h_l503_c7_dc27_cond;
     n8_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue;
     n8_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l503_c7_dc27_return_output := n8_MUX_uxn_opcodes_h_l503_c7_dc27_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l495_c2_e694] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_e694_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_e694_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_e694_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_e694_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_e694_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_e694_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_e694_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_e694_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l503_c7_dc27] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_dc27_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_dc27_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_dc27_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_dc27_return_output;

     -- printf_uxn_opcodes_h_l496_c3_c39b[uxn_opcodes_h_l496_c3_c39b] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l496_c3_c39b_uxn_opcodes_h_l496_c3_c39b_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l496_c3_c39b_uxn_opcodes_h_l496_c3_c39b_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l503_c7_dc27] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_dc27_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_dc27_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_dc27_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_dc27_return_output;

     -- t8_MUX[uxn_opcodes_h_l500_c7_195b] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l500_c7_195b_cond <= VAR_t8_MUX_uxn_opcodes_h_l500_c7_195b_cond;
     t8_MUX_uxn_opcodes_h_l500_c7_195b_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l500_c7_195b_iftrue;
     t8_MUX_uxn_opcodes_h_l500_c7_195b_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l500_c7_195b_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l500_c7_195b_return_output := t8_MUX_uxn_opcodes_h_l500_c7_195b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l503_c7_dc27] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_dc27_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_dc27_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_dc27_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_dc27_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_b781_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_dc27_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l500_c7_195b_iffalse := VAR_n8_MUX_uxn_opcodes_h_l503_c7_dc27_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_195b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_dc27_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_195b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_dc27_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l495_c2_e694_iffalse := VAR_t8_MUX_uxn_opcodes_h_l500_c7_195b_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l500_c7_195b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_195b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_195b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_195b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_195b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_195b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_195b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_195b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_195b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l506_c7_b781] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_b781_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_b781_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_b781_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_b781_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_b781_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_b781_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_b781_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_b781_return_output;

     -- t8_MUX[uxn_opcodes_h_l495_c2_e694] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l495_c2_e694_cond <= VAR_t8_MUX_uxn_opcodes_h_l495_c2_e694_cond;
     t8_MUX_uxn_opcodes_h_l495_c2_e694_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l495_c2_e694_iftrue;
     t8_MUX_uxn_opcodes_h_l495_c2_e694_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l495_c2_e694_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l495_c2_e694_return_output := t8_MUX_uxn_opcodes_h_l495_c2_e694_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l500_c7_195b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_195b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_195b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_195b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_195b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_195b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_195b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_195b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_195b_return_output;

     -- n8_MUX[uxn_opcodes_h_l500_c7_195b] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l500_c7_195b_cond <= VAR_n8_MUX_uxn_opcodes_h_l500_c7_195b_cond;
     n8_MUX_uxn_opcodes_h_l500_c7_195b_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l500_c7_195b_iftrue;
     n8_MUX_uxn_opcodes_h_l500_c7_195b_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l500_c7_195b_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l500_c7_195b_return_output := n8_MUX_uxn_opcodes_h_l500_c7_195b_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_2c71_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_b781_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l495_c2_e694_iffalse := VAR_n8_MUX_uxn_opcodes_h_l500_c7_195b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_e694_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_195b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_e694_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_195b_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l495_c2_e694_return_output;
     -- n8_MUX[uxn_opcodes_h_l495_c2_e694] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l495_c2_e694_cond <= VAR_n8_MUX_uxn_opcodes_h_l495_c2_e694_cond;
     n8_MUX_uxn_opcodes_h_l495_c2_e694_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l495_c2_e694_iftrue;
     n8_MUX_uxn_opcodes_h_l495_c2_e694_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l495_c2_e694_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l495_c2_e694_return_output := n8_MUX_uxn_opcodes_h_l495_c2_e694_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l511_c1_2c71] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_2c71_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_2c71_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_2c71_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_2c71_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_2c71_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_2c71_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_2c71_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_2c71_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l495_c2_e694] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_e694_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_e694_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_e694_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_e694_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_e694_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_e694_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_e694_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_e694_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l495_c2_e694] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_e694_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_e694_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_e694_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_e694_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_e694_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_e694_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_e694_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_e694_return_output;

     -- Submodule level 5
     VAR_device_out_uxn_opcodes_h_l513_c23_7ce0_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_2c71_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l495_c2_e694_return_output;
     -- device_out[uxn_opcodes_h_l513_c23_7ce0] LATENCY=0
     -- Clock enable
     device_out_uxn_opcodes_h_l513_c23_7ce0_CLOCK_ENABLE <= VAR_device_out_uxn_opcodes_h_l513_c23_7ce0_CLOCK_ENABLE;
     -- Inputs
     device_out_uxn_opcodes_h_l513_c23_7ce0_device_address <= VAR_device_out_uxn_opcodes_h_l513_c23_7ce0_device_address;
     device_out_uxn_opcodes_h_l513_c23_7ce0_value <= VAR_device_out_uxn_opcodes_h_l513_c23_7ce0_value;
     device_out_uxn_opcodes_h_l513_c23_7ce0_phase <= VAR_device_out_uxn_opcodes_h_l513_c23_7ce0_phase;
     device_out_uxn_opcodes_h_l513_c23_7ce0_previous_device_ram_read <= VAR_device_out_uxn_opcodes_h_l513_c23_7ce0_previous_device_ram_read;
     device_out_uxn_opcodes_h_l513_c23_7ce0_previous_ram_read <= VAR_device_out_uxn_opcodes_h_l513_c23_7ce0_previous_ram_read;
     -- Outputs
     VAR_device_out_uxn_opcodes_h_l513_c23_7ce0_return_output := device_out_uxn_opcodes_h_l513_c23_7ce0_return_output;

     -- Submodule level 6
     VAR_device_out_result_MUX_uxn_opcodes_h_l506_c7_b781_iffalse := VAR_device_out_uxn_opcodes_h_l513_c23_7ce0_return_output;
     -- device_out_result_MUX[uxn_opcodes_h_l506_c7_b781] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l506_c7_b781_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l506_c7_b781_cond;
     device_out_result_MUX_uxn_opcodes_h_l506_c7_b781_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l506_c7_b781_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l506_c7_b781_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l506_c7_b781_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l506_c7_b781_return_output := device_out_result_MUX_uxn_opcodes_h_l506_c7_b781_return_output;

     -- CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d[uxn_opcodes_h_l516_c21_eef4] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l516_c21_eef4_return_output := VAR_device_out_uxn_opcodes_h_l513_c23_7ce0_return_output.u8_value;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d[uxn_opcodes_h_l518_c26_8e5c] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l518_c26_8e5c_return_output := VAR_device_out_uxn_opcodes_h_l513_c23_7ce0_return_output.is_vram_write;

     -- CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d[uxn_opcodes_h_l520_c25_dcf3] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l520_c25_dcf3_return_output := VAR_device_out_uxn_opcodes_h_l513_c23_7ce0_return_output.vram_address;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l514_c32_7285] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l514_c32_7285_return_output := VAR_device_out_uxn_opcodes_h_l513_c23_7ce0_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d[uxn_opcodes_h_l515_c31_801b] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l515_c31_801b_return_output := VAR_device_out_uxn_opcodes_h_l513_c23_7ce0_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d[uxn_opcodes_h_l521_c24_fc8e] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l521_c24_fc8e_return_output := VAR_device_out_uxn_opcodes_h_l513_c23_7ce0_return_output.is_deo_done;

     -- CONST_REF_RD_uint16_t_device_out_result_t_ram_address_d41d[uxn_opcodes_h_l517_c22_7454] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_device_out_result_t_ram_address_d41d_uxn_opcodes_h_l517_c22_7454_return_output := VAR_device_out_uxn_opcodes_h_l513_c23_7ce0_return_output.ram_address;

     -- CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d[uxn_opcodes_h_l519_c29_754b] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l519_c29_754b_return_output := VAR_device_out_uxn_opcodes_h_l513_c23_7ce0_return_output.vram_write_layer;

     -- Submodule level 7
     VAR_result_u16_value_MUX_uxn_opcodes_h_l506_c7_b781_iffalse := VAR_CONST_REF_RD_uint16_t_device_out_result_t_ram_address_d41d_uxn_opcodes_h_l517_c22_7454_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_b781_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l521_c24_fc8e_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_b781_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l514_c32_7285_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_b781_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l518_c26_8e5c_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_b781_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l519_c29_754b_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l506_c7_b781_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l520_c25_dcf3_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_b781_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l515_c31_801b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l506_c7_b781_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l516_c21_eef4_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l506_c7_b781_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l506_c7_b781] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_b781_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_b781_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_b781_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_b781_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_b781_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_b781_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_b781_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_b781_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l506_c7_b781] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l506_c7_b781_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l506_c7_b781_cond;
     result_vram_address_MUX_uxn_opcodes_h_l506_c7_b781_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l506_c7_b781_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l506_c7_b781_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l506_c7_b781_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l506_c7_b781_return_output := result_vram_address_MUX_uxn_opcodes_h_l506_c7_b781_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l506_c7_b781] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_b781_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_b781_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_b781_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_b781_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_b781_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_b781_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_b781_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_b781_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l506_c7_b781] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_b781_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_b781_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_b781_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_b781_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_b781_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_b781_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_b781_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_b781_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l503_c7_dc27] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l503_c7_dc27_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l503_c7_dc27_cond;
     device_out_result_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l503_c7_dc27_return_output := device_out_result_MUX_uxn_opcodes_h_l503_c7_dc27_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l506_c7_b781] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l506_c7_b781_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l506_c7_b781_cond;
     result_u16_value_MUX_uxn_opcodes_h_l506_c7_b781_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l506_c7_b781_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l506_c7_b781_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l506_c7_b781_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l506_c7_b781_return_output := result_u16_value_MUX_uxn_opcodes_h_l506_c7_b781_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l506_c7_b781] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l506_c7_b781_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l506_c7_b781_cond;
     result_u8_value_MUX_uxn_opcodes_h_l506_c7_b781_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l506_c7_b781_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l506_c7_b781_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l506_c7_b781_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l506_c7_b781_return_output := result_u8_value_MUX_uxn_opcodes_h_l506_c7_b781_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l506_c7_b781] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_b781_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_b781_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_b781_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_b781_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_b781_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_b781_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_b781_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_b781_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l506_c7_b781] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_b781_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_b781_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_b781_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_b781_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_b781_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_b781_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_b781_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_b781_return_output;

     -- Submodule level 8
     VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_195b_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l503_c7_dc27_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_b781_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_b781_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_b781_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_b781_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l506_c7_b781_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l506_c7_b781_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l506_c7_b781_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_b781_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l503_c7_dc27] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_dc27_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_dc27_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_dc27_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_dc27_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l503_c7_dc27] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_dc27_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_dc27_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_dc27_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_dc27_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l503_c7_dc27] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l503_c7_dc27_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l503_c7_dc27_cond;
     result_vram_address_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l503_c7_dc27_return_output := result_vram_address_MUX_uxn_opcodes_h_l503_c7_dc27_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l503_c7_dc27] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_dc27_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_dc27_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_dc27_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_dc27_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l503_c7_dc27] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l503_c7_dc27_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l503_c7_dc27_cond;
     result_u8_value_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l503_c7_dc27_return_output := result_u8_value_MUX_uxn_opcodes_h_l503_c7_dc27_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l500_c7_195b] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l500_c7_195b_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_195b_cond;
     device_out_result_MUX_uxn_opcodes_h_l500_c7_195b_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_195b_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l500_c7_195b_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_195b_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_195b_return_output := device_out_result_MUX_uxn_opcodes_h_l500_c7_195b_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l503_c7_dc27] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_dc27_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_dc27_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_dc27_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_dc27_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l503_c7_dc27] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l503_c7_dc27_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l503_c7_dc27_cond;
     result_u16_value_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l503_c7_dc27_return_output := result_u16_value_MUX_uxn_opcodes_h_l503_c7_dc27_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l503_c7_dc27] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_dc27_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_dc27_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_dc27_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_dc27_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_dc27_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_dc27_return_output;

     -- Submodule level 9
     VAR_device_out_result_MUX_uxn_opcodes_h_l495_c2_e694_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_195b_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_195b_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_dc27_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_195b_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_dc27_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_195b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_dc27_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_195b_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_dc27_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l500_c7_195b_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l503_c7_dc27_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c7_195b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l503_c7_dc27_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_195b_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l503_c7_dc27_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_195b_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_dc27_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l500_c7_195b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_195b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_195b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_195b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_195b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_195b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_195b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_195b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_195b_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l500_c7_195b] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_195b_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_195b_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_195b_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_195b_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_195b_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_195b_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_195b_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_195b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l500_c7_195b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l500_c7_195b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c7_195b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l500_c7_195b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c7_195b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l500_c7_195b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c7_195b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c7_195b_return_output := result_u8_value_MUX_uxn_opcodes_h_l500_c7_195b_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l500_c7_195b] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_195b_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_195b_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_195b_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_195b_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_195b_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_195b_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_195b_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_195b_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l495_c2_e694] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l495_c2_e694_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l495_c2_e694_cond;
     device_out_result_MUX_uxn_opcodes_h_l495_c2_e694_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l495_c2_e694_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l495_c2_e694_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l495_c2_e694_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l495_c2_e694_return_output := device_out_result_MUX_uxn_opcodes_h_l495_c2_e694_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l500_c7_195b] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_195b_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_195b_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_195b_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_195b_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_195b_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_195b_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_195b_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_195b_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l500_c7_195b] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_195b_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_195b_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_195b_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_195b_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_195b_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_195b_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_195b_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_195b_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l500_c7_195b] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l500_c7_195b_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l500_c7_195b_cond;
     result_u16_value_MUX_uxn_opcodes_h_l500_c7_195b_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l500_c7_195b_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l500_c7_195b_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l500_c7_195b_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l500_c7_195b_return_output := result_u16_value_MUX_uxn_opcodes_h_l500_c7_195b_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l500_c7_195b] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l500_c7_195b_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_195b_cond;
     result_vram_address_MUX_uxn_opcodes_h_l500_c7_195b_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_195b_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l500_c7_195b_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_195b_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_195b_return_output := result_vram_address_MUX_uxn_opcodes_h_l500_c7_195b_return_output;

     -- Submodule level 10
     REG_VAR_device_out_result := VAR_device_out_result_MUX_uxn_opcodes_h_l495_c2_e694_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_e694_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_195b_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_e694_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_195b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_e694_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_195b_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_e694_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_195b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l495_c2_e694_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l500_c7_195b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c2_e694_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c7_195b_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c2_e694_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_195b_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_e694_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_195b_return_output;
     -- result_is_vram_write_MUX[uxn_opcodes_h_l495_c2_e694] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_e694_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_e694_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_e694_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_e694_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_e694_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_e694_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_e694_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_e694_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l495_c2_e694] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_e694_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_e694_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_e694_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_e694_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_e694_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_e694_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_e694_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_e694_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l495_c2_e694] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l495_c2_e694_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c2_e694_cond;
     result_u8_value_MUX_uxn_opcodes_h_l495_c2_e694_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c2_e694_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l495_c2_e694_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c2_e694_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c2_e694_return_output := result_u8_value_MUX_uxn_opcodes_h_l495_c2_e694_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l495_c2_e694] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l495_c2_e694_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l495_c2_e694_cond;
     result_u16_value_MUX_uxn_opcodes_h_l495_c2_e694_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l495_c2_e694_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l495_c2_e694_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l495_c2_e694_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l495_c2_e694_return_output := result_u16_value_MUX_uxn_opcodes_h_l495_c2_e694_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l495_c2_e694] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_e694_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_e694_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_e694_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_e694_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_e694_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_e694_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_e694_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_e694_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l495_c2_e694] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l495_c2_e694_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c2_e694_cond;
     result_vram_address_MUX_uxn_opcodes_h_l495_c2_e694_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c2_e694_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l495_c2_e694_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c2_e694_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c2_e694_return_output := result_vram_address_MUX_uxn_opcodes_h_l495_c2_e694_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l495_c2_e694] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_e694_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_e694_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_e694_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_e694_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_e694_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_e694_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_e694_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_e694_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l495_c2_e694] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_e694_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_e694_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_e694_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_e694_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_e694_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_e694_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_e694_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_e694_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e309_uxn_opcodes_h_l524_l490_DUPLICATE_acd6 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e309_uxn_opcodes_h_l524_l490_DUPLICATE_acd6_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e309(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_e694_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l495_c2_e694_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_e694_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_e694_return_output,
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_e694_return_output,
     VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c2_e694_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_e694_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_e694_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_e694_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_e694_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c2_e694_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e309_uxn_opcodes_h_l524_l490_DUPLICATE_acd6_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e309_uxn_opcodes_h_l524_l490_DUPLICATE_acd6_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_result <= REG_VAR_result;
REG_COMB_device_out_result <= REG_VAR_device_out_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     result <= REG_COMB_result;
     device_out_result <= REG_COMB_device_out_result;
 end if;
 end if;
end process;

end arch;
